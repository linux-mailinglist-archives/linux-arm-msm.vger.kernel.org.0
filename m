Return-Path: <linux-arm-msm+bounces-2133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BF7FA5AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49ECA1C20B75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C70D35892;
	Mon, 27 Nov 2023 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZ14Ax1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E026F198
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:08:02 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso3896008276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701101282; x=1701706082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V2B/eeR2omq2Oonazkh8hRWn17MEqCUCyRtBnkSNEEs=;
        b=gZ14Ax1LcfVWsBlCtV5hN9iR/tdEYQuD6v8GvDweHaHb3M/mf2jMvs5SXdtuW84Xrv
         rrIiIqoBSXPK5At5vcrBhXfPkeNsKtPJWQPYcMwGltRe+UoOnfrLBsuMlmmmAygHYsuH
         +nYF48qBsLelvb6AqPut5oIRXsUltVWlyEN1bWt8lDFtKPECe+OdtKfRLKs7x1Cpj187
         B4/zJwS5p0/tdiKYFrGn1ngVpcRhfoF1mu4BaorC1uFEEq7epvuihuQzXt/irxPqdmPo
         IfgaO1Zzl7xDUvEkv6kpeDNZJK8xI7qRH8+qjIhOUGxYrM+frNtET/JPoSUoP3VlGzVV
         8K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101282; x=1701706082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2B/eeR2omq2Oonazkh8hRWn17MEqCUCyRtBnkSNEEs=;
        b=vR2zGKf0OzegCBIlgJHf1rTOa0jqWo6oyFQGtp1XxfL9c4b4qhgz3cj9lMu/ws3LGh
         mUKjubn440Ks99gHuExgaosUf5/a/5I+/koRo8b8ks80Or/uZylKBBOb6vzRcq0MPUyO
         76vxLhvSkEvcu0bdcYs2j4TkiUSMfqI5FdKv69LsHw3e/2RquaL+uD7LVwdLAwWONGpA
         jBkNTHf95WgaTvxzbZX45wx2Z+FFaEmD0UOex1wXwLWk7kBf4KUfmWpM/BLk3r4JL8mC
         Hu/23LtR5bR4F3gJOmzvOQYojmAG9VRCl4TMJLRNP7DogcEAbst/SAym0k33erTLvQN+
         TF0A==
X-Gm-Message-State: AOJu0Yw6YGbVv6IyMYdFWnV8CrvUZoJbRuStmAFBuuUiuEmB8OxkurGw
	unR5q1Q2cjwXgErqRImKm9hM3oCr/8wIkKQxjWIjcA==
X-Google-Smtp-Source: AGHT+IGB1S3Io3GL4luzxkgeoTDjEYrCNbh9B2CePzxtkIZjMueGC2yHbjQI0fQyKGFdQLgdQG9StT4yf2BPtsSHzDY=
X-Received: by 2002:a25:d609:0:b0:daf:6b6e:e328 with SMTP id
 n9-20020a25d609000000b00daf6b6ee328mr11260931ybg.39.1701101281837; Mon, 27
 Nov 2023 08:08:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127145412.3981-1-quic_bibekkum@quicinc.com> <20231127145412.3981-2-quic_bibekkum@quicinc.com>
In-Reply-To: <20231127145412.3981-2-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Nov 2023 18:07:50 +0200
Message-ID: <CAA8EJppKp0nVX-w4OmPKq0BSb_eWs6XpeuFbMobWT3tC2RNG7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_bjorande@quicinc.com, mani@kernel.org, 
	quic_eberman@quicinc.com, robdclark@chromium.org, 
	u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com, 
	quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 16:54, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a prefetch setting of 1/3/7/15 enabling TLB to prefetch
> the next set of page tables accordingly allowing for faster translations.
>
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 56 +++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  6 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
>  4 files changed, 68 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7f52ac67495f..4a38cae29be2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -14,6 +14,12 @@
>
>  #define QCOM_DUMMY_VAL -1
>
> +struct actlr_config {
> +       u16 sid;
> +       u16 mask;
> +       u32 actlr;
> +};
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -205,10 +211,40 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>         return true;
>  }
>
> +static void arm_smmu_set_actlr(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
> +               const struct actlr_config *actlrcfg, size_t actlrcfg_size)
> +{
> +       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +       struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> +       struct arm_smmu_smr *smr;
> +       int i;
> +       int j;
> +       u16 id;
> +       u16 mask;
> +       int idx;
> +
> +       for (i = 0; i < actlrcfg_size; ++i) {
> +               id = (actlrcfg + i)->sid;
> +               mask = (actlrcfg + i)->mask;
> +
> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
> +                       smr = &smmu->smrs[idx];
> +                       if (smr_is_subset(*smr, id, mask))
> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
> +                                               (actlrcfg + i)->actlr);
> +               }
> +       }
> +}
> +
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
>         struct adreno_smmu_priv *priv;
> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +       const struct actlr_config *actlrcfg;
> +       size_t actlrcfg_size;
> +       int cbndx = smmu_domain->cfg.cbndx;
>
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>
> @@ -238,6 +274,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>         priv->set_stall = qcom_adreno_smmu_set_stall;
>         priv->resume_translation = qcom_adreno_smmu_resume_translation;
>
> +       if (qsmmu->data->actlrcfg_gfx) {
> +               actlrcfg = qsmmu->data->actlrcfg_gfx;
> +               actlrcfg_size = qsmmu->data->actlrcfg_gfx_size;
> +               arm_smmu_set_actlr(dev, smmu, cbndx, actlrcfg, actlrcfg_size);
> +       }
> +
>         return 0;
>  }
>
> @@ -263,6 +305,18 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +       const struct actlr_config *actlrcfg;
> +       size_t actlrcfg_size;
> +       int cbndx = smmu_domain->cfg.cbndx;
> +
> +       if (qsmmu->data->actlrcfg) {
> +               actlrcfg = qsmmu->data->actlrcfg;
> +               actlrcfg_size = qsmmu->data->actlrcfg_size;
> +               arm_smmu_set_actlr(dev, smmu, cbndx, actlrcfg, actlrcfg_size);
> +       }
> +
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>
>         return 0;
> @@ -464,7 +518,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>                 return ERR_PTR(-ENOMEM);
>
>         qsmmu->smmu.impl = impl;
> -       qsmmu->cfg = data->cfg;
> +       qsmmu->data = data;

This should go to a separate commit. It is not related to ACTLR support

>
>         return &qsmmu->smmu;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 593910567b88..138fc57f7b0d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -8,7 +8,7 @@
>
>  struct qcom_smmu {
>         struct arm_smmu_device smmu;
> -       const struct qcom_smmu_config *cfg;
> +       const struct qcom_smmu_match_data *data;
>         bool bypass_quirk;
>         u8 bypass_cbndx;
>         u32 stall_enabled;
> @@ -25,6 +25,10 @@ struct qcom_smmu_config {
>  };
>
>  struct qcom_smmu_match_data {
> +       const struct actlr_config *actlrcfg;
> +       size_t actlrcfg_size;
> +       const struct actlr_config *actlrcfg_gfx;
> +       size_t actlrcfg_gfx_size;
>         const struct qcom_smmu_config *cfg;
>         const struct arm_smmu_impl *impl;
>         const struct arm_smmu_impl *adreno_impl;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d6d1a2a55cc0..8e4faf015286 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
>                  * expect simply identical entries for this case, but there's
>                  * no harm in accommodating the generalisation.
>                  */
> -               if ((mask & smrs[i].mask) == mask &&
> -                   !((id ^ smrs[i].id) & ~smrs[i].mask))
> +
> +               if (smr_is_subset(smrs[i], id, mask))
>                         return i;
> +
>                 /*
>                  * If the new entry has any other overlap with an existing one,
>                  * though, then there always exists at least one stream ID
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 703fd5817ec1..b1638bbc41d4 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>                 writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>  }
>
> +static inline bool smr_is_subset(struct arm_smmu_smr smrs, u16 id, u16 mask)

A pointer to the struct, please

> +{
> +       return (mask & smrs.mask) == mask && !((id ^ smrs.id) & ~smrs.mask);
> +}
> +
>  #define ARM_SMMU_GR0           0
>  #define ARM_SMMU_GR1           1
>  #define ARM_SMMU_CB(s, n)      ((s)->numpage + (n))
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

