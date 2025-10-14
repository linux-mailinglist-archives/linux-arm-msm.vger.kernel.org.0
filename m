Return-Path: <linux-arm-msm+bounces-77091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12BBD7785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0972A3B9B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 05:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53511C1AAA;
	Tue, 14 Oct 2025 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TouYZXAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE592877D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420635; cv=none; b=ijFlYHLj/Af2XJZnLx+fmCgwZdbkvPHj1CM4qiohRfo7ndkPhUq+VpHshwf5b85gmyMrRN+93LW0VedsOa7VvWKHD83YOCD0kzF9JD6O9lJAk4NiIGKBLfhysr0ZyrJtHT69kmozhuKgpiBIn5tZfsp8aagIBV4HXT+qkGLUiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420635; c=relaxed/simple;
	bh=E9ngMPpY0495YcRNIkMm3Z3r/sRF71WMCHTr09dpriw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4PdoQ+LovVtucgEV89Er3jI62MQN8ccTCcVm97lPsEaqurHiy8/Ca1ToIOyk2QUtJyaUKq4NADDa8u9ExRgLFxE5gVY0Gdq0ojitoliuSKyEWOOmV1ZQw4ZUg769WD77Pd+Xv3GrNq3C27AZUGmkPF7DtzVAkbJK4/QB/7vtik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TouYZXAU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DIM2tD023588
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9D4EEKufXMXkKelCHysJYJduF8pemtJ6oblHi3EHsuE=; b=TouYZXAULvQYEuTq
	NdqyM1jsslyIuxM/et06k9vIoAeQw3vETY4vbTQ1+SKOlmVQXk/ZJ33Bl9+fE1H4
	HWyMgO4vyqIukO6Dc+hPMmQlJpefIpwcHz/Cn04vCQTqOwTUcWb5zt7TxrIueYre
	RDJtrBAiZfxY6Us3A9QSslwzyqXlzYf46LSd/xFTy/5bF7S04Mdv6y+fB/5C3JEz
	kYsngKLZvXkOmiGcKK3nlCh2oI/7f/qIyg6lddLh9PJ2BIC5PxT0646Cv38KnvMa
	XJnzuHUbw6JtMJtKkD0cBrroOz08VN8Rh2REMp6fZ1/er8oybTwuJWjFlcwCgGm4
	UuN/Qw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwhjpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:43:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befbbaso11667471a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420632; x=1761025432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D4EEKufXMXkKelCHysJYJduF8pemtJ6oblHi3EHsuE=;
        b=DE56jfBsM0ZzuNbi1Yex6BAltnonjpk22cFH8AEAXNbDfS2tvn1QUPfDRdDKvieF4/
         /jw3cVPgPC8bnzGRyB8Hmen3JcXpWdYX6Ack16zJncbhq+qsmvAXYZcZDdCD7ktpW8vL
         pLoEt40vnghxcIlTgBP7LyHgIXsXYI05f1dbiv7UIcFGPnn1YKdHWqZzFiUYbldFWSmC
         fBNQy/VUtxiQcT0v0KwYvdVbm+6Y7+6vNNaN7podpewWGwB2wrYuXMvsnO/q8w1jsMI+
         84H37UEh2S4cwq0WgjyVJVbV5+95qFnq8iFl0v69QyTYQRQcYtw0CISsNEy/nyD+NO6t
         n8zQ==
X-Gm-Message-State: AOJu0YzB7sjLXulk/ccjsQuAZympmayt+Mf/P3uYs1DfnNl0JckLgryz
	2k45iWlfZAYMTltuGG53RdIz+kxdaye3YXxG7axKx4Z9w/tJA3dQ4IoqJSwsnNnrdApYix/vs7j
	YIMIjajJNfJRUMO0rNR+/vWCq6yTmwiT5y3Pbmb+HWJBbvNyfIEoPVDY5bd9ifUqzSMok
X-Gm-Gg: ASbGncuye2XLd0OD/w0B3ejzOZylXAqYrHP1oXbuDFR3tJ66jDJFrVappIAjdVsV39w
	C9zrkRGS40a3CjufdBVUbCJDlxuMFSZnzepLzDkXAJyPSf2J73ay7eaLrwuN1qfLbR5xY7moBcc
	QPiVsr37j609zaDsxaIkrfkyyIdtKKwKuBF1Cd8UVY3fkF9d6wPAvQCS8u//qNPzEUA6srU/nCC
	vRGyBM7dJXlYYQ0bPFqmmGUk6KFTsufUZ51d+5IV22nPy9KKa8XkSkD/qOQ2vB64kKE7sFAsGBu
	LFxwf5TmG++WYxNh9xQ1hVNElCtjMWBYApjyvFreb4byAsR9ff+/btTUpgerWjimnNdWRv4rVQ=
	=
X-Received: by 2002:a17:90a:e7c7:b0:32d:601d:f718 with SMTP id 98e67ed59e1d1-33b51393502mr30831464a91.31.1760420632526;
        Mon, 13 Oct 2025 22:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3trdEiZsOPClRk6Dsifi/viN4KHN7PYNnvGAEG9JdzBt9jMbgdpd2Oj5WQlapWC0s77Wzcw==
X-Received: by 2002:a17:90a:e7c7:b0:32d:601d:f718 with SMTP id 98e67ed59e1d1-33b51393502mr30831433a91.31.1760420632058;
        Mon, 13 Oct 2025 22:43:52 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm11470944a12.31.2025.10.13.22.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:43:51 -0700 (PDT)
Message-ID: <cd84f10e-c264-43fb-9e3d-20338d85de19@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:13:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: Add PCIe 3 support for
 HAMOA-IOT-SOM platform
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250922075509.3288419-1-ziyue.zhang@oss.qualcomm.com>
 <20250922075509.3288419-4-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250922075509.3288419-4-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxRSIfR8IUExz
 D6aXVLDfOTOFOCzjDVghoiR/+IyAv+wG30Z2QoM6BLU8D2AOq3DJU8eEz4APE8Q+G/dlSQgVc60
 z7WdZ+4dA3c78nXQt4NR/EKueSn3FBERxV8gppyOMI4jaWEhucpWJUFUISsQ1xrSN5ScurNVCq0
 XPxxbbb9PNb7UjBZVn3SUEJ6xBwpjQvccnxSvRf/7vbyJLb2D2kWr/l/1+qzKb1MeOutQ12nPf+
 0kbT9uoSGciFAD8iTOm82DCp2oJd6Z1wFqBm/+yNutGlmG9sZ6ZEqNYB3srfexrEurP9w+lAqUf
 d3OWKdOADFEhDbNxZJofT374E+RtoDC4+GFaYQFtSDnwHFa89u6qsH0hAOF6vGSEZqzMEdHlSnN
 4kix1/CzHFr0+zZNk7bNdSNrEiWxVg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ede319 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kM70mR4GnouSU5tgWfoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: q5FNIskyWi_v1JkNFOQXkktv5c1vkFgv
X-Proofpoint-ORIG-GUID: q5FNIskyWi_v1JkNFOQXkktv5c1vkFgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 9/22/2025 1:25 PM, Ziyue Zhang wrote:
> Update the HAMOA-IOT-SOM device tree to enable PCIe 3 support. Add perst
> wake and clkreq sideband signals and required regulators in PCIe3
> controller and PHY device tree node.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 70 +++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index 0c8ae34c1f37..7486204a4a46 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -390,6 +390,53 @@ &gpu_zap_shader {
>   	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
>   };
>   
> +&pm8550ve_8_gpios {
> +	pcie_x8_12v: pcie-12v-default-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pmc8380_3_gpios {
> +	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +
> +	pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +};
Either squash patch 3/4 with 4/4 or move these pin configuration to
patch 4/4.

- Krishna Chaitanya.
> +
> +&pcie3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie3_default>;
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
>   &pcie4 {
>   	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>   	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> @@ -471,6 +518,29 @@ &tlmm {
>   	gpio-reserved-ranges = <34 2>, /* TPM LP & INT */
>   			       <44 4>; /* SPI (TPM) */
>   
> +	pcie3_default: pcie3-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio144";
> +			function = "pcie3_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio143";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio145";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
>   	pcie4_default: pcie4-default-state {
>   		clkreq-n-pins {
>   			pins = "gpio147";

