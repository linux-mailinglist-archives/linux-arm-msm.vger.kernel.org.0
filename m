Return-Path: <linux-arm-msm+bounces-67189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF23B16606
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14756565800
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858BB2E11DD;
	Wed, 30 Jul 2025 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p9IMoYYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC392E092F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898693; cv=none; b=SzE63lGyXeP6QiYGj26veMaRGFQ5hseZ179Sn6DZouKXvMSdz6rPHKPqejqn7DdMKZ4YwM4FGg1UiczTTYBQGYMiQwbJbY4UmZwGLYSmb4GAHNrTvqqMc056YfN4Co1OoNCOUQv1npscAhbdiXwaPVkqJ+CyF+6CC6YW+ac52hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898693; c=relaxed/simple;
	bh=n3D8qHnnfuAiAoc6PZ9oryWver6UAcBaxmcMguTYLIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SARbpnAmadFzX4lQqn7yM6eItIt8zT9gAu7cyq7/hwZJKIsnSovJDRx8Z31HTltlr0GMWI3RjBeyoJC2Plxu2lOhuv4ncuYnMpaoTxl+mVqcWeVr9p9J4uOx042ZkHu2fMdat2sXsvfF/B+OzVzL3UehMtB/vPbhtMXt5ah2Gog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p9IMoYYt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb9XI017604
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I/8jBayyhvVLDAZPoDLRfHEl
	UvAYchL2u6ScDXnQkcQ=; b=p9IMoYYtbltFngmzBsxUuR//FzXgU6tAT0ENf7n9
	RMdxhSr+BHgJ6wfkZjLrkqZ41ENbDxo6AFcwcAXHb/18bDTKHsm2Mz5po1ry2zRN
	yItzjGckbaVR20805iPqgwoaFQDa+SbQn8Ms+ja3u1GxrIBRERUr9gMcQnh/I2te
	LIWAaYDGhBPZx+ee1U965UNkOrwbpxskiwVzi2E3ViDdM6vCLeB4WywwwB/OrgK2
	YjdgId6OzlrxwhosEdxmy/bxHzHr1jeyBOou7kkMCSi2OOJnOZx32uEhyj2TKoHh
	ehcnv7bnTpITx83ryUudM5Zw10g96LKDGS/OZUClemzYSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda4r3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:04:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e2e237fb4eso19892785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753898689; x=1754503489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/8jBayyhvVLDAZPoDLRfHElUvAYchL2u6ScDXnQkcQ=;
        b=r7uZnAzkpqcPPb2Urmx29JxWeOlcldwrOmQN9dNxLIxmB7Dl53hXSyfn1XZVc6zUzu
         uOkQHUHKtC3FkbqZ41DA6pLYl1pSYQbtImwUE5NxRJQ1hLiifmssKX9uwnmH3omifR5G
         FGEfZiYJ71oWsLPn2IFplbx1dK3MPHeGzq8317ZXMOFSDiKSz24fmgTqks1HPZcseUG0
         NeDyS3cZPp/rmp3FFMuEGa3KoRCE8Lq2aCyGfFDwh3z2gT4KzbkbCwbWZdsQ2GIiS+dF
         NATZsr+vo+LSYmYrMxroluoTsxyFGjrVBvpMzYzD/cVX1HkPSLSzJem4FTMAXk1x5J/9
         nX/A==
X-Forwarded-Encrypted: i=1; AJvYcCVnFD3DLHStr4UISDBhr9kagMclZbFnSndfLzLgngYhQvLYi2UvgWVFYCY0yEeZAz+6Dm3ZTq8yw4wA9I3C@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdK/bq2FUDmszuCeQkQ/NNid+hG4hqpWZ8s9de1CIJ8jYpu/P
	/sSog/c8ztNEc6tA5bCqU3rVqgEQvweAi+26mZreYQrpYF9vun49fEP550vrjEtJ4SkXBM6Mgt/
	zGwCB8ttTqGSUHxSYfpK6VSN9tm7axhbprVsbRNI9SxEZX0pt2PUeOgj3p2CuFcks/9r5
X-Gm-Gg: ASbGnctvs7pRgZcgMVKTBIy6RV63fdQOMEK57RwwsGNRTqVa7/TSywWVlfgYfgMt8HF
	nNnjdeCWGYzLqA0Cdaa/Mi3QVBmEsSO0Iwne4m7mUr2lOI69Hw5O/qF6MitZm5x5w7Dz+1BncqY
	aOgyTX7TSBX8mKq322GlUzKwtQyYg4is8A/qeVfD8jp7qpz2C06aBiBc/pEozylJdgMGvpbBdGn
	ZCb6QhowfeM63fJYsnRTfM2YUbjkSUBoAgW56D4jCshFd0q2woepN/InO53PIpAUoq5PYlXPhRD
	Rse9LySvYopUxeyLB71ChHTgne+taB7OfGH+KSwJFJUvB267b9DeBs6vvVadSsVfnLUbo1gtPn9
	yOczK7Q0P88C9xzFnAOkuSLbtZrKdmMihWL3s7ws4VtHEPfRkpz9t
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id af79cd13be357-7e66f356727mr495184185a.32.1753898688702;
        Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkOwzT89t02FAAwhQoy8CKlO1y04DetSnNnh59BpmdEzw5MvIIAzdTos7aUbXT9mMSFhlv6A==
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id af79cd13be357-7e66f356727mr495176085a.32.1753898688034;
        Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d9bbsm2237982e87.9.2025.07.30.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:04:47 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <yhgdibfxtv3w7t7strxd2ywy7gustrff5tbjtlpeh34m2bkhkm@xosfinmgbkui>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
X-Proofpoint-ORIG-GUID: 5DBRBF8aVRSThC8-erLmZz3DxbX64m5Y
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a5ec1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=WvbujaHHVq_kfgFs6tQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5DBRBF8aVRSThC8-erLmZz3DxbX64m5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMSBTYWx0ZWRfXyqQdq/yMMwKq
 b4/TM84Tovug0410MqQsLj8NLTwXPvohvzfONdQegzQsFXBfvfet2ImpD4bsGeuFgkJEuAJKWbF
 5xhIrz4Iw0eDPdegIPGSmDWqrkZqs2U+w4Csilz1tbiFKnMiHzvWGNvwYQjbwZ2c/I1g5NaDrSd
 3O7ULvQ3/BbYjRjD6B79c7RuuuUrkEtE7rpSkqLvKCnH3ZVhwiHfCyWGfBHI2bqJaYEjfIzRCi3
 BXG5/Re+51xFnTZb5HjYWNY/E3oueDvst8o0v1W9kdVcBOOUzIMXz8ug7pF21uG+uxdtDow0Ns5
 gWLN6GvdozA3nw4BwFZRUxndJwaeglNPDpqqiemL9SymMy0Kp3xoyIw6RmGAgs6f8TBumeiOs81
 vQw3XfasrjnAS9pupzXIUV03bDyPJwicLro9eY+8/983lWOC4mQ0AF2Chu0clfxbeY6Dczmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300131

On Wed, Jul 30, 2025 at 05:42:27PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC, which uses the same DPU as the SA8775P. While
> DP0 supports 4 MST streams, DP1 has been removed at the silicon level,
> so SA8775P/SM8650 cannot be used as fallback compatibles.

"It uses the same DPU as SA8775P, but we can not use SA8775P's DP
compatible". There is some logic issue there. Please rewrite to speak
only about DP.

Moreover, removing of DP1 should not affect DP0 being compatible or
incompatible with other platforms.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

