Return-Path: <linux-arm-msm+bounces-47820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB5A33131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE8A3A52B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5142202F68;
	Wed, 12 Feb 2025 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX7DyXvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249981FF5EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739394126; cv=none; b=Dzhy7LU3+D+Eeb41kc3GqZaI+PCEHeTKPBVkY+N1EjxuWiYdPgLSXc7FU7redFlRMU7Ud2LIgR6atmk5TKYt8LLA8r6R8tNaWYCM4yg6ODBzOyXmq9C5Pk2IS4NSuQF9W5NIfoJoK2oACz0VL11B9dRZj8gce+p3/nIp73zpz/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739394126; c=relaxed/simple;
	bh=Uaw+rDJcZCe0PnutWGlQCl32yMI6KDwVsAPiJPGVci8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYBiubHz47POvMpZ2vi0mCKpcAPq410B4r1rU7ofNbKuGvlvuksDgmpMAIV6trKehcusi+yZxgeFNyGTOrxwtfXk8SkoC2b7sPm9DJ12eqxrVebYGVO2XjsrZB3a566A6gFiGwHtubiPGTOL+NxP1EZvHW841uroh2yN37pV1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX7DyXvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CA6OHV015726
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 21:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCbj5/Zpmg7dA+y58lyuc3eEuxnGN/60K5XprUJha4w=; b=RX7DyXvGQ0PipKb6
	TCQzDyclrPF0zMN7xons2zbe45UbS9KoebWhU2025vZ7pEnUtSs8Kztmh+P5DAUK
	ESMc0wTfPRD6+ZCAXq1djMPGJgKs7Qbn70/G5axvoMDBd92oKQDgRlU1jxRcWE4D
	Ti4ZO4Pc6m7iO4Usjhss1PhjLKbdIJqAP0GDvOUavHhLPEeJVkojRdtS9uYszu7m
	W3JXbxXwzjCa/8TapwuxFwJ3o42PemSopUob3VrWxLIOsvvQtUcgG6+TVqPt90Ut
	acoGW7BuJ3MYef2NW+N6MJ+dIMLmzdOvaJHLGnOkdtX1dnB1dlZfVTuWBbLgSRv0
	5LDs0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgk0t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 21:02:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e65bc4f2d8so472836d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 13:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739394123; x=1739998923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCbj5/Zpmg7dA+y58lyuc3eEuxnGN/60K5XprUJha4w=;
        b=V9GDQAvo2ndplm8GPDl/q3BG8W7pd2lXxMwfLj0KAB6K1ZLXYoUWGhQZEpXs9sGGk1
         xwADv7KsLXqglvaTdLh1d5KC0+iBfqy5RiYcdGuc4Ccv9eUe5TgHTZ7OfMI381a7dYoY
         zPuMV1mwzBFhzwglYvwpipZEYq1JeBLk9Kz3YPbo4qditDpOeGAiFerSpqUFQbNDykIt
         +BfIsFD0Sf0L94gLzdXWjzxc0lHsJPrjlTT7UD+s61HbBOVAyJVK07lMqLgyovNpOd4p
         ejT2BJweAHUmLduPdgh8cj+IUZXMia/GLQWfN9ffx4U3JSgD+4ejbjVb1q7lJB2xgLtC
         zWow==
X-Forwarded-Encrypted: i=1; AJvYcCVxK0mCkAfeY5lke63RkExX0X8Jz3dbuhRpRJ0pLr72rj++JervRK/SYiwIl8HGOmAEMyx0dVqLXyrGuzEY@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcl+yag+WxNeRk5r29bq4+xYaqujCrVFe9yY+g2YV7pe5EiFe
	1+3cVwOcKFBdgdUJRbgm6b9VWA9no2My3vRYGEhAaYp9fO70eBDxQejjs++SMVloCksslw8CqQi
	FE3Y/cu0E9/16K5yNryBVhPpVfzTbDNM+jJRjVSnRhv8ewuDsLQl3kx0Lq0iaF0aZ
X-Gm-Gg: ASbGncuMk5rAo+SmZdUYaVyi6cDdCZoasxmfMSGcBQ+k0p0TJCr2YCS1E8NPi+O4yhx
	drTxgmeRsXtzOQOFmwwgssEFzmSDYb6FkRuF/m3xuHdZGw6CP2iH8Sg4F/4YoRYUeB1/zzM5Gcu
	ZvVj1rCxicfwFWpndnoDjM6dvvbZL80q6F4hWkOnOqha8UAa7Vyr89YRvmXLLcjFe2Ksp6SVWV1
	ywhv4aPZk0ki6Ysr9gwh54vQ9IttXO/8cX6pBo9yk72p2DAZWgVow1/yXYKHWGxuP3Glo132eVn
	EXtTIcug1vum0dQRNzwDQUalZmtB2kfewUItA6Xs7xowhngOyj/4Vs48jQk=
X-Received: by 2002:ad4:5dea:0:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e46edad47emr25117176d6.7.1739394122919;
        Wed, 12 Feb 2025 13:02:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg0hOe/smwdQmCk9xi55x13x4TSItXDFCB9AYlS1II6ITVsxjATTaGMskMFKK5yYZrRrpt/Q==
X-Received: by 2002:ad4:5dea:0:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e46edad47emr25116836d6.7.1739394122472;
        Wed, 12 Feb 2025 13:02:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773331db7sm1325782866b.127.2025.02.12.13.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 13:02:01 -0800 (PST)
Message-ID: <22ce4c8d-1f3b-42c9-b588-b7d74812f7b0@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 22:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: dma: qcom: bam-dma: Add missing required
 properties
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Md Sadre Alam
 <quic_mdalam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
 <20250212-bam-dma-fixes-v1-7-f560889e65d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-bam-dma-fixes-v1-7-f560889e65d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eiGrp0UsEYuzvGuB5dgWyiLBybfJaEwg
X-Proofpoint-GUID: eiGrp0UsEYuzvGuB5dgWyiLBybfJaEwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=997
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120150

On 12.02.2025 6:03 PM, Stephan Gerhold wrote:
> num-channels and qcom,num-ees are required when there are no clocks
> specified in the device tree, because we have no reliable way to read them
> from the hardware registers if we cannot ensure the BAM hardware is up when
> the device is being probed.
> 
> This has often been forgotten when adding new SoC device trees, so make
> this clear by describing this requirement in the schema.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> index 3ad0d9b1fbc5e4f83dd316d1ad79773c288748ba..5f7e7763615578717651014cfd52745ea2132115 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> @@ -90,8 +90,12 @@ required:
>  anyOf:
>    - required:
>        - qcom,powered-remotely
> +      - num-channels
> +      - qcom,num-ees
>    - required:
>        - qcom,controlled-remotely
> +      - num-channels
> +      - qcom,num-ees

I think I'd rather see these deprecated and add the clock everywhere..
Do we know which one we need to add on newer platforms? Or maybe it's
been transformed into an icc path?

Reading back things from this piece of HW only to add it to DT to avoid
reading it later is a really messy solution.

Konrad

>    - required:
>        - clocks
>        - clock-names
> 

