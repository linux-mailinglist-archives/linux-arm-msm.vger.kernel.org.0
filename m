Return-Path: <linux-arm-msm+bounces-75197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7091BA1768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F727412CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEC727586C;
	Thu, 25 Sep 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diMoJ62e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536B1F0E3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834584; cv=none; b=UP/TS+NkpyoG18uNu3TMXXH0Gm4bQeFYqxlvrb8/DT8A3IfUEAbdkT5iWNMKhBBENS2mMevHmJZl9qhGLv4m5IOB8qZ7Qvr8eT+nBCk6H3ETpufSrqC1J8YXWfGWKnl36f9HGpiyx+c8teAB5qVgIxNh4O0GKaQLk8+friGCoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834584; c=relaxed/simple;
	bh=JEodWQfFrlLT4ft6wjHp/4PxrYt2WKMNSdqCoZMAr6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hue+Xx+o+mKGcjBhKf3aNQTAtOWWF8TEU+n80PApF/KrOiepJrb2OiW3AtxT9WDy/n1FtGjbCWRfZgV1qp4DwXOP3N0lt+r4L01Ygscp3ijniJt53PvUGfEGugiXzLBIYevxTGkzVfgBBXNbMZXeG5XuykW/n7IQiu64vTQdHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diMoJ62e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQ77M007834
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBJOIEuQPqA/lZF82wvWq/0Q
	zUW0NQdR/jM9pAy0sYY=; b=diMoJ62eD8eRze0dsn2h5hbT7fVGPAaouML9ENNQ
	SjX/0r+ZIzHAH05lSwfXmFG4Mp5mGbROXZo7wWiYoq2OZSI3jfz+CSJKcaqDXoWm
	xoN2DOx18TuD6yHfhC68BbcW4kxQSUMf/3CiIIh6IClGXkW3k8FUnyTH5Bk7TDjm
	VxXGknJ5A75cbB7br6MmO9wtqsmr29YmTAAJ0xKYxiHdSZFX1tD3Y9oMfxeY6bkl
	bkihlyhflKW0FoQWO1AYddK16scD3Qb5lZSKlRs1sJAAtW6dXdTzZMslC+2ya4kE
	HPBZgyTLxGLtnuSNIkDCNDslqjMTM+BnAqzyTezzRv3OTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vrdd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:09:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d3632cf912so32597821cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834581; x=1759439381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBJOIEuQPqA/lZF82wvWq/0QzUW0NQdR/jM9pAy0sYY=;
        b=sukQJPbQ/n0IS3hYekGCrs0dFPIfRFfvs3tqifPoAU8aScGK1k9mGauJRhByBDMami
         G77z9v32qG2DNSdCDfT81F075B7sUwjkllEoIFkaRFgyshJ8IqkvDesVdPhHQXDRKweQ
         a3G9ZIAqrARGIW037jt0t9wienyfbxupeVReFQanF9suEYw4eb1jfYErje3OLCKDZ0PW
         uzSd+L5IUulit2eywxgxc2UsQkZZcHAlarMgNnUnG4545/bfy3ZxoPHwPhUp08UO4buH
         ZSChRBII0ghXv38aZ+1xY37LoaHNfZrHdoNQbV5oOyD61jnLhFHSKX5TK3lbP3sy9X+B
         ey9w==
X-Forwarded-Encrypted: i=1; AJvYcCXTiBkt9uuZNQvIOe5nA/QIPdAaNVcW5X/B5KyxvR8/VlE3aBjdrZD2PHr1PA6puyDFQwkkTqFCHh/A8ZnK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2I3H5ScjC7ifRzJFtVBYDYy4OnLi8Lo4wROE0vQHlLTQ4RGul
	rqyJyLNw7+ol7UNz8aGxEfCOYv0lvfPLWdXkiQ3S1bUrG5LOvt7iNr7EwBrKa3+0oFRQgAKh8HN
	jENcscU3bgSDwZZhpE0t0aIQZawxRlWe808MM4n9EcHhgKXmU5pi9GdNtx4IgbQeb+MfP
X-Gm-Gg: ASbGncuqXhq2UB/rgrZmP+7jNo9uSQavja8imwqRUZ17WenLTuEd8SgE4aKiS7Zhzq2
	Lg41sGqRpbpEGAuLF7guWrvw0xIXRTOwXJnS/9ctjLE707sSvdoyWx4EZIbJNfeftL0Vm2fIUks
	nuLp6YrUY0sbeHjF5iqfoa36hQcZ6R6unP4whspvM7Rgd7mFSDgQV6POaY/zJgFBRUItFFCph0C
	9A2hP3gj4RQUzwrsahKJW56X2xwV7zu6CZhnmKOktbDA6MiOIY37GD9iMB85nU1/Ley9WKzSAYL
	yKmwOcKZaUJryMVHxMEno31Wgj4B4/B2IyhZ4sr3QYmEBWhBI6LpqWx3qBZqMqhJ7KwtXVRovwm
	MqUBMjbqHj06lZJd82d4cKnElJqbf0ZLs1I4g1seTEQK5cm3Qai/E
X-Received: by 2002:a05:622a:2c4:b0:4ca:e5df:f25d with SMTP id d75a77b69052e-4da4782dc5bmr67985931cf.5.1758834580855;
        Thu, 25 Sep 2025 14:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqkDqc2xK8sis9Jeta/cmBmc7gYMtEpaFT6Lcvm02JjnAT0CNE9kA1AR4P6UIm8nYGX1swzQ==
X-Received: by 2002:a05:622a:2c4:b0:4ca:e5df:f25d with SMTP id d75a77b69052e-4da4782dc5bmr67985491cf.5.1758834580258;
        Thu, 25 Sep 2025 14:09:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99d5sm1125211e87.40.2025.09.25.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:09:39 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:09:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/24] arm64: defconfig: Enable Glymur configs for
 boot to shell
Message-ID: <yj5krcmdoualjj4zy4qvjjxarstaphn3eduj7n7jvti2tpbzai@tjwayrloy7fs>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-2-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-2-8e1533a58d2d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j-59XrdbDRbssr8gpjyEEZW_6zVUuq3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6yI9Wrwj1pYB
 K8SClssut95wMUnOrGfS2oTJw8rs7CWH4mEYIp9WSo7PlUwdRxkMwEtXL3OQTpvovKcfCmTS3LG
 n5a3mcQJZeb99ujSpXxyyjWgEmFwZLrTHVJLa++JxwrLwrCorizVxesDRBW5gFXMRZzuzMwzOQX
 JiqHvkwPUEnRtJnTNWpZek4G8VZSTYhlfHzlF01UbBdrPwRiNfc5yLItnwEoBQn6g4GQtlwVnpC
 px+XMk/ECTKo2x0H1aS+2a7hGntQuN2pDBxXsxCQc6l4KmENABwX/mgRuV/DzUObODqESQjP/yD
 CAZsoaCVsXCAMC8ZY52dvPX+Zo0fOe0bmBC70R44Fo8xB+gJdDuIYbDYWlO+V4Yo+kf0iTTrEP8
 5pEXOZ+00po7WMUpSTc9dndXV29TgA==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d5af95 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HHzqYahG-ipb5aDFT_MA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: j-59XrdbDRbssr8gpjyEEZW_6zVUuq3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:58:08AM +0530, Pankaj Patil wrote:
> The serial engine must be properly setup before kernel reaches
> "init",so UART driver and its dependencies needs to be built in.
> Enable its dependency clocks,interconnect and pinctrl as built-in
> to boot Glymur CRD board to UART console with full USB support.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..9dfec01d347b57b4eae1621a69dc06bb8ecbdff1 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -616,6 +616,7 @@ CONFIG_PINCTRL_IMX8ULP=y
>  CONFIG_PINCTRL_IMX91=y
>  CONFIG_PINCTRL_IMX93=y
>  CONFIG_PINCTRL_MSM=y
> +CONFIG_PINCTRL_GLYMUR=y
>  CONFIG_PINCTRL_IPQ5018=y
>  CONFIG_PINCTRL_IPQ5332=y
>  CONFIG_PINCTRL_IPQ5424=y
> @@ -1363,6 +1364,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_CLK_GLYMUR_DISPCC=y

No improvements here.

> +CONFIG_CLK_GLYMUR_GCC=y
> +CONFIG_CLK_GLYMUR_TCSRCC=y
>  CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
> @@ -1641,6 +1645,7 @@ CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m

Neither here.

I'm sad to say, but:

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> @@ -1718,6 +1723,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_GLYMUR=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

