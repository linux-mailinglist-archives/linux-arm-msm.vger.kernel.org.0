Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB99AE533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 10:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404797AbfIJIOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 04:14:19 -0400
Received: from 8bytes.org ([81.169.241.247]:53716 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730510AbfIJIOT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 04:14:19 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 4DC20386; Tue, 10 Sep 2019 10:14:17 +0200 (CEST)
Date:   Tue, 10 Sep 2019 10:14:15 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190910081415.GB3247@8bytes.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <20190906214409.26677-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906214409.26677-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
> @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>  
>  	mutex_lock(&group->mutex);
>  	list_add_tail(&device->list, &group->devices);
> -	if (group->domain)
> +	if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))

Hmm, this code usually runs at enumeration time when no driver is
attached to the device. Actually it would be pretty dangerous when this
code runs while a driver is attached to the device. How does that change
make things work for you?

Regards,

	Joerg

