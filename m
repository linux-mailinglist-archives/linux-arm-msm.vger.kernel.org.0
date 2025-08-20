Return-Path: <linux-arm-msm+bounces-69946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F1AB2D9EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE665E75A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4092DF3DA;
	Wed, 20 Aug 2025 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m04ZDh9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C852C235B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685110; cv=none; b=gxzRvP050HJ5UJ//MmSPUKdE/+5N1W1MQ+8xpUPY3kyIfW95EztU6IPC4jhLDCPm5LuCS+NT9e8j9tpoZ1K3Av/GGtide/qSCjxytKPOSANReSR57qM1c8TCe1uYoTouNoGrodwdRNp2D1nYLAqVhj0p1mLYX70s368JE8wXqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685110; c=relaxed/simple;
	bh=RD/YhGR6n6Cqcm80/va7EGUN4MC358kbGLBV1nwlbKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaMcakW6liHxBPJNbXUkk1pJmi09VG6d6GH2Jd83cm3n+q8L1xXphDYXD9CKGcSEHWAGLLGfTKkw2RbOceWSJzAjtYu2CfacH7yx1fpDtui+kfotQR+c1ZjopK0yLu0Ipg2MxCJ/5kFr7QzRL6Zk55my36FglgaqqOuxo/n5vzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m04ZDh9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA0GGH004202
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RMmIf6OvZrK65C2lJ9Pmjnze
	nmAYNUQwMUXR7Q7PPco=; b=m04ZDh9m3eZZiWHDtRw+bhpEsiBl3XlWz+Yc9AOI
	gHgXA+fqa8B1WbSIincNp6cSJOpfOMfWNNeETEgTS9HKHuZRTzUmxmb/OzkyMP9k
	opd6Qz2SGN1A2t9iHN8DKTqa/T6mXIK/P6/mxC03PJ+R5fnmGQjP6fFgFenI1Gtj
	8IkAuR9N4dHdQX4tyyNg0SlWajKunB4eLhw609Cbvw50G0NqHdLEAmNQoluZ7aV7
	D6xVni2lWpctfrfXLiFV7woLvwdcFJRye/COQZjEuZhqtd7fFffcpMqxqLNt/0v1
	oZAzzT7VTEQLP7wPHJ9g5aWfB/0yyYq5TGfP3zqV9otVHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahaxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:18:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ad4998so241101811cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 03:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685106; x=1756289906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMmIf6OvZrK65C2lJ9PmjnzenmAYNUQwMUXR7Q7PPco=;
        b=eMmup4Jve2eH/w10EHHza3x3x5L/1EW6Xl6ivqMbiTZdD6DONR+JwlXQ8BeiKqWWJs
         TzQ6a+Ej8tTNt/C6Uu302DKwBnoUVLxdjDInX3eD+t5b1zv9ybXYDak4pst90Tt3Ms++
         zR9qYlrYRw/h/uSKL7m8OrzZQYQnsUmIJBNy6lpOfEMtnCCQphWT1Km+J1xsexNcCg0g
         wntmTu2dHb/2HDaHysI6lUQLP52Pmd7Dx4A2t7sGhAAQZrFy7VHWKKUHSgOCjUEHzbnO
         HUttLGiniI5fXj5kMcOEFaZmtf9gDBoj9fRgpOUHJXDuSz8bLPqCAAv5A4ifidP79W+u
         Lajg==
X-Forwarded-Encrypted: i=1; AJvYcCWRGWpu94RPrk8iCB8u9cgx8ZwhRrx6gy70pt5eTHS+dtP9Sil/VvRKrxrr4AjOLpJeB23GROS1zukZss3j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxibh1oP3XnwApyRTESyacWma4Esg13yHrNfTlqnahk+JZRHVs
	r305RM9L+9ykW6ZvQpwEfKPOb4OI7KBGH8AQgCjcLUYk2RfR3ieh0JY32idmElS6pBo5L2k2XLU
	M1LoyBuf64MEw2YQQfRV3eKoQM2M356RaOY1cPDXV2fzzqla12hW5cuccVD4Nhfu3CVKa
X-Gm-Gg: ASbGnctL6FPyUWQ9njRriwIaPPTcJ6khfNchmby8LrdikCrbTCGwAy6ld2m4a20KwoD
	uy+fPkg9DaaXKDRvPsGxlt92Hqw19c6Q8uraDMJq6TQ0a0Hbnl4x5gLyLQ1sKgivTzt5aAaBu6s
	KI2oYjePGz4LCb9Gll7fbl8oMKJnsZiGQhUl+3HLiyUqbtVH67lSt+WtRtAFMw/N1Ib4M7t0d0z
	s5GdYempuXMMOH4WRDyxf0TObEWVSlwippwjYsC6TbUjnLoQa2dafsbLzRf9XF5rvc+ZzZZWqEE
	H65dGN20cigsY2iFfJ0CkDJ0n5B9q8HXTG7VmPMFqfgc23xt8nls9OxUi73N+O8TkFbP24oMh0r
	EiAEv18XNE0+6TaZScq2YSakoS7KyShv9A91FYKPZRqpknpigR9im
X-Received: by 2002:ac8:7c52:0:b0:4b0:677f:db03 with SMTP id d75a77b69052e-4b291a450cbmr19243191cf.15.1755685106457;
        Wed, 20 Aug 2025 03:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2AOZHGENtzCbjXG8zdnjHcyu3nc3kzJVHOmLOa0gbBzdcDRDqks1SlZYpXJ4L372H7WS/sw==
X-Received: by 2002:ac8:7c52:0:b0:4b0:677f:db03 with SMTP id d75a77b69052e-4b291a450cbmr19242671cf.15.1755685105881;
        Wed, 20 Aug 2025 03:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e02c31498sm623244e87.12.2025.08.20.03.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:18:25 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:18:23 +0300
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
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-GUID: _uQqOfFQ0IWmVj1j0dJqutdy87fGezHD
X-Proofpoint-ORIG-GUID: _uQqOfFQ0IWmVj1j0dJqutdy87fGezHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6U0OtbnqWuWW
 ZenW2laOWLYqJ69qDkGgFefkp/Yoq5NBgavJ7CHzQRxbaMPbnmN15byJg7tyIeym8X3v/Gtm000
 l9hZTUpAQhdi+hvOD9vFbMrtiS3LiYo1xOzN2YOXnEN1DNJH/IKL8jOONOn0n2G2rhgzZLuaI/B
 Y8rrPSOl28EkFztTJHqbzkK8cG0IzQwwQy0a4ZBEPJuk5Qh3MCNocZTxk1czeSOeYvZkZtEtm1j
 HoT5FDKv0XvQAAIh2lEsYCwYw+mFdfksvKutFtUawP7IB115BDHSy9KgtCIdZBPlRKuor3rQmcv
 D64zUE9K9AvwTLGALUEdiA3UAfJTL1QAM3xuYkTu7CQ243yczjle9KuCrnke9PszdrmtRFDKdLM
 IOIViCvaf83/mZM+jheYt2S6JKl2xg==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a5a0f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6LesCdOPl9v1yPo426oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> While SM6150 currently shares the same configuration as SC7180,
> its hardware capabilities differ. Explicitly listing it ensures clarity
> and avoids potential issues if SC7180 support evolves in the future.

I assume, it has no MST support. Am I right?

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sc8280xp-dp
>            - qcom,sc8280xp-edp
>            - qcom,sdm845-dp
> +          - qcom,sm6150-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

