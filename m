Return-Path: <linux-arm-msm+bounces-59266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297EAC2A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7981E1B6822F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E782BD01C;
	Fri, 23 May 2025 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtyZr2yr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA5297A4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029158; cv=none; b=nQ8SuDzT9If17vsEiyU6Zq+r6q+nPmiZiDVcaYSWiKpVx1mumX9Il5oWNpN4umltFfLPyx8VA8Ng0dPgQlvbtfvO7G0X8HQ5YpPhzy4HkzpPikEm6+m93Cq94WmsXIANbj1P46pteacbPfNSdLv7hn4zpKXsxeroo85MQ+V4XtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029158; c=relaxed/simple;
	bh=UwjCwu+hoD5QvbENA5EagwHCA8S9dgr+/m5BQ31GkaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6xdOluaarN+hEuPtQICmbuImyvgYW08eKsQ2A9fcOWVQ4/flet9rOlIJn8e4EI6bvweJRu+n5JASOp9waa4SXimof0RrJTEneoPX00Kd1Jaq3i/DlCzbNy9oO7re2GYbI01WMn1AzQI03yZZxhtgPUUIrek3AbnYFuVFcguUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtyZr2yr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NACJ6e020953
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9XB99CT/fAlMSiqksbkH8KqSrgQ0U0y6auihnvVBOU=; b=ZtyZr2yr5RVArOcm
	8nBdyIX9wsKyw2R0Injxps3ytEooWWxhiMs9+O96j1MSkwXYFYzmkxuitdDjbfYq
	vYu3FCMcwUipDcbyT8CSYuPHJIHyJLg13YeNNMxQQamR24N1DYo9yeXMgdVJ3Qbb
	d2UejA9PSFktGRqVc5lf/3xNQxa9x/LwRd6xp8Rl21G6U4SXXNHyYJ0g38eI0VZN
	6W8nSnQI14TnIubBbB0Zs2eSNyyc/WhvGyAXRduAG8iJoy8t9cEp5Cx+CfE3QYe6
	DXT562RkCHduDgdsVBFPFZgkaZbpAUIwGj+Qk9JPXHftYKENlLd65Y1f8DU109SU
	uvKusw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0b79v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:39:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-477608e8e4aso278731cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029153; x=1748633953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9XB99CT/fAlMSiqksbkH8KqSrgQ0U0y6auihnvVBOU=;
        b=LyIrdlgWlEgiXZcUO+2YDhZtiO6zEBdKolQ43OXRwo10CkieZaQJlKVIb+vT+gnqD/
         4r6+X9bm4GW5nPA1Za8e/pOgV0wGjbVHzBYDllbmABJ/QbHm8rPOunfT1qRo0KcJMe5C
         KUmfaKGIs9EnolLqIPq+vK1hlfawHYJOmiPnfv2vLMtH+pIoTyVSbmQy+f7+gbPMX1/s
         NU+T+is08NAy+3Ic018AbkFzzWNp5pM+C7Kl032r1CcaV8pjbgjuyDn0f4wKdtUINI7g
         ZAh6QeFiVY63rP1zjYcCi7hpio/g3oaOW8sDg0jFvschSz4ts5dABYsFDWVedphR/dOr
         rNkg==
X-Gm-Message-State: AOJu0YyWABesyqaoqD9mxWzFGGBLPwJGGYXSXmlBBdbbZECR6TZuxsAT
	t0YANtaMD9qP0h8zaa8IhMxSdJrrRaR3+cP6gGlTivztdvuTrohiMiME3pfvdhb2hPo6dVrFJJI
	z9q5o4VXWTaNRQD10yxCp4lMcfvFhZIe/igCfo1YN73H51KCtNMFLWoL1wQ+0KTCJ4692
X-Gm-Gg: ASbGncuNjzMaJgUtjs37x9/5U084NtU3peaJPJm3G3SqtekY93zoZpNgp8LJ2VKT6Nd
	IR7yG2SMcrEf6gxmwcuxZusMRk0Wp5vWTeyGjaMG8PokLQYOeIPmyM01fsdmrvuEiyFw6MyMea/
	DbxU20Cc3zwH+TxlTP799WO00VIwE+2bcLDMJw0UcZZBj1cCxaOhuGPRmQcJxlkDQkGKOmLBMFV
	Lp2RFMmQ4R9HEW29mah5Low90PCCShvfKQJ4BuLCvW2VqOhaDeL+kW64qBk1yuSAsKF2GVqTrL1
	HZYYhJTqmgNuKrwnH/B0pvOLv0vfdYbCA+F83pPscTYcNzhviwCLwn6i3c1zQa4gjg==
X-Received: by 2002:a05:622a:408:b0:472:58b:463f with SMTP id d75a77b69052e-49f4625a717mr2814041cf.3.1748029153119;
        Fri, 23 May 2025 12:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnPTlDiHsFRsc/53DfqBHHewY94m5nSrjK/NZWsZOAvwCTZUQy5z9CnHlIfIbegggC4dKHNQ==
X-Received: by 2002:a05:622a:408:b0:472:58b:463f with SMTP id d75a77b69052e-49f4625a717mr2813871cf.3.1748029152757;
        Fri, 23 May 2025 12:39:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c3csm1266798466b.88.2025.05.23.12.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:39:12 -0700 (PDT)
Message-ID: <76267be1-1ace-437f-9394-ee56d4e8ffb2@oss.qualcomm.com>
Date: Fri, 23 May 2025 21:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm2290: Add IPA nodes
To: Wojciech Slenska <wojciech.slenska@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-3-wojciech.slenska@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220073540.37631-3-wojciech.slenska@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3C_Sy94wDTRQWX7bMZ5uoROYu7Yjakd4
X-Proofpoint-ORIG-GUID: 3C_Sy94wDTRQWX7bMZ5uoROYu7Yjakd4
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=6830cee2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=wQ2JREbYfKbkpeN3qpUA:9
 a=fFxRHlyTGdwQsMLX:21 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE4MCBTYWx0ZWRfX9rLoaJgjazdK
 ppJvFdqAD3pK3gN4ccUM3OPWn7fEJH88iEklbPqGrtdLrDi+s86E+dYEo2LHvCyvBB/eQrER92g
 sechBxmmpjm7iQtdFJw7sMIA3cSeSfomsYElFEf9/oi5WKdanEm79zpywOTBOA5gSw8EWSVe0/5
 EiZkYHMfUlT8cP3240Ip5ptZYaMKzLAJ2hGuPzy13cFkN3sAezxP0yVWuSmJkinSI8Wl0DR2SZw
 4CKWJhh40ggxG7+bbmRlEiKlrWwAFZIR37pYtNyUNsFaFZvFcFpF2DP/JNA2l4BOcN92PgIQjcB
 EToTNobuzP+PbKPXafa+KxuwtcWczmm4YCTXBlSuSsTjza/3f2hoorxvjW/8OeNqKsjC7mSZVOb
 nbQZpXCFat/zJVeIU0nlZo/c6k6/Bv4CWv0o062A9DSbqfyA6NTtotTHBz6DAhOdo8qJBpqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230180

On 12/20/24 8:35 AM, Wojciech Slenska wrote:
> Added IPA nodes and definitions.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index 79bc42ffb6a1..0d39fd73888a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -428,6 +428,17 @@ wlan_smp2p_in: wlan-wpss-to-ap {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		ipa_smp2p_out: ipa-ap-to-modem {
> +			qcom,entry-name = "ipa";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		ipa_smp2p_in: ipa-modem-to-ap {
> +			qcom,entry-name = "ipa";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -1431,6 +1442,47 @@ usb_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		ipa: ipa@5840000 {
> +			compatible = "qcom,qcm2290-ipa", "qcom,sc7180-ipa";
> +
> +			iommus = <&apps_smmu 0x140 0x0>;
> +			reg = <0x0 0x5840000 0x0 0x7000>,
> +			      <0x0 0x5847000 0x0 0x2000>,
> +			      <0x0 0x5804000 0x0 0x2c000>;

Please pad the address parts to 8 hex digits with leading zeroes

> +			reg-names = "ipa-reg",
> +				    "ipa-shared",
> +				    "gsi";
> +
> +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING>,
> +					      <&intc GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ipa",
> +					  "gsi",
> +					  "ipa-clock-query",
> +					  "ipa-setup-ready";
> +
> +			clocks = <&rpmcc RPM_SMD_IPA_CLK>;
> +			clock-names = "core";
> +
> +			interconnects = <&system_noc MASTER_IPA RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +					<&system_noc MASTER_IPA RPM_ALWAYS_TAG
> +					 &system_noc SLAVE_IMEM RPM_ALWAYS_TAG>,
> +					<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> +					 &config_noc SLAVE_IPA_CFG RPM_ALWAYS_TAG>;

this last path should be RPM_ACTIVE_TAG - that makes paths involving the
CPU automatically collapse (as per the power management uC's decision)
whenever it's possible


Konrad

