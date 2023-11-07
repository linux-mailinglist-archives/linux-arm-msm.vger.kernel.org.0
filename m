Return-Path: <linux-arm-msm+bounces-93-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD47E3FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003861C209F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859222EB0E;
	Tue,  7 Nov 2023 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMhePyp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D362E65D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:10:24 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8077199B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 05:10:22 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a81ab75f21so67518277b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362622; x=1699967422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm1Mb5/Vjq9aMkJlsrjTa8/I47O6pvYgHKx9Bcn4a/Q=;
        b=GMhePyp1xSjoCtMzDE13LEVP1aNRD09yC5boje5juuXie05U1E7JcwHAuYp6cMJIEQ
         O58QaTxVxhwvfh3deAsZBik+Et4fRdy+WnI2yMVNtYlgscFkRWkr94NxIaUWTHKqr+bh
         jwR6jv4pqvYaM9ZwKZ3QZSJJoTGlr50iTsx9zicd0otcH+abyYyO9U6b29x3+Df94zQw
         hkMYFAd4dJxHRmTCe5cR3TWrpBrEshrQOUSE9rakadtSUilUEUftY9EGx+h0nVeMvxqf
         3Y1X4kSdPffdpC3CzTPrEHxbDb5Yu+n20XNBl2VZpErC4KjvJHS26c8TLSefY/Yrn+sS
         lHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362622; x=1699967422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wm1Mb5/Vjq9aMkJlsrjTa8/I47O6pvYgHKx9Bcn4a/Q=;
        b=cX+4VPCg8JSK8gR8oaJ2DDuXxGpjNz7ExJf0dYexZYQIOvtwwEht3W55ISmZgRMism
         uBWo1pKe7qUoR4UeyTmUKqzHA4pU+pxePUYa7TJtH7perP1fxSIsDb8tIWtVxxtSikss
         xixHrbwGRUtUOc5bDTZRPXP+3qtMOO1eQGcDsRn9yPH8pUJ4KoWpSahkLC59d3TixtAE
         oqlffOtghqrGpG3fEagQQ25N8Xq7+WgMbj1rMvk9Fapjs6NTe6OE4J6oeqTSBZyLJ7Tu
         QVu9DAgZE/+eHhLXDBa9s+wEu0FSRUngVN+pWgIr8QKtMbFCR6TiKtj3/oppjWe+IOkU
         JrYw==
X-Gm-Message-State: AOJu0Yw4G1tndyIKAuqh7GgpknEfppiy0OQHZhdvu3iIKBQqDZaymOan
	W5BX9KdS3IOhnm+uYbXnfpaapSSI6J+5Vy2gK7b25g==
X-Google-Smtp-Source: AGHT+IF5Y2PdTK3EgzgxLoQDJvc7JWtJeaqzhWMhuNj03yIKxJpo/mL6Uhb0mf5EVPARRWo8zNGIUpAEY6Ec32rjXXY=
X-Received: by 2002:a0d:d48a:0:b0:5ad:4975:c860 with SMTP id
 w132-20020a0dd48a000000b005ad4975c860mr13979075ywd.39.1699362621854; Tue, 07
 Nov 2023 05:10:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1699362294-15558-1-git-send-email-quic_msarkar@quicinc.com> <1699362294-15558-2-git-send-email-quic_msarkar@quicinc.com>
In-Reply-To: <1699362294-15558-2-git-send-email-quic_msarkar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 15:10:09 +0200
Message-ID: <CAA8EJpp4E7L0JZjj3mT_2SQHeA6az9uwtaF3_diZ_McpGRg-Jg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] phy: qcom-qmp-pcie: add x4 lane EP support for sa8775p
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org, 
	robh+dt@kernel.org, quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, 
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, robh@kernel.org, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com, quic_parass@quicinc.com, 
	quic_schintav@quicinc.com, quic_shijjose@quicinc.com, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 15:05, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
> Add support for x4 lane end point mode PHY found on sa8755p platform.
> Reusing existing serdes and pcs_misc table for EP and moved
> BIAS_EN_CLKBUFLR_EN register from RC serdes table to common serdes
> table as this register is part of both RC and EP.
>
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index b64598a..7114b4e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2099,6 +2099,7 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl[] = {
>  };
>
>  static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl[] = {
> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x36),
> @@ -2125,7 +2126,6 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl[]
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE0, 0x07),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE1_MODE1, 0x97),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_STEP_SIZE2_MODE1, 0x0c),
> -       QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_ENABLE1, 0x90),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x06),
>         QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x06),
> @@ -3114,6 +3114,13 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
>                 .pcs_misc_num   = ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
>         },
>
> +       .tbls_ep = &(const struct qmp_phy_cfg_tbls) {
> +               .serdes         = sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
> +               .serdes_num     = ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
> +               .pcs_misc       = sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
> +               .pcs_misc_num   = ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
> +       },
> +
>         .reset_list             = sdm845_pciephy_reset_l,
>         .num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

