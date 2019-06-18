Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966D64A8D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 19:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbfFRRwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 13:52:22 -0400
Received: from foss.arm.com ([217.140.110.172]:52588 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730161AbfFRRwW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 13:52:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FEFA344;
        Tue, 18 Jun 2019 10:52:21 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F77A3F738;
        Tue, 18 Jun 2019 10:52:20 -0700 (PDT)
Date:   Tue, 18 Jun 2019 18:52:18 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, robin.murphy@arm.com,
        agross@kernel.org, robh+dt@kernel.org, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        david.brown@linaro.org
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
Message-ID: <20190618175218.GH4270@fuggles.cambridge.arm.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vivek,

On Fri, Jun 14, 2019 at 02:48:07PM +0530, Vivek Gautam wrote:
> On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> > 
> > > Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
> > > to address under-performance issues in real-time clients, such as
> > > Display, and Camera.
> > > On receiving an invalidation requests, the SMMU forwards SAFE request
> > > to these clients and waits for SAFE ack signal from real-time clients.
> > > The SAFE signal from such clients is used to qualify the start of
> > > invalidation.
> > > This logic is controlled by chicken bits, one for each - MDP (display),
> > > IFE0, and IFE1 (camera), that can be accessed only from secure software
> > > on sdm845.
> > > 
> > > This configuration, however, degrades the performance of non-real time
> > > clients, such as USB, and UFS etc. This happens because, with wait-for-safe
> > > logic enabled the hardware tries to throttle non-real time clients while
> > > waiting for SAFE ack signals from real-time clients.
> > > 
> > > On MTP sdm845 devices, with wait-for-safe logic enabled at the boot time
> > > by the bootloaders we see degraded performance of USB and UFS when kernel
> > > enables the smmu stage-1 translations for these clients.
> > > Turn off this wait-for-safe logic from the kernel gets us back the perf
> > > of USB and UFS devices until we re-visit this when we start seeing perf
> > > issues on display/camera on upstream supported SDM845 platforms.

Re-visit what exactly, and how?

> > > Now, different bootloaders with their access control policies allow this
> > > register access differently through secure monitor calls -
> > > 1) With one we can issue io-read/write secure monitor call (qcom-scm)
> > >     to update the register, while,
> > > 2) With other, such as one on MTP sdm845 we should use the specific
> > >     qcom-scm command to send request to do the complete register
> > >     configuration.
> > > Adding a separate device tree flag for arm-smmu to identify which
> > > firmware configuration of the two mentioned above we use.
> > > Not adding code change to allow type-(1) bootloaders to toggle the
> > > safe using io-read/write qcom-scm call.
> > > 
> > > This change is inspired by the downstream change from Patrick Daly
> > > to address performance issues with display and camera by handling
> > > this wait-for-safe within separte io-pagetable ops to do TLB
> > > maintenance. So a big thanks to him for the change.
> > > 
> > > Without this change the UFS reads are pretty slow:
> > > $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
> > > 10+0 records in
> > > 10+0 records out
> > > 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
> > > real    0m 22.39s
> > > user    0m 0.00s
> > > sys     0m 0.01s
> > > 
> > > With this change they are back to rock!
> > > $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
> > > 300+0 records in
> > > 300+0 records out
> > > 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
> > > real    0m 1.03s
> > > user    0m 0.00s
> > > sys     0m 0.54s
> > > 
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > ---
> > >   drivers/iommu/arm-smmu.c | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > index 0ad086da399c..3c3ad43eda97 100644
> > > --- a/drivers/iommu/arm-smmu.c
> > > +++ b/drivers/iommu/arm-smmu.c
> > > @@ -39,6 +39,7 @@
> > >   #include <linux/pci.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/pm_runtime.h>
> > > +#include <linux/qcom_scm.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/spinlock.h>
> > > @@ -177,6 +178,7 @@ struct arm_smmu_device {
> > >   	u32				features;
> > >   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> > > +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
> > >   	u32				options;
> > >   	enum arm_smmu_arch_version	version;
> > >   	enum arm_smmu_implementation	model;
> > > @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
> > >   static struct arm_smmu_option_prop arm_smmu_options[] = {
> > >   	{ ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
> > > +	{ ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> > This should be added to the DT binding as well.
> 
> Ah right. I missed that. Will add this and respin unless Robin and Will have
> concerns with this change.

My only concern really is whether it's safe for us to turn this off. It's
clear that somebody went to a lot of effort to add this extra goodness to
the IP, but your benchmarks suggest they never actually tried it out after
they finished building it.

Is there some downside I'm not seeing from disabling this stuff?

We probably also need some co-ordination with Andy if we're going to
merge this, since he maintains the firmware calling code.

Will
