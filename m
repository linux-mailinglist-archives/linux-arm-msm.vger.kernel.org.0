Return-Path: <linux-arm-msm+bounces-69950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A96FB2DABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAC0A3B49A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E202E11B8;
	Wed, 20 Aug 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jb4FCtHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0D20E6E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755688604; cv=none; b=uAMEfZ4JtbJA9P193HoIJuh5vLUhHUUj++NUlwu41Z82A1ZKvMOOpUXhSRFNBtebRHFWOQzeIi+o3TOXJmSzTfM5g8956rQzG/7X9n/RabPKAojR66LMYO/A71L+uIc4lLf8i918HayvR3bEYPTsygWrQ9a/5pFq+9q6qFcWZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755688604; c=relaxed/simple;
	bh=AdxCjkjoAfQ7JR8WecnlpWNVRNTlYxyAj7JILqSb/mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5oFeeocybZTJZg/FBn5QK1eDGf3w27vtdYeNNdc8T+LLcceBSSh4sUqXRwRE7Y08MZhQ5TY9D6gsXVhs2X4mdgOpfrjdieBIDdabsJGJrtOUOzap9U0r5qNWH5BLNm8DHQTo9eb2lxjMgFVW0ZtgGXmFfmOeG+Nq9JECQYonyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jb4FCtHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAGFiL031528
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Z7Up3r+c9engU8+UCwkklUb
	n4iM1d7MoVv1XcE+/Bw=; b=Jb4FCtHgVzCuUKJ7WmuwSjJ+BngX6Y0KWaespDfZ
	/gUwh0yFRpcSznLyLx16ksxhAwNyF3cywKbX/XJTWQ9kpbrwYHpPU83ulp35TuvE
	RxJEzDzKBAKHKzI72rO/dBtvWfp2Q+nQjUt4DHnkK2iFeMVexC2w8sp9jC6nbpBT
	mRroLv2koSmJulBWEqR0FVSElttV8E+mLnJ/u6waK3bxBN8SkVc4SHASDNUUuE4r
	UdgzWo3uN5P0BMguUqiuPXJdIXmltNnxPxoF+zKGS2gAu1jfK3ytp/pyNu9qzZ3n
	LdIkCbrbaZDQcp56ERlYjMtRJvVX26D7aUfjwNZkzK3awQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dhf73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:16:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a92827a70so140805776d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755688601; x=1756293401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Z7Up3r+c9engU8+UCwkklUbn4iM1d7MoVv1XcE+/Bw=;
        b=gNEyxFY3sKcA88KZfTBEccXDEZxqvIVQrFklvf8yYeijKI5kMe/QqgULBKgiAa/4bl
         uk5y6ylrVOHerOfLNE4oDSnnCeEjuT1HdypHsKmOmfTJ9VfuPwypeRCDmz7B9gLDFeO7
         9p8xTOzhhQp7utXWcp2ukGi82hCSHX8b7v6UEd542JBEjyFAzGw+f+xJ1rFp9sRtf18P
         5HCh9jrhL2HNMHFji4XY25u8xKrSj4i9iz2W80dHsAVNpzspyCG8FlfLaNv6sQLaAGEY
         kHQyle9JZh/VG3bm0xlEEpM1EsUkvu0UE6kAdmD4Mv4+Cp7OY9+WT3ZQF7v+5pHuMJ6i
         +7FA==
X-Forwarded-Encrypted: i=1; AJvYcCW6O9coHGOVbIDKXkKhlQqVwYTUx+8cf+RA55wlrZzdxHOSYcSRiAQIF8OmxjemSywFeE3Byszzexu/la8P@vger.kernel.org
X-Gm-Message-State: AOJu0Yylgmwt/eGMVJGaW9b6mU/fKcuq+2NI3vZfxWRFWBvtqAhY2oCV
	T/1jDK1kNpecmMCLd3SgRW0fyGyB/3FeBD96kyl0nRjzYLTWqTVvHt5ESFcvQBGmIJ8nNzgQC6a
	v6PP/HG+HIt8X9DarUGJeGg57bxNkIthsoe0hvYPO/uK3TcX6QDy4H94l47ja+Rnj+XJ5
X-Gm-Gg: ASbGncvMNnV71TEcouxXNXHp/debEwVUMsrKYiJgulNCQ9n4+XvzbrebJm5pNMUlF+e
	4ODyPiVzcoLSjcHYY7jWJEuIKj6ThVhcons+eRvv8nYvfKjdARakWoQbMT/ZJ1FAr9DTqeAUWUb
	xuOFni4CYTcHRIKpJu9H07qGuJ7ygxW8XySWAjF1suRzzEOBscbe/CCNJgUGYk2a5yKaSVy970i
	6sUQmBOJotSBpVMEIbHaGcK+zDsnE1pA484KeueJcaUoZbftIxI2/bNSxzjkDv6ZtKjFbZZlLwZ
	9fE89R08p4TDVgDWfy/IeUyivVKMaX/bUNqB8vT8dkLeVU28ah3jQ4w3wHxQOrFBEB6mPj8WZDk
	aB1hI+zEIDqJJgNQduSSxMFe1W7YDEGKgsPxfi3BJeDOlIESmqiSM
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id 6a1803df08f44-70d76f5be8emr25705166d6.10.1755688600546;
        Wed, 20 Aug 2025 04:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXo2tEhaFHWFMNzMyu5ebXhvONp13hFPzXhg1vzwJcxoRGG2jluk+k9PtM8oxn7Ws7nmt9rw==
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id 6a1803df08f44-70d76f5be8emr25704406d6.10.1755688599895;
        Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3515edsm2625261e87.20.2025.08.20.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:16:37 +0300
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
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyF0UTJxsQWy6
 faNSJkYkxiyhKAVD7PEqDAIEysJn6l/HMm2KgBDhMjqd4870RTi69W835kauaeUXVT+5NGZnAEP
 08DzkCDNf0BzuaEfZ4Neltg7XXQBmY1PmTApP4GFocSf2/xkunq7Twhlqiqt/CXYCN3jb+l7dOv
 R6XiztXxJhlL/gRls8vS+ES7/aZt/V0YATHbWUSus9MlkAW69gxZ785uzkeZVLIPnp8WJFr6NUh
 YQpkSXlEr3EPGD5xMJgQF6RMdCGIKf9EIGj1pBHMOCDmo5ULqSP+4pZQV8B2X8ZXY/YrDT5w/pz
 YNONiCFby8f9ZM3n1DKV3SVxDz7MaIa1d3mAkh9Le2bWjTYrFhYp8HiSLrl4BsklZFb/HOXsIlQ
 SqUbnw8FfQhuxaIFZevSFvgKMWbdhA==
X-Proofpoint-ORIG-GUID: gOtNzXzrGUn3baOf8HWyisYWcGcj1dT9
X-Proofpoint-GUID: gOtNzXzrGUn3baOf8HWyisYWcGcj1dT9
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a5ae99 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2oAyx2JpwU0Ji29QuscA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> Introduce DisplayPort PHY configuration routines for QCS615, including
> aux channel setup, lane control, voltage swing tuning, clock
> programming and calibration. These callbacks are registered via
> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>  2 files changed, 252 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> @@ -25,6 +25,7 @@
>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> +#define QSERDES_DP_PHY_VCO_DIV				0x068

This register changes between PHY versions, so you can not declare it here.

Otherwise LGTM.

>  
>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry

