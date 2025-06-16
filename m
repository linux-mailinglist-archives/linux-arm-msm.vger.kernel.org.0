Return-Path: <linux-arm-msm+bounces-61427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA21ADAEDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E89189176C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5516A19F424;
	Mon, 16 Jun 2025 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvEwwKbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAB2E3367
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074041; cv=none; b=lEXBKc1luPBRCleESm5ap7ph/DaORhoFQUQXwWtguBNG3Mwxq54319Uv3CXI2o6bYvRlb/neGwJTLd1v0VBgQSPxahI1K/L9uJd+U+lBwLOeLaYQI+6QYRp4A/rvhBSyYaFLVByvyE4pxZvV6nHsJNs28XJY2zJ8HGjBdDBq/bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074041; c=relaxed/simple;
	bh=Xxxi8t0eVnWP/vXRQRQ8rPROtZm3BlMfdE2fMVvnFXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv8MZjkdKbFT59wamivaMKVyG2V0o7O8+7BT5Xp5Z0qw2xrT4x/vp0yEh+NQM/T237R26A9szM7MYhqi765VYl6jrofgQOYmewuYcORljEzxQZ+rP/VZnVAhqXwrRg4V9TwI/0OwDRifA8NsNfIXVeMRyuin+hXx2zsdYRIPAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvEwwKbi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8QM3b027045
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sU9oQKJ9CXQPwDKh9YrC0FRF
	yn4HmwQPux4WlLidHvQ=; b=gvEwwKbitZsu1mMmSO0EnwkzfmRzVPolUoc6trSx
	vkcap6Gxd2aLi2LoxvgV4hKseot6Z2mHH+WvVYkMXU/NUkNqWckMj3x/v01E0bBG
	4pmLOjYVTVaW2UhuQ6CnYK/PYyMIp8TTxqLlkZrHVdC9lbNw1xKhjeq84x0sXQ9B
	BcR/Y7NKthVJwxghEvzEZTwfvo9w/bfsZQsH3PpW5dOxD/DlZqCGxC6/VTmoUXzA
	T1CefGkczhlAi1qdgYeZVoofVQ5yR3wFLkGQPh8XP3+kvV8lR3R0c7sb9u6nZwFo
	iDNQOddlSGrjcMnQZhgHuC1LNELY6OSrl8G3cRLc8XapCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfccaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:40:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so780387685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074037; x=1750678837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU9oQKJ9CXQPwDKh9YrC0FRFyn4HmwQPux4WlLidHvQ=;
        b=OcyiKWcLaHUtE6lnISEDFbUsVXV9ubdMbUpe6sT3WhR39UwAenUgbp/N7q0+fIlEQu
         Q+Mba7i5LjxxBLD7hTuBhpw+lt10dfQeUnsC7kaIa5fQLwnO+oD3H1bv0o3SzgA9iEPw
         V8zrzq+RtbdiMhi+BEJ5vq/AzaXK/3M9YTY1RbPAkrR69IqO11mexEWEjV7yNooOiIyN
         D0pzRM+YStMh5+hFXixwAwzDga/VpIXcxFpvs6BF7R/Bf2EhT29bnYZgwmBiDZi4A+gs
         rLbHoZo/d1ST2x14YNNbTxNbj7r8vR/elfvMBVTepQCxMgTBXsBnCuKUR1ikuBlXZwC9
         MfHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKSVfXm/N1leA0SoMfUTJxuRYrhCI0caZk/sMQ3C0OW+Dd4iLiP1RC1908ZEuKptr3cBf7cYhefdVkMORB@vger.kernel.org
X-Gm-Message-State: AOJu0YysKlQ2yrkTcfWOCFK6iY9ntNzz+OjtjNNF7LtSobeGC1E+TnOK
	mAn6UFHL2j2iWMJyZSouzZuSCf3hq1cd2SkILHY6oksDwutwZK5bUNBNIziMi/GGq5mwCOOF38s
	BevfHI6djo0HkUciHHfJxz6+ex6d01wwg62C9NMg0yeRQt6efvC7Es+/qmRksRraAE2ID
X-Gm-Gg: ASbGncupl6NzTgArYEwH95Gg2HSONRYpGX3ngw5zgNMB3AOb1a1Xcf6OuM5Mx0YjaX6
	l7HjtkVn7b6d4MIQdQ9JVt93dpRA32ZmqOh43TbJTPY3MZORlGo8uZgRto2Sq22az6AQLLnMHUj
	WaMORY6zQO18GBqfBOfmECR4+Z03ukZVdiDJ+cOHex3ZcNb+899RHYD6o5sg1SDn+V5rSRvyLIB
	BLb8ed9Th26FS7aG+70w8JFD9ySJ+2pCA7OJtZvYELbqprGS9ak5a+xGSzjFu9grxG1YIUl2/P2
	y256nfiIH8gE1YvD0mQE1Wb7+o67f2PItkCLB1vJ4mDttDsI3fA8JzU8F9HQDukmM/5n1umu+MI
	kmntCFgnZ1RH65DLwhKbZewYT7TEyVjWfjFg=
X-Received: by 2002:a05:620a:2a0f:b0:7d0:9f1e:40dc with SMTP id af79cd13be357-7d3c6d0caf4mr1552506085a.56.1750074037325;
        Mon, 16 Jun 2025 04:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9s64+AUEQh7O6C8bv6bysqjaSeP/EDjHBrywB+0/u+u/JEszrb4CKMujLx374cWraAyL0lA==
X-Received: by 2002:a05:620a:2a0f:b0:7d0:9f1e:40dc with SMTP id af79cd13be357-7d3c6d0caf4mr1552500885a.56.1750074036881;
        Mon, 16 Jun 2025 04:40:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab619sm1530482e87.136.2025.06.16.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:40:35 -0700 (PDT)
Date: Mon, 16 Jun 2025 14:40:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
Message-ID: <qmcoh5lysln46mg7tbmeelmnzc7s6o7bssir3a7r3n3x5lnboq@cizzodjel4ut>
References: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
 <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfX/bNUxphey/+Y
 2p6mD00LH4t80GBEXhnXlR4NFUCqmFmxbn9npDMeKR/2PuNLIXtRQyyFi2hbyoXWo5xfvVwpCHZ
 l3tettTMe4IX5Kjv1pLhue/kwZEUCCoItY72liX0T7o0MWYBnDV4tlHXLf2ZceXpMjG0mOmRCy/
 3FD/vi3o3ANmb4FBscd+lhD/Lz7L6PaDxuVcV88ka+mPWm0OpeiYaoqiPMPtfh/xbb35QyGtpGT
 v+2j1Q5fjoOj5O1tScoIyTiWla5OvZkChNPL30KznhvZQPtSDqWTZXsm711Jj3J9kd8L/FJdIKK
 sawu+KpTq/TcZcTYBbcSo7zbipUaw0THi/vwZSNoWHSTVGVppUtb4eIbVNSWKDRQVB5duLzJsA7
 1aC0Vmf90XrbupvyePrEbUu1RgKX0KasjNdtpeik5eKGpy8i36KBtAOlKOZns/m9yWdLIMrp
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=685002b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=QGoD4uD7uq53lMcaTbkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: -vWqIOMxX6Lngjq3oQ03TypcN-LGLbk9
X-Proofpoint-ORIG-GUID: -vWqIOMxX6Lngjq3oQ03TypcN-LGLbk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On Mon, Jun 16, 2025 at 11:45:12AM +0200, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 63 +++++++++++++-------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 6bd1b3c75c779d2db2744703262e132cc439f76e..a246c897fedb2edfd376ac5fdc0423607f8c562b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -61,8 +61,13 @@ enum eusb2_reg_layout {
>  	LAYOUT_SIZE,
>  };
>  
> +struct eusb2_repeater_init_tbl_reg {
> +	u8 reg;
> +	u8 value;
> +};
> +
>  struct eusb2_repeater_cfg {
> -	const u32 *init_tbl;
> +	const struct eusb2_repeater_init_tbl_reg *init_tbl;
>  	int init_tbl_num;
>  	const char * const *vreg_list;
>  	int num_vregs;
> @@ -82,16 +87,16 @@ static const char * const pm8550b_vreg_l[] = {
>  	"vdd18", "vdd3",
>  };
>  
> -static const u32 pm8550b_init_tbl[NUM_TUNE_FIELDS] = {
> -	[TUNE_IUSB2] = 0x8,
> -	[TUNE_SQUELCH_U] = 0x3,
> -	[TUNE_USB2_PREEM] = 0x5,
> +static const struct eusb2_repeater_init_tbl_reg pm8550b_init_tbl[] = {
> +	{ TUNE_IUSB2, 0x8 },
> +	{ TUNE_SQUELCH_U, 0x3 },
> +	{ TUNE_USB2_PREEM, 0x5 },
>  };
>  
> -static const u32 smb2360_init_tbl[NUM_TUNE_FIELDS] = {
> -	[TUNE_IUSB2] = 0x5,
> -	[TUNE_SQUELCH_U] = 0x3,
> -	[TUNE_USB2_PREEM] = 0x2,
> +static const struct eusb2_repeater_init_tbl_reg smb2360_init_tbl[] = {
> +	{ TUNE_IUSB2, 0x5 },
> +	{ TUNE_SQUELCH_U, 0x3 },
> +	{ TUNE_USB2_PREEM, 0x2 },
>  };
>  
>  static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
> @@ -129,17 +134,10 @@ static int eusb2_repeater_init(struct phy *phy)
>  	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
>  	struct device_node *np = rptr->dev->of_node;
>  	struct regmap *regmap = rptr->regmap;
> -	const u32 *init_tbl = rptr->cfg->init_tbl;
> -	u8 tune_usb2_preem = init_tbl[TUNE_USB2_PREEM];
> -	u8 tune_hsdisc = init_tbl[TUNE_HSDISC];
> -	u8 tune_iusb2 = init_tbl[TUNE_IUSB2];
>  	u32 base = rptr->base;
> -	u32 val;
> +	u32 poll_val;
>  	int ret;
> -
> -	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
> -	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
> -	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);
> +	u8 val;
>  
>  	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
>  	if (ret)
> @@ -147,21 +145,24 @@ static int eusb2_repeater_init(struct phy *phy)
>  
>  	regmap_write(regmap, base + EUSB2_EN_CTL1, EUSB2_RPTR_EN);
>  
> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_HS_COMP_CUR, init_tbl[TUNE_EUSB_HS_COMP_CUR]);
> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_EQU, init_tbl[TUNE_EUSB_EQU]);
> -	regmap_write(regmap, base + EUSB2_TUNE_EUSB_SLEW, init_tbl[TUNE_EUSB_SLEW]);
> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_HS_COMP_CUR, init_tbl[TUNE_USB2_HS_COMP_CUR]);
> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_EQU, init_tbl[TUNE_USB2_EQU]);
> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_SLEW, init_tbl[TUNE_USB2_SLEW]);
> -	regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, init_tbl[TUNE_SQUELCH_U]);
> -	regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, init_tbl[TUNE_RES_FSDIF]);
> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_CROSSOVER, init_tbl[TUNE_USB2_CROSSOVER]);
> +	/* Write registers from init table */
> +	for (int i = 0; i < rptr->cfg->init_tbl_num; i++)
> +		regmap_write(regmap, base + rptr->cfg->init_tbl[i].reg,

Init tables have TUNE_foo values in the .reg field instead of
EUSB2_TUNE_foo, which means that writes go to a random location.

> +			     rptr->cfg->init_tbl[i].value);
>  
> -	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, tune_usb2_preem);
> -	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, tune_hsdisc);
> -	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, tune_iusb2);
> +	/* Override registers from devicetree values */
> +	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &val))
> +		regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, val);
>  
> -	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, val, val & RPTR_OK, 10, 5);
> +	if (!of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &val))
> +		regmap_write(regmap, base + EUSB2_TUNE_HSDISC, val);
> +
> +	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
> +		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
> +
> +	/* Wait for status OK */
> +	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
> +				       poll_val & RPTR_OK, 10, 5);
>  	if (ret)
>  		dev_err(rptr->dev, "initialization timed-out\n");
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

