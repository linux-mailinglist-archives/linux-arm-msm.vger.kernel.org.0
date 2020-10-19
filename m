Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3744F292A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 17:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730090AbgJSPhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 11:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgJSPhF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 11:37:05 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BB1C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 08:37:05 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t15so33919otk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZuObq9whWGDMmuO49RORrwrhqdb/dKbIiBCbbe3MZ+8=;
        b=C6WGncCyg42oqfIwbZX16QroJD8lscb0ArhpyKgf4GkpPaB4D7iGfaU9Bzj0g6qSis
         0372FjoZBSTHj262jqlLl96tMRrEQlDhd2XZt52kuE8stnuNjDOnmewwjwBBcOHHu+Gy
         0Q8lHEIs6Te5T37TFUENmQIe6g9VQHWikMFvW0WU2M/i5mk5JwTme3rLDmv9kr611/Ry
         lPruuQAiILKYVUYEs06XzhPcbaQCdS70pbv4o2s4uqjv+zjseP3FhCkf3c4r0mxiv063
         wam1WtZWQLuxojz+ymhE1L3ftMqDYk7NBmwRXcQMfEA/J0Cwtjc7XlzQYw2dUupN2J4t
         H0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZuObq9whWGDMmuO49RORrwrhqdb/dKbIiBCbbe3MZ+8=;
        b=YfRvxeocMrNv8SjSSjMGf2AjuOWB6+FEUWbwBcg2Sml9mxrF5FhrQL9F+MGdR/Up22
         w9l4lXW5O9ofn3eDF0vqomVN1+WB0AaN5uybRE+EqILo0fZr1NywVclPKP24rG0PtC5i
         eQKewFedS7IKreGN7Qcd9bawtKCJEmdRnRGG4R7p045U3A1n8IWFm16qS1mfshy2uT4A
         7dSOTt7GE+qwmrkUXxXVgaQpEGrf8Jy1aJedq2y3WbpWVOOVdZGcMu4AcmZGNZ5EqDY4
         3JWHFguuzC0x7PW05e9kL72MA/K3TKksboAw+mICsQtiXo7FPpuTVnfWMwVcx+hoL/AN
         IPmQ==
X-Gm-Message-State: AOAM531Csa51O+MQ2PW4dgRFQhRDxDKItDd7NhsN98mzIIixA3gzEX0L
        qMoqxI4QRUm1rxZit+xH0ZrDGg==
X-Google-Smtp-Source: ABdhPJxyQj0BxuHZkdFy97PqND3qA9PIazxUOwIJ6MKfl9YWhfxFCeAHoSjERQkg821O8disXAds2w==
X-Received: by 2002:a9d:6c8a:: with SMTP id c10mr384950otr.293.1603121825018;
        Mon, 19 Oct 2020 08:37:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm3497994oto.21.2020.10.19.08.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:37:04 -0700 (PDT)
Date:   Mon, 19 Oct 2020 10:31:59 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-qcom: Read back stream mappings
Message-ID: <20201019153159.GC6705@builder.lan>
References: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
 <20201017043907.2656013-3-bjorn.andersson@linaro.org>
 <5eeecd0e-e3f3-f805-12d5-633284a29074@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eeecd0e-e3f3-f805-12d5-633284a29074@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Oct 09:03 CDT 2020, Robin Murphy wrote:

> On 2020-10-17 05:39, Bjorn Andersson wrote:
> > The Qualcomm boot loader configures stream mapping for the peripherals
> > that it accesses and in particular it sets up the stream mapping for the
> > display controller to be allowed to scan out a splash screen or EFI
> > framebuffer.
> > 
> > Read back the stream mappings during initialization and make the
> > arm-smmu driver maintain the streams in bypass mode.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v3:
> > - Extracted from different patch in v3.
> > - Now configures the stream as BYPASS, rather than translate, which should work
> >    for platforms with working S2CR handling as well.
> > 
> >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > index be4318044f96..0089048342dd 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -23,6 +23,29 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
> >   	{ }
> >   };
> > +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> > +{
> > +	u32 smr;
> > +	int i;
> > +
> > +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> > +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> > +
> > +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> > +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> > +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> > +			smmu->smrs[i].valid = true;
> > +
> > +			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> > +			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> > +			smmu->s2crs[i].cbndx = 0xff;
> > +			smmu->s2crs[i].count++;
> 
> FWIW I don't think you actually need to adjust the count here - the SMR
> being valid should already prevent the whole SME from being reassigned until
> the display probes, at which point it should "take over" the SMR based on
> matching values and claim the "initial" refcount. After that you're back
> into the standard flow. It might be a little unintuitive to have something
> in a valid but "unused" state, but arguably it's entirely accurate in terms
> of the software abstraction here.
> 
> Otherwise, you end up making boot-time SMRs - so potentially all SMRs after
> a kexec - effectively immutable, since even after Linux has taken control of
> the whole system such that they *could* be reassigned safely, there's still
> this undroppable refcount hanging around preventing it.
> 

I did increment the count here to make sure the stream mapping do
survive a probe deferral of the display controller (which is rather
common when you have some bridge chip hanging off it).

But after digging through the code further I've convinced myself that
the sme won't be freed while the device is pending probe deferral.

So I will drop this.

> That said, for a mobile SoC use-case if you have enough SMRs for all your
> stream IDs and don't have any kind of device hotplug, that restriction
> shouldn't make much difference in practice, so I'm not too concerned either
> way. Otherwise this is as nice and tidy as I'd hoped :)

I agree, I'm quite happy with where we are now!

Thanks,
Bjorn

> 
> Robin.
> 
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int qcom_smmu_def_domain_type(struct device *dev)
> >   {
> >   	const struct of_device_id *match =
> > @@ -61,6 +84,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> >   }
> >   static const struct arm_smmu_impl qcom_smmu_impl = {
> > +	.cfg_probe = qcom_smmu_cfg_probe,
> >   	.def_domain_type = qcom_smmu_def_domain_type,
> >   	.reset = qcom_smmu500_reset,
> >   };
> > 
