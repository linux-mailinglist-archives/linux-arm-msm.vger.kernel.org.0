Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18E321CD4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfENQ4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:56:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbfENQ4B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:56:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E9D42084A;
        Tue, 14 May 2019 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557852959;
        bh=kLKAdEEeXCbRylavUkmyhySVv0lYey9X0yaOkSYnFwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suFW14rDR+aofrdMelabOO6zWt/x6IU0m6HQjDQoVN5DP9RJfdiHQNzHkNh+usqZ5
         vBWjvDTvSRV2+su6pxeHQ8XODKpSrHamfKPtnWac+7E+BsWyoYno7FYYbYUsx23Nq6
         OZgYJHHpEUIF5KsoUXsqj2uGdo9R35TDu4FJqKFs=
Date:   Tue, 14 May 2019 18:55:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Muchun Song <smuchun@gmail.com>
Cc:     rafael@kernel.org, benh@kernel.crashing.org, prsood@codeaurora.org,
        mojha@codeaurora.org, gkohli@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhaowuyun@wingtech.com
Subject: Re: [PATCH v2] driver core: Fix use-after-free and double free on
 glue directory
Message-ID: <20190514165557.GB28266@kroah.com>
References: <20190514150027.2364-1-smuchun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514150027.2364-1-smuchun@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 14, 2019 at 11:00:27PM +0800, Muchun Song wrote:
> There is a race condition between removing glue directory and adding a new
> device under the glue directory. It can be reproduced in following test:
> 
> path 1: Add the child device under glue dir
> device_add()
>     get_device_parent()
>         mutex_lock(&gdp_mutex);
>         ....
>         /*find parent from glue_dirs.list*/
>         list_for_each_entry(k, &dev->class->p->glue_dirs.list, entry)
>             if (k->parent == parent_kobj) {
>                 kobj = kobject_get(k);
>                 break;
>             }
>         ....
>         mutex_unlock(&gdp_mutex);
>         ....
>     ....
>     kobject_add()
>         kobject_add_internal()
>             create_dir()
>                 sysfs_create_dir_ns()
>                     if (kobj->parent)
>                         parent = kobj->parent->sd;
>                     ....
>                     kernfs_create_dir_ns(parent)
>                         kernfs_new_node()
>                             kernfs_get(parent)
>                         ....
>                         /* link in */
>                         rc = kernfs_add_one(kn);
>                         if (!rc)
>                             return kn;
> 
>                         kernfs_put(kn)
>                             ....
>                             repeat:
>                             kmem_cache_free(kn)
>                             kn = parent;
> 
>                             if (kn) {
>                                 if (atomic_dec_and_test(&kn->count))
>                                     goto repeat;
>                             }
>                         ....
> 
> path2: Remove last child device under glue dir
> device_del()
>     cleanup_device_parent()
>         cleanup_glue_dir()
>             mutex_lock(&gdp_mutex);
>             if (!kobject_has_children(glue_dir))
>                 kobject_del(glue_dir);
>             kobject_put(glue_dir);
>             mutex_unlock(&gdp_mutex);
> 
> Before path2 remove last child device under glue dir, If path1 add a new
> device under glue dir, the glue_dir kobject reference count will be
> increase to 2 via kobject_get(k) in get_device_parent(). And path1 has
> been called kernfs_new_node(), but not call kernfs_get(parent).
> Meanwhile, path2 call kobject_del(glue_dir) beacause 0 is returned by
> kobject_has_children(). This result in glue_dir->sd is freed and it's
> reference count will be 0. Then path1 call kernfs_get(parent) will trigger
> a warning in kernfs_get()(WARN_ON(!atomic_read(&kn->count))) and increase
> it's reference count to 1. Because glue_dir->sd is freed by path2, the next
> call kernfs_add_one() by path1 will fail(This is also use-after-free)
> and call atomic_dec_and_test() to decrease reference count. Because the
> reference count is decremented to 0, it will also call kmem_cache_free()
> to free glue_dir->sd again. This will result in double free.
> 
> In order to avoid this happening, we we should not call kobject_del() on
> path2 when the reference count of glue_dir is greater than 1. So we add a
> conditional statement to fix it.
> 
> The following calltrace is captured in kernel 4.14 with the following patch
> applied:
> 
> commit 726e41097920 ("drivers: core: Remove glue dirs from sysfs earlier")
> 
> --------------------------------------------------------------------------
> [    3.633703] WARNING: CPU: 4 PID: 513 at .../fs/kernfs/dir.c:494
>                 Here is WARN_ON(!atomic_read(&kn->count) in kernfs_get().
> ....
> [    3.633986] Call trace:
> [    3.633991]  kernfs_create_dir_ns+0xa8/0xb0
> [    3.633994]  sysfs_create_dir_ns+0x54/0xe8
> [    3.634001]  kobject_add_internal+0x22c/0x3f0
> [    3.634005]  kobject_add+0xe4/0x118
> [    3.634011]  device_add+0x200/0x870
> [    3.634017]  _request_firmware+0x958/0xc38
> [    3.634020]  request_firmware_into_buf+0x4c/0x70
> ....
> [    3.634064] kernel BUG at .../mm/slub.c:294!
>                 Here is BUG_ON(object == fp) in set_freepointer().
> ....
> [    3.634346] Call trace:
> [    3.634351]  kmem_cache_free+0x504/0x6b8
> [    3.634355]  kernfs_put+0x14c/0x1d8
> [    3.634359]  kernfs_create_dir_ns+0x88/0xb0
> [    3.634362]  sysfs_create_dir_ns+0x54/0xe8
> [    3.634366]  kobject_add_internal+0x22c/0x3f0
> [    3.634370]  kobject_add+0xe4/0x118
> [    3.634374]  device_add+0x200/0x870
> [    3.634378]  _request_firmware+0x958/0xc38
> [    3.634381]  request_firmware_into_buf+0x4c/0x70
> --------------------------------------------------------------------------
> 
> Fixes: 726e41097920 ("drivers: core: Remove glue dirs from sysfs earlier")
> 
> Signed-off-by: Muchun Song <smuchun@gmail.com>
> ---
>  drivers/base/core.c | 47 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 9 deletions(-)

What changed in v2?  That always goes below the --- line.

Please fix up and send v3.

thanks,

greg k-h
