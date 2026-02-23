Return-Path: <linux-arm-msm+bounces-93622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IuGMKQanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:15:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39751173A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A7E830B9C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5341834D4FA;
	Mon, 23 Feb 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULa9g2EQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRWr4vET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8F1428F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837659; cv=none; b=WoC2+7sbNuX8MbqbhesESlwhE4hiD1d0O1cJF/fJxnKqtx6FNKr8qjZm66htZMxNks1vRMoJJal1EDM3EIX84qCXQ4LSjhrNWU4qABd3mZ5zajvnz0KcltuFGROLTvwmlaCe3SfwJO8Y16dU4uXrfzGUE2H0FLOAraDZDTPXfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837659; c=relaxed/simple;
	bh=zA1BeXhQdtW1QR+mRUEiee3Jg5g6Fdj482GgldGzhbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2fRuZ+V+QBkA29swtrDfyo2KqdcAkKgL4BFzxQFsmMnSQqcbogaWj+Mrxit0bfSbkesDIUsWtC6THAVEP18k2OXT3zVN5vPl4P4LZP4aDSwMrwc5o+6Qf9fL2PPSF2lDtNcOZeUU4dg11njxkF0xLxh5m7wrOmUMjGtFfvsnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULa9g2EQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRWr4vET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MINtxU3076321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=; b=ULa9g2EQeFWEYBhS
	LvgvZ5Q1W9W4H2e0C+i0HMkCpw1/bUv4rImhqALlqrkYjDQEfWvV6DsDlqTDsq/O
	rIPUpHVaYvF53iT3tX84r2K1f4DcuSB/44EBQQenQ5NzRp/4cDPgmE1G1+o2zg9Q
	9gqI6IQCxeg5JuD2T5GyHGqYizRfJMlSFpfGCdzBVSQ8Vy3c/Rzhw8LsbpQK6zFK
	oRAyoZUHIr8KK1wSoq8QXMU+1btDgfW6I+ektIyoL2j+b55tc4lyZJvua8uuBiyk
	8HX1s/RyY8BFN1AOZJIxYKlGI1NVBrtlKeIOSCWFgqXoSilkVYYIZKgV62Kauxyz
	nufbxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m2b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:07:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so456560685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837656; x=1772442456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=;
        b=ZRWr4vETU5Lkle3ZWgb4EVQxPysSohnTmWnmD/f2gfb62c3FBitypUoUGb95QkFjtG
         VOHA0cADpz4zrK/0EjcezccyjACnhI4jeQb90bZzWuIpJe5qGaVxGFmMakJPxr/EdaaT
         6Q5Zhcpza6IRPgvezLSnMixqA1Q8tWGgtOjeLzO0DlzKRR0jkZC/XJfSvmWJ2asQMK1x
         pnbYaSbUbTUcQwa4v7eTAoetsVJgcXbXRybxr97Ab0bH2nLh/PnSRjpPYl7t3GDrc5Ek
         0/gjC9tB9w4vAGHmyIRdOLcvoB0xPvQHXFEFldJj05SarsOVoflG1KNdlQ3kHwIR+3Nv
         ovzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837656; x=1772442456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=;
        b=h5rhKe29E63Av05YpV9rj3i282qEOshvlv0uC7lWvvXPgTbPOOw99+Qjg5xz6NDJKD
         7O4D2kPZpwc0uyTauWKpKQxqIoEtYGTRSlb0upKzUDPvS4opCNE5pGMx0MZ5hwC2l/qu
         +31+JGYIn+1zQGAeNGRpxfy6IkJ1deS8j7ej0Fax2IRpc3823wOZGbLt1ZuRiOUE3UOz
         nL4UianCdgaBmdjv5B83PMwHxejj19IflrjpvebO28MTNI6zX9jLZks3xBFF3EWIx631
         4dtNt3Ddu4Q5Z0Fzj6PtOYyB3zBcpC7MAwj6eKkRWCBBv7PUcVDvnOqtLGk4bmfAnaDH
         bhlA==
X-Forwarded-Encrypted: i=1; AJvYcCUd+FfPCc1xZjsZZC9QBMyQVKPfV4AwPLyiLyKP/9d0bDLQZM2/8aoLRQ86QoBzfKb+D1NeWm/6+EsvaJmP@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiwZuPIoLVbDyy2PLE2r6giibvBZS2CN8cqEm90JPM7ZpwyCc
	391ooODTDeo/EWx6SLPLyoqSkrdV+IcsJQtawWnzdzDGc2lZYh18V73Gh7u/mLccVinjDootXWB
	qwV7kNHkbbg1phfaVERBmr687fwh2jB7XohiWWQX4N1THIWE0EEHZFqJB9T0NA/mzeuChCj/B2A
	sA
X-Gm-Gg: AZuq6aIvhlJgzgjkAHgXNDw43Q+b8FesjvPpX7R5RosUMNob2cMHDyQYQa0EYUctuZH
	cBr1HmPwJ8W2fVtkdl2oGs22kucGzog8cesmYJ9i7YFc8hO4cFWCdl3QbheNAIX3dRawi2+2nG5
	Itvf00tyoXcdkLew3/l7ZOKpMi/sOSXhGqp0epn/L1boF9DhuKSSdULepFiqVQZP9/TQjDuU0hj
	5z6XDiHwGQFEfJun3SY8achyOS0VlWoAwS1f4l61kbDWwOSo9emI9h75pOBOJVGiNYwOXBDIsJP
	YNY78jpDzCEIyckfKMGtmjpHTEzupEi2TSE+gSpPu7d96z34cCKzXFTSpQQxifb6SC3L6wO5HiA
	rJsOIQvb3DUyu4NHMFgrA8WrHybLO8fGXVLDNQF/GIOAwYNOmQucLvjVS+2jo4xWI4LAHsqxmnF
	kXefU=
X-Received: by 2002:a05:620a:170c:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb8ca924f3mr753422085a.7.1771837656298;
        Mon, 23 Feb 2026 01:07:36 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb8ca924f3mr753419385a.7.1771837655742;
        Mon, 23 Feb 2026 01:07:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f18f7asm303345766b.66.2026.02.23.01.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:07:35 -0800 (PST)
Message-ID: <5d3efb0d-96a7-4ce7-9622-88152715656f@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:07:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D4KNg4kx77l-0ferihX85xmkCKsYiS4w
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c18d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OB9DN5_9geIfRXgfTJoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: D4KNg4kx77l-0ferihX85xmkCKsYiS4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX3zwpkiNBf2ci
 pk9LZNMznuLZF3XU77Z+zCS5WspE5lCcZ3pQCYjv12xb2J2kMih0CRZ+ncdjBDcKqYCvMi0he0M
 h7TgYSVCdMrQIu6Glqn104YW5oBrVy9kCMwEcZbs2NaDFBlNBki25QdKHPseQLuppqDvuSvc9sz
 ZL2LuwGZcVHA4SX9aqB3kJNH4ytwWBJ0/+pwBSn8bh/omvl9vC+Ia5i7JZ97tlwkTPghOpkdaIZ
 +vfD1PZsACjifU0pDYAqtTrQYgU3u5cA410RR3D3eXDVzSggPYeRcECDoG/zg+7ejJ5KFd2LCps
 tfCYMnf7RBJoPO8Ze1Hwg9cSP2gIZEt1Bj0TM9IfghtYi7CIA49TpF0zVgze0r7ZEMtN3tf4Zxf
 rsCcKI/6ccO/3/Yxnc+AxNqWveER7ORFbjLUqourp+GJe+Kw2pqhcGHpmJg6B1xECWPHMADC3eP
 TEy+L2G2gNAc+DXU74w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,posteo.de:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93622-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39751173A94
X-Rspamd-Action: no action

On 2/21/26 9:55 PM, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8916_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&button_backlight_default>;
> +		pinctrl-1 = <&button_backlight_off>;
> +		pinctrl-names = "default", "off";

"off" seems unused, this should be "suspend", however the difference
between the two states is already handled by the enable-gpio in the
driver, so you can omit the second state

[...]

> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&keys_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Buttons";

Sorry for not being clear, I was okay with the gpio- prefix in the node
name, but I intended to ask to remove it from the label.. 

> +
> +		button-volume-up {
> +			label = "Volume up";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	hall-sensor {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};

[...]

> +&pm8916_pwm {
> +	pinctrl-0 = <&pwm_out>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&pm8916_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

Please add a \n before status in nodes where there's more than just
that property

[...]

> +&tlmm {
> +	button_backlight_default: button-backlight-default-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	button_backlight_off: button-backlight-off-state {
> +	     pins = "gpio119";
> +	     function = "gpio";
> +	     drive-strength = <2>;
> +	     bias-disable;
> +	     output-low;
> +	};

This can now be removed (it had incorrect indent anyway)

Konrad

