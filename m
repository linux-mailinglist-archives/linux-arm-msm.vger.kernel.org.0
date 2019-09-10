Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFF3AEF99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 18:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436700AbfIJQeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 12:34:24 -0400
Received: from foss.arm.com ([217.140.110.172]:38080 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729580AbfIJQeY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 12:34:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CA321000;
        Tue, 10 Sep 2019 09:34:23 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6204C3F71F;
        Tue, 10 Sep 2019 09:34:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
To:     Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Paul <seanpaul@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20190906214409.26677-1-robdclark@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
Date:   Tue, 10 Sep 2019 17:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2019 22:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> One of the challenges we have to enable the aarch64 laptops upstream
> is dealing with the fact that the bootloader enables the display and
> takes the corresponding SMMU context-bank out of BYPASS.  Unfortunately,
> currently, the IOMMU framework attaches a DMA (or potentially an
> IDENTITY) domain before the driver is probed and has a chance to
> intervene and shutdown scanout.  Which makes things go horribly wrong.

Nope, things already went horribly wrong in arm_smmu_device_reset() - 
sure, sometimes for some configurations it might *seem* like they didn't 
and that you can fudge the context bank state at arm's length from core 
code later, but the truth is that impl->cfg_probe is your last chance to 
guarantee that any necessary SMMU state is preserved.

The remainder of the problem involves reworking default domain 
allocation such that we can converge on what iommu_request_dm_for_dev() 
currently does but without the momentary attachment to a translation 
domain to cause hiccups. That's starting here:

https://lore.kernel.org/linux-iommu/cover.1566353521.git.sai.praneeth.prakhya@intel.com/

> But in this case, drm/msm is already directly managing it's IOMMUs
> directly, the DMA API attached iommu_domain simply gets in the way.
> This series adds a way that a driver can indicate to drivers/iommu
> that it does not wish to have an DMA managed iommu_domain attached.
> This way, drm/msm can shut down scanout cleanly before attaching it's
> own iommu_domain.
> 
> NOTE that to get things working with arm-smmu on the aarch64 laptops,
> you also need a patchset[1] from Bjorn Andersson to inherit SMMU config
> at boot, when it is already enabled.
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg732246.html
> 
> NOTE that in discussion of previous revisions, RMRR came up.  This is
> not really a replacement for RMRR (nor does RMRR really provide any
> more information than we already get from EFI GOP, or DT in the
> simplefb case).  I also don't see how RMRR could help w/ SMMU handover
> of CB/SMR config (Bjorn's patchset[1]) without defining new tables.

The point of RMRR-like-things is that they identify not just the memory 
region but also the specific device accessing them, which means the 
IOMMU driver knows up-front which IDs etc. it must be careful not to 
disrupt. Obviously for SMMU that *would* be some new table (designed to 
encompass everything relevant) since literal RMRRs are specifically an 
Intel VT-d thing.

> This perhaps doesn't solve the more general case of bootloader enabled
> display for drivers that actually want to use DMA API managed IOMMU.
> But it does also happen to avoid a related problem with GPU, caused by
> the DMA domain claiming the context bank that the GPU firmware expects
> to use.

Careful bringing that up again, or I really will rework the context bank 
allocator to avoid this default domain problem entirely... ;)

Robin.

>  And it avoids spurious TLB invalidation coming from the unused
> DMA domain.  So IMHO this is a useful and necessary change.
> 
> Rob Clark (2):
>    iommu: add support for drivers that manage iommu explicitly
>    drm/msm: mark devices where iommu is managed by driver
> 
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 1 +
>   drivers/gpu/drm/msm/msm_drv.c              | 1 +
>   drivers/iommu/iommu.c                      | 2 +-
>   drivers/iommu/of_iommu.c                   | 3 +++
>   include/linux/device.h                     | 3 ++-
>   7 files changed, 10 insertions(+), 2 deletions(-)
> 
