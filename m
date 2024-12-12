Return-Path: <linux-arm-msm+bounces-41804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C799EF53E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA2628BDC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155D9222D79;
	Thu, 12 Dec 2024 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/riB0kA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C91222D68
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023641; cv=none; b=LsyWfbsD6JXhfSXDwQGVZ7DaL2PNCIQGRbaGtoVcZf7rMRPyqIStZLn++WqWqA/xDeijmv7ItvaE4rFU2FmTs7nGYrm8yvqc6yy7jOz9tPl/0f1xVHOUZenhyIcVPT8JDnZBjqIT7UF2iz927R9+aRceP8oPAZ0UbtDgdunMhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023641; c=relaxed/simple;
	bh=W0LUSqX308BwBxT8TRJsnUAJTHx07QDNGNUrQe/gmhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rrms0r3MGCtTXt2kyYysaRcOMSOv94xfqMITCwE3ukNIwfOOxNqvHu/4XdTEWzhCdCVUgKp026WJd3mg2p6R1IbY8r7ESnw3YCNbPhNgIst3ybhgtivmgLGeWqUA0sI3KOyl7OF668MGIG8JpYCTHYmN+t9tbzXLYnf7pe2DeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/riB0kA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8GgXG029980
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cuh45z2TdlFDNIhWgxGy/jJNcB9fIJPtD1vTetbFoNY=; b=W/riB0kArYFzhAaq
	N3yeiXaHG5X519cA7pgL5jusCLtC58NRao88qOphP6DEYfRWulzTCTFWnCvQ+Cx8
	Xtm0SZdj/o9bWqivjZzf0QaL7SVw+/u3U9AHo5n36gGUvDOFt27q6SGg8vXUAul7
	IB9fAB/O4FGB+4fK8Q1ZAlZz/CTDCN7w0tUwiaR95cNOhBki9qsmiQ6zXFgNIUaA
	CD2qOQkgLaRKnZrpkeDE6VLDpHtELnPs6oc/yduRK2Ul5Tz+iWKZmIHSz9uEe/V3
	qW/tcfhrzgr+SDiAJ2SCL9yEfiAgtH46FEKCSW6g9L+KIJ2fTDccuxGlCHDfXMjp
	UTxdgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4c44c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:13:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e5c3a933so5804485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023636; x=1734628436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cuh45z2TdlFDNIhWgxGy/jJNcB9fIJPtD1vTetbFoNY=;
        b=As1sIelUFtWyWTi1NRKJKqF+vKCiIQ2AMZsZEV5E8b/Is1skEUdRIP9lVBsKzZovZ0
         FX/Abipt8fXsIfUP+jeC07IHjBjrGv3ursDy02bkofUd75DD4KhGqDIr18dH05BIUCs2
         3MxwVYwf4qJP7PCoAe5DnsuhQRPGBD2jvr8lCJ/3NL0csuWjN5uB+2pYxtzag6fiu7SX
         HfKClSdrC+yJ+PPnRrh/wW2wUo3m/gNIYjQN7cPblz7Ggim15hssBXoEfk5+S431QdAR
         aUqxbLxQ1HQLpzIfu+YUvHk/yqm8XF/Jv/v3A5kgz7VlOAs/fyF6ZvTd5Q2gIaFD1LKp
         +zlw==
X-Forwarded-Encrypted: i=1; AJvYcCVGBtUWz1tIlLhbjiko8KQvjSEEpvtIOrp1AvohTm49Zzo+EMLX1A3GsxI3WdgdugoRJoYEGePjp3IqvUon@vger.kernel.org
X-Gm-Message-State: AOJu0YyGczyPEx34Vj9lUBGikglD+5GBgWEivaO7XR/I7Mx07bZsfQx7
	9BwRXI9S3DIBkK0ban6BKj1oEi9hyGWiUIXDWm7Dyyb7mhjEMarjKkQlOFlWWwgFWmELEGE0Vvm
	Bd75ZdoVL5U2VgplAF8mnq0RUtsTeCcL91eSXA7ntYsU+CxEhDYNk8rd39CHczztG
X-Gm-Gg: ASbGncvKamYzsn1zRDpT1pNMqQILFK49sIrnTJ9utYdKKQUH6w3N82bmAgVoWkfv2tv
	Jqq+/CM9rZnv0lF4McSLbAdUiztTV09SjaL8tE/DV/QLCRJ2SieZcfY1RgMG9DVf/DIEpGOpU1m
	sp8NcvU3glCvjzbnZijAgjEyucuGVbYVsoErHd+gmWf4JB17hgrwQY/FJQxU76LmNSwLaO+kZeu
	afuFzSSSaBeEwc6mfAh9pIj0BXQ/sbS2l8oLxHB87Am93MvUB6vvSY1EekIqy00eNFHrKzk3P55
	VdArDscZv3P/eE/3UxwBwU/m4HnExcOvb6chqA==
X-Received: by 2002:a05:620a:46a4:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6f8905259mr68063585a.5.1734023636296;
        Thu, 12 Dec 2024 09:13:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4wsjDzWR7bxAHL0XxqOmES4gHtGRgiZ+/uv4KzkmRM74SCycMZbDe1RMwwIP1e3MzyS0aog==
X-Received: by 2002:a05:620a:46a4:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6f8905259mr68056585a.5.1734023634090;
        Thu, 12 Dec 2024 09:13:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm537489366b.45.2024.12.12.09.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:13:53 -0800 (PST)
Message-ID: <d5813d64-0cb2-4a87-9d98-cebbfd45a8c0@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
To: Pengyu Luo <mitltlatltl@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gty0622@gmail.com, chenxuecong2009@outlook.com
References: <20241211153754.356476-1-mitltlatltl@gmail.com>
 <20241211153754.356476-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211153754.356476-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O2X3AJ5WsKvjLZ4287p2UFgd-CjMLcXT
X-Proofpoint-GUID: O2X3AJ5WsKvjLZ4287p2UFgd-CjMLcXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120123

On 11.12.2024 4:37 PM, Pengyu Luo wrote:
> Add an initial devicetree for the Huawei Matebook E Go, which is based on
> sc8280xp.
> 
> There are 3 variants, Huawei released first 2 at the same time.
> Huawei Matebook E Go LTE(sc8180x), codename should be gaokun2.
> Huawei Matebook E Go(sc8280xp@3.0GHz), codename is gaokun3.
> Huawei Matebook E Go 2023(sc8280xp@2.69GHz).
> 
> We add support for the latter two variants.
> 
> This work started by Tianyu Gao and Xuecong Chen, they made the
> devicetree based on existing work(i.e. the Lenovo X13s and the
> Qualcomm CRD), it can boot with framebuffer.
> 
> Original work: https://github.com/matalama80td3l/matebook-e-go-boot-works/blob/main/dts/sc8280xp-huawei-matebook-e-go.dts
> 
> Later, I got my device, I continue their work.
> 
> Supported features:
> - adsp
> - bluetooth (connect issue)
> - charge (with a lower power)
> - framebuffer
> - gpu
> - keyboard (via internal USB)
> - pcie devices (wifi and nvme, no modem)
> - speakers and microphones
> - tablet mode switch
> - touchscreen
> - usb
> - volume key and power key
> 
> Some key features not supported yet:
> - battery and charger information report (EC driver required)
> - built-in display (cannot enable backlight yet)
> - charging thresholds control (EC driver required)
> - camera
> - LID switch detection (EC driver required)
> - USB Type-C altmode (EC driver required)
> - USB Type-C PD (EC driver required)

Does qcom_battmgr / pmic_glink not work?
> 
> I have finished the EC driver, once this series are upstreamed,
> I will submit a series of patches to enable EC support.
> 
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Xuecong Chen <chenxuecong2009@outlook.com>

Your commit message suggests Co-developed-by: tags would also be
fitting here

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@c6200000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xC6200000 0x0 0x02400000>;
> +			width = <1600>;
> +			height = <2560>;
> +			stride = <(1600 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};

This should be redundant, as you should have efifb

[...]

> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9380-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

Please follow this order throughout the file:

property-n
property-names

[...]

> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-buck-supply = <&vreg_s10b>;
> +		vdd-rxtx-supply = <&vreg_s10b>;
> +		vdd-io-supply = <&vreg_s10b>;
> +		vdd-mic-bias-supply = <&vreg_bob>;
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mode_pin_active>, <&vol_up_n>;
> +
> +		switch-mode {
> +			gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;

This could use a label too - "Tablet Mode Switch", perhaps?

> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_TABLET_MODE>;
> +			debounce-interval = <10>;
> +			wakeup-source;
> +		};
> +
> +		key-vol-up {

Please place this node above the switch-mode one to preserve alphabetical
ordering (see [1])
> +			label = "Volume Up";
> +			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +

Stray newline

[...]

> +
> +		/* s2c, s3c */

Please remove such comments

[...]

> +
> +		/* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
> +		 * there is no calibrate data for huawei,
> +		 * but they have the same subsystem-device id
> +		 */
> +		qcom,ath11k-calibration-variant = "LE_X13S";

Oh, this can be taken care of! See [2], [3].

[...]
> +
> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "SC8280XP-HUAWEI-MATEBOOKEGO";
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",

Please remove the line break and

> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"IN1_HPHL", "HPHL_OUT",
> +		"IN2_HPHR", "HPHR_OUT",
> +		"AMIC2", "MIC BIAS2",
> +		"VA DMIC0", "MIC BIAS1",
> +		"VA DMIC1", "MIC BIAS1",
> +		"VA DMIC2", "MIC BIAS3",
> +		"VA DMIC0", "VA MIC BIAS1",
> +		"VA DMIC1", "VA MIC BIAS1",
> +		"VA DMIC2", "VA MIC BIAS3",
> +		"TX SWR_ADC1", "ADC2_OUTPUT";
> +
> +	wcd-playback-dai-link {
> +		link-name = "WCD Playback";
> +		cpu {

Please insert a newline between the last property and subnodes.

Otherwise looks fairly good!

Konrad

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
[2] https://lore.kernel.org/ath11k/ZwR1hu-B0bGe4zG7@localhost.localdomain/
[3] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware

