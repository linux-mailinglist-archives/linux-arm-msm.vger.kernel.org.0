Return-Path: <linux-arm-msm+bounces-66185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BFB0EB37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD3C27A800F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA4C270ED2;
	Wed, 23 Jul 2025 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiipYy67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DEB214A94
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254203; cv=none; b=q2vp5w0nx3VoqWbuuQ0Hsj69VDuYmOrkzP1v4xqu4FTq2vtF71SBIyHVrDR8h04uJWBxruqxi45xvOX8OvP+LHoF1F1jNw/aqhjElckeiBbczhD7DYcTPb/2OKSq//+UdDhRZMKCC5Vys7z6KCuvVwnGaBUkP5UhZCpfqD2QjA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254203; c=relaxed/simple;
	bh=HQ/VzO55hzw8ZKGaXble4MZ5AW+QZvBkOBgx65ykmDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOjayzt9NMQZTg6VFrM/uKf9Scd66hvp/g+xKT4e6pWGClqAAwvHcIkd0SJph496oqOUKMAQU+vKVrLdo8dow+qNrUivXXGx4AQ7JDvXv1Z17Iurn2kmRS8fhFx/bIOgz+mnPmbSwo7h3Uz7Lu1+OCbhMtjIxreYd25tGW+8fBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiipYy67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNvGJ019487
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgHrH8DxZbmAx2+kVkpI2EajPPpLEzEmxq3USz/0Qyo=; b=UiipYy67x6eYlWKy
	b+osKG5CE9EnGL/uFkn9n6zZiPLGsAA+JZpI2iv2KKA1OTDUVg+0AFYgt+ouo53z
	het1o+oOnfn9Fb13xnRUbkMcPvC6X01YEtMXkdClZCoanXoAqFnmeiAvtjmUNVgr
	HVA5KPy0c3XiXLmDEgXE3+rQFCSTfM8UY9pvTsy0Yj70zVFbZwZSwMGZtUD++/Ak
	n+ufoI9ixoxtroWDp9+6HF9n+bEpikG/LzO69Tq+dF2RJ/+DFqWx5xCD8cfiPUB5
	wMODRuCPPSWrYYMY+gXlwk9DlgF5IzhudB99BRCUdOSRm/Q/m6lTKG8oKCEcFjIu
	tYMlsA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6pcfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:03:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso9703434b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254198; x=1753858998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgHrH8DxZbmAx2+kVkpI2EajPPpLEzEmxq3USz/0Qyo=;
        b=rqO3W/aaIh6vWLy/kPgI8PzbweUdOOL/0J14J4IIYcZnkHpGwvd55yj/AFtjfXqDCX
         xiBXaei639YjRPw3RWWO7qX7s3ucGMv3rZtsy4IPVpSKZdbYoVXihgZ6ft5v3YezT80Q
         ZQ2JuHkZIbO7sUK/onpSMCuEtz3LuoYenooKoLjVSrIekP9xZXlIyhHUUwyLqZe65uQH
         IJXe96ggudLsQQ3ujxyNVKhme71j+E3+NXjpA3lKOAkwzd71v7oGg4ZI9w80Lnscu77r
         QAxvdNscZmqP75wq9BzGKW1zzrMFpBy+rsryIeHZ5Hb+0MWN/2LgAAVBK38OjH5891UR
         wJJA==
X-Gm-Message-State: AOJu0YyZdNtdDH/uXiRYT49yINTmiGWGeSAlfa+vPeBXsy8ZNo4rSTfB
	6b3MAsgOAMHzx9GLq9qNZXiDk+S1/MGIXpb3ksxdT74LpA9oMRoxrIcCXdQ7Zkla731WPSQ0/jj
	ywdZn5eFhJg6Yvyxp/qe8V3MAcO7MdKtvoNzBVVB8GzyzhGufw4LdTJaDpBMOfN6hk6JB
X-Gm-Gg: ASbGncuZJNvi7isPibHdiuYyJY2i9Grti9HwHFOXErcN2M52GekiK+ua3w7v0XaU2Ca
	56SZw4wVMPD+ygdBdW5xBe2rWDYBzqFbevr4uuxh4Mm2LtwHK8Uc5RdwtNWYRYs9KiLu4HRnN5E
	skT46VsadT6+d80Pt+5C83ThUcJ6BTwIq0Ge02OCaJNaNLJ6ZSwZxaRwH3eMuNp+nToVshGSK0u
	5NOt+v0cPK2Vydkm2NPsTaqeS9mNu1p39hkAjw8DOG5+ulGQ4eESSg2PpenSz2aIu7B9U9/+nMc
	+els6owSzY5WrHO2jjOcB5NUcOrknTN9/puqaJ7JkEZrQXlZ98neP6WKfADqCKhJsblcRpKCBl4
	EMKmiCUxi
X-Received: by 2002:a05:6a20:72a1:b0:220:7e77:f4f7 with SMTP id adf61e73a8af0-23d4911f9e1mr2982074637.25.1753254197895;
        Wed, 23 Jul 2025 00:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOdoj/Z0jEqXcV2S8L/uQoTbevs9LrXwjf85fcxGIO0OJDtv0iwbEYch0xtIVtUG3ntXRiWw==
X-Received: by 2002:a05:6a20:72a1:b0:220:7e77:f4f7 with SMTP id adf61e73a8af0-23d4911f9e1mr2982034637.25.1753254197437;
        Wed, 23 Jul 2025 00:03:17 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe69c80sm8194616a12.12.2025.07.23.00.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:03:16 -0700 (PDT)
Message-ID: <8bea2f87-35fa-4411-acb3-951889b92713@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:33:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68808937 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LH_GineItQtitB-Bug8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hR4MlfHBV_BS03HIAGTGP7krykEnmxMV
X-Proofpoint-GUID: hR4MlfHBV_BS03HIAGTGP7krykEnmxMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA1OCBTYWx0ZWRfXxnDxj3A/a1B8
 Ix02w4bxJu3aM+Ubo4fa9CchaMSHNUonGblTuXWdyNGML+tOt2P9KM7WzOUhJAFyf8WF6Lk1P1e
 9JeoOU2UtGxyMOlDPsQ/YnqTUWPvWl3V4xtfJJb2yDC/z4T88tNZxclAbmZdrqITEHvrsQv8oHb
 TIRheP1y/T/9Moni7lmoekmlbqS+WeGEobE81/ZXtV3/pUp4MMc3TJm0tvXgT52pYGIagL+S09L
 GYBUNNWWGJT/1RB+zyYwYdvcRVGSUVqY0FdiQE/pORW5S/GythyHvkgiiEQ7oVSi0OHHVPh7eyV
 FvfyBywbfs0QJdixXAJp8VfvmqWI9ryJ32Uvm6etJQNvDEvfRVYFyP99HPhZZpprj55Hd3IgLvI
 qw06+vO77NoQokUgiYmxZ4+DvZFZ0fY6egtI6CbCI4LLR7n/O6+IGhKDmoOgBXtf74Y79b5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230058


On 6/30/2025 2:20 PM, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
>
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> disabled. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


Gentle Reminder...


> ---
> Changes in v3:
> - Add the pinctrl configuration for the SE (Konrad)
> - Link to v2:
>    https://lore.kernel.org/linux-arm-msm/20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com/
> Changes in v2:
> - Correct the interrupt number
> - Link to v1:
>    https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  9 +++++++++
>   2 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 1f89530cb0353898e0ac83e67dfd32721ede88f8..8dee436464cb588fdde707b06bd93302b2499454 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -224,6 +224,13 @@ data-pins {
>   		};
>   	};
>   
> +	uart0_pins: uart0-default-state {
> +		pins = "gpio10", "gpio11", "gpio12", "gpio13";
> +		function = "uart0";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +
>   	pcie2_default_state: pcie2-default-state {
>   		pins = "gpio31";
>   		function = "gpio";
> @@ -239,6 +246,11 @@ pcie3_default_state: pcie3-default-state {
>   	};
>   };
>   
> +&uart0 {
> +	pinctrl-0 = <&uart0_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   &uart1 {
>   	pinctrl-0 = <&uart1_pins>;
>   	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   
> +			uart0: serial@1a80000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x01a80000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>   			uart1: serial@1a84000 {
>   				compatible = "qcom,geni-debug-uart";
>   				reg = <0 0x01a84000 0 0x4000>;
>
> ---
> base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
> change-id: 20250630-ipq5424_hsuart-0cf24b443abb
>
> Best regards,

