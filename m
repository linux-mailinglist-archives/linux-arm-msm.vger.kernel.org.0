Return-Path: <linux-arm-msm+bounces-64799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE11B03CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F3B217E33E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760A3246BB2;
	Mon, 14 Jul 2025 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPs0cIJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD7246BB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752491187; cv=none; b=SHVoZp2n3rZywz+LgSAkDkLdJtTyAhQU87MIQ6tsQ2bL/FL8Yc9mlos/w34vXbtgnXvoZe2mjhANXRoXthbhqc9pjovtIZdkh3cp1xS8CrECWo+NtHxPy5lbZ4/8oEqYPN1gnQeFzDI0D2X56RuSKXCpZ7lS57IUpr2WgPoFLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752491187; c=relaxed/simple;
	bh=TbeXNfFoP3vxZUzqcnSVxTS+nA/kiLeewg++BaGQMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHBY4GyUdMzFTT0DE1dG4fdvwnZHeMo0mtnr0CrVqR0dunvGO/c8zFpjoqO8XymdSBzWDECv0HmsSI1vhg44N3wHF9ppB9+hNaCNUhWT2Y9tgpvMjCmvTlelOcZ9Zi6wzYTbSKjauJ3idTtGHXD16r9x20jk2ucDz/BpgNmJBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPs0cIJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9Up9P031774
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YKrSFv1YGAiQMcAg6nzwovM4HAC9RQMF+xyu/4Z080=; b=mPs0cIJe8pzhvbW4
	bObewQAZcRH06g6c74+oGoGrkHgfEh4KU/ZGgajSBxDEpWByVjm2kt8KwLQjItrR
	/pcJwNXZdQt2SGahNizWFFQyoJC8rDYnbY4XKonXGS/1KD1UH4yV2QMdkzjPz2xX
	rl+PhceJGJFodOSxTzHnip6XGH0CXO1WegyDK1b8rbSsDuAAtOaXC/Kxhpbzmyv+
	6FXFbHeOwX7YCsrd3JBTfsHVy7aGkDpzkd5j6NgofOTA+qc+qh8RGZY/JfstRiCK
	DkNv93rjqrHj4iaz79EJ0JHxVIvumqEqI96XmKU1NVYVyGm7SUF9O6+8xGXhQbE4
	LWQJIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a30u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:06:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab716c33cdso2957951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752491183; x=1753095983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YKrSFv1YGAiQMcAg6nzwovM4HAC9RQMF+xyu/4Z080=;
        b=X0allePsSu35WspoytjsWH3mZMTCDcoqWTtG0iaKss/LtDAw1jNUTSCQK0sbSZni1a
         1+w/iM9RSw2p3/R5DlGqHJoL6bqTG8xnI8iJJvsFbZls17PZFlJiP3aTaodIDQ24e8t/
         iTnMr7dnd2Epl3zDxT3NmqOCAzeamgub62eIHGeveP0Qdqa+GzWlmtTZKS0SlPw7ATqo
         Z4hHh8lsZVzTWqN8j33RGTmFUCjm7aIbKHN2gPUBtlsJ/Ku70l6JXKQFzWJf13Nnu7Pc
         PD2UBfPt2osIg3VySjoU6h/WaqDJQNkHYBEzC8562fG0/3UxEDF8eQFWik9Mgehjejwy
         ieVw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Si77OKCMvJXnPqv2ImWOiRDUofgWddnnKAHxXcHEUQ38YT02p7ta0OQifCcPRP3nm8J8zaeRsO2FXlNn@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0s9s4LZlsFVElRVCxCTtA3eeKdzakPeuZKXoTKKrRhDmK/KZ
	+/vtcg97dIPK5iCBPT8hqX1WK5sQhzaNgRFr9Ih1Hpy781Rg3ABPd2dlQ9S1z+dBK7i0XErWRi9
	BrEEyp0mgBEfV7wybzPivXv3E1gL4wjcctYZ70BwGYrJT22kd4Y2KzlukmOXigzktkDv8
X-Gm-Gg: ASbGncvQNnw2EoD4NTezJX5vjXGcBJP9NZVh73nDLlXvzM3f7FjzfnnAIM2cbx5TfaG
	zMvxNHgu7GlFab16LZ4wzHqfLiKN8OL4m+IEmbcf88KM+fr15B5yAvwTTwcr+9hupC1dETNJ2Cs
	iJBK+J7HArGGiC3/fT7csH6AjUO3mqq15NOeDDJYDkdzp21ljx+U3elDY18Snscxc4owX5cLdwI
	9SZriU7WraclzPSr3qRPLO1DF3rBkN3dHBlwulEJa02EAVtRSn3v8O5iS1/p6FnuipD1P9o6TW0
	QycYuLO+d7yAQG9N83mpgdkwc25a48/LqAKl5Fi0O+jDWG23AqnrLoAe7s8E1y5pbMVnd+laflD
	gIvZrMHSxvotmCbS7J1DH
X-Received: by 2002:a05:620a:4310:b0:7e3:2c0d:dbf8 with SMTP id af79cd13be357-7e32c0ddfc4mr149315785a.2.1752491182443;
        Mon, 14 Jul 2025 04:06:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhTZ0DLTBSSXPn3zW9zJaHv3/h9yak2ZP6Mp/ZJM1SbXkpqrQko6k3sUc726RTE5VQHh5bkw==
X-Received: by 2002:a05:620a:4310:b0:7e3:2c0d:dbf8 with SMTP id af79cd13be357-7e32c0ddfc4mr149310085a.2.1752491181555;
        Mon, 14 Jul 2025 04:06:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee46cdsm819147066b.60.2025.07.14.04.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 04:06:20 -0700 (PDT)
Message-ID: <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:06:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w_JB161wH2MyYJpFQEJwvGyP2Z6kFKiQ
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874e4b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=N13MPgUakCYYuvbLhsgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: w_JB161wH2MyYJpFQEJwvGyP2Z6kFKiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2NSBTYWx0ZWRfX71Xifb4fXlf0
 0xWRcLbMWEE0+ZawlznDZrLZZhxQ/uNNYYC9/L6QqjIhBifEBenWdNYk/VZ6NlfLaeeJEVXxyna
 cRM4XxfYK72dOL8RjrRuOO68K9GkXkssZjdr7npzacXDSZm/TENK/t6l6AK0LbK0oGN9/DnEaQb
 oMoG+4raGrBRU9LMudcLPBnb02n5tKCHKt1zUfZWz4RWzNMwegQGBJ3BksBah8duuYDgtzlHNLV
 FtItIZh7Aa0vBLMs9VIqQwHBHNAjueS8jHM96wlBCEUrEvc9mmpq24WtJQ47Z3Zpxuh8EYHfdpg
 HDtutse+TGYszcpDCbneICcyvOe1CUczOtH8ZhKuxtF9Z6IvtGuekyMnWEo+qqgZch3i0HKkSrf
 lFNnLc7IgXTlnv/kLN8zJiBnxp/OJcUondXs3Mt/lIsbjtlAsdWcn98THNQCacOIAgukb3If
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140065

On 7/13/25 10:05 AM, Luca Weiss wrote:
> Add a devicetree description for the Milos SoC, which is for example
> Snapdragon 7s Gen 3 (SM7635).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};

I'm getting mixed information about the core topology.. 

What does dmesg say wrt this line?

CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n

> +	pmu-a520 {
> +		compatible = "arm,cortex-a520-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a720 {
> +		compatible = "arm,cortex-a720-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};

See:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

[...]

> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,milos-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f4200>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>,
> +				 <0>, /* pcie_0_pipe_clk */
> +				 <0>, /* pcie_1_pipe_clk */
> +				 <0>, /* ufs_phy_rx_symbol_0_clk */
> +				 <0>, /* ufs_phy_rx_symbol_1_clk */
> +				 <0>, /* ufs_phy_tx_symbol_0_clk */
> +				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
> +			protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
> +					<GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
> +					<GCC_PCIE_1_PHY_RCHNG_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +					<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +					<GCC_PCIE_1_PIPE_DIV2_CLK>, <GCC_PCIE_1_PIPE_DIV2_CLK_SRC>,
> +					<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>;

Does access control disallow accessing these on your prod-fused
device?

[...]

> +		usb_1: usb@a600000 {
> +			compatible = "qcom,milos-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0x10000>;

size = 0xfc_000

[...]

> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <133333333>;

Set the latter to 200000000 - your device doesn't have USB3, but the
next person may lose their hair about tracking down why it doesn't
work on theirs

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,milos-pdc", "qcom,pdc";
> +			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;

1 per line, please

> +			interrupt-parent = <&intc>;
> +
> +			qcom,pdc-ranges = <0 480 40>, <40 140 11>, <51 527 47>,
> +					  <98 609 31>, <129 63 1>, <130 716 12>,
> +					  <142 251 5>;
> +
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +		};
> +
> +		tsens0: thermal-sensor@c228000 {
> +			compatible = "qcom,milos-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c228000 0x0 0x1ff>, /* TM */
> +			      <0x0 0x0c222000 0x0 0x1ff>; /* SROT */

drop the comments

the sizes are 0x1000 for both regions for both controllers

> +
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,

pdc 26

> +				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <15>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		tsens1: thermal-sensor@c229000 {
> +			compatible = "qcom,milos-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c229000 0x0 0x1ff>, /* TM */
> +			      <0x0 0x0c223000 0x0 0x1ff>; /* SROT */
> +
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,

pdc 27

> +				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow",
> +					  "critical";
> +
> +			#qcom,sensors = <14>;
> +
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		aoss_qmp: power-management@c300000 {
> +			compatible = "qcom,milos-aoss-qmp", "qcom,aoss-qmp";
> +			reg = <0x0 0x0c300000 0x0 0x400>;
> +
> +			interrupt-parent = <&ipcc>;
> +			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +		};
> +
> +		sram@c3f0000 {
> +			compatible = "qcom,rpmh-stats";
> +			reg = <0x0 0x0c3f0000 0x0 0x400>;
> +		};
> +
> +		spmi_bus: spmi@c400000 {
> +			compatible = "qcom,spmi-pmic-arb";

There's two bus instances on this platform, check out the x1e binding

[...]

> +		intc: interrupt-controller@17100000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17100000 0x0 0x10000>,	/* GICD */
> +			      <0x0 0x17180000 0x0 0x200000>;	/* GICR * 8 */

drop the comments please

[...]

> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clock-names = "xo", "alternate";

1 a line, please

[...]

> +		cpuss0-thermal {
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				cpuss0-hot {
> +					temperature = <110000>;
> +					hysteresis = <1000>;
> +					type = "hot";
> +				};
> +
> +				cpuss0-critical {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};

See:

06eadce93697 ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")

(tldr drop non-critical trips for CPU)

Konrad

