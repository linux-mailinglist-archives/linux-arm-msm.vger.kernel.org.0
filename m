Return-Path: <linux-arm-msm+bounces-92927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GT1BAH9kmkK0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:18:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5726142C8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C705B301053E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4262F8BD3;
	Mon, 16 Feb 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnnyZSVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZTGUIHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A9253932
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240699; cv=none; b=WQ2O48uxNU6el3QxzGfyOnj4OgoZ4s8cOhZ6+h4KdTyWCND4Cgy7Oa4X7tVXKehvhiB31csvsAmTGA/RjOK8h4oK/B9wuzrjGlOlbCpm0r/7hsFU5LwE9QiyCoJjYZ9zhk1Hy5x+oeP7yo8QtZeulnfsS0Nec8PrvRdZXE4fBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240699; c=relaxed/simple;
	bh=ad85B4rdRDGUPF7BGuuP0i7dKAVWLVlLV2lYoMUmcy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcTvwMSUcWfde2BECnrHlXTET/E+dCId/uCWe8/0iXLnc8cx+YVryrCgtOxcQvTbqLF/ZDWjaSPKsIukvu7+ImhacfsT2exT8nppsVUWx41lucW3UVF6sa+Yj5yywHIbta+S8OeJUI7XrewEjE53LZI3CkH8SyXm7gjjU6oFE/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnnyZSVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZTGUIHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMhain2895319
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=; b=HnnyZSVTAJl61FAY
	mg+rL3wOxhzT/vPsNM+k7FZkBq8blMNQShNg9UW+emBiCUQF9wQdzlzjQiQP0nHW
	ZM+v4for7oy6209ibJUVx1GdRhA5k57ETUg5q4rN1GZ+Xhyw0K8bcfQaDzDZuKef
	StG8xY1YpWSpEzDb7ra1jT2LTT+GRk/l1DKYsH58F1XURTn5Q9mcfWUpFFRVKjIP
	6d1xG55xw4QnBfhcIs896o9EeYGAj0CI457Tzm+9NRSQHS4Ah1hAdYm3VqEHa9aI
	dEl707XOi7zQNU++RVGcdHXUy4MfsKlWWh9vltue57nsdSPaJ4JQtLA5Abd/XEYC
	mOGL5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcm788-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:18:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so142654485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240696; x=1771845496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=;
        b=GZTGUIHjQnvWG5sDItFYBIQcYa1hZ2MZlf61HnLDeQebekm/MO50+dEM6W36WsN5MQ
         r34FM2HglreQ2biyaZrxKwA4k5fpP/ODf7+wfpWTbaXFou7zdl6i91FTGzbYcAICFMl4
         MdEJdt/OZYW1M6YqjAs2cBpCOG1ZS3S2lzRfgBexHakNLKJeu9uoQU0mf29F6x8ae9+V
         aCZhKrsStWYc/20IXUo5dzuWEX+KU/I7FbpMSTYS5wjlDIs4q8k3jOdFM7cKvIyIjqkF
         wU2cjOLCQluDF64D++1D+REMq3pva3zG0a0kbg5nIkyGxNxIjYFxGkfzSfqtL78OJGxr
         UpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240696; x=1771845496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=;
        b=FXl91vRWaIW6LN63+mXWJqb4UuW8dBPPwsZaCbhkvshLWxX7u8r23ysXYWXojs/oCj
         LFgIygAXiYb+MAfavR3PHH0znp/Xzt9meHX4JBHC8azP+I8lK+tPndANjb6CUd77EpCC
         K+KGJ4Z2iHHSUhx2Q6erTo0eTBfefrN+kdJ5DEoZiHV6Nao/8j6PxK8X1+5pak4XFgY7
         iR/3aLUEJ3mVyk6JMp599cXdxM8alFDwJBNGvhyGI4we+RgugHGuFg/cjHRZ1ZY9Km6L
         LExbXy2xwvtv4B9s6SO5xZkzUBMiZxG8Qi2HBRYvldF1ebaZMgOV3MTb6YUyj98sqefD
         vK8g==
X-Forwarded-Encrypted: i=1; AJvYcCVIdoY++J834FrOqjK0DIBGiCV3Tpr6Q8XRvt3qGPONnq+hAt/krjc1wbCe3Q2GPHmRagfWiS2fNyodKYyK@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXJxg84zDF+lJF9LvfBlnwJexv2ATOn14heInxhs+pWEa7ax5
	ZmVDZm/iTRnRiriOjTCUFphC3JqcCyLZt/Ci63xO5VIllJkaGAayJEUdvs+2wHv87PGSPlpi/mF
	tgZuGZtH9iPn+1Nxt7q6RHomSQIDrRfMJmcQj6Ok9i9w7F90S4l9MX0hK3TnCenaH/mFN
X-Gm-Gg: AZuq6aLwTnobCYIkAj7+MQDRX09YkfZm0iYgS2Pvif1dnn0xRQikfoUNzcr4VtcBss6
	qwB6iYdR9RIX6N4U/8yAfOcp9llmwFQU/7VpdoZ9cnTcgjxhUFcz2tRK1+PyxjjlqGRvufxUKsZ
	7lDuPL2hCVa0rgwj+eSZlAljo2CPajlZxFiQP3z2N93HZWRbV13YYnajNFXftjsbAihHcaZgjpK
	xY2BQGrD7cJ4ze7axPl7oi1/9os6rxhUs4lFk44HaaVnbhorFApVGJ9j9mh8umGIVI4BPhoBMDh
	qQWa4QBTG74U4Xat/YNhpwoN0FA/qVqlfCq6Qw1/sCzezfrLvk8MFF0GByTsgml3OHPwtqLf1g6
	K+GjU1EbUoDTBdgeAE2yxnn6xjlJ/U5ekhbd1TsfWiElvj5e02mFBHnZk5NnSCJiYLCI1gHe1NY
	C7j+8=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1016713285a.4.1771240695606;
        Mon, 16 Feb 2026 03:18:15 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1016709285a.4.1771240695011;
        Mon, 16 Feb 2026 03:18:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691c48sm248837566b.59.2026.02.16.03.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:18:14 -0800 (PST)
Message-ID: <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:18:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial
 devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfXx8Tw/QwuU4uV
 neZVcJpQiJZKMHwPVHGn5tWwy6dvqsnvwon4n/YlLI7gPs1093GPaNLRI5XOARCvHz9FOPYu3yv
 ArKb5j7KDDgbu2/zIvj57IfjCZCcZRtL+ANg3jk/lIalnCKNKpWHz0MDCckCyHPMMxjBfwn/Qdh
 bAAD3CLVN84zTNnWVFZ/ezF/0bkEM+2J2Nf9jIDl/4Y3PXt7+MoC0aEoC0S9txDdwfMB4EpGDN2
 LwDhEYA5crIUzLHUzsOEJDKX5llgkZ0jOEqoJ2JFMxcS9dB210KeHBElzPjsNy1Ie5+/8Q3Wn4C
 rCDUAwMwRTs3hCg8aF2jp9vMlRZb1dgbLnZxhRChFXb/o9EjJIeE1abrB7eK98oNZ2OdMnzt5zW
 5dCEbkT52Z0YTIS1fcPdw8t7HUySb27Vd7WVxi9SXma/vPjGRAi5Wd4oSLWfqGDhwjwywTSRvCJ
 J7QWY7xNsKCyz2EHnjg==
X-Proofpoint-ORIG-GUID: AokZZgoXmdKy4S-sha0UHCLZXJO0n7Sr
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992fcf8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=L2tLbZxQM9psbuxyGx8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AokZZgoXmdKy4S-sha0UHCLZXJO0n7Sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92927-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.48:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5726142C8E
X-Rspamd-Action: no action

On 2/15/26 9:02 PM, Paul Adam via B4 Relay wrote:
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

Hello, just a couple comments below

[...]

> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +	backlight: backlight {

Please add a \n above to separate these blocks

> +		compatible = "pwm-backlight";
> +		pwms = <&pm8916_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&button_backlight_default>;
> +		pinctrl-1 = <&button_backlight_off>;
> +		pinctrl-names = "default", "off";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Buttons";

I think the GPIO prefix is unnecesary here and below
> +
> +		button-volume-up {
> +			label = "Volume up";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_hall_sensor_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Hall Effect Sensor";

[...]

> +	proximity@48 {
> +		// downstream devicetree only specifies "stk,stk3x1x"
> +		compatible = "sensortek,stk3310";

Looks like the driver has a number of CHIP_IDs - you can be sure which chip
specifically this is by printing it out

[...]

> +// make sure gcc is probed with display disabled.
> +&gcc {
> +	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
> +};

Do things break if you remove this line?

> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mpss_mem {
> +	reg = <0x0 0x86800000 0x0 0x5600000>;
> +};
> +
> +&pm8916_l6 {
> +	regulator-always-on;

Is there a reason for this?

[...]

> +&sound {
> +	audio-routing =
> +		"AMIC1", "MIC BIAS Internal1",

Please unbreak this line after '='

Konrad

