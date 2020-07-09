Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49E521A488
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 18:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgGIQRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 12:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgGIQRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 12:17:12 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A987C08C5CE;
        Thu,  9 Jul 2020 09:17:12 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g20so2301152edm.4;
        Thu, 09 Jul 2020 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PbZTITmKTO9v4/Yy5DRRIZvAYJtU4hHDRKc55yhoFy4=;
        b=n3wS0iGzZ+3YDjJV1K5llsijCzKsYTst8VuFIEVvZOSavY1U74imu45mEgZlSakZf4
         WPMJYVU/0tUHeJI3M2J3pGB9N9I0H/aWlu4TC3GOoAmF1NMT3dbJiX+p67oqmwRKay3O
         rRhCmZU9Ek/IOFhh4gljW512FIRCzsVu0P0yGrBxP2tJZuj3RJtcUN8slT8VL3/PRwOr
         oCk+66SFbGZUkpjpXBrLDGG3gSQrv4VNLRiE7fUMK12wfZVibjY4XmW7JXJm2YxSxfy7
         78A2ckUJ3hQUx7LFW2vusyS+D+99aRqGihxtgozQebu7h6jbQ+dlYEMptlp+nE7Rbtbn
         hCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbZTITmKTO9v4/Yy5DRRIZvAYJtU4hHDRKc55yhoFy4=;
        b=bur9Fne+l07eoYizpiqdqar/GBJSCipoxOnuGnpgAd56ywVuN53FnCndwgnr1/p9/u
         4GHqaKoeDF6tgQo9+XuFlgordaNcyWJiOUCuj0ri4I+M9nN8tLxvPZ/cp11/Jcbq3nGr
         ZXLLoG8NNY1wUFz5/12r0gb1Py3454ua4TyDa+3BMq6R24K4DuW5qLdjduwfyiOhfMiK
         yTM/wOq9r5mS0geZPbgsa19tqZkySHyPzKRsevR8g5nOdIvC3qfBBRivO1foubBK5HGk
         0DgyMEQKAq8FnH6LZRqR2Y1VwBlxAX+8SbfRGv7LMngGY4HzLyxcsFrLvhjFZUQqtPc+
         xvLw==
X-Gm-Message-State: AOAM531okfEYJPPmrfGf/3x2JcSzZSdIa5m7rpYBy1FWj8SGBJ+KZa9l
        Y/yKRQnzYOsB5XrPFsiHJw4lpIeNJWnw0xl/9eQ=
X-Google-Smtp-Source: ABdhPJxyxniiEqOkIUEv4MnLELcL6+agHSgEU06T0R8qfHUOr7BcZLOmDEYtKyWKxCrm4Pm5IgGcCEQKfeInQQacQDs=
X-Received: by 2002:a50:f392:: with SMTP id g18mr49995614edm.151.1594311430652;
 Thu, 09 Jul 2020 09:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org> <20200709050145.3520931-3-bjorn.andersson@linaro.org>
In-Reply-To: <20200709050145.3520931-3-bjorn.andersson@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Jul 2020 09:17:42 -0700
Message-ID: <CAF6AEGugJYmMpeH_9mWXcegq1awzraUzBTa0S1Rqcr3=Bmk0uQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] iommu/arm-smmu: Emulate bypass by using context banks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 8, 2020 at 10:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Some firmware found on various Qualcomm platforms traps writes to S2CR
> of type BYPASS and writes FAULT into the register. This prevents us from
> marking the streams for the display controller as BYPASS to allow
> continued scanout of the screen through the initialization of the ARM
> SMMU.
>
> This adds a Qualcomm specific cfg_probe function, which probes the
> behavior of the S2CR registers and if found faulty enables the related
> quirk. Based on this quirk context banks are allocated for IDENTITY
> domains as well, but with ARM_SMMU_SCTLR_M omitted.
>
> The result is valid stream mappings, without translation.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
>  drivers/iommu/arm-smmu.c      | 14 ++++++++++++--
>  drivers/iommu/arm-smmu.h      |  3 +++
>  3 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index cf01d0215a39..e8a36054e912 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -23,6 +23,26 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
>         { }
>  };
>
> +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +       unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
> +       u32 reg;
> +
> +       /*
> +        * With some firmware writes to S2CR of type FAULT are ignored, and
> +        * writing BYPASS will end up as FAULT in the register. Perform a write
> +        * to S2CR to detect if this is the case with the current firmware.
> +        */
> +       arm_smmu_gr0_write(smmu, last_s2cr, FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
> +                                           FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
> +                                           FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT));
> +       reg = arm_smmu_gr0_read(smmu, last_s2cr);
> +       if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
> +               smmu->qcom_bypass_quirk = true;
> +
> +       return 0;
> +}
> +
>  static int qcom_smmu_def_domain_type(struct device *dev)
>  {
>         const struct of_device_id *match =
> @@ -61,6 +81,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>  }
>
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +       .cfg_probe = qcom_smmu_cfg_probe,
>         .def_domain_type = qcom_smmu_def_domain_type,
>         .reset = qcom_smmu500_reset,
>  };
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 2e27cf9815ab..f33eda3117fa 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -654,7 +654,9 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>
>         /* SCTLR */
>         reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
> -             ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
> +             ARM_SMMU_SCTLR_TRE;
> +       if (cfg->m)
> +               reg |= ARM_SMMU_SCTLR_M;
>         if (stage1)
>                 reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
>         if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> @@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>         if (smmu_domain->smmu)
>                 goto out_unlock;
>
> -       if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> +       /*
> +        * Nothing to do for IDENTITY domains,unless disabled context banks are
> +        * used to emulate bypass mappings on Qualcomm platforms.
> +        */
> +       if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {

maybe I'm overlooking something, but I think this would put us back to
allocating pgtables (and making iommu->map/unmap() no longer no-ops),
which I don't think we want

BR,
-R

>                 smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
>                 smmu_domain->smmu = smmu;
>                 goto out_unlock;
> @@ -826,6 +832,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>         domain->geometry.aperture_end = (1UL << ias) - 1;
>         domain->geometry.force_aperture = true;
>
> +       /* Enable translation for non-identity context banks */
> +       if (domain->type != IOMMU_DOMAIN_IDENTITY)
> +               cfg->m = true;
> +
>         /* Initialise the context bank with our page table cfg */
>         arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
>         arm_smmu_write_context_bank(smmu, cfg->cbndx);
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index d172c024be61..a71d193073e4 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -305,6 +305,8 @@ struct arm_smmu_device {
>
>         /* IOMMU core code handle */
>         struct iommu_device             iommu;
> +
> +       bool                            qcom_bypass_quirk;
>  };
>
>  enum arm_smmu_context_fmt {
> @@ -323,6 +325,7 @@ struct arm_smmu_cfg {
>         };
>         enum arm_smmu_cbar_type         cbar;
>         enum arm_smmu_context_fmt       fmt;
> +       bool                            m;
>  };
>  #define ARM_SMMU_INVALID_IRPTNDX       0xff
>
> --
> 2.26.2
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
