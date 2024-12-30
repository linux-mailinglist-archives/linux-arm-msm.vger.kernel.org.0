Return-Path: <linux-arm-msm+bounces-43658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6109FE776
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283E31882671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E6E1AA783;
	Mon, 30 Dec 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PacZnASe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B6C1AA1D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735571556; cv=none; b=gthg9eTiZNBE8zMiDhdhDlG98f/DrpVC01OujYLYxdn56BlhGrrr+V+rizWyKKEzI/9WhULZxMcYpkpHchfG8eWNM0NKdIuPxMMzO5TN3F7bdEZ8XudZzG75eS0pO+XcNy9Zz5qACb61DX2UOjheEGA+7w7Og2tReYDYQnXuGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735571556; c=relaxed/simple;
	bh=uQeLA0WoD3aTEsN0et794Wb8oqH3FbvEqUXzJ+y+5WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lc63BocP+05qKqNACI+9Bg8b2w0XijLUeOBeJ8Fn1R9IOM7fHnKe4jg6dtiG0NUO7AUWyUf3H7sx7dKfQBg9qdR6CXk3WzcljXQlbhCxwhqO2/57pBqZ/xeIaCgNx5A9iGXUGI3hsBrwThu2HCmqKTkSjt+22BDrvHC9SDbljbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PacZnASe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7G9jY027922
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxPy1tKzJ8uIr8HXQOcjhmV2KQFpKWLKxWXseSf5kdk=; b=PacZnASeU2iQ/Gy0
	GcI2jCJRu+ku3RoyPyYbtOzLyeZQxg5LH7i+kYGnYpbTgIQmVozAYNfJmvE8OlxM
	mPZVYbq7dZSRyA3Kuaboe7j179XysWD1h30ih8yguJ4M82Q3ohfHe2ss2MdvJ71E
	4RlHH1rKwF9lXPtUws1y9mPUNPlsfA9wfFWfpG1qiRDw4nAUpcv7VNV1P4oLz8tx
	ZS3w4PmUPXtHJrBPW7hbVrjDNHJDQxEclBUU1+s9VED52JoZli6LXXWm0iKfuV+J
	no1UMM3DJ6JzxRurFvEQSUwhSyQWHFD+rJzvLTk+pNICssR5eg/54VgvF1GdL/19
	S4ICLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43upyr8y58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:12:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso32470706d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 07:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735571553; x=1736176353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxPy1tKzJ8uIr8HXQOcjhmV2KQFpKWLKxWXseSf5kdk=;
        b=nV1OVEghvwVqevCqCATDiyACTxXO6NBV/2IniwiQ5O3RAN6WeYTYPxOLkV8ubS6lDv
         zbnbPndNtBvB/3DCAH9UUE8hB/vXwKfY7ZZ2u5gDxTZQ2ZmvUPZGPjsjArV0Zz+leUff
         2Vk3Np3sWojjdlXK2rzZTJ4dvUp7I1E5/avswAERMroWWO/l8eKUq1iQj9+1z3ESmUOj
         GjRMMdwSeijVAqOvSHAPihn2l1o2/ZBS0KZWTJNu6oqPTlDPDQ5I+T67RvKN2O+r+3OY
         WxFC1vFkcxEc1GE+vuCFcSJvS8afWGoDxpexHY1Na4bT8M3/bW0NaZ+jSPXHKBCthvOC
         omvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuJC0e/VcoK285PAHbDeEZIInidO7aowVmgde7lgJT7d4fXHoF6ay3iOidv52A0gxbljZwUPhqVPESpwUR@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5XXJ878RdI/hesTCjJUK7DdQwxp/ncB3Vp+x+RXRgiD5bmtT
	0Mniv7Jq2aqfDnXYv9vQt4g11RZmK1GQ3xvNt5jTvBcM7/Wb6umfjyEG+EvB+KVHtiecQghWziD
	++D2et45RsPzvyoAu2ECsU3udUY20jwOEXEG1tZYx2524l0PfxUMKuxH35sXxNu08
X-Gm-Gg: ASbGncsVwycqgoX/JakZGRbayFpnK5W8WY5UR8CY+Tc3EclTRcazE2yNxeM4YbzWGdS
	FMHlM7AYwCvcABwxcckwgp/jcF62oyWtCR7mG+NlGTfnVPeyG/vcTqNyKwomhgv2hmtHKkdXke9
	mPq7p3jKGdPwDotqPxy9NV9FqKkmnfz3VWiwwSEPXtp6dRUI0o8Vpe7uWRerzttNaXZPFG8XvY2
	UBL53at37g7MoO1EtFxRkpMP517B1Tb6XLVocXEEOtSIdlCXDjEjll46OAOP5qJsxIq8SNcUaFl
	9/ZK8s/Rvra+1FYvbAsvC6Smghz8ndw9bqM=
X-Received: by 2002:ad4:5b89:0:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dd2339fa9dmr194613716d6.9.1735571552757;
        Mon, 30 Dec 2024 07:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG3gcOXUpXBlRITqHpbNhdWdg/dwPgdjPlg4vgy6CoDdrxMBf3eiunItm35w0CjVX1HiH9lA==
X-Received: by 2002:ad4:5b89:0:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dd2339fa9dmr194613506d6.9.1735571552339;
        Mon, 30 Dec 2024 07:12:32 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894781sm1459731966b.44.2024.12.30.07.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:12:31 -0800 (PST)
Message-ID: <32921286-cf46-4c8c-8244-f840b6605dd3@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 16:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs615: enable pcie for qcs615
 soc
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20241122020305.1584577-1-quic_ziyuzhan@quicinc.com>
 <20241122020305.1584577-6-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122020305.1584577-6-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kCmbMGoD4Fciu1AyHy85bISKfl7rypDs
X-Proofpoint-ORIG-GUID: kCmbMGoD4Fciu1AyHy85bISKfl7rypDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300132

On 22.11.2024 3:03 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 158 +++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 868808918fd2..c56cc30a59f3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -678,6 +678,164 @@ rpmhpd_opp_turbo_l1: opp-9 {
>  		};
>  	};
>  
> +	pcie: pcie@1c08000 {
> +		compatible = "qcom,pcie-qcs615";
> +		reg = <0x0 0x01c08000 0x0 0x3000>,
> +		      <0x0 0x40000000 0x0 0xf1d>,
> +		      <0x0 0x40000f20 0x0 0xa8>,
> +		      <0x0 0x40001000 0x0 0x1000>,
> +		      <0x0 0x40100000 0x0 0x100000>,
> +		      <0x0 0x01c0b000 0x0 0x1000>;
> +
> +		reg-names = "parf",
> +			    "dbi",
> +			    "elbi",
> +			    "atu",
> +			    "config",
> +			    "mhi";

Please match the property order/style to x1e80100.dtsi

[...]

> +
> +		interconnects = <&aggre1_noc MASTER_PCIE QCOM_ICC_TAG_ALWAYS
> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +				 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
> +		interconnect-names = "pcie-mem", "cpu-pcie";

Use QCOM_ICC_TAG_ACTIVE_ONLY on the CPU path

[...]

> +
> +	pcie_phy: phy@1c0e000 {
> +		compatible = "qcom,qcs615-qmp-gen3x1-pcie-phy";
> +		reg = <0x0 0x01c0e000 0x0 0x1000>;
> +
> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_0_CLKREF_CLK>,
> +			 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>,
> +			 <&gcc GCC_PCIE_0_PIPE_CLK>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref",
> +			      "refgen",
> +			      "pipe";
> +
> +		clock-output-names = "pcie_0_pipe_clk";
> +		#clock-cells = <0>;
> +
> +		#phy-cells = <0>;
> +
> +		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> +		reset-names = "phy";

Please add the NOCSR reset too

Konrad

