Return-Path: <linux-arm-msm+bounces-84213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00584C9ED84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3753A611D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932A22F3C03;
	Wed,  3 Dec 2025 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ComG5OT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmeuOgE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F752F363A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761390; cv=none; b=IvvbB3TvoQ3kPfSiCSPvd2BCReaG/QEkkIJfwg+w+6WPP1UkHehvtVGpmvZfiOnBnYxjqNQFhNiKgnfDczs9DeeMdkQATEbN0tP9xmafpZQTfSuEzV7G2XmwPTNCND5r8mjv4pU9a1dPqmA4A5kTX1PXV90R5PbMv7IOuYmyTtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761390; c=relaxed/simple;
	bh=KkwX406F/rOwGuuPYiskAf4EggDt1QkLHDVgenMLb8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0PGhJ4rOZ0N3bfklXw+rjWn43Y5USRrz0kjBCA66WTTKgBb04UTcj38kwQlAzsU+586ZRzfgzU0o6h+ztf9JNhmyIrMdP1MWaN+u5pVab28Nq+B2C/YeEOrlq/i0phrCrsXt07JCkiKMIgfmLYU63l7NHqAxHRFK4hphu7ohcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ComG5OT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmeuOgE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3cNs1536224
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJNspEOBSml0fd6skB6bElbGxf2KEugOLE2ZfVxs+Yk=; b=ComG5OT8Ffe+IsiT
	ldyE1UNn5HKoTFrF99Q9gnCTpx4IZBmfdkt18a5RX5C7TfakTOLJ18qC6LB/cpR8
	dZ+pA6hUdESVKUhQvG4V/n20GVwub0PaDYS/XKka5GOUgwl+W2FCHMdsxAZvHPwa
	sakV4O00zwxpnTW9JXcuIsjohut6hwOrUj77RV+oW/ppd3L6Q1aDA0jzV64q4/sp
	wgSxbEiqLxkGO6z7l8UeVMRKHMzSViBG4x7mWeD/PfDU8SKu5LKQxGw66DrtSooA
	g4tDUPNtPAz/NHQ7pt5X8liBM2Tt38UMcePmjS8F9DWIMl+VXpl23LYlkhVuon8t
	je4J3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hr24u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:29:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b196719e0fso127333785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764761386; x=1765366186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJNspEOBSml0fd6skB6bElbGxf2KEugOLE2ZfVxs+Yk=;
        b=fmeuOgE/YTvGs4ndQs75j9236iwHNzZ2sGVljPXLlfjZj7MYgCYkBTbYKKbB40cLWc
         DDyXXlJKKvn0pdxz6TzT8gvzt6VDch9qfD7yZCXBNRCRzKgOmNtEWyPd5MYBCetuO2yE
         MZ7ME/oCK0W0yL2J9o2G1So5E28VRT0xLd/cMUuic/Xn8ifoMlSQa3AvJc82zlYgmAnk
         ZuR8sICMKWR3tVfCrn4Pcqw4eNveVt8JEPvjhh7MTBLRQu/GT3huzi2E2DYHrBogf7Ny
         /2uWWqbMVOvsvgQyc9sQ4zh44sMJHr0l83mvRVIOfauVPRz+eSJKWiqEk312blOYYl7x
         doaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764761386; x=1765366186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJNspEOBSml0fd6skB6bElbGxf2KEugOLE2ZfVxs+Yk=;
        b=kWW/bMbL1lUTbU+GKnkOsQnWyfJNX5XhDFkGVz52A9GZXAR0n4ZVVwuA80nnu3fi5V
         u5JySNYZBfCT5i0T6OSwJr60JwNgCtpX2D6EBa3YaLyXfRP0x2hNf8QHnjIORmWEEvuH
         lSURgZIaJ/XPbz3nixJ0VgKGLVXMysF5nVw1nFUX9RfT1JkV+fwECgffKeWXvePHbZ6V
         ccrfH/Tzn/q/33JviRcvRNrd4n4Y9BLd+CifYCDMb+zEjHIJJomc9zD1AcL0/SjYNra8
         /6qjsPaatB1j3vV0Pt1xcOystZNbtG9bAd1FW/vAR0Kp8EY7eUV1v7C8bQbYYIGhbRik
         jIqg==
X-Gm-Message-State: AOJu0YyTbwM2QhmRUJ9puBHxSEjCULm6VBXp+t0ReGolO8srpltcwsjb
	WFYzvJTaK/q5DCZEDvCVw0jqvkgCaxtdt3p2HWvGZpgyS/tfld+yUQgCnq+MPr+bu2gkcJ1gUv1
	vB6rDaUeiZRTqnqJvU8uvktzpXYpdo+MNxEHBBaXdek89ER+lT96gU/He5DVA8sfaI0v6
X-Gm-Gg: ASbGncsKk2piIF10uxapYIBzddpwjlbt9I/XagimTpr3DWKAKRs6m6kkPnQ+W+iqu/2
	VOA/zCr6GkTWa+k/zDiuZbODBhTrJVlAeZmfJXIi+OhppRmOBsKbK+2nVVI2oRIFvFEpZSFFq/P
	GtytEKjKHc9KAKoqySK5EVG9WGaYlM35DSmwuwtSPwVxD/0xtPpjKVO9LIN3SNgniQjVLi0Mcc0
	HWh1F8DyJfqqiPjICXKdv/YMkNs1AgJtJVEJzQIJWaGpvHf2XerNLv31Tb5m/dtPuHyD7v/fQ+Z
	EwOmT9ijVEKvykM+eyEMuPzegd8Gph6BswzXiIJitny0ddCw3Keenwo+VdWiFAX7DCqV1tI7BqX
	rtH0aALQh8wr12JsikByYu+Va5EnUfi4Sd3UApIbItAMRABDPFkfrAlQ6jR9gXiYyFQ==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr76273485a.8.1764761385545;
        Wed, 03 Dec 2025 03:29:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3jD4+WeNmDbIP8pdVjTDWJaZP1C9yCeAoq8WxJjkXefu5TPzcYVlp8+rJfqxvSDnHTYiy2Q==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr76270985a.8.1764761385087;
        Wed, 03 Dec 2025 03:29:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51721b6sm1775400266b.5.2025.12.03.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:29:44 -0800 (PST)
Message-ID: <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for
 USB1 controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2oEsPWgHSBkMNyhd28e1P2W9t9wAVuMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MSBTYWx0ZWRfX3AQvK+RvsSqs
 ESdfCZnWd0MUHDjbUWPIc1uGUxFPwm5+P7PYkBR8d6g01HBtity2bUU2UIEf2eR0FZ+JVhO2Cu/
 E1LL4/e3v717polzHqQtSF+QXkRCzxBy2kO8OG/o8sV9COrTEjdLLNWJyhjeL5znqOuOzcvcMii
 OEwhd84vMeSce9FVQG0aSf4hnGTSwJ/rCZZqFuskb3FS0aqEquB9QnfGUlt/gxAslTl7LlZGOO+
 tkbXne1YJCk2LyqmV+T76zrkSmx3PcpwgRxl+2tr6m8fRoZK5Jfo5aY/Cb1Tp5f2i+vYmyR3s6d
 wOU2X8CHw99OypTrkbhjXFfOZG+zhfXuQ7KbM2C4+gkhS0CWGvmVnu1/oRCfC6V0c3i+SQD0Ql7
 XqieEi6A/VXzwxfAdHeep/ulJIOuLQ==
X-Proofpoint-GUID: 2oEsPWgHSBkMNyhd28e1P2W9t9wAVuMV
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=69301f2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AMynSle1ThUGtpGg-SwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030091

On 12/3/25 3:42 AM, Swati Agarwal wrote:
> Enable Host mode support for USB1 controller on EVK Platform.
> 
> For secondary USB Typec port, there is a genesys USB HUB sitting in between
> SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
> through the hub to the Port controller. Mark the second USB controller as
> host only capable.
> 
> Added HD3SS3220 Type-C port controller along with Type-c connector for
> controlling vbus supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> This patch depends on:
> https://lore.kernel.org/all/20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com/

Please work on enabling both ports at the same time on the next
occasion.

> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 102 ++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 2536ebe36edbfd146e07d5698779767acff87ab4..07389593b3cd4728357255d47156c6861cbabb5e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -67,6 +67,34 @@ usb0_con_ss_ep: endpoint {
>  		};
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "dual";
> +		power-role = "dual";
> +
> +		vbus-supply = <&vbus_supply_regulator_1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_hs_ep: endpoint {
> +				};

You should really connect these endpoints somewhere.

> +			};
> +			port@1 {

Please add a \n above this line to separate the subnodes

[...]

> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr_state>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_47_in_ep: endpoint {

How about rename the other one to hd3ss3220_0 and name this one hd3ss322_1?
_47 doesn't really tell us anything and may re-appear if there's another
instance of this IC on another I2C bus

[...]

> +&usb_1 {
> +	dr_mode = "host";

The connector states it's a dual-role data and power device. Is there any
reason to keep this in host-only mode?

> +	status = "okay";

Please add a \n above the status line to keep consistency with all other nodes

Konrad

