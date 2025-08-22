Return-Path: <linux-arm-msm+bounces-70347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0BB314C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DA9C7A4FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A34E2C0288;
	Fri, 22 Aug 2025 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7A9xvj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4875296BA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857326; cv=none; b=FEjtdbTubmjSvDO4WfCrba8skAmHEY+joHftCuScpdlyspEWQb4nD606714ww9u98Pn0swCFdSh4USVximVPua8khZaSJzUYbDJPb8P6jW3+KmgXKbgiNWzk5K/y5ZNsE9jb6EkJXc2pnUBA/P4movkb3AUdfWtoh1XeAmZees4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857326; c=relaxed/simple;
	bh=K8QAahUnGe4mLUckNZSB/FwuYGl6ZTHXSv95Ldt0mjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSiaxxoGYnEbw+xxsW+oyOH3bMfusUXcYhwEH3ICDaxOPgXK9pNh07p0NGz9tQjcv/5lMyiL10GYTbv+609J2HxgrUQ2wNK9nQ4nwMlJqcC26AoTwtsjPuU/vr/4pib4Lm6oQRCF9H6jXL1cle/Ufadd+oYPVFE7YLqbme98V8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7A9xvj7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UTQ9030555
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3Oq6IeqsBr8d7DMg28n6xntUOJRa6+XhNN7IG19x7g=; b=b7A9xvj79dzpxdm/
	h2l9yrwCowspJz/Wy8HahV+ulqa8KniauN7Y38rru0oMx04WImTmhH03s3Tt2ouI
	WH5BG4T/fE1cYKRwmLE+WEEVgTieRu/xi5yb0dqPbh5mOCHoOTFjga9nx/RGrYda
	uoNhYsFdDIv486TFI3cZ4O02cFHDtCsS4V2Ll1M+l57pGnQJ+H3Q2YdGETocfgcB
	2o7iRySUqY8h8ngvB+Fnu5Hf0doyLe8APuececJc6cS1YDCX0up6r6FiR3xDdHZn
	PY+rt0E/N6pIuybTWDi63w70fgG9Eg34Q6nqMsHr9GkH3AaqOgx2P1KyFS+SmLY1
	6Ny3Cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdpp2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:08:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b134a9a179so19792481cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857322; x=1756462122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Oq6IeqsBr8d7DMg28n6xntUOJRa6+XhNN7IG19x7g=;
        b=tWpFYZFTlRnMIHuORvm0sgdFg0SUlUZZphUZtQ4Q3ofuAuvKRTryivMWhzgGZRhLid
         Fqpiw2pMBPup9uHXv3xtpTepmzZaJ4XBDy0efmWssTnITmEANzYFi5JeDfWuH2J+cv0E
         Vu9bj90aQts4Z+AP0idEFBu4OUdo+k3NehRxwoIgjVf5gXDpHyUj8kA5QWCmVxAwM37n
         DFqomb1apTzQO99bFO+NihpN9Rk6i2RCumhbYKQTTuhdVvnzAKAS3LkGcSPrSxuqePhg
         XfzSqKVyF/jIZm9whY6j7PekB8EOQWCSidc6EgKRRQVc6bxgm/e4Fi366dnB6Bpa3XHL
         40LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf2fefI/IWls1HjD7tnxZyhG0sW++CQFC77QA+UZsGdGYFl7xXg7XiV7wCGYSfxAPLiYlQPm7ZCWD1BGIR@vger.kernel.org
X-Gm-Message-State: AOJu0YxoI1aUucagNDgfDYtliLIKKZp8mP/ZHQcBbF9yNSpovzoG/NGK
	nbj6ANJlaiDxv/yZ419wFr7g8E7jT9qOjhsm0A2hLEq0B6coQjWjtmIw9P+hD7W6zlBmvgoheQu
	iCGiFdN12lTI6UKxwxSA5LE0Ad34+aQmcXRdeb/uM79x3p3DriNaxwx734B5FSLbs15MY
X-Gm-Gg: ASbGncuEm9lJf5z+9OTH1Grg2m3caXiT+bRb8AnPPhKSnjCUu1nl7r5YgbLb0f6QYHv
	QIF0sqAoCCUZgZjFCHQPbTO8EjxO4SkUXyZ27PoqAZCTL7ZpcQ5pZATOMnErQtlCqUWaE/DQXlp
	RrAAl/GTRBdl4MPBNO7X7pDqM3pHByJr/KgMn1hw+9gAGSBSskNU+MjRMiuypkI9DDDH1/k5OOp
	x++o8kGzKAzZwYy6GzYH7KKJJThBKahEmHiuy5H9gkR/l3lQ694OG249MWIBFTqX0QKdz3/NHKa
	RXD+08HNy6nalTlPZ8KyMxUOi+KjeOuyT8fiSype+38C5dhRQvf6bLHyyRQvPE56Wi3tXXwX4V5
	ludlp/2ak1abVYLlGKxNWsfcVP+FTQ0mcKtTouRehhk/cbpC9YRFe
X-Received: by 2002:a05:622a:2513:b0:4b1:bf7:2adf with SMTP id d75a77b69052e-4b2aaa6d0f2mr27808641cf.18.1755857322058;
        Fri, 22 Aug 2025 03:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEHAQ24q8+UPlpw3prxSB0tJZfAhyWevqYdOauxJKuca8cbecxJRyCfe29anp4IxL7US8Izw==
X-Received: by 2002:a05:622a:2513:b0:4b1:bf7:2adf with SMTP id d75a77b69052e-4b2aaa6d0f2mr27808181cf.18.1755857321263;
        Fri, 22 Aug 2025 03:08:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369a73sm3442266e87.65.2025.08.22.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:08:39 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:08:37 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Message-ID: <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a841ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eGj7nJ6_Ab5DLtFNWjwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3d6paYR5YuvuultBWXcdwpx4F7eGLF58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX8FJb+DMRUrZW
 za2wL5FI6plncPvGDbMkTGxGS6uVXJ6Jpkz6ixFEwjQenqENtFeFbcg1daDJq/4//jzWxnawGQ5
 i2ugL/MjMps/Q6PLKNPKDX+9kaF8LzkOBkVYhtJLvnCyBUyXfRv3c32EHnQAd4qxVtCJ6/A5KWI
 ofG9FGZ9++KkRG6AYJ7yeZ8ruTgYSClkxXOp5wSHcGJ81xDJdXLFzYr4nTZmi6tOSM6BBUilVPE
 XhBYfxLWVPjL7z4sa+0pH6SP0yxEje64Etm6BZ/uBd/dpjqpU+NoSs3/dJ4YAFGKLaI+sk9JvPk
 P6Oo1oA3NweagbBGeuATckvZWy7cqF3uZiuH++IsYM1MbDDmHJSdQ3J4E/sEdg6yB943Kjp7+Mg
 4PuzG4/hzCTk4wahMc4jxlTCYeuAyQ==
X-Proofpoint-ORIG-GUID: 3d6paYR5YuvuultBWXcdwpx4F7eGLF58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> >> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> >> instead of hardcoded lists. This enables per-PHY customization and
> >> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
> > Please split into two patches in order to simplify reviewing.
> 
> 
> Ok, will split reset and regulator part.
> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
> >>  1 file changed, 53 insertions(+), 55 deletions(-)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
> >>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
> >>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> >>  
> >> -	/* regulators to be requested */
> >> -	const char * const *vreg_list;
> >> +	const char * const *reset_list;
> >> +	int num_resets;
> >> +	const struct regulator_bulk_data *vreg_list;
> >>  	int num_vregs;
> >>  
> >>  	/* array of registers with different offsets */
> >> @@ -453,7 +454,6 @@ struct qmp_usbc {
> >>  	struct clk_hw dp_pixel_hw;
> >>  	struct clk_bulk_data *clks;
> >>  	int num_clks;
> >> -	int num_resets;
> >>  	struct reset_control_bulk_data *resets;
> >>  	struct regulator_bulk_data *vregs;
> >>  
> >> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
> >>  	"phy_phy", "phy",
> >>  };
> >>  
> >> -/* list of regulators */
> >> -static const char * const qmp_phy_vreg_l[] = {
> >> -	"vdda-phy", "vdda-pll",
> >> +static const char * const usb3dpphy_reset_l[] = {
> >> +	"phy_phy", "dp_phy",
> >> +};
> >> +
> >> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> >> +	{ .supply = "vdda-phy" },
> >> +	{ .supply = "vdda-pll" },
> > Please fill in the values for all platforms. It well might be that they
> > all share the same current requirements.
> 
> 
> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.

No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
12.560 mA for 1.8 V supply.

> 
> However, I didn’t find USB load configs in downstream and from SoC related power grids:

Please check the actual HW documentation for those platforms.

> QCS615
> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> 
> sm6150
> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> 
> SM6115
> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> 
> QCM2290
> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> 
> sdm660
> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
> 
> msm8998
> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
> 
> It seems the USB power requirements vary across platforms, and the
> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.

Ipk being ?

> I also tested removing the load settings for USB+DP PHY, and DP still works fine.

It mostly works either because we don't allow mode switching on older
platforms (yet) or because somebody else has already voted and that vote
keeps the required mode.

As you've started looking on specifying proper current load, please
finish the work.

> So, can we keep the regulator config as original qmp_phy_vreg_l?
> static const char * const qmp_phy_vreg_l[] = { "vdda-phy", "vdda-pll"} 
> 
> 
> >> +};
> >> +
> >> +static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
> >> +	{ .supply = "vdda-phy", .init_load_uA = 21800 },
> >> +	{ .supply = "vdda-phy", .init_load_uA = 36000 },
> > Typo
> 
> 
> Sorry for Typo, will fix in next patch.
> 
> 
> >>  };
> >>  
> >>  static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
> >> @@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
> >>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
> >>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
> >>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> >> -	.vreg_list              = qmp_phy_vreg_l,
> >> -	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> >> +	.reset_list		= usb3phy_reset_l,
> >> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> >> +	.vreg_list              = qmp_phy_usb_vreg_l,
> >> +	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
> >>  	.regs                   = qmp_v3_usb3phy_regs_layout,
> >>  };
> >>  
> >> @@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
> >>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
> >>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
> >>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> >> -	.vreg_list		= qmp_phy_vreg_l,
> >> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> >> +	.reset_list		= usb3phy_reset_l,
> >> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> >> +	.vreg_list		= qmp_phy_usb_vreg_l,
> >> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
> >>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> >>  };
> >>  
> >> @@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
> >>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
> >>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
> >>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> >> -	.vreg_list		= qmp_phy_vreg_l,
> >> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> >> +	.reset_list		= usb3phy_reset_l,
> >> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
> >> +	.vreg_list		= qmp_phy_usb_vreg_l,
> >> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
> >>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> >>  };
> >>  
> >> @@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
> >>  
> >>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
> >>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
> >> +
> >> +	.reset_list		= usb3dpphy_reset_l,
> >> +	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
> >> +	.vreg_list		= qmp_phy_usbdp_vreg_l,
> >> +	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
> >>  };
> >>  
> >>  static int qmp_usbc_com_init(struct phy *phy)
> >> @@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
> >>  		return ret;
> >>  	}
> >>  
> >> -	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> >> +	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> >>  	if (ret) {
> >>  		dev_err(qmp->dev, "reset assert failed\n");
> >>  		goto err_disable_regulators;
> >>  	}
> >>  
> >> -	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
> >> +	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> >>  	if (ret) {
> >>  		dev_err(qmp->dev, "reset deassert failed\n");
> >>  		goto err_disable_regulators;
> >> @@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
> >>  	return 0;
> >>  
> >>  err_assert_reset:
> >> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> >> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> >>  err_disable_regulators:
> >>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> >>  
> >> @@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> >>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >>  
> >> -	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
> >> +	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> >>  
> >>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> >>  
> >> @@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
> >>  			   qmp_usbc_runtime_resume, NULL)
> >>  };
> >>  
> >> -static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
> >> +static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
> >>  {
> >>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >> -	struct device *dev = qmp->dev;
> >> -	int num = cfg->num_vregs;
> >> -	int i;
> >> -
> >> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
> >> -	if (!qmp->vregs)
> >> -		return -ENOMEM;
> >> -
> >> -	for (i = 0; i < num; i++)
> >> -		qmp->vregs[i].supply = cfg->vreg_list[i];
> >> -
> >> -	return devm_regulator_bulk_get(dev, num, qmp->vregs);
> >> -}
> >> -
> >> -static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
> >> -			      const char *const *reset_list,
> >> -			      int num_resets)
> >> -{
> >>  	struct device *dev = qmp->dev;
> >>  	int i;
> >>  	int ret;
> >>  
> >> -	qmp->resets = devm_kcalloc(dev, num_resets,
> >> +	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
> >>  				   sizeof(*qmp->resets), GFP_KERNEL);
> >>  	if (!qmp->resets)
> >>  		return -ENOMEM;
> >>  
> >> -	for (i = 0; i < num_resets; i++)
> >> -		qmp->resets[i].id = reset_list[i];
> >> +	for (i = 0; i < cfg->num_resets; i++)
> >> +		qmp->resets[i].id = cfg->reset_list[i];
> >>  
> >> -	qmp->num_resets = num_resets;
> >> -
> >> -	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
> >> +	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
> >>  	if (ret)
> >>  		return dev_err_probe(dev, ret, "failed to get resets\n");
> >>  
> >> @@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
> >>  
> >>  	qmp->num_clks = ret;
> >>  
> >> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
> >> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
> >> -	if (ret)
> >> -		return ret;
> >> -
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
> >>  	qmp->pipe_clk = devm_clk_get(dev, "pipe");
> >>  	if (IS_ERR(qmp->pipe_clk)) {
> >>  		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> >> -				     "failed to get pipe clock\n");
> >> +					"failed to get pipe clock\n");
> > unrelated
> 
> 
> Ack.
> 
> 
> >>  	}
> >>  
> >> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
> >> -				 ARRAY_SIZE(usb3phy_reset_l));
> >> -	if (ret)
> >> -		return ret;
> >> -
> >>  	return 0;
> >>  }
> >>  
> >> @@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
> >>  	struct phy_provider *phy_provider;
> >>  	struct device_node *np;
> >>  	struct qmp_usbc *qmp;
> >> +	const struct qmp_phy_cfg *cfg;
> >>  	int ret;
> >>  
> >>  	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
> >> @@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
> >>  
> >>  	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
> >>  
> >> -	qmp->cfg = of_device_get_match_data(dev);
> >> -	if (!qmp->cfg)
> >> +	cfg = of_device_get_match_data(dev);
> >> +	if (!cfg)
> >>  		return -EINVAL;
> >>  
> >> +	qmp->cfg = cfg;
> > Why? This doesn't seem related at all.
> 
> 
> I added the |cfg| variable to simplify access to |num_vregs| and |vreg_list| in the following lines, 
> 
> avoiding repeated |qmp->cfg->...| usage. 
> 
> If this is considered unrelated, I’ll remove it in the next version.

This all gets clogged in a mixture of regulator and reset changes.
Hopefully it will be more obvious with the patches being split.

> 
> 
> >
> >> +
> >>  	mutex_init(&qmp->phy_mutex);
> >>  
> >> -	ret = qmp_usbc_vreg_init(qmp);
> >> +	ret = qmp_usbc_reset_init(qmp);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
> >> +					 cfg->vreg_list, &qmp->vregs);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry

