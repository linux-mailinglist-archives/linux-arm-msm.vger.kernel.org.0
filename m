Return-Path: <linux-arm-msm+bounces-74892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14FB9D3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26033A7B12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA952E6CA2;
	Thu, 25 Sep 2025 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oC6v6fJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8E2E62AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768903; cv=none; b=b204m3u4LWc/urGiuXIDZJ9X9KSpb0/JsNLq0lRMunt6ToK/mENuw8SHXTmjTEdITxOny/8GZMRoxMsYzj680z+GJ/fx7LPGIMGlwTuqATGJZgBF6gcduszM5Pk37ya/bLIzquOdKu7fL5gjKdTEaSbbe7/tBnJ4hqSi83OVqi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768903; c=relaxed/simple;
	bh=GRzW2UTFXjkMbCv8ZuBiMaxnc7z24scaXvk2FiPQdfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIKq1yhec2IUkLpT3ZX/+VqkAN+S45Enr/Itj3KuthN0oB/WXvITlnbiqmGBYa2EPiO0ddQqwFF0DdQkRrrBHIsxp/zd6kyKKOpqgfIHOUgj7tGfW7N22xlTTuLAuAglGMK0jYEmF43BZtFUQZOQYJ5TDB6hozUZecTjKXddBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oC6v6fJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0MCet002079
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qc2kjNdpU+Ilinxlsz6Brx3
	M0lwHT1wZVUtKam6+GA=; b=oC6v6fJbG/C2Sv8NIRf1HC8NhJtgOv1kmlCBKK7V
	W6gZjv97Nth+siQt+Dp7WQb7vfjPWg4+m6Z8ZtbATMtkYqFjUCDeuTn2e1183bZP
	xfiv6fkvr8VrHLmzdfSl//F//rdC9/BlALYGlBZM78WMD4VYBatfJ3Tx0DBZxzci
	f7WMwWx5/Pfsd/MZILKCGUUQ60kkisntAJ3gmytOWKQxRoMv80PZXJxtBuW9UVvt
	SLYaJEccjYJHZbjM7CE5k6xzhfV+/iZyy7y4TzP40IQljR1Xqu1NQm9Y0uhAO57/
	gWa+ArYwrITDdyyiF4NYyNMvVsJB7L4QETVfbQM4x6gXvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pgqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8b8c3591fso14387471cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768900; x=1759373700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qc2kjNdpU+Ilinxlsz6Brx3M0lwHT1wZVUtKam6+GA=;
        b=ZEboWYiV6UiV5nBz9gatBCH0IZH54B1feapE9xnJgU6tl7cJ0aIpNhll9+XTb9TwUv
         RoM85S+SGuKiCrYursXvyBJ0uif+kvOkxecZrAh6n4/Z79M+riu1slWVcrKjvDGnIGW1
         9utTxqnLSQo5+A2St8Xx80DCHzkrcj79kFqR2elUKd0pnNGDHroweV6qdd2JocetTGEq
         W6/9Q2wzKrpVsoAUv6dnZyqece+pXQu6QUbbZeWVBniSOElYqvCNYrIBZXrbembsSvKW
         qNH+BHN+OXS2x49x1sVJ9Oz64od962Mff6tZ48fyhGcrMdEYTUzbr4T44XiPHOleEF32
         5s0w==
X-Forwarded-Encrypted: i=1; AJvYcCX5Zo9xAvcUgO6OJheam2H6mj0tbW9D2R3Qw6V31gy3aPTrGVsQXsITeRhf6OANADLqngjZ97r5Yhgf63SE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4NXw4hP/gu63I1QsijiOjKmDGSnXz05j+IHcjxSDHHtxsc1B
	a7j9A5UP0UTuQDlEUu4VLvXbKK3Iqt76oUyT6h/gKARzHgFcFpl5z+hTkh6PMc8fFzanutxwoEu
	v3LYHVfV7ezRSjtI5s9HiNjWEXiUROsXGESL5uM83iPN70ehk6d0G9Io7r1AqWJ4CWh/2
X-Gm-Gg: ASbGncuAitfZ0eB/zQcd+5nGOxfTq6zL7jPRUZvYZlBWGmy1aESeWTjM9SXT5nGsK53
	VaWLNwybKNdlgQr5x0jz9Zz3r48zjKeADF61npJn/dj+2nfwLujb/qabAazf/cxSssAIE2yjzfi
	XaxtKBcrMoVbq1yeSNyA5EWOLDc8RQ9Vm5Jdl3sIwyWT/uQVcaC+VdWo1j422J/30kEJjH803dF
	b2aLsZyWMgbDqjkxCZ+4c+LcWluzGTsJIo9ISaHMbfM3PDS3yiil41lrOfShGyZxrB1K+wO1mw4
	31vUzTMyUrU60wd0cz3TR1EJ2ekkWagQJwDCxMbQrHWGx35o1PNY7NKaB+gP4pZE4n2GUvsiUfG
	eU0d12GYSUahU243jPlOIOII7aNZgR3jiLYXchTz9ArAUnJB7qaBE
X-Received: by 2002:ac8:5f53:0:b0:4b7:9ddb:abbd with SMTP id d75a77b69052e-4da48c83c0fmr29976541cf.27.1758768898962;
        Wed, 24 Sep 2025 19:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+wX0KgM5CRfCAhfR9yvHW5QMrj5JET9e3yAt5sYvlw+SROD2nT79PnMZGnXjEN0cJtYx4zA==
X-Received: by 2002:ac8:5f53:0:b0:4b7:9ddb:abbd with SMTP id d75a77b69052e-4da48c83c0fmr29976331cf.27.1758768896998;
        Wed, 24 Sep 2025 19:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff5f0fsm256240e87.135.2025.09.24.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:54:56 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:54:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <oecyjwj7ouufjbiq2fpvlhhuaof5agm22fdsruf3ppayiu4kkm@wvi4no53x64y>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: GJHA2jKGh95uTz6jxKhSBwB_eyClZQ1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9Phm4SkFRzaw
 4YAwjt2eDXwmntenmFnRfknbbfRm9jx6lqXotXbXACVElkGSAi8fPvcewkaAT53HgXz0QpieUaa
 2gBnxpGgjy0pTZWdXsEej7kDEGlup6qIEd9tUuJwL/ZpcPzGd9wnln2z1uneCP3JkdUX6rAaYL8
 j+iHNj3xUf5Aqj4ZFxrJToaPBsPzMihhARcxpiZgW8mhHQuAiXxVVee1MonSR/2S7aOn0ozmMoK
 RxKvQhY04VG4pTRuxxRR4tSiXmpeXrUbnQEBISBPakkSiI3P4k5aw+py2LZfV6IdH7cYDluddT7
 tAB+T+9WRah4vRZT4w4zet2zL3yXrdZhPKAz0LRGhTvSzlGP0jxy86pGftW1EIHHc517RW1bmbW
 7bfqklDV
X-Proofpoint-ORIG-GUID: GJHA2jKGh95uTz6jxKhSBwB_eyClZQ1w
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4af04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bgMNcTsuivlx1WpOe6cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, Sep 24, 2025 at 07:28:47PM -0700, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
>  2 files changed, 314 insertions(+), 1 deletion(-)
> 
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),

Why is this V4 all of sudden?

> +};
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
> +};
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +};
> +
> @@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
>  	{ .name = "vdda-pll", .enable_load = 36000 },
>  };
>  
> +static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
> +	{ .name = "vdda-phy", .enable_load = 21800 },
> +	{ .name = "vdda-pll", .enable_load = 36000 },
> +	{ .name = "refgen", .enable_load = 936 },

Is this a meaningful value?

> +};
> +
>  static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
>  	{ 0x00, 0x0c, 0x15, 0x1a },
>  	{ 0x02, 0x0e, 0x16, 0xff },

-- 
With best wishes
Dmitry

