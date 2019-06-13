Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4837844F86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfFMWtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:49:53 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41826 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfFMWtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:49:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id 83so328342pgg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 15:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k6Xar2glLHwQeNn6R1ji8rZ9NF01iMIAzLJ4xoiuLOY=;
        b=Y8DKBr1/TsIOIuzwitB3T1W7YWN+CXqNcp/VuBQwp74GtNJDL5X2GasFcG2Lo2kWDV
         7IQ1vqNT4HbVYbsXJMkkMGFokpdIL5TmjLYtabsqqPhs3nGq6+oiVXUeIHl9k2RqOGuT
         NjDfQ8VREFp5cE4s2EjbifQ7cPeGpKfq9kgxcdsnH5I/nI7Ya3CDaH1klpqD5Q1hyCWV
         4QQypBWDfoeWdhUglJa9i4/lIWGmoceNbKiZNyGDarIvrhSoG+HKtCiS+QIXfKVmjYas
         FVzx2SD8qGZm8aNmNcMOCcCMBU7tuj9YrhUKR+kSVrOB9tLEYH//+1X7pV8D5kK8FbZ4
         1ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k6Xar2glLHwQeNn6R1ji8rZ9NF01iMIAzLJ4xoiuLOY=;
        b=QaZkU+XxscI9+RLVWFVzyqN7ZUamMPaw3wLJfOnl6P4jrS30e9JJZp90nkg6eHdi5j
         iiJ4XW+as88WVw5JxwFQWoGxldN/cOScJ0DHEq7+BBqJyGtYlQ9eY9L1bN/TfFIv+Hsd
         4yFfxuArtBxOw9KhbdzAJw5uMdwr+ngGQAApZPRgZNn/6zIuzljpaHejmePRVeL50wwh
         kz2BvpcawhI1Lj6rpU7LT04Qkk8Nzu7I31iLVlu2wr9kZnhh+Enb7PDNDQYEJpNcXKfH
         VPoWv3PfG7VHiS+FxMFKEwUTPOXEpzO63RDQlkrD0nUDCOHmUJuMV2tADCiZmZqASnDj
         +n3A==
X-Gm-Message-State: APjAAAWG0IZhDxSOaZK821sKlHqbHHNqKz/mC2N6H9VuInqnctk+pQaR
        D4FroRP05wuLKUuEj/ulr2SXag==
X-Google-Smtp-Source: APXvYqxv559mQ4O7aVghviV8Rq+W2Pn31ny2ZF7QJw7w3BDGwuUqZdShgfe4eC1vvJrSJN59i6HZnw==
X-Received: by 2002:a17:90a:2224:: with SMTP id c33mr7832372pje.22.1560466191944;
        Thu, 13 Jun 2019 15:49:51 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m16sm732798pfd.127.2019.06.13.15.49.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:49:51 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:49:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Patrick Daly <pdaly@codeaurora.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC 1/2] iommu: arm-smmu: Handoff SMR registers and context
 banks
Message-ID: <20190613224949.GF4814@minitux>
References: <20190605210856.20677-1-bjorn.andersson@linaro.org>
 <20190605210856.20677-2-bjorn.andersson@linaro.org>
 <25f19f09-ab19-a7b3-c31a-f5f29b29fef8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25f19f09-ab19-a7b3-c31a-f5f29b29fef8@arm.com>
X-TUID: ToS7Bn5soDWZ
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 04:23 PDT 2019, Robin Murphy wrote:

> On 05/06/2019 22:08, Bjorn Andersson wrote:
> > Boot splash screen or EFI framebuffer requires the display hardware to
> > operate while the Linux iommu driver probes. Therefore, we cannot simply
> > wipe out the SMR register settings programmed by the bootloader.
> > 
> > Detect which SMR registers are in use during probe, and which context
> > banks they are associated with. Reserve these context banks for the
> > first Linux device whose stream-id matches the SMR register.
> > 
> > Any existing page-tables will be discarded.
> 
> That doesn't seem particularly useful :/
> 

In my case all valid CBs have TTBR0 and TTBR1 as 0, so I don't have a
page table. So all I need is a matching stream to keep the display
hardware satisfied.

Is this perhaps the thing that's mentioned as "S2CR bypass" mode?

> Either way, if firmware did set up a translation context, is there any
> guarantee that its pagetables haven't already been stomped on by Linux (e.g.
> via memtest)?
> 

The only way I can think of is if the bootloader would allocate these in
a chunk of memory which it removes from the memory ranges communicated
to the kernel.

In order to support this I believe we would need some logic that
remap the existing page tables and clone them into new ones, and then
update the CBs to match the existing configuration.

But as I said, this is beyond our current needs.

> > Heavily based on downstream implementation by Patrick Daly
> > <pdaly@codeaurora.org>.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   drivers/iommu/arm-smmu-regs.h |  2 +
> >   drivers/iommu/arm-smmu.c      | 80 ++++++++++++++++++++++++++++++++---
> >   2 files changed, 77 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
> > index e9132a926761..8c1fd84032a2 100644
> > --- a/drivers/iommu/arm-smmu-regs.h
> > +++ b/drivers/iommu/arm-smmu-regs.h
> > @@ -105,7 +105,9 @@
> >   #define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
> >   #define SMR_VALID			(1 << 31)
> >   #define SMR_MASK_SHIFT			16
> > +#define SMR_MASK_MASK			0x7fff
> >   #define SMR_ID_SHIFT			0
> > +#define SMR_ID_MASK			0xffff
> 
> The SMR ID and MASK fields are either both 15 bits or both 16 bits,
> depending on EXIDS. This mix-and-match is plain wrong either way.
> 

Okay, I will read up some more on how these pieces works.

> >   #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> >   #define S2CR_CBNDX_SHIFT		0
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index 5e54cc0a28b3..c8629a656b42 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -135,6 +135,7 @@ struct arm_smmu_s2cr {
> >   	enum arm_smmu_s2cr_type		type;
> >   	enum arm_smmu_s2cr_privcfg	privcfg;
> >   	u8				cbndx;
> > +	bool				handoff;
> >   };
> >   #define s2cr_init_val (struct arm_smmu_s2cr){				\
> > @@ -399,9 +400,22 @@ static int arm_smmu_register_legacy_master(struct device *dev,
> >   	return err;
> >   }
> > -static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> > +static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
> > +			       struct device *dev)
> >   {
> > +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +	unsigned long *map = smmu->context_map;
> > +	int end = smmu->num_context_banks;
> > +	int cbndx;
> >   	int idx;
> > +	int i;
> > +
> > +	for_each_cfg_sme(fwspec, i, idx) {
> > +		if (smmu->s2crs[idx].handoff) {
> > +			cbndx = smmu->s2crs[idx].cbndx;
> > +			goto found_handoff;
> > +		}
> > +	}
> >   	do {
> >   		idx = find_next_zero_bit(map, end, start);
> > @@ -410,6 +424,17 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> >   	} while (test_and_set_bit(idx, map));
> >   	return idx;
> > +
> > +found_handoff:
> > +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> > +		if (smmu->s2crs[i].cbndx == cbndx) {
> > +			smmu->s2crs[i].cbndx = 0;
> > +			smmu->s2crs[i].handoff = false;
> > +			smmu->s2crs[i].count--;
> > +		}
> > +	}
> > +
> > +	return cbndx;
> >   }
> >   static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
> > @@ -759,7 +784,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >   }
> >   static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > -					struct arm_smmu_device *smmu)
> > +					struct arm_smmu_device *smmu,
> > +					struct device *dev)
> >   {
> >   	int irq, start, ret = 0;
> >   	unsigned long ias, oas;
> > @@ -873,8 +899,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >   		ret = -EINVAL;
> >   		goto out_unlock;
> >   	}
> > -	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> > -				      smmu->num_context_banks);
> > +	ret = __arm_smmu_alloc_cb(smmu, start, dev);
> >   	if (ret < 0)
> >   		goto out_unlock;
> > @@ -1264,7 +1289,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >   		return ret;
> >   	/* Ensure that the domain is finalised */
> > -	ret = arm_smmu_init_domain_context(domain, smmu);
> > +	ret = arm_smmu_init_domain_context(domain, smmu, dev);
> >   	if (ret < 0)
> >   		goto rpm_put;
> > @@ -1798,6 +1823,49 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >   	writel(reg, ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
> >   }
> > +static void arm_smmu_read_smr_state(struct arm_smmu_device *smmu)
> > +{
> > +	u32 privcfg;
> > +	u32 cbndx;
> > +	u32 mask;
> > +	u32 type;
> > +	u32 s2cr;
> > +	u32 smr;
> > +	u32 id;
> > +	int i;
> > +
> > +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> > +		smr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(i));
> 
> What about stream indexing?
> 
> > +		mask = (smr >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
> > +		id = smr & SMR_ID_MASK;
> > +		if (!(smr & SMR_VALID))
> 
> EXIDs again...
> 
> > +			continue;
> > +
> > +		s2cr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(i));
> > +		type = (s2cr >> S2CR_TYPE_SHIFT) & S2CR_TYPE_MASK;
> > +		cbndx = (s2cr >> S2CR_CBNDX_SHIFT) & S2CR_CBNDX_MASK;
> > +		privcfg = (s2cr >> S2CR_PRIVCFG_SHIFT) & S2CR_PRIVCFG_MASK;
> > +		if (type != S2CR_TYPE_TRANS)
> > +			continue;
> 
> How can you tell whether an SMR or S2CR has been programmed by the firmware,
> or that its UNKNOWN reset value is junk which just happens to look
> plausible?
> 

My expectation was that the reset value of these registers would have
some sane value, preferably without SMR_VALID being set.

> > +
> > +		/* Populate the SMR */
> > +		smmu->smrs[i].mask = mask;
> > +		smmu->smrs[i].id = id;
> > +		smmu->smrs[i].valid = true;
> > +
> > +		/* Populate the S2CR */
> > +		smmu->s2crs[i].group = NULL;
> > +		smmu->s2crs[i].count = 1;
> > +		smmu->s2crs[i].type = type;
> > +		smmu->s2crs[i].privcfg = privcfg;
> > +		smmu->s2crs[i].cbndx = cbndx;
> > +		smmu->s2crs[i].handoff = true;
> > +
> > +		/* Mark the context bank as busy */
> > +		bitmap_set(smmu->context_map, cbndx, 1);
> 
> Does anything prevent the SMMU being suspended between here and whenever the
> relevant drivers(s) show up to properly establish the device links?
> 

There's nothing that prevents a system suspend before such drivers are
inserted and attached.

> > +	}
> > +}
> > +
> >   static int arm_smmu_id_size_to_bits(int size)
> >   {
> >   	switch (size) {
> > @@ -2023,6 +2091,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
> >   		dev_notice(smmu->dev, "\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
> >   			   smmu->ipa_size, smmu->pa_size);
> > +	arm_smmu_read_smr_state(smmu);
> > +
> >   	return 0;
> >   }
> 
> Stepping back from the implementation details, I also have concerns that
> this will interact badly with kexec/kdump,

I didn't consider kexec, which I expect would also rule out the type of
DT properties that downstream uses to trigger some of this behavior (as
the same DT would be used by the launched system).

> but mostly the fact that it's at
> best a partial workaround, rather than a real solution to the fundamental
> problem that initialising an IOMMU can break EFIFB/bootsplash/etc.,
> *regardless* of whether the firmware is even aware of said IOMMU at all -
> I've already been living with this on my Juno board for months since EDK2
> gained Arm HDLCD support. AFAICS this can only be solved by some sort of
> RMRR-like mechanism, i.e. firmware providing explicit information about what
> address ranges are currently in use by which devices. I've been pondering
> what a DT-based implementation might look like for a while now, and I guess
> it's probably time to raise it with the IORT spec owners as well.
> 

In the downstream DT targets a static reserved-memory region is used to
ensure Linux doesn't stomp on the actual framebuffer data and iirc the
ACPI firmware has the EFIFB memory region removed as well.

So I was expecting a translation of this particular region, but that's
not what we're seeing. But regardless, Linux needs to be aware of it
somehow, it's just that there's no link between the SMMU configuration
and this region as of today.


As a concrete example, booting a SDM845 based phone with this patch set
(and some debug prints) indicates that I have SMRs for primary and
secondary display pipe and then four entries for the various storage
devices.

> That said, once we've perfected our WIP design for keeping invasive
> implementation details out of the way of each other and the core
> architectural driver flow, I wouldn't rule out the possibility of slotting
> something like this in as a qcom-specific feature if the "we can't change
> the firmware" argument is going to come up.
> 

While it's possible to alter the firmware for specific (and future)
devices, figuring out a way to do this in the kernel will be necessary
for the majority of existing devices. In many cases we can work around
this problem by configuring the bootloader to not do a splash screen but
with EFIFB on the laptops we do not have this ability (and that's why
these patches has not shown up until now).

I'm very much interested in us coming up with a sustainable, generic
solution that we can work with the firmware guys on implementing beyond
the current needs.


I will read up on the stream ids and EXIDs and make the read back of
SMRs conditioned on the qcom compatible.

Thanks Robin

Regards,
Bjorn
