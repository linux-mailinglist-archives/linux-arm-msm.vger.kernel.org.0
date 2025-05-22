Return-Path: <linux-arm-msm+bounces-59093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C1AC1315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2DDA188EEF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B30B191F89;
	Thu, 22 May 2025 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvvJmXzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75317230BD9
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937573; cv=none; b=bNEI+YSpUyHMdJbI9De5UYjHU7gLPxOWAWBpcBz9H+Y8EHskd1Egcg924DeRYUdnfsRSZhYCJe2HArikBYSLuZxva09cpx4isxqvVL7+udb+vS1tXSctX+RFVehw/2mtP98liOihKivYQKSCeWrEOXb4/WdoUJ1F7Uif2ft12VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937573; c=relaxed/simple;
	bh=4+L3iLZ1PQ+3x9OrSxwxJm5UHnJLQRCjkTTkw4U8OIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rlf3ZyQfLMWZm47NQ+7UC0raHNAcXf8zUl+jFBwrcKja8kwntW1ukSV2BOxPModHwrCVYRGl0llxbPTWD7rkS4raLLIflzPaSITPJlJ9i/fxYe6reKleWf8uFiH7E9zEp/iBosPnQVrslUZEXIoKNRv5gHo56lmU/DMdlNCoKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvvJmXzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8O5VG029233
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=; b=SvvJmXzs4qhEv6e4
	eu5PSNbUjxTvBr3wpO5xfBrukRDoZnoUGkAbZquRuMqauab4U/JvX1/DCkkCF1Q5
	pgRiYI1cHElaBcsmuGjmrGo2+e9Sju8uoH4jnlcU9We5XJAc1vHw65Ci5kbtkHJX
	+0J3vU8dye65Nz1TCuMoS5Rq7G5UZ8puLgM5q45gb1oQ364chtrxl1j3DV4hJ541
	MSBym109Lw3QrwchAGPl6EpRfg+oFjVhB2OjVfdBYpvRwikJJ/sNYn56djEnlK2l
	WfQMzqYBh4rL3omNI04Oufc7JOuqGvFzG82AcKB8zkudukePlJ3sQO9xCs4lVGp+
	7l3icg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb75wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:12:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso225439885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937566; x=1748542366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=;
        b=waB+j9Om2pr8l9xQcTiDhWgMQ+b4n+4LrWHiv5pX35Kb2/X2ffXo5smXzO3Snn7Wd4
         lJGQdBMpyiO4U6s4RmLhrBlG1gzuaIgIkVrW6YQVwb4d6yoW4EW2QNwIwn7LfSoQnswM
         T64j5KP0fi3pIWhje7DAy6XKl6g3cdaRULT2IIn/1+NssaAdhcZ+Xvodis22vipa5wfw
         f4IU41Kl4SqA5JY1UWMhHVob7923CHnmovjW51x7NyaAD9+s0bKCy60D52B9wOiJt5zJ
         5En1nONidbiDp/lRaGf8LjvR/35IEOEjrZvWpurHkCrTGX8nvZreH+2ea92w4nJRkekT
         7IGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLpGWXc6axTcLT9HGIBIPRcWm4xmLEAsPEyAv5x2TXYvQ5htSj+Byy8uTur59K8v7eRl8GiV5iCaeR0Y/f@vger.kernel.org
X-Gm-Message-State: AOJu0YzURqsTrn8oKIHxI+MGXuTGvaSbMbBKA7gTFp51HKVYdI85Aip9
	7VRR8tY+CRhlz8EHLLe0UNfhKuMwzVb2DE281d6BVbbuZUNyrAwoZAlC1tUx55vEpGUnC+fvlUp
	UIrJIHUYPgwSBpQAe+1j/77VTqK7TutKIPXCa1QMCLdysLNFxlN52Cd9goOnTGvVtrppj
X-Gm-Gg: ASbGncuOLkPjRHMvcrNAUmky8Hl+kwkLDaJYQmL3kNbroSotMw1JpfY2BYUprXiXLgP
	OV3mD84+qxTFn+/yXWYPgZhDWlm+K5CUi2QJtVhCRIZBKC1e9grFC2batt/Yv12/xuC4ikymIYV
	Hi3JnOYQGoZzm7lz2xuZRqmBX/iy3xXJ8FGoHdaSKd4dnTNGerTbGmdC3vKAawRvl+IRznWh47/
	dcjlZh/0mAJai0Onflm+QC2v3X9+Dobd/92DCQteTt9CzSnlS+BrdxPCbR98bQSqnKKAIABBJUm
	Z5CwSJdgy3sBZbAFEQ4nkqcgmbIZ0LTQk+Fl6/EKdgQHzNV7HVktomyVPMizCVA2oA==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648092285a.6.1747937566291;
        Thu, 22 May 2025 11:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKApsZc0tAvzeoyie/NaHZmrsLj7RHyx8qKKdLeYJhqJZ/GOhS6Az5AsscGMsme0KdMurL7Q==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648090685a.6.1747937565936;
        Thu, 22 May 2025 11:12:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d43830esm1123536966b.98.2025.05.22.11.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:12:44 -0700 (PDT)
Message-ID: <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GXJuOuuJEb9bBJJxeliy00RiYPp1BMGg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX+upmz/VTRwBM
 vw2pdkaW+6gWJezJihQd3AbDNVlNMEWlLHi7v8TBkKzbiQFNd09+xTSmz8G6/pKTkH03Bdeydi8
 x3fP/J4bGCGMsmigoSx9hGe0izLTFaMkQYhqMeI09dvXjUkPYpWF5b9ooEW346ozIe8kzUeLG6K
 1J0CgOuztaYnYMO2VLFDBQD9drOtUVOOMMcMqntN5rCN4T/9BrC0JA+278XhScSPJ7qADP+xX8B
 zqJ1yBijA/LUosCxyo2Y212T12sQ/ZMnNHJlSsSXtCwezqoXzjMk3GCaGW7b6hKHeLR67ZLahaJ
 M34RzohtyWZXJ/XrMdqjc6eLHGMR9gX3J4SX2HJzthU+9Cx9jF5ARP2OXF8OVSG0ypDX8EU0mcL
 kkedZTxe+3eG+a2Wef9CyqVE9PoeqqZiuY6ZFt3K8f5rP6DyuEizFE/b0+R73mBvDfzkIdfz
X-Proofpoint-GUID: GXJuOuuJEb9bBJJxeliy00RiYPp1BMGg
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f691f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=tiPGpea89PUxzv1JMdAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220183

On 5/22/25 7:40 PM, Alexey Klimov wrote:
> Adds data and clock pins description (their active state) of
> soundwire masters and onboard DMIC.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23932c20bd048fbe80 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -37,10 +37,36 @@ &cpu7 {
>  	compatible = "qcom,kryo240";
>  };
>  
> +&swr0 {
> +	pinctrl-0 = <&lpass_tx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
> +&swr1 {
> +	pinctrl-0 = <&lpass_rx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
>  &lpass_tlmm {
>  	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
>  	gpio-ranges = <&lpass_tlmm 0 0 27>;
>  
> +	lpass_dmic01_active: lpass-dmic01-active-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "dmic01_clk";
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		data-pins {
> +			pins = "gpio7";
> +			function = "dmic01_data";
> +			drive-strength = <8>;
> +			input-enable;
> +		};

Other SoCs put these in the common dtsi

Konrad

