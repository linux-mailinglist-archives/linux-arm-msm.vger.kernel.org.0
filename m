Return-Path: <linux-arm-msm+bounces-76645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952ABC9102
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E376B352AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18962E7F13;
	Thu,  9 Oct 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abuXGtr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF912C327C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013473; cv=none; b=lhZ4X4EF+Sor+I3ALCNsCp25F1Dzv38TM3+i5TAIS3s4I7t/y8BR3ErmTCEVSJdjYTARlmqhZlEz2QkuVSqaAMp4Qmsk8aRT6EOlr6OBXaqI7a1aupAqvmMZRJaLHaaECrGTPnwEbe4lz6K5/ia3AloUzCvLWkD7JTtr5ORtokE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013473; c=relaxed/simple;
	bh=extWvGEBxrY3ETxBN/CqvhubWG0rD3e1PdiYCRNJwW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN8m6eYuEwEHPzpP5d6t9nVKp/LrlIQ2pCgakcGuKFDFZwE+dPGtEb+DajxLf64kt1DblPCfPTgMyJ2SVwY/Px16+abO6vq1gbVOdklzWunbsgz7PoliLKpko6h4qPsYzh1Q+UXxA7ybX8U/IPtfHQj6XYMljnu2rx9BYCBQ67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abuXGtr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJVK019182
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt3cDHWikNa21LQEjco3qqYXJZL0zCP7HIhZv/yAhcQ=; b=abuXGtr40tJ/LEyX
	T4LQemW84W7rh/tqT9TeZk2JdMoV3GsTkel/FnLrMiRwXob/OBkZ7/k6VNt45/ow
	K6UnepOFS11V/N24CDj6Yzgeej/4imHqk8bGlkV2Q8iWzyftSp8WvIaBk3pxxu87
	E6WbuLSUSNqSfKDqnYm9CIdJnTXEFLsuEBFJD0UVNGcK/dbrNrCZ8M+Qk9i1926e
	xzdzAOTITSGgLr/DRoKLSi76R2y2nvU3ric1w70N4R5ipvmcrsh8OO59xuAHagm1
	0PYgSWbH9BMufm1eK9MTBc5/ZX/nnVyd7eoIaJRFjp+U/Mnv9JMXfvmM4TpsEJLo
	i+vF+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntr70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 12:37:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85db8cb38ccso33737385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013470; x=1760618270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt3cDHWikNa21LQEjco3qqYXJZL0zCP7HIhZv/yAhcQ=;
        b=VF8T/qgTz0sYrGgWjENkr2K0sDGXy9h7JP2KvJQhOCruARHnhzmG2cdmCWAXsJYN48
         zkUWyy3ZJt8w/tB9VMbXUrx6Q2QKgYukXe8GRKbVquGnzY2rtCNR+oBGL/pLgUhCwlll
         bAbDRbczAALVBIFf1Visc1S10zSHaM8Od39pNeKX+QgNTaPOADRH6pBy7LaWHRGGH/64
         2BvlL7l7QG65kjOV9knRiQ8ZUuo9nQ/qUfsUKZvJa4oBd+qSub1mWey19rbF4jY0skWJ
         CH91T1CzWG+WRLAsPKxlWAmjesjPPVPjK+KoI69T/xrT67nartgHnxWhAZaOHDyBFrMb
         fbug==
X-Forwarded-Encrypted: i=1; AJvYcCXLCMvTsIrcCqOGrcMOgIDrWouWHwMFlQTm9yIfu7VpnjKX3hsNyxO8Nynfclc057HYg619Kmc8ZqxzlhU/@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQY/ys4ykDfZpamdlyK5UvR5iayEyqb+yFYohx4rLdOuQcwWg
	xDN+yfuq17akS/+T6XL98hfyiEUrPfdrPI27kjmIGEWKEKSiKT5+K4PnXdECxxk3qvS8Ss7YPiq
	1kGVkdgrq/fPbO3Ayt/T4a8hVVGqkFNC47+sW+PWYRsIjHzK8S/kwhaeQy8NhvMyyC8Li
X-Gm-Gg: ASbGncsOM2v7V36IRLEz/dHyjBQWHymit1TkAWAmNOR+9YlfG9ravFKXuopPRBBrSBM
	tM4vu5olSiGhPVm+uWlofdbH0XDblZjRri9UVDmXXYPhEjq7NkcOttca72rlTNSBNWo7z8Klgap
	e3DAPMdrr523XrKQu2o3ooN5iTxHn9kkcbA+mTZdY4ON+Sn/152hF3kYjaOM0ZoxEU+eju8xuOm
	UMX4LVPCbCplx1LZ9M8bj91nMpJOueDzyZKD+QVPNJftuBeNR3clczaGNeHxMHqhZmgfqEejczj
	q5qi4D+2ME+YKm22jAmmm0WCoIpAREigeBxwQUg5CjQ0Cf32d85lB33n0NxHYFlTr5sJwjxi6G7
	r4qBAmOr9+DM+hN5JR2Bi0NAPWUc=
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr638940885a.9.1760013469906;
        Thu, 09 Oct 2025 05:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPlbTf9kz9wyqlteOqkK6kI8LCXLa/DHZ3rb8BsF1nhSSwC936OYw2CJ8McbVnr+gjPtCUQ==
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr638933485a.9.1760013468748;
        Thu, 09 Oct 2025 05:37:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1888759866b.72.2025.10.09.05.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:37:48 -0700 (PDT)
Message-ID: <488d9182-175e-47a9-9dc1-f43753d6fdbc@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:37:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y5_4fE0_KFo9FCgTVN2MaPB9H8HpnCw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXypYyH9DyVF8c
 9mKZLneeoS+3TZpU9lUCKxwy8eNsmIoyUyFCGtFsM2M1w1fdKZQ0W8Hvo8IxtdosTtGRorWRJLN
 u57bGt1FCvYc/5PEvi3bqMSHjEaRgSAwcvgHS8eEm4nCtLcaAw3gpHYlvOz1YvPgRdqwugko2yN
 +ripqR+ae1Ott0ExFZyaAQ0eGDJMopWY0MwN78TgHZU8tSjndvEODOJkrhVTAwjG+Q6p5R1RxZx
 wkndkSsa220ktSmoRX0qstmHlsP1gnYh8YTwS2fc/vq+ZoApRTKQm7pDBEWMUqCT8uNUNBNYMjK
 5VyhN41cKsgMrnv5J9yDUbO1XclcvKfg/uj/gkOgUqYpMB1QGpWY/N1C93FTAC+38MKXlfaQkEp
 zx89h4gGCTZyI5lr53JncVRHNQbXzA==
X-Proofpoint-GUID: Y5_4fE0_KFo9FCgTVN2MaPB9H8HpnCw3
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7ac9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=m35xbnh7LrWQ_H9zj4oA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 8:56 PM, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 26 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 0c6aa7ddf43263f30595b3f0733ec3e126e38608..7b822086a57c600ae9b5668d6d7a375d0ec55fa7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -667,6 +667,8 @@ lt9611_codec: hdmi-bridge@2b {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
>  
> +		#sound-dai-cells = <1>;
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -1016,6 +1018,14 @@ &sound {
>  			"TX SWR_INPUT0", "ADC3_OUTPUT",
>  			"TX SWR_INPUT1", "ADC4_OUTPUT";
>  
> +	pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
> +	pinctrl-names = "default";
> +
> +	clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "primart-mi2s",

"primary-mi2s"

[...]

> +			audio_mclk0_default_state: audio-mclk0-default-state {
> +				pins = "gpio125";
> +				function = "pri_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +				output-high;
> +			};
> +
> +			i2s0_default_state: i2s0-default-state {
> +				sck-pins {
> +					pins = "gpio126";
> +					function = "mi2s0_sck";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

I doubt output-high for a clock pin is what you want..

> +				};
> +
> +				data0-pins {
> +					pins = "gpio127";
> +					function = "mi2s0_data0";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				data1-pins {
> +					pins = "gpio128";
> +					function = "mi2s0_data1";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio129";
> +					function = "mi2s0_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

here too

Konrad

