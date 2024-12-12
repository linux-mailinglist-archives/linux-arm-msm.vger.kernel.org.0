Return-Path: <linux-arm-msm+bounces-41822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8A9EFAFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EFD1888DBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0482253EB;
	Thu, 12 Dec 2024 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdSPk2Ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506C223E6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028352; cv=none; b=UacMgGppEL00KD924DilKi1jlUc+DpmpDjeQPYBfleZ/HXZmlJJ0bJPk7dAToXY5bJ6lcTebKMhq2F6cFdNNtMIY+axjUOoajwdmGzoHF8gL43GS1h9PWjqUPHLv4vEh3Hp/sUMI7M9dih2qO08E+aIXhv99ICvwpFHBZxopcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028352; c=relaxed/simple;
	bh=ab91+ueCYgrYH2bc5L7WlbOD9Ax1t0nzav8cgMZbK7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjX0ZhlmTAjwXr+hLNi2sitkLuXc1rNWUivi0DD7Nbnp6YN0+96eriBTW5pIPsnP0lmPATQU27wiQogN0jKStaTQsLX/0836EhpKEN0CnJXPQLai3aufNqbBsMdfvUbyXwufV3ijIylJH/4/tTt+TOTgjb2uVcdSsSxGMZDHjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdSPk2Ic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHjR4X029230
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxM7khpFXIRWVrEqLH01YG/cMrQdSKce000WX+jkPIo=; b=cdSPk2IcvGz6VJ1z
	vfGVxBlmbFyVE5jx5lwWH6+MoovacNQYMfI5jBBIGMSfYmMzNOVUHls6omsHNuEf
	kQW/h6k6GXCHXdLkKaxAZrv7mbPuisNwuL8cfJdo2tORAaCVNI3ThVDfE+vP1MEh
	/s//3lpXbHwNt1o/roRKoXfxCB5QYf0AkdpCynZiF704lNMXJOvkt3tCv/Nkemg+
	//jVjk7xhUirbz1gwNKynSlTA2BVQNuV7Bi4Bl20mixCJfK6L0QPDesL6dnxI/N2
	Fg/dohulBYophg/856blMrkcTeNpl/wd4/fA9eMW2oyeKPzo4jwHOSOYYbwnDMAL
	m8TOLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuwgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:32:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d881a3e466so2220876d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028347; x=1734633147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxM7khpFXIRWVrEqLH01YG/cMrQdSKce000WX+jkPIo=;
        b=O5mgHdmGeN7jE/PmnaOUu+KmISaTuav32hc22nisgcRGzI5QnMirMoyI1RPMUUqJHx
         FxpwtIJpuOgpgbBYg0NN94ocfTZLYaCuvrSZRmuUcSm3DY6EoayWMaQHjrxUZMYXWLls
         8ly+TQmmQYstxnh9JtOuSquTDCXdcuA+T2ndiz0sghLBSPhVpzeMtpq7e5lDL6a5GgZF
         MqndCGFSgXxmOM96FFvW14Zox9FgYrLZdQhL9Bnp3XXAw+K8+gwnwSm06AvcftIRceIA
         BWc2kUQce8UNTa38cz918AvP8UwKuerB3En17QSzzX5rbogpHWxsJugmlsGDUQoDwmN3
         tzqQ==
X-Gm-Message-State: AOJu0YypyfOMuC7ZbGIDCNbpVOnPkHgpZlAf7ebOFVfmQad4te4heEm5
	S9SgOzybqu8DVLa6T45em6I0vFkrG4J9hcWUO7QDtQ9tpcqs2DZpw3bnPpp+6iYCJRxa7Tf/48v
	TNYETB8prd4m4OoPmqeoGzfrj9pANk3B/xrW7DgnIz8TXdAQN3XufJHqrQtXl6JoV
X-Gm-Gg: ASbGnct6x2JUfAG/CFCqE+9qV+KnnAhoX+C7yKv1S/icE9xI79s+x7LQ3EtwBVI/TAS
	1O0tfjJ/BXAgrIMov4JQLoFPpBb2eb5i1w4nRnY708IEtCCf8JgpCv2lkElH+HiLCQgY00imwNQ
	SEgB1/mImXPQbP8R/+7mRM5GuB2pnZ1rNLZIaiD64t+v/sqiWUtBolxxC163Az8dWzNO/mI1CwY
	7xnPM3P6yU5JbaZVDSTfi8AHbk1PtEYQzdUWiQHGQqOIimQiKeRv2emTXR3JdM4YM4ztfC00lxZ
	8GmAKGctu5oE75zT7HBcLBFNKhCCLhbiWG9Wyg==
X-Received: by 2002:a05:622a:494:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a1619b60mr8325541cf.10.1734028347226;
        Thu, 12 Dec 2024 10:32:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrfljY2vkd3Lt/DfsHE9Q4yKVSefuodPmXn/tMSCjfeYw6ACCIUoa/Od1A+jurMZ4xVqPMg==
X-Received: by 2002:a05:622a:494:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a1619b60mr8325201cf.10.1734028346752;
        Thu, 12 Dec 2024 10:32:26 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6808c03a5sm669945466b.137.2024.12.12.10.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:32:26 -0800 (PST)
Message-ID: <22491b41-f081-45cc-8766-6b4c851516f4@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:32:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HaTV18syWnsSm6adxXIhUTnXvv5-8AdY
X-Proofpoint-GUID: HaTV18syWnsSm6adxXIhUTnXvv5-8AdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120134

On 7.11.2024 10:50 AM, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input clock rate
> from a defined set of input clock rates. It in-turn supplies fixed
> rate output clocks to the hardware blocks that provide the ethernet
> functions such as PPE (Packet Process Engine) and connected switch or
> PHY, and to GCC.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> the internal WiFi block.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> 
> The reference input clock from WiFi to CMN PLL is fully controlled by
> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> Based on this frequency, the divider in the internal Wi-Fi block is
> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> ensure output clock to CMN PLL is 48 MHZ.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 91e104b0f865..78f6a2e053d5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -3,7 +3,7 @@
>   * IPQ9574 RDP board common device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  /dts-v1/;
> @@ -164,6 +164,20 @@ &usb3 {
>  	status = "okay";
>  };
>  
> +/*
> + * The bootstrap pins for the board select the XO clock frequency,
> + * which automatically enables the right dividers to ensure the
> + * reference clock output from WiFi is 48 MHZ.

I'm a bit puzzled by this comment. Does it mean this clock could
run at some different speeds?

[...]

>  
> +		cmn_pll: clock-controller@9b000 {
> +			compatible = "qcom,ipq9574-cmn-pll";
> +			reg = <0x0009b000 0x800>;
> +			clocks = <&ref_48mhz_clk>,
> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> +			clock-names = "ref", "ahb", "sys";
> +			#clock-cells = <1>;
> +			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
> +			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;

Does devlink not complain about self-referencing the clock here?

Konrad

