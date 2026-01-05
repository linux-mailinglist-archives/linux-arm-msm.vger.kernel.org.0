Return-Path: <linux-arm-msm+bounces-87359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC8CF1B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 04:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F51130056F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 03:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B4829D29C;
	Mon,  5 Jan 2026 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4SKeDmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDH57AcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA11CEADB
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582468; cv=none; b=ZhdTvskvbcNDEXmysICiqZBnJzWk0j/weaK5hhfQ4GXaVGusnZpPweOM3Wsp0P8UInpoFD7yVQKkicQIDgU9u5XJLzFCCk8xuuAdF2uvOKzXi1krZOmrDKlL14ixGECil6qWzxDttHaETk69CV/B+OV8nlx59MC4udb69lSnevU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582468; c=relaxed/simple;
	bh=AZcOjGFLEipIawlrIPQP+eNdDMeUQITAUZ7VJqYya1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdI3bpwY7uV8cPB3y3+rbMq/RxFvKIGfHEDn+8IfpndfHkwMK8lc+lLw64uVGzRarpx1CMlBxhsM/cKVc80ck4bszD3vY9swVQEXieeeKx8qxLDDO1MjiZXd765Ksf700gARNpbiolRORPLOlMG1wekEIV0d4M2ENgn2ZrK1X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4SKeDmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDH57AcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MaeL33408360
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 03:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jvWx7OZEqRzE+LCgdNc5cKOSpywJ3IvWIxp1CH8yzs=; b=n4SKeDmHUNC5+veO
	DZBzedpXgu4pElFNunQbv319cYXLr/AsvsaxCHJD69ORxph/QN6gSKNBPrRs+Dd1
	UuHWleHT3uCa6hve8bSwGbZais2K1Q0YPn0IKpdCj8i+JNBtVwYo0jOVT2Ix77vA
	QLlpqhGvJwzU86oL0yaE/y+Dz24M1lrpbdMpwvTQ9V9bEVTaAYIjox8lk6gdNL+3
	5BVoRBDUReGEiys6iHtB31IMza+uNA6GDPbIMqxAGXxf3/fCbhYg1M+tMpeNKbiQ
	0wkEjcUYCVVc54aflkKxDL6OOUTihBTdz53KJLGlPJrFRp050K5ssNhK9txqsVzX
	0/Mj3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beywdjneb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 03:07:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f25a008dbso117894715ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 19:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767582465; x=1768187265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jvWx7OZEqRzE+LCgdNc5cKOSpywJ3IvWIxp1CH8yzs=;
        b=RDH57AcWS/gtJxCYN/rcZFGyjNhEec3kRht6J1U8S3bpaWG1Jn/o0XHHnyl0Mk1ZVy
         UVxj3Vcufrfmx5rQtSTqPAkmci8GsBsLf6NtougplGke2oVslku++d8RIveWHrGMGuEV
         0EqrOnd1eQih+QCmKJG9Np3Xh+X1sIZco9mgOKOGWLqOuNs5xSuPivTgyHP/bCYX8VSt
         0ZxIBqdMQJrPDKMo/iIXEC5xnRAWvfVNMwu6MkiWAjC07NyxW8YpEQOUX7Bc+1vJcaUW
         7IBBq5/JByO70MMHbxTmdRGoy2/UW3riNXnDrmmTHSAmCau5ODylPrcY5mWTCwuk2o8W
         Rjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767582465; x=1768187265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jvWx7OZEqRzE+LCgdNc5cKOSpywJ3IvWIxp1CH8yzs=;
        b=kS8gy/f7+Zgm/c4g8purL/mlZlVTzk+yywURZZbg/hg3zyFo8vCJdDNw2LS6FTuvsl
         oDcX47/wufhYl7tNDUbxTeVustgJo6lrF1SIynxO0PkPO7tdjLil2++UOdjMCmRj15tm
         a+amVTXQ/ZPwUV5md9I7wN+BA682nyLpxhbd5DIL2f2uAFRB7bbBPKCtCiUkaVx/oHKK
         T7KfhR3IxzOcJEfJ38hRp/M8SRe+bynW7kbrPm86e46GJnyFvCiJdYpo2r5erfIJwJdM
         SNouDcf99elD9vuXhfcyhy2G9tbiwj+vEClk8rUPqQJj22+mQSXGZOqo1igB1zC4FxXI
         PO8Q==
X-Gm-Message-State: AOJu0Yw5zrzF2xBHGiitkNDBtbJ9r/RtKN97snZcRMY4sPluPgMdkEu4
	MVWOrm5rHlRi1igJW61GE2IUFamjUGc8tpzyhGJfGQSz2kJ/xaEFUFa2oZHlmnMigMjvRjs4T9q
	pGwDoeSWLP2DjU9YPCrV+/y+kiSygPyTAtGFto0itahmXWl9DnohlwHH4oZNklBNsEek3
X-Gm-Gg: AY/fxX7Am/oL+HR04zDjxslbJvpTPg2CpQ2j1JPlE+KJIvrDoKNpN3ahZw6tNfY+F/1
	l1JmZYXX5A2jk0veHWadGsEOHIBiKNd+9zKNar5nvv46kZD4SOD6tXBK4Xb6fLidFyCVa6WJKeh
	y0hgArE5bevE4vk/IWJgQeoMr3/d/AXY2FwJMlQlX+DfO5OqHX0vUpf/0TbR2R3k5ZqE8LFqlT6
	FMuw5UHdOIWpVamoO7VAN/8uoxCn5IWSxyLi2EdEDCQUsmQzPjOUyGepPnGSLJd6VIMgU+T+AQc
	pgqKEOGSO/vCxrl4CUf/v8wTN0RxQOx018TD7Ga0Sqj/yKdBm8l7rjrnvhAVGvGoBn/8wCuP87x
	6s+BBoZW2ykdSmj3/ma44JJ42RYtODVDIqlWS5FtSA+POYXJxKuAXeHiHJVyg/yA6Szeb6LPRWu
	T6Q8Obyw==
X-Received: by 2002:a17:902:fc8e:b0:2a0:a33f:304c with SMTP id d9443c01a7336-2a2f2a400b4mr499684705ad.57.1767582464800;
        Sun, 04 Jan 2026 19:07:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/Pcv0KKELZsQ4xuxVrddH2xFkW/Jq6CxCE0GsqYEu+5rMGChfsiqULS0J7a+2YeyN5XM1DQ==
X-Received: by 2002:a17:902:fc8e:b0:2a0:a33f:304c with SMTP id d9443c01a7336-2a2f2a400b4mr499684465ad.57.1767582464245;
        Sun, 04 Jan 2026 19:07:44 -0800 (PST)
Received: from [10.133.33.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8279esm427610745ad.28.2026.01.04.19.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 19:07:43 -0800 (PST)
Message-ID: <e28915a0-e263-46b7-8093-904dfefcc308@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 11:07:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add backlight support
 for eDP panel
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=695b2b01 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lKX3r_8-CxP3csmqYEUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAyNyBTYWx0ZWRfX1A09UvInO3Oo
 jIwZ0uNpJuMwHZZcibZzlHAKtxa5wojIB9p8Le1tsf6TWucjG4QDjhSMWyqYpWcmYFH0IeE3gwi
 b0ZCrDyjT2Jc5mJiFvuaoc3d8PmIjq6hC2qFthbIKD3/7zChLARf2pOWKxPFn6Ly/2L01Db6oX/
 ZX9MGHrLdvOk/nFeqWi34QsbiVK6aTlIiKHiGRnX5zpFjJXgUagfPFREfczm8bZSk4O1tvfdGt6
 Poig4FAxxcjnt6HOHYcZOQaJMSVIeRlgv49CV9SzRihnQ2ffg4cyflF6qWgvz+TIqK+RrtTHlxr
 LVPeQ8OLb9HTDZBOmZrMND3lG3QL+I8DrQ+u72130AhrraIiFGmh7kZLKoHhrpvSFmKFpkUNkfP
 svolRFHLWjSymCkSDSnRaOWOOLklSFXn81DBaCIobRFIIC4v2Q4eIZRuHnh/TnxfPF6T3a3xVkM
 b3wbMJ6t0dxm4dj956A==
X-Proofpoint-GUID: RIWet7TdnlZ1kB66_CLW5Vs2KbgH1_24
X-Proofpoint-ORIG-GUID: RIWet7TdnlZ1kB66_CLW5Vs2KbgH1_24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050027



On 11/12/2025 12:21 PM, Yongxing Mou wrote:
> The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Describe the backlight device and connect it to the eDP panel to allow
> for brightness control.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v3:
> - Optimize the description of the commit message. [Konrad]
> - Drop empty line. [Abel]
> - Link to v2: https://lore.kernel.org/r/20251106-hamoa_dvt_backlight-v2-1-9f844c8f8110@oss.qualcomm.com
> 
> Changes in v2:
> - Add hamoa-iot-evk to the commit subject. [Konrad]
> - Correct the property order in the vreg_edp_bl node. [Konrad]
> - Link to v1: https://lore.kernel.org/r/20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 54 ++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b..499db4d67583 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -17,6 +17,16 @@ aliases {
>   		serial1 = &uart14;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&vreg_edp_bl>;
> +
> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names = "default";
> +	};
> +
>   	wcd938x: audio-codec {
>   		compatible = "qcom,wcd9385-codec";
>   
> @@ -183,6 +193,22 @@ vreg_edp_3p3: regulator-edp-3p3 {
>   		regulator-boot-on;
>   	};
>   
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VBL9";
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_bl_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
>   	vreg_nvme: regulator-nvme {
>   		compatible = "regulator-fixed";
>   
> @@ -819,6 +845,8 @@ &mdss_dp3 {
>   	aux-bus {
>   		panel {
>   			compatible = "edp-panel";
> +
> +			backlight = <&backlight>;
>   			power-supply = <&vreg_edp_3p3>;
>   
>   			port {
> @@ -879,6 +907,21 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
>   	};
>   };
>   
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <1>;
> +		input-disable;
> +		output-enable;
> +	};
> +
> +	edp_bl_reg_en: edp-bl-reg-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +	};
> +};
> +
>   &pmc8380_5_gpios {
>   	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>   		pins = "gpio8";
> @@ -890,6 +933,17 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>   	};
>   };
>   
> +&pmk8550_gpios {
> +	edp_bl_pwm: edp-bl-pwm-state {
> +		pins = "gpio5";
> +		function = "func3";
> +	};
> +};
> +
> +&pmk8550_pwm {
> +	status = "okay";
> +};
> +
>   &smb2360_0 {
>   	status = "okay";
>   };
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-hamoa_dvt_backlight-373528b7ce7e
> 
> Best regards,
Just a friendly reminder, can we pick this change to tree?

