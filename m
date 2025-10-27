Return-Path: <linux-arm-msm+bounces-78890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215BC0D7BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0861B19A5566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5669F34CDD;
	Mon, 27 Oct 2025 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh4W2s9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04A2FF67F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567664; cv=none; b=SFLi+wW/z6vgoIe+mP/uRpN8CgrhRCTZ/1P7w7cAAjGhpnSWylRAgs6xbEu2bpbQUNSlZQhYcu34EUVTg2ZQI1Z9jIs9XjDgWD/rx4svP6KXitYSomsO/qnCbRHn9h5JK8wUyoMtckWUULRqlmY7Ov2DVdC4TF4CxahrU6gPozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567664; c=relaxed/simple;
	bh=nxPWAEJRSRpuGJj36axWvM+AKJHgISMgHq4fyA83R84=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UgVhny0nzI0qJX6nbcahEW1oRGgrtmHw4gAnjtYiwpsLYfVgVUnLJ1IeWABLTjM3pcMaIsQE2hYYlQeYm7WAhkpNxart68O2himSoRXfIts+U/1+EwX5dVI3k46oREBo8ZwMk41bPIjDVSodXGRyNGqabYIX1Al78kM9VgNspHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mh4W2s9i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8MYcl783388
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=; b=Mh4W2s9iCZTmOG/W
	eiIFJyfeRI84xvhv9CLFGqr7pVww6ukMC+1WntxshoS2QBlBGiyNzZQbab4vU03T
	x2NhEP65/wuehfB0uS64BV2OCCbF+Hp7LTcMjY1KdVxzSDNJkzoKQby8spZ/jNIl
	0Iti/RVC0Af7lX8O450WcUbVPfcXp0OqV9iW4hhffprkXvBlFnmw4nNzinVVT9xf
	AFeisaiUmfGxGbNFKWpgdhJYKxwHABwUXwJ/FAIeXCF3X0DKKJ099YkRBbt10l3C
	LcwEdhew1qtui/XWreVyqvweyydqcBYpFXIzvDDD/zu04WvPLn3k5hY+GrUH5sQl
	Ab9riQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4g3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:21:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8b86d977fso12514391cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567661; x=1762172461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=;
        b=P9KOxoFHYoaGRpITd4lmh7frcCFA3GZdXr2c8nImcsTOltWubPg/yOzex57RNNcX7E
         U/qLjEyd6unGKRR7IPu/rAyZIqqJ15lYg+kfkT4ddtVUNMzaGjkwj62/myreITF3KsXZ
         Ur62ZQYA9WgVu45WEfIebReRm7Lt4xlgH0VMFRoT3qSmzw2B72fQQ+qWVfgnajJjZY63
         QD3anQxNIGKJLq6c+F+nkhUmUPCdtcO++KdIxRZQ6ZnKvRVLP5UmeqrnmpLnfDUmneTL
         X6/ZCZFLySJuXAjNq27oQ6alBOl6i7/B8mbRzQeedWf67ES9nyI6Q2OyqGDC/kznZ0KG
         YMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfHM4Rd9zX6/6mjOVhkOOOdnmEEYjjGhUmSKI+HRKRPoRWmdsLnQuFGbi57r5882AiavtLX7KMGrCEM3Vj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0S8KWslIwQ70LQ/xr0vc89Jo4TWxQNATxy/L2pKUePuilShjM
	nQU7Fr8txUSXXVYwSz61fJwxhxuJ4hUQTpt4tNZXW6ZQ6kkY4e+m5f/l3tkoBLaw7unv7nrQO73
	SL1f9F9O7eisprQY4CwOgitVBm8lYnblGf7XPdLMibr+MDETLINYL7Deldxcw7JSo+nd3
X-Gm-Gg: ASbGncvP8xUGusrfZvvufHPhna26JmvlQzW8CDP71sUiJYnGuEi6kwF+ste56eG28q0
	EnTVmddTr/W3VkK6cx2qdgBnzpRzzh8OtFkBfTRRWmmWfX3FrH2agpFuli3VwPhmK5iB1k/Rjgf
	ikeD+vI5ZGa4xyVmpzG+P0jmBlgRi7EY9jSuKg/wTg2N+o5JzomZwV8315uJX5l0hSoFCiCogp5
	AYTo3IT8cqZ+P+GjKwwNAtIeFOJ4DzpP76dQGIf0xTN0ZHEuT5qUwIrYB5glxp+P+CpUco9lRVI
	332LOn9dc3JDBA4QyP/f0Ai3e6Pf7Tv+XjS0WBJ525w8fZi/ZQPebtulkcqwM7j7JAvYDwYbLwF
	4SJqXq1jU/ZtqTvaMgbLzQORrfROb7X5BHsh8JLViMLA+s+VzzDPADUtk
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eced46b36dmr54348681cf.9.1761567660966;
        Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Ymwp4j4U76wtRZGQW8EHbN2uGqMPPJ/w80E3/mCrIAWR0RdpJNVmK9Zxy1Lr+Yj9F1bPnQ==
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eced46b36dmr54348351cf.9.1761567660538;
        Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f9a0fsm746527466b.50.2025.10.27.05.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Message-ID: <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:20:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CugDgs2AyDI2093_oE9KUb3sB91ycJxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNCBTYWx0ZWRfXzyrRLmhhjwLo
 HlO2wom4bsMfWDItph5/PcL5sluCzkc7tzfOzU96jm9mySFNJ1hdJFW+mZP0DzbTXJnO/abQepH
 aiISuzSrcO1NgRXipNfkUuAzJFfWKx5gGZPKa3yYi+JmpoVGSx/m5j/KfcfRRtZRhPKyyZanxYM
 5aOKIZurCFigo/HyboXFYG/KzRtVWAKc1LUEaGOvHIrXkIqodhXMV7EAEci2DntkAJa+Ia4SFZI
 1d7cK4n9PtE85HUX6RyLFHK5zmbJjr+Fw+cizaYS4Wlid9jq4SKsrtAYjBdxxKtTeZvFmvifV1L
 pFWHvkM7w9IUHKjJYe7b2Y6xnAZjqVDYtMQD67XbjZxME74SBXs846OdjcpW+PJomZYKHlpMrz7
 E/1wxNOy8g+J+IPYtOJt9IHshkAo5A==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff63ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=PIn3yDVZNjJHwrb619wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CugDgs2AyDI2093_oE9KUb3sB91ycJxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270114

On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> ALSA UCM and audioreach topology will follow up as well.
> ---

[...]

>  &mdss_dp0 {
> +	sound-name-prefix = "DisplayPort0";

We should probably push this into SoC dtsi since #sound-dai-cells
is there

Konrad

