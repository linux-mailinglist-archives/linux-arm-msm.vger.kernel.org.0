Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08BD2A4E09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 19:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgKCSNE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 13:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgKCSNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 13:13:04 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F3CC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 10:13:04 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id d9so13328870oib.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gR/SlmlCtWaTEuhJ75HH1ougxe6tbAau9fplmY1Gd1c=;
        b=IDtCg9rskaSN2GRu9GYPUrlAigWfkkKXdz55Esi6x09u3Nz0r64d4Fw9IsXDmga/XN
         GgDQfpQzJkFyCDSKyUpA0GAoKY1SEr5B7jIxLFrvjg3531Qx9jb49Wx7l2KZDPC5qG4X
         joRv5XuwsCZbv1u4xmQ6yLpmTNrCZHtzMugF+dmyIIUPMvlbuqryIz99kidhenUsYvxg
         +DbU2TIV9EXBwbtKsGBcSC0RboDX+NRK/vZNOc5D3FiPiUjb0JG2Fq0G/ypVWi9IUE2w
         5d7iOfhaaH6qyc7Aw8JaLq5Rvgvn8/LxsH2VkBjKvwVtud/VXvr4zr5LefWLmUAw8S4M
         LR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gR/SlmlCtWaTEuhJ75HH1ougxe6tbAau9fplmY1Gd1c=;
        b=cd9RYWpV64s47lQFSuAv8NA7JrnYbt+kZBp1SZBk0Inwi88fy5pJHHcbNzDsDqozTL
         4POzI8U7c4KHTJ4i1vjdmORzwIccVzDc9H470SNRj45/fGr1s/TSDAEcy3zD/Fsz28fu
         ZoDpyFkRm6gzwTF1PfkWNhUW5aNqROY7oJyg/v+p8Zg415yOZsXVHB4+R9Wv8UssDiEV
         Wik3iYiZYU/tZFdPktf1Z0Ixb/aFXB06kop3oFn+nmyQ2FYfn+NQGFGXhYTcMbwrJnX0
         rCMFrWAhSem4Fo/19NBUG8d4AtU6HNYIz3I9OC4aEdjfQgQgQRXem6ociz9GnbFDIr1O
         RDuw==
X-Gm-Message-State: AOAM531G0JxgfYdy0df7BdmjH+BL3NcSjqMlNy7ftxnYyzor2uaVEVpW
        htMEArWulOE8lStzb9p/bdytPg==
X-Google-Smtp-Source: ABdhPJxRsv4PojQL36+xDxGkDTX6Y1faXi/IayqSpIVC+vvP+rkjhV+Cd07S7O92ZiBj/F10ccQT4A==
X-Received: by 2002:aca:3387:: with SMTP id z129mr221653oiz.123.1604427183670;
        Tue, 03 Nov 2020 10:13:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e47sm2643616ote.50.2020.11.03.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:13:03 -0800 (PST)
Date:   Tue, 3 Nov 2020 12:13:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/4] iommu/arm-smmu: Add a way for implementations to
 influence SCTLR
Message-ID: <20201103181301.GR3151@builder.lan>
References: <20201102171416.654337-1-jcrouse@codeaurora.org>
 <20201102171416.654337-3-jcrouse@codeaurora.org>
 <0a00c162-ad77-46b7-85ad-e11229b57a3d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a00c162-ad77-46b7-85ad-e11229b57a3d@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Nov 12:18 CST 2020, Robin Murphy wrote:

> On 2020-11-02 17:14, Jordan Crouse wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > For the Adreno GPU's SMMU, we want SCTLR.HUPCF set to ensure that
> > pending translations are not terminated on iova fault.  Otherwise
> > a terminated CP read could hang the GPU by returning invalid
> > command-stream data.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++++
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 3 +++
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h      | 3 +++
> >   3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > index 1e942eed2dfc..0663d7d26908 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -129,6 +129,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> >   	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
> >   		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> > +	/*
> > +	 * On the GPU device we want to process subsequent transactions after a
> > +	 * fault to keep the GPU from hanging
> > +	 */
> > +	smmu_domain->cfg.sctlr_set |= ARM_SMMU_SCTLR_HUPCF;
> > +
> >   	/*
> >   	 * Initialize private interface with GPU:
> >   	 */
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index dad7fa86fbd4..1f06ab219819 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -617,6 +617,9 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >   	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> >   		reg |= ARM_SMMU_SCTLR_E;
> > +	reg |= cfg->sctlr_set;
> > +	reg &= ~cfg->sctlr_clr;
> 
> Since we now have a write_s2cr hook, I'm inclined to think that the
> consistency of a write_sctlr hook that could similarly apply its own
> arbitrary tweaks would make sense for this. Does anyone have any strong
> opinions?
> 

I like it.

Regards,
Bjorn

> Robin.
> 
> > +
> >   	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
> >   }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 6c5ff9999eae..ddf2ca4c923d 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -144,6 +144,7 @@ enum arm_smmu_cbar_type {
> >   #define ARM_SMMU_CB_SCTLR		0x0
> >   #define ARM_SMMU_SCTLR_S1_ASIDPNE	BIT(12)
> >   #define ARM_SMMU_SCTLR_CFCFG		BIT(7)
> > +#define ARM_SMMU_SCTLR_HUPCF		BIT(8)
> >   #define ARM_SMMU_SCTLR_CFIE		BIT(6)
> >   #define ARM_SMMU_SCTLR_CFRE		BIT(5)
> >   #define ARM_SMMU_SCTLR_E		BIT(4)
> > @@ -341,6 +342,8 @@ struct arm_smmu_cfg {
> >   		u16			asid;
> >   		u16			vmid;
> >   	};
> > +	u32				sctlr_set;    /* extra bits to set in SCTLR */
> > +	u32				sctlr_clr;    /* bits to mask in SCTLR */
> >   	enum arm_smmu_cbar_type		cbar;
> >   	enum arm_smmu_context_fmt	fmt;
> >   };
> > 
