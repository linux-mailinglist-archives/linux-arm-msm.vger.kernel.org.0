Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BCB1EA38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 10:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfEOIfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 04:35:10 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43577 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOIfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 04:35:09 -0400
Received: by mail-ot1-f65.google.com with SMTP id i8so1468107oth.10;
        Wed, 15 May 2019 01:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qGDvjhuqwyZ9tac5+2DRA2DTVD+KM6zUhqbXQAxYbK0=;
        b=RPGtf+Vm1AB6ox0PhFVsjGheZirrqpi0YSzw0ConWTI6lKSIrW9a43YJuHE5MtzzTj
         aqs5j75u0l2lP1CSINBiT170mjpaUpb0ZXQzeGMVPQYHcPjGrJH3wImJNvxdv+tXoAg8
         0VkwmQcnM281vQamFlI7cXdZAT7opFC+MCzZ1S7CEAoEwRzU+zxScwzUH0FOQI0KX2Jh
         Zq0BzIuSvEmYY7Tf7TPKjZjBDlDqExh2xjdJ6CnN1T/usibuJY7i/T+RR1QxblQa27Zy
         qL92sxP49+Ah2S20lj4he+YUVZCHcKmcm4ScxWcDufEub18DU7hUSfGNxwm86B3QJNvE
         P2pg==
X-Gm-Message-State: APjAAAVbCUmr0ZXvlQDyRUyt7J000ipy2wFwsOmF4MARHLrnd6R5TQ4O
        5fpOLoWaTO48G0D4SIErwWJ1bzCsDEfGN6EbtPQ=
X-Google-Smtp-Source: APXvYqzE59NGA+Cc6Kgj3bHAnAwdU+grNRr9QJ/08hhNfPsLt2nPn0NAbP1CeUiSkybt7WtOU/M65zLVNkPi26UEzu0=
X-Received: by 2002:a9d:7b46:: with SMTP id f6mr139072oto.324.1557909307949;
 Wed, 15 May 2019 01:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190515005716.4019-1-smuchun@gmail.com>
In-Reply-To: <20190515005716.4019-1-smuchun@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 15 May 2019 10:34:56 +0200
Message-ID: <CAJZ5v0hRZ8aLvNJdYFNNF9nT9nmts7-sAu-Uw+x8MOYdDfFLDg@mail.gmail.com>
Subject: Re: [PATCH v3] driver core: Fix use-after-free and double free on
 glue directory
To:     Muchun Song <smuchun@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Prateek Sood <prsood@codeaurora.org>, mojha@codeaurora.org,
        gkohli@codeaurora.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 2:57 AM Muchun Song <smuchun@gmail.com> wrote:
>
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
>
> Change in v3:
>        add change log.
> Change in v2:
>        Fix device_move() also.
>
>  drivers/base/core.c | 47 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 4aeaa0c92bda..e7810329223a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1739,8 +1739,9 @@ class_dir_create_and_add(struct class *class, struct kobject *parent_kobj)
>
>  static DEFINE_MUTEX(gdp_mutex);
>
> -static struct kobject *get_device_parent(struct device *dev,
> -                                        struct device *parent)
> +static struct kobject *__get_device_parent(struct device *dev,
> +                                          struct device *parent,
> +                                          bool lock)
>  {
>         if (dev->class) {
>                 struct kobject *kobj = NULL;
> @@ -1779,14 +1780,16 @@ static struct kobject *get_device_parent(struct device *dev,
>                         }
>                 spin_unlock(&dev->class->p->glue_dirs.list_lock);
>                 if (kobj) {
> -                       mutex_unlock(&gdp_mutex);
> +                       if (!lock)
> +                               mutex_unlock(&gdp_mutex);
>                         return kobj;
>                 }

There is an unconditional mutex_lock(&gdp_mutex) above this, so the
idea appears to be to leave the function with the mutex locked in some
cases.

That is far away from straightforward, so there needs to be a
kerneldoc comment explaining that behavior.

It also may be necessary to annotate the function with __acquires().

>
>                 /* or create a new class-directory at the parent device */
>                 k = class_dir_create_and_add(dev->class, parent_kobj);
>                 /* do not emit an uevent for this simple "glue" directory */
> -               mutex_unlock(&gdp_mutex);
> +               if (!lock || IS_ERR(k))
> +                       mutex_unlock(&gdp_mutex);

So it needs to be unlocked in the error case too, because the
conditional unlock down the road doesn't work then, right?

There needs to be a comment to that effect here, please.

>                 return k;
>         }
>
> @@ -1799,6 +1802,19 @@ static struct kobject *get_device_parent(struct device *dev,
>         return NULL;
>  }
>
> +static inline struct kobject *get_device_parent(struct device *dev,
> +                                               struct device *parent)
> +{
> +       return __get_device_parent(dev, parent, false);
> +}
> +
> +static inline struct kobject *
> +get_device_parent_locked_if_glue_dir(struct device *dev,
> +                                    struct device *parent)

The name is long and it doesn't explain much IMO.

I guess the idea is to pair this wrapper with unlock_if_glue_dir() to
produce a kind of lock/unlock pattern, but this doesn't work anyway
IMO because of the extra glue dir arg that needs to be passed to
unlock_if_glue_dir().

I would just use the raw __get_device_parent(dev, parent, true)
instead which should be clear enough as long as the (missing now)
kerneldoc comment (and possibly annotation) is added to it.

> +{
> +       return __get_device_parent(dev, parent, true);
> +}
> +
>  static inline bool live_in_glue_dir(struct kobject *kobj,
>                                     struct device *dev)
>  {
> @@ -1831,6 +1847,16 @@ static void cleanup_glue_dir(struct device *dev, struct kobject *glue_dir)
>         mutex_unlock(&gdp_mutex);
>  }
>
> +static inline void unlock_if_glue_dir(struct device *dev,
> +                                     struct kobject *glue_dir)
> +{
> +       /* see if we live in a "glue" directory */
> +       if (!live_in_glue_dir(glue_dir, dev))
> +               return;
> +
> +       mutex_unlock(&gdp_mutex);

This can be written in fewer lines of code and one negation less as follows:

if (live_in_glue_dir(glue_dir, dev))
       mutex_unlock(&gdp_mutex);

which IMO is self-explanatory, so the comment is redundant.

And I would use it directly, without the static wrapper around it,
possibly with a comment to say that it drops the mutex possibly
acquired by __get_device_parent().

> +}
> +
>  static int device_add_class_symlinks(struct device *dev)
>  {
>         struct device_node *of_node = dev_of_node(dev);
> @@ -2040,7 +2066,7 @@ int device_add(struct device *dev)
>         pr_debug("device: '%s': %s\n", dev_name(dev), __func__);
>
>         parent = get_device(dev->parent);
> -       kobj = get_device_parent(dev, parent);
> +       kobj = get_device_parent_locked_if_glue_dir(dev, parent);
>         if (IS_ERR(kobj)) {
>                 error = PTR_ERR(kobj);
>                 goto parent_error;
> @@ -2055,10 +2081,12 @@ int device_add(struct device *dev)
>         /* first, register with generic layer. */
>         /* we require the name to be set before, and pass NULL */
>         error = kobject_add(&dev->kobj, dev->kobj.parent, NULL);
> -       if (error) {
> -               glue_dir = get_glue_dir(dev);
> +
> +       glue_dir = get_glue_dir(dev);
> +       unlock_if_glue_dir(dev, glue_dir);
> +
> +       if (error)
>                 goto Error;
> -       }
>
>         /* notify platform of device entry */
>         error = device_platform_notify(dev, KOBJ_ADD);
> @@ -2972,7 +3000,7 @@ int device_move(struct device *dev, struct device *new_parent,
>
>         device_pm_lock();
>         new_parent = get_device(new_parent);
> -       new_parent_kobj = get_device_parent(dev, new_parent);
> +       new_parent_kobj = get_device_parent_locked_if_glue_dir(dev, new_parent);
>         if (IS_ERR(new_parent_kobj)) {
>                 error = PTR_ERR(new_parent_kobj);
>                 put_device(new_parent);
> @@ -2982,6 +3010,7 @@ int device_move(struct device *dev, struct device *new_parent,
>         pr_debug("device: '%s': %s: moving to '%s'\n", dev_name(dev),
>                  __func__, new_parent ? dev_name(new_parent) : "<NULL>");
>         error = kobject_move(&dev->kobj, new_parent_kobj);
> +       unlock_if_glue_dir(dev, new_parent_kobj);
>         if (error) {
>                 cleanup_glue_dir(dev, new_parent_kobj);
>                 put_device(new_parent);
> --
