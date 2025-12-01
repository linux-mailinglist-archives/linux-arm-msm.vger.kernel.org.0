Return-Path: <linux-arm-msm+bounces-83996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0594C98110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD8F3A39C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525163321BC;
	Mon,  1 Dec 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXeGASKW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJt86Upu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816436D518
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603333; cv=none; b=tX8s7suO/tzBee1QAZN2kUyrXdXCsA+9eG+YX1QHOYlyW0+PRXsGqPeG2Q8xum3a0CcDeRq9mYBkxqG+sdcucl0S7wFSI0Ayb37NudxGVxz2eO2aSbbNldKe3/chEZClPHvetS7mabBxr87Z4yJh+4fUL+Xpp6A+J+VfbJkw8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603333; c=relaxed/simple;
	bh=tL5e14DVKiDBpXvEaAFJZ5OEe1sjmeo0BOq7BoEIVWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reTngp8rKEOY7NNnW9zxDPqu/OeLe0QmJzFmFzvX5KEYLhGl99Wig4+Gct8yaznS7XhzKgfRoEWTX9tZW4WvxrNmdPrLLMy846sWaQaoNSPeG7hDtwqAinyueUuNwvFwWjrsPZRY3tgsmrGx4tDfUMc+0N8A7TDWDykBXXxz+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXeGASKW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJt86Upu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19Zv7U451735
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSdFlfJg6fygSR4AfKJokJCbi6KfBDtyaRTR4r1LbAc=; b=DXeGASKWxKq7m0SM
	TRWuWF5TBz3ya3tuBY5pCz6Uf0HNLr2YCTdewlN4P24Cz5j3Lqs5UHKfzRbwo1Sr
	6OgBaa+HgHnorfVqzBdkwquNmGx2IpmIPkagyCjdphxg2elvGldBzhkqSFBA2Zi5
	dLs6pWIXCuFhUFhe45qL+UDfckivCGJutEzRsZIYH4YbMraqIk5qagoDxfYEmbkX
	gCymLfvy0pQeApmbXyq6YTNTE5CLy86kCJytmu5eLOhj65vgL4FdofQZAwL6f2mB
	GQV3+RCjWBSy69LU/9LbwWbsOVX69UmtJLbc3fNuiRBubmK0r5Err09sZxjfxNzK
	UMBHuA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8hes0f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:35:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-935163478acso109581241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764603329; x=1765208129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSdFlfJg6fygSR4AfKJokJCbi6KfBDtyaRTR4r1LbAc=;
        b=DJt86UpuJl92979yQ/cYwYEHy8SmBPA6NL+LnFHIj5E1NrG/I5YpYHW1wnZgxom2mJ
         pRF3NGDchMw9ifprOyVEqul3t+j17u/GrTGVKhjJN0kSbPUoIbqjxjuj7Y95t2Nz44/o
         SgB9sTXC6zFweIVNkBuTHK+BlUYRMaDvM3R2d5HcU7/a7zU/JnPaQIINKSne/O5BVU/O
         F83O/JYh7HvebM0+ESyDPMmfkZ4KpjEuoS4sZ4+VrQ260w8LYf/ab6RbMeXcGOzxRBxN
         X7Iz3rAJ+moh+H7qrAsWoAGmJq9jiQjDgWZdA6/YK2zQ8gZ6UkBj1Q/DLPCP9ArrY8Uo
         DmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764603329; x=1765208129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSdFlfJg6fygSR4AfKJokJCbi6KfBDtyaRTR4r1LbAc=;
        b=XFrq4rjpCrdMAANps1ifacFgN/nPQHlPemKjW3VCbgDI482ZKFzk9ycJ0bkFrWyrLW
         Bkn6CcaVD8npADGbzPw+u9uL7A5xfWWFM77hEDOo8LkpWwZDlSslWMYU7Yln53aRZTbO
         rpTyZN3fufSuxPctc77Mtjp5k6TFHFa9sV6HcrJHXZXGfikZ95O07Uu0kraLiMzj3qrN
         +PttJjgc/B4mg118UwVnjBi0TYzuHa4gm9pW6zfCe1lsvJ4XDnUI4U/5S+CZ7MWYNBEm
         b6ov7nQy+sqimR/GPkiVfEgX++LCP79ReK2y3FEtiMfuNi/Ol8/lMb7A3sndaGMmjeFQ
         V5HA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuX4YnrLk7W8y/AxKdDCxxmeTmIsG954yTPYVSH7l8izqSkYHKrgozkGd4/2F9NCXaRbfXUPXsdi08Goo@vger.kernel.org
X-Gm-Message-State: AOJu0YwIePk7PZhiKHvnDGqafjGWKX9gVq6/7M7eAaFvxV5bkJLVtKgX
	dwYKSNFLUi8Q8y+wr3JK681fJSaDGqih1sIHPKvy6ns4cZTYeMDFwMj5N0xCzQbpdwNGwgjByn+
	Crqxe2+gjjK7kZVSH/MCvBlBTtUx2Ghn/uGf3kH6tHWV2HmRvyxgQUIhMzjfZFwIhOGkL
X-Gm-Gg: ASbGncuqTzTKPPKSBPaBDZhRY0T4PDKa94jhzEkY6TwMGd/CTlt4NX3aru+fJc2VYXw
	FXYYjxenPU3+jFxNvoVVvq2ZE2roW2f0ggV5u11XMdIKpxGkCD7Ac/7DA27W7qZZ0JEB/9fgAHX
	SP1LUuEAuOepadC2oeKECdLe0IOpTXuubDn53TRz9AFeyGrK47ZaQRLDKlk5dXV2YIz2114BZxL
	GAShIUXp8/fMW9HLSmAv5X4SoGy2OpMACoHHOM5xoB0qfnOtzq+7gSvDz3QDfbJp+EFIluV/q46
	c0qdUbD2Mv7wfTts3i3mFPvCoIXHbgZ6N7Q9EMA47+4BLGzOihUc7m2h1jFqpiOl4KtaxZg1Y9w
	wQ80ijFv0VcLi38Oc51Vqsm3qRuhgvIdwDbyCjLH//mpNBCST+HitXbIbGi3nCK5Fxik=
X-Received: by 2002:a05:6102:f96:b0:5db:cc92:26ee with SMTP id ada2fe7eead31-5e1de35cf2bmr8930126137.4.1764603328617;
        Mon, 01 Dec 2025 07:35:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsjTfhZJ7Z7XDoLd1ax9q9qP5u3h9164L7jlabzwPziATWGAVKEVLRYhouWGN4sCO0X0pbdg==
X-Received: by 2002:a05:6102:f96:b0:5db:cc92:26ee with SMTP id ada2fe7eead31-5e1de35cf2bmr8930088137.4.1764603327342;
        Mon, 01 Dec 2025 07:35:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e8612sm1209835066b.52.2025.12.01.07.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:35:26 -0800 (PST)
Message-ID: <ae91cad5-5a0b-4c83-9eb0-6e7baf6a33d0@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 16:35:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: Add support for Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-5-daleyo@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251201011457.17422-5-daleyo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692db5c2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1mBarluwAAAA:8 a=pGLkceISAAAA:8
 a=E1kxXXJYvyZ95uorfa8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=o8qfD6Mr5H-_luWk-5BF:22
X-Proofpoint-GUID: JhC8b0t-TYhx06V0rTAc0AjndsbpYLQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNyBTYWx0ZWRfX3Do7sywJqH5h
 ah2zIiFuej+pdGHqi+L2uMKSKQ19PmzUE/AQ3ZUmLsxI0/L2hZJNBZXnyl2frmjMgbUsryGmc0t
 lWDrY3WdwRaWsjBywQyN1FSYZIWePdBqw6gVFGxS/zIN87sO03mmeqV4GTRFeeFPHM2xPWvDg8E
 /96cWQhYRv6EhCv5QnIVFzgHBjcQzrAYZEXUJySdsT1Z67jpBmvN2imyV4gNvde2RCU/uox1S55
 fKcaVtj17vBUHq3SbFuoApWXOu1VsYb/T14U6XeSeLWHR7wxSZUGqZ1pw/PCJhGn+wPPFM86mzU
 fUB7LsRhfeFXMIhsJvKOTXf2ECRbzBWdi9dIO7x73TDdJgtn3Luapg9IFcVTyYaFxAcoHusSPw+
 Z+xpKt23N2HRUJJIUeLfDay802YJGA==
X-Proofpoint-ORIG-GUID: JhC8b0t-TYhx06V0rTAc0AjndsbpYLQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010127

On 12/1/25 2:14 AM, Dale Whinham wrote:
> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> Pro 11 machines (codenamed 'Denali').
> 
> This device is very similar to the Surface Laptop 7 ('Romulus').
> 
> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
> x1e and x1p-specific flavors of the device tree without too much code
> duplication.

[...]

> +		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;

I.. don't think this device has a lid - what triggers this GPIO?

[...]

> +	/*
> +	 * TODO: These two regulators are actually part of the removable M.2
> +	 * card and not the CRD mainboard. Need to describe this differently.
> +	 * Functionally it works correctly, because all we need to do is to
> +	 * turn on the actual 3.3V supply above.

There's not a M.2 card, the WLAN chip is soldered on board

https://www.ifixit.com/Guide/Microsoft+Surface+Pro+11+Chip+ID/174016#s370945


> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-Microsoft-Surface-Pro-11";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

please flip the order of the two

[...]

> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "disabled";

Is there anything connected to that controller?

If so, let's keep it enabled so that it's accessible through i2c-tools
It'd be even better if you could document (in a comment, like in romulus.dtsi)
what and at what address that is

[...]

> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

Please drop output-low from both definitions, the output state is
controlled manually by the WSA driver. Although from the diff below
it looks like spkr_23_sd_n is unused and you only have 2 speakers

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +						   <238 1>; /* UFS Reset */

Please ensure your tab width is set to 8

[...]
> +	cam_indicator_en: cam-indicator-en-state {
> +		pins = "gpio225";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +			pins = "gpio214";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +	};
> +
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +			pins = "gpio116", "gpio117";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +	};

and here (+ these last 2 entries are out of order, GPIO num-wise,
please adjust that )

[...]

> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "x1e80100.dtsi"
> +#include "x1-microsoft-denali.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Pro 11th Edition (OLED)";
> +	compatible = "microsoft,denali-oled", "microsoft,denali",
> +	             "qcom,x1e80100";

Are the OLED models always X1E and the LCD ones always based on X1E80100
and LCD models always based on X1P64100?

Konrad

> +};
> +
> +&panel {
> +	compatible = "samsung,atna30dw01", "samsung,atna33xc20";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> new file mode 100644
> index 000000000000..7c064ad49395
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "x1e80100.dtsi"
> +#include "x1-microsoft-denali.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Pro 11th Edition (LCD)";
> +	compatible = "microsoft,denali-lcd", "microsoft,denali",
> +	             "qcom,x1p64100", "qcom,x1e80100";
> +};

