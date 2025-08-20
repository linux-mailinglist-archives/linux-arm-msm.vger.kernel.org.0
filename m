Return-Path: <linux-arm-msm+bounces-69963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99BB2DB9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5C6687AE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394952E5B2E;
	Wed, 20 Aug 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj0EFRd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59842E54B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690454; cv=none; b=nw2vIPeSXDBQYSy5cmHIj6roSzdSPiAbAlaKZenSYjom3IUbWC3AAd1H+l2QL3ck+9amkG3WMObyEKR6PNfeR/+o45laGf6aeSAojDNtjN9Cp3oxTH7jZU8wXHu24+pn/xRK4CYeF0GigcA0EtL5f2pL6L5GxHUOaMsZm26Hqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690454; c=relaxed/simple;
	bh=rqP7bdnWmvdLNH+wGeeBYQkO7IqJVLQXu/rfwzWsYlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1f6ZEE4YSbJRuV36ppEOR2sT31pzoKtzjONAGTYyGqFQOFHUCRah2dDV5sbjkgAZj6ZxGIlSNy6hhpIlysafsPDYtNDK3SUYnnALIO7N3SxRPiYq4pp08E/3VRDMSm94/AqyBL3Szp05po4Ki8KdXIWx19SE0EJAdKU/6BuwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj0EFRd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA27hR003234
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dFc4IH/0HHEYW2zGgPx9oUd1
	ai5FCg3dSwI1TYF3zRA=; b=fj0EFRd64mA+29oBybgkCVSDClAeX2cpVe/JJ+lY
	ybKS2lKptFDXF+W36AaL8Z/4b8ujhEqHlvJFA+8BwmoEUvFU6ugNCOOBqE4Gk9tZ
	LaV+nX6UBN6e56o3l2QkykgRXIUeFRM+qQhrLlWnUaSmM06ehbpCitK700fj4/Ob
	bkNueSH5OJ4ulXd/qK7JQqPRjPc2dFhKavJAUf65g2r5wIt4zCHyT2xFQ4MzrRMI
	0B/r0m64I02uycCk0vw0p8rTbIFURSFW50OGz/IJSamZkA43D+SsQ/6OJyr4a222
	Jgt0i10jklvZUdAPxPJxpbRoB+b0h88g5COwO949pR8ksw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahjej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:47:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a928dc378so150023246d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690448; x=1756295248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFc4IH/0HHEYW2zGgPx9oUd1ai5FCg3dSwI1TYF3zRA=;
        b=pvgUtBg+VpU4O6SfZl/SSgiB0uOJfJbw5gEhHa3sPfFpkt6Bi66FSvXU4Cm2srfXGv
         7wcU1JEMam1vuAyH9xrFVRJlmRWuzYTIG5nlh00VJ1MGk+u86BayrKGmmpehRaS5xlCx
         D9pBRr7t0IUzDNZQ6ZL+bJ6txVROAFvYx85mBuk66ZnSLCQIGkAIqlw4Ymt3i51ik5SC
         u0WHfJNOdrROQNI+Na0223R2s6DFQwCVU3l+QiZvidwuE0vUA6aUh2TqJEjRyc/s/6pv
         GjmekDRpK5cVG4QEKM+KhkMpTMT/vW6aa1EMdWk42Dxsay+no7h/q7IHo3HGgDANlINF
         VmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf6/U1w3dkwqvKKHHq+uSbG3TEzQVBSyOvpdC1ZM+v8R82X6zZtjhA4vmm74U1wb7NfSkz2jE+932eWzKN@vger.kernel.org
X-Gm-Message-State: AOJu0YxWa9+uauYa/VJku0WwSY3aMEKNDBkBcdQ3GXJVWARFkEEmSH28
	6vxvL6wpSTKWM46zFEkANv9mCmXfrVEd24oLf1+FYWOne+3GBEu2UFJqZPDM9u+aAudNtToGDCv
	SdT7+P2wiMXaROIrXjJgC5EkXGAmlCKhusKh5VGXpncfV72ZLBeG1hp9mlF04XChOPiQ7
X-Gm-Gg: ASbGnct957Lq8kTqo3Gwqk6ifKIaOmyoCSXQBbNMMpnWyT9vB15SIoiqkWLGCRiIjTd
	u9PQP76cdA4HJ66bCt/hZ4eiU5MV9U94DsohJiSW64t4qLVsq/JFauN/ugkobkzlq3jvXwyXmkq
	WUjZumesJPwH9ZmOZTGtdryGJoodGfXklBiYVAHfNwZDz0wsRyOU//Ay8vuUXKq+1z9e/E3RMfF
	zGNjUbHrSUjpviJJ4B+yo5rb2ovTZ+ol1NVAGupmA1LJao3PE/ozuHipPbFCN6wTA9ByahdKO+D
	+Su+yz2pH0PaweDppGmGCTfFJLBjttJ6I0XOmDqUBVlrNpif6rMsxqhv3tEy8NHWyaUdmNJbrVJ
	4HTNt4fxiMTrMcL0RtPXOc8DXDl1wVoBeErSS5/BTt5ys8qLfU1Au
X-Received: by 2002:a05:6214:e69:b0:70a:3792:71b3 with SMTP id 6a1803df08f44-70d76f870a8mr26796676d6.8.1755690448153;
        Wed, 20 Aug 2025 04:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gakNMa/QxtXVM6Q3T3hNzkLDxmdNOzWdZVhhKTGdYxa2vtoe8JOEwhpP+CZNBh6RpUnOkg==
X-Received: by 2002:a05:6214:e69:b0:70a:3792:71b3 with SMTP id 6a1803df08f44-70d76f870a8mr26796116d6.8.1755690447455;
        Wed, 20 Aug 2025 04:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3519d8sm2573833e87.11.2025.08.20.04.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:47:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:47:24 +0300
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
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Message-ID: <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-GUID: wudAUK1yevnGZevKN5YcydGXFkNCT6D5
X-Proofpoint-ORIG-GUID: wudAUK1yevnGZevKN5YcydGXFkNCT6D5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0hCRGIXIc9xC
 1j1786J7Glt7Wap+T8r12JC+1+L1M4sCAG7SwuDTFrpamHKLsjc5N+bjUFpxphHmWK7v0ICVEWp
 AQtwS6dYH7OquKkg191HMBxSSC3muOgWd5GXIX6Bmd+LoP84P6ZOUueFLVfd9B3CKqnPLS8mdoN
 ZNMg4f/5RCqmUpLlgMJ7hMT8fCXsM8VWzK+/MExnQCrBsCMgE958pluOWSgxvzQvETxbA/MLlZD
 imkyLSe+H8fZCnlSQNq5It25TxHh67qjDAixQ/I/ozC2q7CA2lyshEoEcKOtW5yWoOFOGlTDKMN
 pPO+ZTaPGCApw2iGDwUVasbGnUyoZbiiyYjHoMcZDd3Wx2etLLDiBm2SGLJ1+VOOTfqfVoi0Ylf
 7YTi+gWuOaCwmgD94bBwajKW3miglA==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a5b5d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tpX6aX9aePfZnGUoeJ0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
> including register offsets, init tables, and callback hooks. Also
> update qmp_usbc struct to track DP-related resources and state.
> This enables support for USB/DP switchable Type-C PHYs that operate
> in either mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
>  
> +	struct regmap *tcsr_map;
> +	u32 vls_clamp_reg;
> +	u32 dp_phy_mode_reg;
> +
>  	struct mutex phy_mutex;
>  
> +	struct phy *usb_phy;

Should be a part of the previous patch.

>  	enum phy_mode mode;
>  	unsigned int usb_init_count;
>  
> -	struct phy *phy;

Similarly.

> -
> -	struct clk_fixed_rate pipe_clk_fixed;
> +	struct phy *dp_phy;
> +	unsigned int dp_aux_cfg;
> +	struct phy_configure_opts_dp dp_opts;
> +	unsigned int dp_init_count;
>  
>  	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
> @@ -874,11 +911,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>  	qmp->orientation = orientation;
>  
>  	if (qmp->usb_init_count) {
> -		qmp_usbc_usb_power_off(qmp->phy);
> -		qmp_usbc_com_exit(qmp->phy);
> +		qmp_usbc_usb_power_off(qmp->usb_phy);
> +		qmp_usbc_com_exit(qmp->usb_phy);
>  
> -		qmp_usbc_com_init(qmp->phy);
> -		qmp_usbc_usb_power_on(qmp->phy);
> +		qmp_usbc_com_init(qmp->usb_phy);
> +		qmp_usbc_usb_power_on(qmp->usb_phy);

and these.

>  	}
>  
>  	mutex_unlock(&qmp->phy_mutex);
> @@ -1106,14 +1143,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
> -	if (IS_ERR(qmp->phy)) {
> -		ret = PTR_ERR(qmp->phy);
> +	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
> +	if (IS_ERR(qmp->usb_phy)) {
> +		ret = PTR_ERR(qmp->usb_phy);
>  		dev_err(dev, "failed to create PHY: %d\n", ret);
>  		goto err_node_put;
>  	}
>  
> -	phy_set_drvdata(qmp->phy, qmp);
> +	phy_set_drvdata(qmp->usb_phy, qmp);
>  
>  	of_node_put(np);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

