Return-Path: <linux-arm-msm+bounces-69954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C940DB2DB05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C86671C27F7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1855A2E6103;
	Wed, 20 Aug 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZOKlVAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C82E54B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689447; cv=none; b=kz+x6BlyAkVX/MmGvOr7V3IG1f6V5o6hROb3KrYet6IesoEEiHOJsp+k/Gcrj+RuMNBX2rgFHmaH7ypxDtGj2eBCCyGZChmvlB53j4QudNAQv8n15FqW/hqb9qRZ5F4CzuDNyoz0szbYDk3D5i9DoMZxX+oFT1bAqEysmmXn0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689447; c=relaxed/simple;
	bh=PDXwq2L/igkEe7rEXP0JAqYjJGbRhMnDhaOHC1w+HI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXUGfRCFYgJIKjhz8NK1ltDuU/1OXc3exVvzMYR7PW7c6FXZRibrUIFpvKuSkmTUix3m2l3LA3Q3PNBWGtgg5fUdMNgJvxeEUfYUc2c4vDwysWyjfn43zaBR9J4gdgYsgqja9NlDNCV0x6Zyp748WzFsCStpl7reoksyP+QoXHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZOKlVAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAVVrs031108
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=11qOqJ2/zlZWWFKG2Qr7IfBn
	gq7qq9U/nhTGIUfgWRE=; b=QZOKlVAg6zbinBbAlBM8YvB/mBK0kEER4HA8T0zi
	kcPs7uh7dDG0NCTzR+7taMHZZFq7OjNkCgRllYTACEqW5igjJqGBcYEWHqMy1abv
	TO91fM5R56+e5bCRMj9nm4HkY3FhDB1ohEVKvmypCbVm1hHTHfG9o/orQMdMwOzu
	z4bDpNq2lbxApwB5xy/hvpXEMPd+T6UDxPwzMahAMh/MfN5s07zX/TIlGkbQH1cc
	aSxTMk2GnNnASJBdpiK25MJRlB9C8VmHRLE5k8QWHBjSe5XHoWNK1p6ZlIgiybs6
	Td3FGMpkq4WPBgsT7vWdbwBkoK8J1+pKAuT6fRV21Yf0bQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dhg9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:30:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso6392626d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755689444; x=1756294244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11qOqJ2/zlZWWFKG2Qr7IfBngq7qq9U/nhTGIUfgWRE=;
        b=kPF9teMCZVgBdKxE0pfFkbRNWflX5cY7EdKb2FeaTe+q19OyUM8ucpPik0utenuRI5
         hjUNbteKJ+wkx+LfBZx2zR6zgceu10Si1wtPtd5oQRUEMyFasurgjNE/CPPejQdtBrXQ
         Rm98zJe8ulh+Z8GtdCj0sprA6L4piU/R3CjXUJs74kgnJAMUb/ABnteofPZQAjOFWl3x
         bmUnkrPcGQhEWBclG9N1hg8R0WnQ77PAjSf0pPo/3fAv5nduyDesVLYPB4gV3k01bXb9
         YGFKAncnRWihsOYTwPlLHDrhlUilgI4EiUTRLiqzZfZWHM3ebpfdsiLt2If9xs2hNPEu
         IqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtHvn5XX8khv28DTJHwaAodNPbasF/lbw2576IeFVmiKqEo2FIJtseT5gswX1SSAZVyD4stLA+98GWLaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nmqY/m5Ikas2n7SZJZld1VZA0MmpP+LqTt3xS3RKcPJlaLzB
	eiiNqbFtU1Onv4PgyvQaaK7fb71TW6Mtbm/LBW4iv7KzWj7gjedbsjtuvVZV7dXnmhSrZ3QK1Mp
	VCw/NcFm+JZXHQ0NTxs/LQ/NapMber0qP7jxWIOfhhaDNLzTTe3W0F86MJShJ9SRnmOD3
X-Gm-Gg: ASbGnctqE31+hOok9o3rfh5Sap6iEnHIRNDYoetUjYX7/Oy1EzUenE1NrcjZ2XwX61s
	Ddxh+imwXKhu71GI2B2An6w26Q6E+z0q8sbEncdWsdgGCf7GIO+BF0CqFTX0OHG6u5ezl+RpZ9w
	F52hbmRG7KYEWn40sPl9qSGwdrgWUd0D2RS6eeWseyVOgeD3kPzvZtUFIOwegsSboGWTlVWl22n
	YG2r3oh1+XtomaHhG9U4b3ZqUMpxZQIGyKIcafX0Zp+EAiSic8LkiqHhvnYFA+jY+btXbVz5SU1
	43KspRrThJQchM7Kj+ojNMAMUS+Nx1JAFfACIufkuWrknb/U5Q8l63VOT/QKfVQkAg1b3j5vRiG
	1/9ok/L+3fAEWboeKn0Y2L37JwyEJTw77hdvqV8+9tXaDQEPfdWQK
X-Received: by 2002:a05:6214:dc6:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70d7714c5b0mr23381336d6.51.1755689443610;
        Wed, 20 Aug 2025 04:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCoIBzEYR/mDTVo8mBK1FNVcFSnDbMhTwv7zD/ZmeWi/75iYf9Zf+uZargQHtGNMC8Hn4UzA==
X-Received: by 2002:a05:6214:dc6:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70d7714c5b0mr23380446d6.51.1755689442859;
        Wed, 20 Aug 2025 04:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3e31sm2575508e87.119.2025.08.20.04.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:30:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:30:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Message-ID: <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXypGbg1EJNCs8
 eFYj6uieJ3xfAQLRblJpCobMeJ6A5/vjFI5q6YuO1kzOvHtU8PK6IOjItBZc2lrOoRshPd+XLZe
 CBVfzAW3pGNR0J/GN79x8tku4+gX1/Sq9vKGANQIwY23slfECKjYkJVRWfjrz5Y3Na2eQTowTSU
 B0sM16O9+C9HRPovfRLvSw1kXdKr+2fsDYx6U2OpCHdD0F1U9bjK5TQW7yMk9KMs6uP3SlDfmIq
 euE5wD3+kit+9UKpFpmELOUtnd1Ejut3fr+p0L6dl0xTvbdkEnNYzW3Dcy2RNhLpJUAwulBwpXB
 w+c/CVNgn3N5CxXInZ5Xhx33IJOoSKpquhYFApv6Nk8e7Ev7LkMHPrZVIekXA34h/HQJ05gdjNH
 VRqy/3o9JkEhrKxH4EWEIsLpO389vQ==
X-Proofpoint-ORIG-GUID: 9P-GckP1PqDyVYTNjBGpsQNroI-lK9U9
X-Proofpoint-GUID: 9P-GckP1PqDyVYTNjBGpsQNroI-lK9U9
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a5b1e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Buvtj7qxYYKUlD_DlT0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> instead of hardcoded lists. This enables per-PHY customization and
> simplifies initialization logic for USB-only and USB/DP switchable PHYs.

Please split into two patches in order to simplify reviewing.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
>  1 file changed, 53 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>  
> -	/* regulators to be requested */
> -	const char * const *vreg_list;
> +	const char * const *reset_list;
> +	int num_resets;
> +	const struct regulator_bulk_data *vreg_list;
>  	int num_vregs;
>  
>  	/* array of registers with different offsets */
> @@ -453,7 +454,6 @@ struct qmp_usbc {
>  	struct clk_hw dp_pixel_hw;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> -	int num_resets;
>  	struct reset_control_bulk_data *resets;
>  	struct regulator_bulk_data *vregs;
>  
> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
>  	"phy_phy", "phy",
>  };
>  
> -/* list of regulators */
> -static const char * const qmp_phy_vreg_l[] = {
> -	"vdda-phy", "vdda-pll",
> +static const char * const usb3dpphy_reset_l[] = {
> +	"phy_phy", "dp_phy",
> +};
> +
> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> +	{ .supply = "vdda-phy" },
> +	{ .supply = "vdda-pll" },

Please fill in the values for all platforms. It well might be that they
all share the same current requirements.

> +};
> +
> +static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 21800 },
> +	{ .supply = "vdda-phy", .init_load_uA = 36000 },

Typo

>  };
>  
>  static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
> @@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> -	.vreg_list              = qmp_phy_vreg_l,
> -	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> +	.vreg_list              = qmp_phy_usb_vreg_l,
> +	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
>  	.regs                   = qmp_v3_usb3phy_regs_layout,
>  };
>  
> @@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_usb_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>  
> @@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_usb_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>  
> @@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>  
>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
> +
> +	.reset_list		= usb3dpphy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
> +	.vreg_list		= qmp_phy_usbdp_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>  };
>  
>  static int qmp_usbc_com_init(struct phy *phy)
> @@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
>  		return ret;
>  	}
>  
> -	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> +	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  	if (ret) {
>  		dev_err(qmp->dev, "reset assert failed\n");
>  		goto err_disable_regulators;
>  	}
>  
> -	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
> +	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>  	if (ret) {
>  		dev_err(qmp->dev, "reset deassert failed\n");
>  		goto err_disable_regulators;
> @@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
>  	return 0;
>  
>  err_assert_reset:
> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  err_disable_regulators:
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  
> @@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>  
> @@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
>  			   qmp_usbc_runtime_resume, NULL)
>  };
>  
> -static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
> +static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	struct device *dev = qmp->dev;
> -	int num = cfg->num_vregs;
> -	int i;
> -
> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
> -	if (!qmp->vregs)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i];
> -
> -	return devm_regulator_bulk_get(dev, num, qmp->vregs);
> -}
> -
> -static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
> -			      const char *const *reset_list,
> -			      int num_resets)
> -{
>  	struct device *dev = qmp->dev;
>  	int i;
>  	int ret;
>  
> -	qmp->resets = devm_kcalloc(dev, num_resets,
> +	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
>  				   sizeof(*qmp->resets), GFP_KERNEL);
>  	if (!qmp->resets)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < num_resets; i++)
> -		qmp->resets[i].id = reset_list[i];
> +	for (i = 0; i < cfg->num_resets; i++)
> +		qmp->resets[i].id = cfg->reset_list[i];
>  
> -	qmp->num_resets = num_resets;
> -
> -	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
> +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>  
> @@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
>  
>  	qmp->num_clks = ret;
>  
> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  
> @@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>  	qmp->pipe_clk = devm_clk_get(dev, "pipe");
>  	if (IS_ERR(qmp->pipe_clk)) {
>  		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> -				     "failed to get pipe clock\n");
> +					"failed to get pipe clock\n");

unrelated

>  	}
>  
> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
> -				 ARRAY_SIZE(usb3phy_reset_l));
> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  
> @@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct device_node *np;
>  	struct qmp_usbc *qmp;
> +	const struct qmp_phy_cfg *cfg;
>  	int ret;
>  
>  	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
> @@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
>  
> -	qmp->cfg = of_device_get_match_data(dev);
> -	if (!qmp->cfg)
> +	cfg = of_device_get_match_data(dev);
> +	if (!cfg)
>  		return -EINVAL;
>  
> +	qmp->cfg = cfg;

Why? This doesn't seem related at all.

> +
>  	mutex_init(&qmp->phy_mutex);
>  
> -	ret = qmp_usbc_vreg_init(qmp);
> +	ret = qmp_usbc_reset_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
> +					 cfg->vreg_list, &qmp->vregs);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

