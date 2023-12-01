Return-Path: <linux-arm-msm+bounces-2828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C88004E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB17281570
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86FF156FA;
	Fri,  1 Dec 2023 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qpKojryL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E3D10F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:42:47 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so17307105e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416565; x=1702021365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4gZXQfygUPAe+AAwdkfE77RWakOl4sMNVWq16oRFqo=;
        b=qpKojryL45jyGjUxwC6TSUVoKCNsUxuqljNiQ0BNPSeomG6LSnog9Ncs2ur7DLPxg7
         CRmwj1baMzhowyiqMrepCqWku5tX8CooEdFc56DprqtfPcM4CPg0pm6M0WbxJ8nLGXZK
         6o0kE3k79aWZ81vCZxs6K05stS8XKMIQcx65YEUET86MiUv2GBAAzrExQhCETFA7Um6M
         pkN2yyeLj6PIYqt9WLqgb1SMKtg3i/7bqGIQtalUAkaDJHPmWwcIjLVBlbECsjWPsoyq
         69jbnPaVOvF6xmoDZsqKl9w7yq7x+ws2haQ5hpWt5OJ922WMV5owjZiwgy0L+kHhUFCL
         NHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416565; x=1702021365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4gZXQfygUPAe+AAwdkfE77RWakOl4sMNVWq16oRFqo=;
        b=uUEaxRExNmwNgYQOKh5/Vyq643gVke+rZGwpVVugEc9A+kdQVjHCZzTV6bd4wswEKn
         7hy7OzcBa+NhncJI+qETbo6vzfsHkUsLufpQlQttXtBptTzonLT3LOt6VP7vS4gaYaO3
         iajeWaXHupYgAAki1epQR2YKbsgXh3/fSU8FXElgy4uvWdvTGpKDRIvLVsh7f3f8mk1s
         TKo0fJ+7TstJbMcXfAbGVaOqBPM05mM9mZXXyLFiiEOqvvBuDqPJWkjG7W3ZonsxeuwF
         nr2qtPox5NeXVaM4ksMYHWFdnlKzEiwXfvyPRZ860pnJY+kMgCiNwUuptX2w2k+avoJ3
         vjhw==
X-Gm-Message-State: AOJu0YyJZjUYeobMz5l1tWhOGaHHeF8RjtQcvGUWRx8eUE7yQhUutZfy
	ePXi7yiMzKKhYNDc8hBkmwp1QQ==
X-Google-Smtp-Source: AGHT+IG8QItqsyTUDzO6jqy3bmRQOm7s+atezgPFS5+u0HQXHp+QjW1sXTrPxRPVRMGdCUohoXNNlg==
X-Received: by 2002:a05:600c:20d1:b0:40b:5e21:e278 with SMTP id y17-20020a05600c20d100b0040b5e21e278mr213483wmm.101.1701416565467;
        Thu, 30 Nov 2023 23:42:45 -0800 (PST)
Received: from linaro.org ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id e13-20020adff34d000000b00332f95ab44esm3472068wrp.57.2023.11.30.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:42:45 -0800 (PST)
Date: Fri, 1 Dec 2023 09:42:43 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com,
	vkoul@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 09/10] phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550
 UFS HS-G4 PHY Settings
Message-ID: <ZWmOc/L/2najkwKf@linaro.org>
References: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
 <1701407001-471-10-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701407001-471-10-git-send-email-quic_cang@quicinc.com>

On 23-11-30 21:03:19, Can Guo wrote:
> The registers, which are being touched in current SM8550 UFS PHY settings,
> and the values being programmed are mainly the ones working for HS-G4 mode,
> meanwhile, there are also a few ones somehow taken from HS-G5 PHY settings.
> However, even consider HS-G4 mode only, some of them are incorrect and some
> are missing. Rectify the HS-G4 PHY settings by strictly aligning with the
> SM8550 UFS PHY Hardware Programming Guide suggested HS-G4 PHY settings.
> 
> Fixes: 1679bfef906f ("phy: qcom-qmp-ufs: Add SM8550 support")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---

Hi Can,

Since you are not CC'ing everyone on all patches from this series,
please write the changes made since the last version in every patch (if
applicable) from now on.

Thanks,
Abel

>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 28 +++++++++++++++-------
>  2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> index ae220fd..35d497f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> @@ -11,6 +11,7 @@
>  #define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX		0x30
>  #define QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_RX		0x34
>  #define QSERDES_UFS_V6_TX_LANE_MODE_1				0x7c
> +#define QSERDES_UFS_V6_TX_FR_DCC_CTRL				0x108
>  
>  #define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE2		0x08
>  #define QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		0x10
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 5f79d18..3c2e625 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -763,22 +763,26 @@ static const struct qmp_phy_init_tbl sm8550_ufsphy_serdes[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7f),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x4c),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x0a),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x99),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8550_ufsphy_hs_b_serdes[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x44),
>  };
>  
>  static const struct qmp_phy_init_tbl sm8550_ufsphy_tx[] = {
> -	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_LANE_MODE_1, 0x05),
>  	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_TX_FR_DCC_CTRL, 0x4c),
>  };
>  
>  static const struct qmp_phy_init_tbl sm8550_ufsphy_rx[] = {
> -	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE2, 0x0c),
> -	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_UCDR_FO_GAIN_RATE2, 0x0c),
>  	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_VGA_CAL_MAN_VAL, 0x0e),
>  
>  	QMP_PHY_INIT_CFG(QSERDES_UFS_V6_RX_MODE_RATE_0_1_B0, 0xc2),
> @@ -801,6 +805,8 @@ static const struct qmp_phy_init_tbl sm8550_ufsphy_pcs[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
>  	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x2b),
>  	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
>  };
>  
>  static const struct qmp_phy_init_tbl sm8650_ufsphy_serdes[] = {
> @@ -1357,6 +1363,10 @@ static const struct qmp_phy_cfg sm8550_ufsphy_cfg = {
>  		.pcs		= sm8550_ufsphy_pcs,
>  		.pcs_num	= ARRAY_SIZE(sm8550_ufsphy_pcs),
>  	},
> +	.tbls_hs_b = {
> +		.serdes		= sm8550_ufsphy_hs_b_serdes,
> +		.serdes_num	= ARRAY_SIZE(sm8550_ufsphy_hs_b_serdes),
> +	},
>  	.clk_list		= sdm845_ufs_phy_clk_l,
>  	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
>  	.vreg_list		= qmp_phy_vreg_l,
> -- 
> 2.7.4
> 

