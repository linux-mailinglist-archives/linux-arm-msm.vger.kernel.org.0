Return-Path: <linux-arm-msm+bounces-79641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6FEC1F771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A3C401E00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3265134EEE3;
	Thu, 30 Oct 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLnFPXdS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYoZ1UPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D61340DA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819037; cv=none; b=MqZaMKVCexNineglibKriKjC63abwJKdjBIGPcpGEw7Jlx5jnHZr3WspuyYTxLQWXMrtz0TZ1AYLgjlK8oVBlL76BlqbJUkGc4Hfp94u1i3uKcH87dO3qBT33/P+wkLUehtrEKaiFNCfR9d7LOtYLH0HYuJ2hwrmjZV/vqgCLUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819037; c=relaxed/simple;
	bh=gjnSCp4ErGtgQj+kyj3ZUfn8tTM3HyOSMBbh/HFVyZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWZdEOQo7UtQPBFoE1EycrQGT80wa52Zn7tjNUhudoSiP5MA66g+68uaYMEXTe6iAuV4yE8pKXJrkPUdRX9XzmLNiD6uN3cJIs2+FgZIVNDRO9XVsJZO0Gas65rSqn8UHTesvIYgZ2nt4/ztH3u5+BWOKr2VJJStSWY2604pcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLnFPXdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYoZ1UPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PMKn3509326
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Tk2wViz0AltOKov0bmJb8BdIdTqWdxh4mEaQnxEC6I=; b=gLnFPXdSWwkwwiQX
	ITzByOKkfCISwdeJRVCp3CqTB6wV7P0TZ/xFIVSjGCLktLBzEbyHaLzcDB7Scw69
	I8qck80SIUpsPYw27yfeVdq1Qvjajye/r9vOIT0OOoHlkAw4eqtlk6ZILBq6orW7
	ugHFPpdjKGS7bcKm0BL28Yj7A5sOcBsyrxFjrNQae+wQxXEZxJ4mKyfrRpIC93ZS
	+pm1FgDfXCVUSXH+z6iOeuM99Or9y2uHXZq5FiBsYl+OlIkS3FNOV0NghRAIWH2J
	XgjmE1MZD5EdcGh8EhYWQ35rbCSy+RP0K2ZWiQqzhVp0jXwFNThY2Dcf6nMidcBz
	NFAfWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdg4wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:10:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb9f5d6a75so1354801cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761819034; x=1762423834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Tk2wViz0AltOKov0bmJb8BdIdTqWdxh4mEaQnxEC6I=;
        b=IYoZ1UPvcPSIK0l5xFy1EldVvi3Cb+8CCr42sav769vB2aFegLRavEROCxfxOZymQL
         2c5YqX3THD+CSBtxqxfPWZCNnhQbLFzJ6O6csPDzPdpFIo1TfeQ/b0qeHAj4tnz3SWk9
         Umamto7RlheK/5NM1PfJMbX5p8/8Vn9LLxoLZNSfoIYg4MnoxHmRB7yIR3EQBsmOq0Rk
         g55uZ82tan6ynh4DpFR1NYjv+EHAhZtwab7fVqIMpguS2AaGOCmovIGVdHqYU2b+0U7g
         vfEGIiUGg94xV9+7p0ZMSqf63LQuRdhekgw/fCzYMTcvHYkQDwf+WxcQuw6X8pdcevr6
         XRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819034; x=1762423834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tk2wViz0AltOKov0bmJb8BdIdTqWdxh4mEaQnxEC6I=;
        b=uNST4HmlXF+9/YheiUssdr3gR2HhH5Ljdn9XPUThQtYBxnA/CODUIOZwSXltlm4Yn3
         rgvJiq4rZ1KUHK+p9PZZ+AYH/GjRKSwc8+neX5V1FwQDUL+YQC7Fp2KLrLmeYJa8MSwG
         2IPpXl0bvGZWwf0Aj+s90bKU1yGRRVARyUUya7vVDf1wg0Dnbj5IAeJmJkaX6aGIbmBW
         V5zsyRCRkk3YcvpNJeJ9nFUvR/ESdaCkBVthxGmdi8iyP/AUjHhbzxm1p9+Wz2ZmA3cv
         nhoSGC9zT+pigg+nnMDZMsaGcNAwPyCqhgjr9OGG8IRRC1G6v0MmPwlulsGnT4Dg99O9
         3ccw==
X-Forwarded-Encrypted: i=1; AJvYcCXMaAj9/0yPih9+3859NQZJjbGfBGbMbddTdjx5Bj6WsEF8OTivxUiVffTJqPgLrYbcwq1rVRCcYDpQO+gQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04QWVBfyWp20wQ/rWOk0GrN1cikHrponcBIPy3WJk9bvj9QYy
	icrKa7IRXUhhIRksKifo+u1XcaBYaTyJID5dCFC23/HlfApM0HoiRJDpIMxD1OHwtzmD2TSH/EZ
	0JE6METPdH0L3Yr+sC1ayRHmbQmvPmC5/Kr5OlA7k2fLe926qN+738VP1HU5nrNUZozEY
X-Gm-Gg: ASbGncu2WeaL3idf139md+4SiXXHnbQghmFZOGJlUmmF8HdsN+9Wt4SOuI0VFUyLgeb
	z+X376VZ68NzLZn3mTOyH/Afd+jdc245RSL6dsX7xmfenju2st9tjpxXfkAXTH3R6dEtiXijX2W
	ZE0B4X7VLDZO1vOfV930PLxLC4DnEgDUmgZS7xACxO2mb/aBiCCJI5qRTXFXPgJj/Cj56qS/NnY
	JkUlrnU78Jw6Pn+c4J87jqQRd4TMAH7zwjL1UYeKtJygG2ueAFzUxlqYxiOyb0tFFFBHQPhZyDm
	OtNp9XFKLlq+5MRt9dqxL46XD15u2fs3nBnxqEY/Kz+Jysp/9FOPYRpjJoODMlcr4BDEXZTKnk8
	Cj6zILTN8uNxwteAF3kj/FdBiOVFOqBxxKUNiBkQLOGUjukR7ZNwDZ1nF
X-Received: by 2002:a05:622a:155:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed15c06266mr55893371cf.9.1761819033581;
        Thu, 30 Oct 2025 03:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELF81IfIckZ963pva8kKMpBiIb1HN/EuzgABEmtwD7DsEXTHRgYJQc5q52Dl9jk2M9977eNw==
X-Received: by 2002:a05:622a:155:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed15c06266mr55893041cf.9.1761819033073;
        Thu, 30 Oct 2025 03:10:33 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64061a5b7b5sm1874821a12.1.2025.10.30.03.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:10:32 -0700 (PDT)
Message-ID: <6d6f3981-af6b-4fb6-a379-dc72d08363d7@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:10:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
To: Tingguo Cheng <tingguoc@hu-tingguoc-lv.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <y>
 <20251030-add-rgb-led-for-hamoa-iot-evk-v2-1-3b3326784d7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-add-rgb-led-for-hamoa-iot-evk-v2-1-3b3326784d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7LmYN0gCgnQ0tTod42D7D42Tx5S4omOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MiBTYWx0ZWRfX4BbLOTE14AzY
 zAIbHebtN9DMQM8gV46BSFZI18GBl4L1dJyuZHSva7ZpyYCGpFLzj4+pMkYBs9KT+fn4fT1IoIu
 Mzyf3qCrn7Nhn1Qd1Fxer5cv5+GBiKgEVM1fThVB29IoD43mkEc8tTQ+TVRuw4Pj6m9wi1xSnP3
 AnCGp40F97x3jgbxQr5ii67G9Ed4ZNKpDUVSPZrtEyiaPLQBDvWh/+lXCHlnqNRfXGyvxCzLnyc
 kO+e1OeJZNJRi2tQ8B0mK687+DpwKV6o9/vX6RS4okkmZ2GZgEWPIFPlYTfyKkIdrRLHFIdg7vU
 hKLbG7vhFvCwj2ujxC0q724cOX1ir2hJe0p1A+y26cMfzMcQIF+F9N/Vl74275jRMyOkjeHDh8A
 AE8f8LNK1t1r6lDeop5wWxPvs3qMGQ==
X-Proofpoint-ORIG-GUID: 7LmYN0gCgnQ0tTod42D7D42Tx5S4omOh
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903399a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2cCYZ7mipiWG3OMYrP4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300082

On 10/30/25 8:42 AM, 'Tingguo Cheng' via kernel wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add RED and GREEN LED channels for the RGB device connected to PMC8380C
> PWM-LED pins. Omit BLUE channel to match default hardware setup where
> it's tied to EDL indicator.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20251030.
> - Remove BLUE led channel to align with the default hardware configuration.
> - Link to v1: https://lore.kernel.org/r/20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..ef59e5ff59f2cbe0ee60a020a5d2929c67ad511b 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -5,6 +5,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/common.h>
>  #include "hamoa-iot-som.dtsi"
>  
>  / {
> @@ -879,6 +880,28 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
>  	};
>  };
>  
> +&pm8550_pwm {
> +	status = "okay";
> +
> +	multi-led {
> +		color = <LED_COLOR_ID_RGB>;

This should be LED_COLOR_ID_MULTI (RGB suggests all three R/G/B
channels are accessible)

Please try the attached patch.

Konrad

From a13436fc3ee649b40efa8d0f21467b8534d7ebe2 Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:08:44 +0100
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI

There's nothing special about RGB multi-led instances. Allow any color
combinations by simply extending the "if _RGB" checks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d26..c8afc68e442f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1382,7 +1382,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		return dev_err_probe(lpg->dev, ret,
 			      "failed to parse \"color\" of %pOF\n", np);
 
-	if (color == LED_COLOR_ID_RGB)
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		num_channels = of_get_available_child_count(np);
 	else
 		num_channels = 1;
@@ -1394,7 +1394,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 	led->lpg = lpg;
 	led->num_channels = num_channels;
 
-	if (color == LED_COLOR_ID_RGB) {
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI) {
 		info = devm_kcalloc(lpg->dev, num_channels, sizeof(*info), GFP_KERNEL);
 		if (!info)
 			return -ENOMEM;
@@ -1454,7 +1454,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 
 	init_data.fwnode = of_fwnode_handle(np);
 
-	if (color == LED_COLOR_ID_RGB)
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
 	else
 		ret = devm_led_classdev_register_ext(lpg->dev, &led->cdev, &init_data);
-- 
2.51.2



