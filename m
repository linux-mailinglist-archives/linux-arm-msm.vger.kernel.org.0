Return-Path: <linux-arm-msm+bounces-59802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E7AC7B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A678F1BC6A2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E5C1AF0C8;
	Thu, 29 May 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpM9dJyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A521CA0F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511006; cv=none; b=mprCjMgjgDEp0WCkMDmCJhL3YJ22HeWvvLp1jxhqUfMols//izM7xf+VWugNaJIaOmDMbvIC7QS4xtF69hapocTGwWaWA6De+2HVTMXRB3PWrBS8IPaqiKDfT/L8H0ZEgnzw9AuIdWkQjxWBcHm7MH2DPLjwOPWqMpEKPD2bvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511006; c=relaxed/simple;
	bh=GWZ47weuVjxdmOTn+geA4pg3AEu96U7nGcqiOqrS+FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBq1O4l8m/eBaq91kgJ7KYroyCOtOnrwZd+VEDdR2AnzWCcDAbUQSkqmC7TPPa3tk/KOH54zppLuHD2cllRxLI1CR914uIFPMT1iqIihK2AsBir0UVmnzBXFbz89UbWwIOezdgkuViKPpxOZgFT9IvBvGgqGpMSLkrk28ULn1iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpM9dJyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7KlbI009136
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=; b=gpM9dJyt8bVrOwIe
	LpFoocQC/9ayLPKTKVr1ixHgkCO3/gh4FgJLOmviRgyljkYchTEaXfWcMA1e2Myf
	S+nGj7iHfRGQ5rAeZGvx9VF/wX9/Bi1fSnnzDEnFk+roiqwMHu7JFApoWZLbPOwB
	UcGU0hA25GrmSHpEnwj09HpkVrZenD8mzF1NRkzeeeWzcNKhLqoadMwaA7WdydfK
	GAQZHCVhG1Kf4BCfuBxJIthdwIFrDnOfY9lAikT11DS/dvkI1Fki/7/hZjaGtrHz
	5WH2fFiG/CNuPVode37PEOv+i9d3M8JNtCvwZD9ra4xWekIPC1BxaE2jg0UkQUI+
	tNnwkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03muex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so12963276d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511003; x=1749115803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhIfxMVlQ8L9RT3lT5uUaRfqIAHopMP4V4S1R9fi38M=;
        b=HP/riDm0MDSdmi8dE7UaYrTLeSMr7ysBy3yn3P4suQoZsQYiwYdYBU+n+6ieAfs6bB
         at0tLnwnz4pgb/BDz9+wDQgKZwRsQ57G34TYlzIys9Yewo5hKnijB0b4d3c3RN4rCYTv
         +eloLICq9PzsBR4xDiz1UOePHj15dy5bnkoC/GS0DCKBIaSvNskNufyybY5yIiVcLTAn
         wVXv5sEXGIWIFP4afHP/WTTb4gVrxITSuRkAMm3iiZ+De0MG2PUTYHmT6q4eMBC0XO5R
         TDAdvDEMqRdWEjz9tWnZtqyiOsiqVoy5Ztj0cPEugAySOt6CSZDjRDwIqL0eIpZ0ssfL
         82rA==
X-Forwarded-Encrypted: i=1; AJvYcCUOMEPPfOitCuyaEIebzwfPlWfA66aF2DdBHT1wnFs9CaCo6jc23rCOoj9XXz81u93Svjtj7fsPMP1AfhVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50UfKYMkYwWgjaVi2JtkRgKsYb/OBkyWle0HkST7CY1T71JKD
	2AdepQCCpIRwBKNfT50TnkmFa+Ac2UpVIM6m+sK2s3eQN74dxvejGrYlME4aWzsaEKcQVya37+Q
	+uwoBGonVp0Pgja5SqUsgWhDuBpUHJNNsrYYtyhsrz8QFWH+Gm+5vC/0Id31PFaDdyFBw
X-Gm-Gg: ASbGncvbwHT95kV1LAFhRIiXrpClIB95oS+7SOJ7fFZNHLqwfFaIcSj1P6SWj6rtqhk
	atHhGbIspOIz9wgkp+vAPNykEwcXDbA1vPVG6VkRXj5dwmMUv65LZJXZLIVfsRhrkaSFZkGi/6J
	OXlKbhF1oNufStYR092cHGyvlxNJdNfMo+JlCuIla5M4oLxozIg2mjVRssyP/0M11dTvj+ojt9Y
	wJrsTZApVRnPGwPuFJKEScgGzTHMe+lrRf6YU47voqJI+dpKeTKDqTXKYOCOJGIK/wKjaFpRwAJ
	8mid9s5s0QJz9x1v31wY8AeOrgq5TTaUDw8ykA==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275576d6.2.1748511003011;
        Thu, 29 May 2025 02:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuhF0a9JamEH2xvLOnY3n8YKcLhz5fVLRzYE43PyF8jU1JcEPEDxsP9ZS8JS0YOd2Xcle+XQ==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fac83d3e56mr19275296d6.2.1748511002582;
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm1411669f8f.75.2025.05.29.02.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:02 -0700 (PDT)
Message-ID: <89a1a6ea-3939-4d52-a8d4-478347b1867e@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] ASoC: codecs: wcd937x: Drop unused 'struct
 wcd937x_priv' fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WK-eSzZQWYGyNWoV0zuy7xVardzooDrl
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6838291b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pnj4R_TuY2SD5zWdqewA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WK-eSzZQWYGyNWoV0zuy7xVardzooDrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX+THajmFoCrdI
 sMWRD/BaqLqp0iGexL0eZCnc9Zx/cEoPjXSb/pBoxt50CXOjcfCXvsvu67MYMASqkVtLE2XGXaS
 H5CDfaaEFg/cAkS3rq10sMiJij3EshytzYf8Fi7BhpgDn1sVUpD3+9Ri0bZMglPPT9gmSEuB/qp
 7i5yhACzJtXzlQCN7Wp7m3GgMcKECkeiTCiz0ApcnRBC9uiiMhD6aXbuD+PXMMJup7iTrveUXVC
 M4KcyU55dfKZKFiW6Golvxd0qI64brYyFsIvFz3kFEq4fTnAEt8wHdd2LMX2uN55eQrDFrRbLAX
 3nvfx49q5BHBWyl9Ay/bQ6GGLEGsVbu3HAAe18jJMbRCBmKC7t/J+hXH6ztYOyO5QWsaztEjZnz
 GPtRORIJ6Ul9rQQ90bgLiSDLGabZa09mQKsik+sWzDEJJYayxBa8dlKxWnwsB1HyUwGrBTTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=844 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd937x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd937x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..126a29e0b3ff96c12fdaba2b9344a3040b455e44 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -88,10 +88,8 @@ struct wcd937x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD937X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD937X_MAX_MICBIAS];
> 


