Return-Path: <linux-arm-msm+bounces-75091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C1B9F34D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37953188C1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6E42EAB6D;
	Thu, 25 Sep 2025 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqXm0jPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAC2E7652
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802852; cv=none; b=iqjN4rWm4ta0D44g0kW7x8mq8pVri91KVdXVPbHPyr+qOYghjGZmeDEoMnR6YK7c9YBTZGdf+vH6Tp9XaP4/xJQ2GQCiG6Rc2+Mki978nm862DeIraeRiRPF/6v//igCS0StEcl/I/Ls/gkJE3EkfqojQzV7PfT53QUgD3ZlTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802852; c=relaxed/simple;
	bh=UEgHkUZ6HhoDdgg1MlS4yGu3nLu+qwQjfmfqPdvPrvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwljvA2Bv+SFaBA6dbyH//tt6ppUNP8MxlIaPAX8k8nnGmHXt394eNZqVEAJgsId68hraYjOkx3gP2XPQDCeTqUSVUAp3h38asX20bYnKsrKJGi/lFv+dwhy6s7ykgvFbAkxByRYRQX4TuzJnDxFLI+XeKS8GPtnwKA9rB5RCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqXm0jPx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PA7Rup001948
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JBa9WUH9blDwOYLAsQwNw9XJY5WIlBodkUOkl/iYaOY=; b=DqXm0jPx8bLW5b2J
	imDfibvt2AKxzjE0wTHNRDVT6GjE5Gy9IsEPaV7DFrAzcoHvLUi7QG6c72uAw+9g
	QZiPjea4esqkof+wWjQcaTKkXVyM4UZYREznVU7T/nBv/3kcwFhShCkKjmxje5XH
	nwvztwP49gQsxiDIAFD2EnqR8cvh6v9ir3cWxgEfFxw9PCAab6kFfRhxvJCdwkVW
	9OoZygW5indqKF3TIGU4+CVa4mKu+Rtr8sx3QYW24Ar2P3gGGEkUfuve0J4sQ7V1
	NeisBCr1B9LhcASWFicd6fd9YhTAI/wmOG7vVKXbPMsYU1/C2xJklN/UqADPasiH
	j3nn3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98r0qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:20:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4cd5464cb0bso1663441cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802848; x=1759407648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBa9WUH9blDwOYLAsQwNw9XJY5WIlBodkUOkl/iYaOY=;
        b=A1wGwZDBx+mafWUkDcBypq8F4oOfkuz0R/H6/Zd/TWRm9PJbtsXHDTcoJR66Zo9En1
         AnRkIDJte0Z8bZ/QeVdu15bNF1LyJX1gEJQ+6vT8vqXO8T7JOVMy9auaMDy6hRCBjri2
         jihONYW8ow3ILel6P2IZPu+A6Ta0OMb0u+TFCA+4LYwspAXLCtKYncXoDjQlrxbbLf0y
         JyTsq2xzo9w+o3QJES7yJdEgIJtsqdsT7D8GvNdg5/WOfedDY+mYr0vlOT8Zj6xYkFY4
         vqOMIClcKbTLKQk4f7o/cpkM/B/n9ny4IcTqN4yC3JLP2CjYgFSsxSLhN8ULt7d4lKlt
         ccvw==
X-Gm-Message-State: AOJu0Yz17F60hxXKLjPFOKaNcGpXzKwhtmrgqP44cFuB5UGFIptKjEmV
	ymdgrSKF4H0xa/B1LActZ7d3j8U17VFDDWbHTnw/iqoUK63fU3/M8VnokUMBTxkqOyNa2k2ZyIr
	WLVl0Tsx4kD7Tm0WGvFLQIN516GEF5XTrnORAokr7g9HCH78dg63QBZKIMhQsHFLhvk/k
X-Gm-Gg: ASbGnctLWjpk7/2qeyYXBvfmg04n8tUx0R74Hn2fWHeDU5zq9w+Jl5ZjuZBIKLuDJe8
	MjFx4n+/yXNzA9bvJzIm/3PM3wdmyzYzRSFFo49LkUdVDV/LzQj+7pZIohnHnTFlO1NqNN6/uVf
	D4O8/IeugDB9F1b4FFEAYEjlUf/zmpuzpq/oPUl/WHtU/KQszaFzLyo1/nw3FLsv1aLLBlNbpZf
	6Sz7z4l+RqE/DwU7+s7rOlAvWYUM9KAUrV+1/qaru/EzKZUB/wpmoMSbGUXjKaVbHntCVmL1F+3
	pWjqfPmM2kQ/Jzri42AHzUjbz+NKkSwHMtyFkBy3mC+/2bCJ7EXkpJiHx20iIDktWhFPAilgswK
	iCXUWChOXMuV5UZ4Rkg/ceA==
X-Received: by 2002:a05:622a:608:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4da4b6160cbmr23991441cf.8.1758802848330;
        Thu, 25 Sep 2025 05:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEye28teigye8FN0oa/ZIC5riqFjgrGEHnB3Orw1Yd88iMLUXY+KIieWa9yV7NHkzBr8FWFwQ==
X-Received: by 2002:a05:622a:608:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4da4b6160cbmr23991201cf.8.1758802847897;
        Thu, 25 Sep 2025 05:20:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1643sm155282366b.22.2025.09.25.05.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:20:47 -0700 (PDT)
Message-ID: <85ba017c-3ed5-4fb3-ab6e-a64135a15a85@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] arm64: dts: qcom: Add PMH0101 pmic dtsi
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash
 <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-9-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-9-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JKkPZpRs1OGZZHgjnOdZ1-mJVEEsUxnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9oLTjbirCMrn
 /P8kf8R0CzWIlLoSv8gJyZvA5FZUNrV03gSSBO9UUj1on80DQ3l8PcE4hqyXqst+63JuaPozu2i
 w0S22KPirOXtexEz+XEsRraVfIiu8C/RBXQ/53JeRWJi2UWkxnAnClHYyyzAUw4SI8UuwN/5Z9O
 SCnP7xHOQnmhymoCgezJo3wUSYyMmCDj8QLtefhkp9apP0/COu24k/3HPPBG58fJOJx8w43DOAU
 vKcgPBWhgYGlAYjAVJtYIlp2ZfWmCfbR8rMa5eHZnwweTvwiazXGK6iVepZbe+qIhKYEaC1OBLT
 CQMeKziT6+f70eLJJAtF9TT/c4NWNer7Jl1xQCREOwzgI4GL8GwrZOgXufa3+b2gPFu73O7+9k3
 BRiaqiNe
X-Proofpoint-ORIG-GUID: JKkPZpRs1OGZZHgjnOdZ1-mJVEEsUxnH
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d533a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sMJJNNXJM2iMDzM3yLcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add base DTS file for PMH0101 including temp-alarm, GPIO,
> PWM and flash nodes.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmh0101.dtsi | 45 +++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
> new file mode 100644
> index 000000000000..831c79305f7a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus0 {
> +	pmic@1 {
> +		compatible = "qcom,pmh0101", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmh0101_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmh0101_gpios: gpio@8800 {
> +			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmh0101_gpios 0 0 18>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmh0101_flash: led-controller@ee00 {
> +			compatible = "qcom,pmh0101-flash-led", "qcom,spmi-flash-led";
> +			reg = <0xee00>;
> +			status = "disabled";
> +		};
> +
> +		pmh0101_pwm: pwm {
> +			compatible = "qcom,pmh0101-pwm", "qcom,pm8350c-pwm";
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};

Any reason for these to be disabled?

Konrad

