Return-Path: <linux-arm-msm+bounces-815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDBA7EE42B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 16:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1482280A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285912C865;
	Thu, 16 Nov 2023 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lb7MCzE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA59A19D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:25:11 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d865854ef96so865069276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700148311; x=1700753111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yoms34FsK4SCyToEqB/I9dPW/3PKklM8+dwv2tCvAnA=;
        b=Lb7MCzE0SxQ3Ua3/bPJ4EVpPMCcmzztOlY0013ddU4Al9iXQQbpuXVgXUixbxW4a/h
         KR7RatDMtKTrx0fZ0uzeR7BLOnTySJxomDXdTTmF7J7gpo3XTFWuIdgOdI3E4QjrULtL
         uwUFanfcu4LqGFC7ZJvZ4PuDXs7/68OKyOiMdBSHMqpAh/cwWcbR3hwW8gvRa3hGPPWC
         LAe8uUQ2wC9K9t3HFP2JS9W0/K6/0yus1cY0CVVpSwuFdhWXWvVxGa/a3TvSEHdp9jb2
         RQ60i1JtqurM5JkymGQ4Mli8xzrOvXjHh87YT9YqCq98pJCGy0l0jGLRp/Ab+MKg+kK7
         WCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700148311; x=1700753111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yoms34FsK4SCyToEqB/I9dPW/3PKklM8+dwv2tCvAnA=;
        b=UTSUUPN+J43ugQw6Gnq6ONP3irEp21h9SRmT5WCw3OjLc/nznUUEQclo71HRqDQZxM
         YKwm1kaX1kktCg8GMQQpF/MX8eHTgqQLkPq51cVfhVV/dv05K//KqmEbbr2ixMAhuwrs
         xT1kc5cuIoMqfZHtBbJqpTlSW6ELYflQpIDoddUd9A8aB//7P+fuRUOpNwTR88VVQzfF
         U1igQA2QnMUD/R2mBKH9BcHhFzsD+V54gizZ2FWsgKT+HVvBNWhDNQzcDLNYxmnCyQUp
         wcvUzq1FdlugzGz6dcmPx4+1CTCU7C21mqa4GBvDxx0YJf12J/9n9s/Qcz4ift2uMuE6
         cZHw==
X-Gm-Message-State: AOJu0YyirTsMhhY273cYwaFHWQdkB42cvH/MBiUW6X8QIX536jbAOEnt
	nfPpkv5Ch3x8tZiWXwO7GmM6jz8RXArsodKJac8xOw==
X-Google-Smtp-Source: AGHT+IEdrGI2GaaFm4NnHJNyeJQd7vfEPu7GnR/TVL6G1x7zK7jKjjfDyMj7aIw96WZz5PeFM6EmB66JQ2RRuAuL0Jw=
X-Received: by 2002:a25:e751:0:b0:da0:514a:8f42 with SMTP id
 e78-20020a25e751000000b00da0514a8f42mr14661508ybh.32.1700148311009; Thu, 16
 Nov 2023 07:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-4-quic_bibekkum@quicinc.com> <CAA8EJpoRmm42aAvyX61o3tMWXszUZmfFvJEtnNDEfYdDqy4Y0g@mail.gmail.com>
 <72b30354-0497-45cf-8b71-e4f265eb0005@quicinc.com> <CAA8EJprPE=z2VN5LkaUyLyvYpx6i1eF9dyxOzN_L86pi5tmU-Q@mail.gmail.com>
 <0d290a5c-081f-4dfa-af9a-b061e6134662@quicinc.com>
In-Reply-To: <0d290a5c-081f-4dfa-af9a-b061e6134662@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 17:24:59 +0200
Message-ID: <CAA8EJprHppoN6rg8-rS1F+4kynQqmV1L3OiHFnJ0HyrshywFig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 14:45, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2023 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, 15 Nov 2023 at 11:45, Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> On 11/14/2023 7:45 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>> Context caching is re-enabled in the prefetch buffer for Qualcomm SoCs
> >>>> through SoC specific reset ops, which is disabled in the default MMU-500
> >>>> reset ops, but is expected for context banks using ACTLR register to
> >>>> retain the prefetch value during reset and runtime suspend.
> >>>
> >>> Please refer to Documentation/process/submitting-patches.rst and
> >>> rephrase this following the rules there.
> >>>
> >>
> >> Noted, will go through the description once and rephrase it
> >> in next version complying with rules.
> >>
> >>>>
> >>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>> ---
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 25 ++++++++++++++++++----
> >>>>    1 file changed, 21 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> index 0eaf6f2a2e49..fa867b1d9d16 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> @@ -478,11 +478,28 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> >>>>           return match ? IOMMU_DOMAIN_IDENTITY : 0;
> >>>>    }
> >>>>
> >>>> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> >>>> +{
> >>>> +       int i;
> >>>> +       u32 reg;
> >>>> +
> >>>> +       arm_mmu500_reset(smmu);
> >>>> +
> >>>> +       /* Re-enable context caching after reset */
> >>>> +       for (i = 0; i < smmu->num_context_banks; ++i) {
> >>>> +               reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> >>>> +               reg |= CPRE;
> >>>> +               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, reg);
> >>>> +       }
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>>    static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> >>>>    {
> >>>>           int ret;
> >>>>
> >>>> -       arm_mmu500_reset(smmu);
> >>>> +       qcom_smmu500_reset(smmu);
> >>>
> >>> Is this applicable for sdm845? For all other platforms supported by
> >>> qcom_smmu_500 implementation?
> >>>
> >>
> >> In arm_mmu500_reset operation drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> >> CPRE bit is reset for all SoC based on mmu500 platform, hence for all
> >> Qualcomm SoCs including sm845 we are setting back the CPRE bit.
> >
> > The errata for the CoreLink MMU-500 requires CPRE to be disabled for
> > all revisions before r2p2. Do we know whether these SoC used CoreLink
> > MMU-500 and which version of it?
> >
>
> Just checked all these SoCs are using r2p4 revision.
> So CPRE needs to be enabled back here then?

can be enabled, yes.

>
> >>
> >>>>
> >>>>           /*
> >>>>            * To address performance degradation in non-real time clients,
> >>>> @@ -509,7 +526,7 @@ static const struct arm_smmu_impl qcom_smmu_500_impl = {
> >>>>           .init_context = qcom_smmu_init_context,
> >>>>           .cfg_probe = qcom_smmu_cfg_probe,
> >>>>           .def_domain_type = qcom_smmu_def_domain_type,
> >>>> -       .reset = arm_mmu500_reset,
> >>>> +       .reset = qcom_smmu500_reset,
> >>>>           .write_s2cr = qcom_smmu_write_s2cr,
> >>>>           .tlb_sync = qcom_smmu_tlb_sync,
> >>>>    };
> >>>> @@ -528,7 +545,7 @@ static const struct arm_smmu_impl sm8550_smmu_500_impl = {
> >>>>           .init_context = qcom_smmu_init_context,
> >>>>           .cfg_probe = qcom_smmu_cfg_probe,
> >>>>           .def_domain_type = qcom_smmu_def_domain_type,
> >>>> -       .reset = arm_mmu500_reset,
> >>>> +       .reset = qcom_smmu500_reset,
> >>>>           .write_s2cr = qcom_smmu_write_s2cr,
> >>>>           .tlb_sync = qcom_smmu_tlb_sync,
> >>>>    };
> >>>> @@ -544,7 +561,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
> >>>>    static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
> >>>>           .init_context = qcom_adreno_smmu_init_context,
> >>>>           .def_domain_type = qcom_smmu_def_domain_type,
> >>>> -       .reset = arm_mmu500_reset,
> >>>> +       .reset = qcom_smmu500_reset,
> >>>>           .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> >>>>           .write_sctlr = qcom_adreno_smmu_write_sctlr,
> >>>>           .tlb_sync = qcom_smmu_tlb_sync,
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>
> >>>
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

