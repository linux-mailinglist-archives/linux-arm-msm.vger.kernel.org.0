Return-Path: <linux-arm-msm+bounces-82092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C16C64124
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 748DB363EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9536C286412;
	Mon, 17 Nov 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsAYVHL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyGbhH9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA2132D7F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382623; cv=none; b=Fm1LMWsOlmbE0p3iSx0Kt0uDUa2VuZM/Fj6RcliroEhw6odCc1bq9Ycw94hb2S83JoaFaBDQ/VAaZBkxzQb7MRpY4hI+py1eXWJA9kQKq4/RCahs6pkAveds9zh8m6YzzA1heKQmCXYhV/VEzeNKs4/HANW9d2ajwSGD4Zhgdvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382623; c=relaxed/simple;
	bh=r7R1b9wUBDzUXuulPCqVqpGc7iIfAPgHde6sJdwLc0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQs70Ozdr0X3/XQRz4ouF5Lm7DqckWxQa6yCqKbGvu5NoGAXOfDcTKqKwOBOFVMKYVXzpFO+QT3TmYFO/smVK9HocuDJf+2oMa16xVBSgfj2Yiv3os/4nWsWgN9aup0ZCYkVbsTpSqLBHEI1yrRVVV+XLXephtB99+2+aVI/4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsAYVHL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyGbhH9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB65DO4107490
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jg+vEurhb/UOj9r6Pwi2HGIyI+qf8acnrXpyNCLCH3Q=; b=TsAYVHL+aMIoiDe8
	d+31Ju7EnOEtvbOVDJG4sjSyU7ugBCYEIpUoO0zqcjvEKn112CJI2nFujGkrMInn
	RhYHnuKzWJzTjHqqH/VeufrXZQlo8T2lCV9R0i9Evq6I2eFhQb07ndkeiYNoskK/
	CEP7i2VS6TDF9M4c52soebvezrcgaQ62hzp4iWVoba5eJwZzf17rewBBVEmRygrf
	jA3umkuRjA0n9Y5E/ZfeyZ2TIHoXiVwIBmT9ecHD4hsBtacIzwLNCRJnzTGCkcZJ
	3G8mocmf2bDXdMBsGVcYPth0TdwN7ESw+GMEnk2j07O0getjA/CPB614u9x93fxc
	GqBs9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp87cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:30:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee24e1559aso466261cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763382620; x=1763987420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jg+vEurhb/UOj9r6Pwi2HGIyI+qf8acnrXpyNCLCH3Q=;
        b=NyGbhH9mzr4AlqgGhLlFZ9JK9F9+73OV3ERHRoOI2rN4Qgpx7k0H3UVu+Gg0Dni99b
         4KRwIYcCwNBTeNPvrIqV9eY2U+OMOuBkTC7XRzfSQxwWm8bC8ZliDPQlcaQawTbenf8l
         T0uFh7qaXqV2iAn3SXrAVkpvIgUQtLA+B6SSgsEAIXL30oXy+9YNuZRy73NQYaOjY1Ad
         iQNGDDxe78hrQM0pNakO60fcBdKTnuiwIkaY7+BHewarxO0ZSZDMXbZTIZnDhPWDLjI2
         OljJCfLVPHDg3FO9AMRKQB/tEnqGcMJG5GbYTL7lf+pIdT/l/Wey35xXEp2R61b9N+aV
         9Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382620; x=1763987420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jg+vEurhb/UOj9r6Pwi2HGIyI+qf8acnrXpyNCLCH3Q=;
        b=IsD/5LJJO/YjsHlbIq2Pugbam1WcKEIjrnfq9V7wAzd5A6pBQaqw8TA3qFP04q7QYA
         DnuFNjeFbYxZVjVQHDv691LLzZ8FFdrMwHYYq0OpTNz6x8tgzMlsQYGPMpOj5yq2VNWP
         cLPCNxFMhpTD7y4O3VAA4shqhRxsoTJUeWwrtG4j/QZ0rYmX++DGfN13vIqxUWp9C8q9
         wzQ3PzHukwXMGH+0w1heN0XguLNGt/xq5ZO7xKEQRq3gCJsNMw1dWJDpz8tNLdTF6Uz5
         Qc98n0GGwY9fJz1fMYQGtAiC9acGbReY2G6+qyPlEsq+C4yePQILsi0KSmFPPKn2vudA
         sZ9A==
X-Gm-Message-State: AOJu0Yyd/4chCHAwYP4ptZ4fMiiKmWMLo3nZYX8U7KMLifgMIUUF5E9c
	mGufHFGXyVGvmdrIbba4gVkFDcUjeryidiboIOT5dw3MdYXVDlN6JlY80i8esiH5rHGOjp2mKK3
	etd7jii4klIjvtVvS4K+nbFzk27XCZ3K4oLcQFhCssEfWAbwaJHAkZv9N9yJnlPhsnlZV
X-Gm-Gg: ASbGncsQbYBGQ1YyHFHoHJZ6GIGnonQfS/ZWsmp/bH+97F6uICreMu7FWXSNxHyTwFn
	wPzK1wtMgaAp2E3Hmx/AumCO7oPBmvMAmVQigY37lX1D/RbKfsRq1/Y0w/+4L3pyPd7Pjf/9AFp
	2etx/nrwJq7AKeOQjHQU2XelmKC8T3dedCScUMXZWJDfkXpBysL1kUPVhtqaMoQyQOGaXtaIJAb
	w9NLnT9qvZ9gzfvq9Vg/2dFt5UXVCNbJvcvICd7UK0aLHf0TTVzaYdLlv7BZRfMQqayA772wg34
	RCfgBtF7ATx0NFSWr//uZEozVTOmdTpIu+/E2x8k1hB9NnO8s6VQDN0E3+VNoJVOwdf/Ze5yW2J
	DjnCIEFJqndwEDo/6P4GrltiQ+1GyvUJU8sybjRJjH9GLSJ5tPaw3VeQH
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr107293661cf.10.1763382619475;
        Mon, 17 Nov 2025 04:30:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBfRfdvaplYzbcgQy9VBBUfnsh8fk84DZZU6alhi15KhqLDYHlI0Cttm45o8F/29kkTsiajw==
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr107293291cf.10.1763382619031;
        Mon, 17 Nov 2025 04:30:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm10133910a12.4.2025.11.17.04.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:30:18 -0800 (PST)
Message-ID: <c44faf76-852c-4bec-8e8d-6ea7d79ab48a@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
 <20251115-battery-hall-v1-1-1586283d17c7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251115-battery-hall-v1-1-1586283d17c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8ns42PsrwQaoRpDyxCvbmSOFMo72o8TX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNSBTYWx0ZWRfXztSPM6yjsAbB
 k504wvXTNLo1I2Ier1bZW1JFI3CJCxZOHuawvr+Hx9zUT6m/QcEtp8McCnPZlhscOxFg0pL2/DV
 naknf3bRE/HXgIxmAVvpheI3fFl9HBAFUJ6PnUF+gBfqCItVA/UEnBewZy3TXGlkfUNeEajL5y1
 Q5pSMo+QBKZ3tN7cqzIF38M+X7XeFC+jBOPAj8mGI5w6mGnTuFGKlH0Zp7OvMmCAklD5TQccO2a
 +Gxc76ouDvaaATmrLrMJ69sZW5psobKTtdcCs0m2TH5wQwjY+ljptAUfgVKazD08odoOSPUAnI0
 Jj8epvIJ1tuNNxjLq+Htm645hYLrI5tCkkJtjr2DlNpmixdGkXgilnu5h6pAY9oOjz9QO5fAHtE
 dQCXFZo4sWnLeG6cdfAGRQQLPvJgEg==
X-Proofpoint-ORIG-GUID: 8ns42PsrwQaoRpDyxCvbmSOFMo72o8TX
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b155c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69Il93vAAAAA:20 a=pGLkceISAAAA:8
 a=I6SptnUO25vYt0rnpQ0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170105

On 11/15/25 1:26 PM, Erikas Bitovtas wrote:
> This device tracks remaining battery capacity percentage using voltage
> mode BMS. This commit enables the pm8916_bms node and adds a battery
> node to track its capacity. Battery properties were taken from the
> downstream code and from the information printed on the battery itself.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index ebb548e62e02..b58f0a04abfd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -20,6 +20,25 @@ aliases {
>  		serial0 = &blsp_uart2;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion-polymer";
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4400000>;
> +		energy-full-design-microwatt-hours = <11500000>;
> +		charge-full-design-microamp-hours = <3000000>;
> +
> +		ocv-capacity-celsius = <25>;
> +		ocv-capacity-table-0 = <4372000 100>, <4306000 95>, <4247000 90>,
> +			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
> +			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
> +			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
> +			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
> +			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
> +			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
> +			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;

I found a dts for this phone and it seems like there's 3 kinds of
batteries which quite obviously have disjoin characteristics

https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi

https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1949572_3000mAh_3p4COV_VBMS_Final.dtsi

https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_2024958_3000mAh_120mAcc_3p4COV_VBMS_Final.dtsi

I don't think we have a mechanism to handle that in the kernel just yet..
At least documenting which one you based this data on would be nice..

Konrad


