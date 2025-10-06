Return-Path: <linux-arm-msm+bounces-76045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A24BBDB2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6137C1896D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE2223D294;
	Mon,  6 Oct 2025 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlUP2JDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7A23C8C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746809; cv=none; b=Hji7dFUaP7AAX8fhkrzbNMXyBBQUNeZeGsFiJQ5RB/T1IYHzWeqyEHOq1wc7Gxmk6j22sk0YkmgkVIHSAKL9W+JZ5UBksQWF+vPDkoxCubwaxOwJL6lMJPHfMtSErsDeuCp+xz8pxjMeMidZ2KuVtYMRIpVemYF4cgBp1MyWoMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746809; c=relaxed/simple;
	bh=f556lLdkAyKF7wwdvfKSu+XRrkkwo09BYNkc84VMzNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxLHBmaHGkypCKOFSmoIbpL0VJJFAEQ/vc7voKsc0akka25FbIy0zFtZuB3nMoJX3Wec7SKH/qsrK+v2MQxHlImy556IK7uQqyzKkMtJs3OW5QH1ar2s2r2Mq4zBdb4dilmMgPiPYkbmNQ9scqv3C+jKDTt45Md4N7QZV0wqkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlUP2JDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960wYqk020690
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qqt7OOjw4rKho+scsBn5/gmnAT0vskjfOzHz2jL1iU=; b=ZlUP2JDxtHPa6RQb
	EsKH5wYPGJass40FFj/ickmFWXZd9qWe9X1lKKYDXc1T7XaPVsRZ5Ra5GpleP/Bh
	y/S3QYzaJBOd09ApIdUj7FnoV4C5nXWDq5uZ7pEE/si0PTfv48oiYI443Jca4y5b
	xjecL3/g0UNHmdiLZ4K17m8Dc+S+QpYL/TjXSCZxvGTahew7hmaF9/veRN/SB+6X
	CsI3l0P93Qw+KfHcS71Io9S5gaXaGvmyIEhW6Z4OSyBycNN12iRjw2OEKY0jifwv
	wiVdASOk2Z66M+qv62YKgR7rAK+3R3WcmUl4wJW+qho5NjzVs5DBPQGIf79g3LTP
	3J5gZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6uh7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:33:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-87d8621e4b5so10578185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759746805; x=1760351605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qqt7OOjw4rKho+scsBn5/gmnAT0vskjfOzHz2jL1iU=;
        b=SvGwQRH3ygILyWV2phaEfDGIcEIkbztC3V2m4r+lmGv5r/+bRMiz3A6B4hzwhOqliB
         R88NNk/TTwENxYiY6/CuePyUKbceCLdgrChFZrJ3AtWv4+lEE9JGQmE6QGOGNlQYg4Y6
         qQ5iT9TPqj/S63Cyotw8no7q3CPoFZctvU0NGaHL55QIFFJOixVRChV0RG9zNK9Wu4Ge
         GXfRO0oJfTbXATdR7U1lgSNv03GITd1lPnzfB3ZdS54MjhzdHxsfHJaAskrzlhEtH+Qo
         Zrjps2x4T429ADnJ7mo1kgzy2fi3HRmXXS8x9L3Rj7wSfSPXN//Tp626YgMwONuQJCi3
         sH8w==
X-Forwarded-Encrypted: i=1; AJvYcCUG6AIJeDW1fZmtjK3118Kd1FFC58mK2W5NJBkCFMbtzZFTRXehuIujuF3UcgyGJjWnhyb0mu3vtMJOALty@vger.kernel.org
X-Gm-Message-State: AOJu0YwbyhVPYzWqK/iblpvpvsMUy2C5Q6kedvKq4BimNwrKsMKN/QWm
	uSpjRUDO/8LQrkRmgnjLsUI7rB74QsLqn4nRid/I4mO0Y1bMwlcwMrruUUDBDzQHgBrmfh+VJvv
	kCDQY8zUpchtW1qwGPzFZpchmyn+Do4pTlfiL++hyS7yL954pK8y1PBGIhzk7ZKQWNHCG5LA/HY
	V6
X-Gm-Gg: ASbGncvHr4S0P7RsPaRW1vcmswycb8CsV6cZ8EbLIGmg1WYq1keqdssVEpDHAXxuhxH
	gfispmmxvmPLwUlV4DFSEX6BhnfjRjMoCnXDNqItjKy9ZL7CFZy1XuPRnGy1+VtbrXbcVo8v06u
	g0vcvQ84gpB1lk8KY1LHZz1ZnWETYWKZ9PoA57Pb60sVY4IIz6cY4CK5ZjssWCcTk0Edchgxy7H
	8YulncI0uoIfOjQpeSPzXbWk/0CJed1HJClHnBJ91DVWgm44fo5ser2g1WREZxjxH3wU5i9w42Q
	FdeZsRCbSXY6DliOMxy8QRSPjiVaPhW6FQTOs7ViyI6YxMBFCjhvELH/QRKmTzVv8WnPtVPxIjl
	XAGsw8BniKvf2X26mWR4kZw690+4=
X-Received: by 2002:a05:620a:372c:b0:815:4b9c:61f5 with SMTP id af79cd13be357-87a35ce69f4mr992349785a.2.1759746804994;
        Mon, 06 Oct 2025 03:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFOBP4vU8wp1d57g+NkfFSMc2KRXrVc+sUbJ7jeMTuuLTPrwR4YP6fxLvL1EGCkdRQhUo9SQ==
X-Received: by 2002:a05:620a:372c:b0:815:4b9c:61f5 with SMTP id af79cd13be357-87a35ce69f4mr992347685a.2.1759746804467;
        Mon, 06 Oct 2025 03:33:24 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83770sm1118799366b.25.2025.10.06.03.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:33:23 -0700 (PDT)
Message-ID: <27b309ab-e0b2-4f00-84d6-48fc1b027e40@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org, christopher.obbard@linaro.org,
        loic.minier@oss.qualcomm.com, andersson@kernel.org,
        Roger Shimizu <rosh@debian.org>
References: <20250930043258.249641-1-hongyang.zhao@thundersoft.com>
 <20250930043258.249641-2-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930043258.249641-2-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e39af6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8
 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SrCAy5ncqeEqr8t2DQQA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HqCgK9i38T7hjlWB5IrwsG0GmHCBgjmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX887Yx8DZgDGg
 9/BV/RNDG7iR/iT2qiRW+L+LmDgovrEfVfzv5wQ/LXPHCeS5EO++xM3lGwlGXbr7/07bV1Ry8nS
 tAgOWjl1R977fYZEBjcNb2awMt2YZAfc5pVmdswsQv1oX6hW0TxcCPq/EKv9yPHje8eJcE+fNWe
 FWdNLxHu0f5o+/C9bSzbaq78T6XSb9L/XhQORKCxRUKrbZ6JcJwchp6mlmiptxeTSMg6Kwd9HoF
 rHUU3r+lCttq4lUu7Bsi88+7AFhBvPLBJPOpLZh9olbdwsInsmPdzuPunmPezt92iAhYCosB7+4
 vKDXSkM2j2szXA/fmXFxBZyrSGi+KwAx3WzSHwb2pYBDVrCfx4394ESRPJV0wrm6e0CUO+ETB/J
 r7BkHGcuBzgLo2VjrGPv9UWKt2axkw==
X-Proofpoint-ORIG-GUID: HqCgK9i38T7hjlWB5IrwsG0GmHCBgjmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 9/30/25 6:32 AM, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Wi-Fi (AP6256)
> - Bluetooth (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - USB Type-C
> - USB Type-A 2.0 port
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - M.2 M-Key 2280 PCIe 3.0
> - RTC
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>

Is the "V1" part of Loic's name?> ---

[...]

> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		pwms = <&pm8350c_pwm 3 1000000>;
> +		pinctrl-0 = <&fan_pwm_out_default>;
> +		pinctrl-names = "default";

You most definitely want some cooling-levels in here, so that the
fan can be then referred to as a cooling device from some thermal-zone

[...]

> +	thermal-zones {
> +		sdm-skin-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 3>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		quiet-thermal {

'q' < 's', but perhaps sorting by the thermal provider index (i.e.
pmk8350_adc_tm 0/1/3) could make this more legible

[...]

> +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_lt9611_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 83 0>;

"0" is supposed to be "GPIO_ACTIVE_HIGH" here, similarly elsewhere

[...]

> +&pcie0_phy {
> +	status = "okay";

Please put 'status' uniformly as the last property, with a \n preceeding it

[...]

> +&pm8350c_pwm {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	led@1 {
> +		reg = <1>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <3>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		panic-indicator;
> +		label = "red";
> +	};
> +
> +	led@2 {
> +		reg = <2>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <2>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		label = "green";
> +	};
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <1>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		label = "blue";
> +	};

Are these three separate LEDs (i.e. are none of them combined)?

[...]

> +&thermal_zones {
> +	cpu0-thermal {
> +		trips {
> +			cpu_tepid: cpu-tepid {
> +				temperature = <65000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};

these are not useful unless you wire up the fan here

> +
> +			cpu_warm: cpu-warm {
> +				temperature = <80000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +
> +			cpu_hot: cpu-hot {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +		};
> +	};
> +
> +	gpuss0-thermal {
> +		trips {
> +			gpuss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	gpuss1-thermal {
> +		trips {
> +			gpuss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	nspss0-thermal {
> +		trips {
> +			nspss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	nspss1-thermal {
> +		trips {
> +			nspss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};

neither are any of these ^

[...]

> +&tlmm {
> +	bt_device_wake: bt-device-wake-state {
> +		pins = "gpio39";

It'd be nice if entries here were sorted by the GPIO index, as per

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

[...]

> +/*
> + * Update the lpassaudio node to support the new compatible as the
> + * lpassaudio needs to support the reset functionality on the
> + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality would be
> + * provided from the LPASS firmware.
> + */

I'm not sure this comment is useful, given this is a "common" situation,
but this override should most definitely not hang out at the tail end of
the file

Konrad

> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};

