Return-Path: <linux-arm-msm+bounces-37908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C79C8BB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 14:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0C46B270E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8771A1FAEE0;
	Thu, 14 Nov 2024 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDOL3MU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE518C01F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731589378; cv=none; b=dVxB06PriPo7ttpUob4WBRRUcvYQedSEZBP8DBfAUepbmtlupgLugeUM55QBBJnhYln7MtMSU7WQDB/DMZv3V++4OVnLtzlKGYI00o4ZcnDA7VhOxuhpg/7UkyC7EzUmHXTDs9IPZIx6Hwvc+bwLc0/3j52psQg+w/V11IDmF3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731589378; c=relaxed/simple;
	bh=KpQSEV0F/SoadF22vnoSln4VGjlgZUVzfALiOxGi0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dyd/K47bpI2mlp3N6WsD1ZplaLK0zw9sVbLG3mMcJX/p4W2iIuvSOuBAe8IoA1nOK5gLTSMFF3gJ87rdERU/fPdTzsmvHOQ6erTWWprJ2iIfwiW8JEvF6V+2uyZ0plseH8wEVAkdOa3Hhu3PZu1jgrgQP2h3BTkabXhSE2TLzCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDOL3MU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE68c94021102
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QP2OORrJCqh4d/rWOsnd4tkvUDI8ltC0YswJYfXH6lg=; b=BDOL3MU3H3PD/qxI
	ZUIh0iZBQeQ1GWyjgc67L+Rg7fKp7N+dm4HZ8jJJgr2oYY6Cg/1bXBFqOwIH/rcF
	/eauzYhszRS4sAvFSzyaQhJFmRpCYuePAxCc+Eb57ZbqR2ciSBVu79rp64TuEmJU
	hyfbW1X7Jqx372hb0er+qJEGqiUua8S/E0ZPqkmWNJlS4hWjxMEPK2ne3QSsYoSB
	GP3eeVrW+9GzN0NGqalsWfXGpUwTHcSWl57/E8qAfSsszUC46+F+JhxMA+h2b4tU
	7FOmShb1J+ZT9WbYDfbjKnvx65r+St+3BCXdUOkPf8fVBwLim6eKUOu0R7TnX4bO
	jsh9ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kr0fc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:02:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46093edbf1fso1468601cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 05:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731589373; x=1732194173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QP2OORrJCqh4d/rWOsnd4tkvUDI8ltC0YswJYfXH6lg=;
        b=hXpzT3uWu+rXVtL4igRnbNSXhS+1bjCIt9Atg71LloXMlk8SkgycqHkWfohI42BWHw
         nU7TzPcmOZ+Wk09/uCz0XeLV+N2rajphQ3vDy3s0NUOwBtjF50eUbooQUSjUqp4I+Oqu
         rAY4XfiUGGAHmsiaJyABBsBmuLlluac6fU1tyGzNpEbPKuWDJnIBNDylriUyxqaYKD+1
         /axLePwBPlRpwmh4g+9GiXouWs/5sLCPmug3ZUVq+zTAXJ88f9Hek798V36f5cj5mSGy
         zmN+vEsp587Tya44TSwHtqb0uQB/dV1y5dcENpQwb9E6mMLJHt6M3d5/Jp903YUA6WZq
         piwA==
X-Forwarded-Encrypted: i=1; AJvYcCVF9NNimdmOTy9I+7/C2zV7tVs4/NQ9QokdCDge/erXR8nOtG6K8l9aVoGZE3Og36F6DSJf91rSGMcBqKMs@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPu7+AhCl1Z9b43PFYxbL3M4iydGZGSs308se9olg3FHJX96h
	jliN2KzvGc/e/bldEe5dLIJpSAmlCZTpaA3FT+bxS6IOL/enQlvcOJRKLBWbQZLkQ8YoguLXm5W
	uEM9S+iCDHrh0TDLCKQ5JySMATjLYL+aK4QjxosB+ilSu2ggw+8INQaE+PoE6/Pu5
X-Received: by 2002:a05:622a:13ca:b0:462:fb65:cdc5 with SMTP id d75a77b69052e-4630937948cmr149938321cf.8.1731589373585;
        Thu, 14 Nov 2024 05:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz5OO7uv5yCAm8X+yScUZ4xyIfrQ/1g7/Ukf8j7FpRrAROqzLOvWj9RwVnZUICeZpIufZ+nQ==
X-Received: by 2002:a05:622a:13ca:b0:462:fb65:cdc5 with SMTP id d75a77b69052e-4630937948cmr149938091cf.8.1731589373227;
        Thu, 14 Nov 2024 05:02:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df27068sm61531966b.8.2024.11.14.05.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:02:52 -0800 (PST)
Message-ID: <a02925d7-2d09-4902-97e4-5e7f09d7ef21@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:02:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pR_u2tZwsFq0MG4vBML_k9RK_TJQt12K
X-Proofpoint-GUID: pR_u2tZwsFq0MG4vBML_k9RK_TJQt12K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140102

On 14.11.2024 10:54 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++

This implies this patch should be two separate ones


[...]


> +&tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio0";

Sorting these in an increasing order would be welcome


>  
> +		pcie0: pci@1c00000 {
> +			compatible = "qcom,pcie-qcs8300","qcom,pcie-sa8775p";

Missing ' ' after ','

> +			reg = <0x0 0x01c00000 0x0 0x3000>,
> +			      <0x0 0x40000000 0x0 0xf20>,
> +			      <0x0 0x40000f20 0x0 0xa8>,
> +			      <0x0 0x40001000 0x0 0x4000>,
> +			      <0x0 0x40100000 0x0 0x100000>,
> +			      <0x0 0x01c03000 0x0 0x1000>;
> +
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +
> +			device_type = "pci";

Please try to match the style in x1e80100, it's mostly coherent but
things like newlines differ, which is tiny but mildly annoying

> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;

Looks like there's a bit more space in there
> +			bus-range = <0x00 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <0>;
> +			num-lanes = <2>;
> +
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7";

Please also add a "global" interrupt.. looks like it's GIC_SPI 166, but
please confirm

> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
> +
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

[...]

> +
> +			pcieport0: pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +				bus-range = <0x01 0xff>;
> +			};

Are you going to use this? If not, please drop

> +		};
> +
> +		pcie0_phy: phy@1c04000 {
> +			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
> +			reg = <0x0 0x1c04000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,

This clock goes to the RC, it should be _PHY_AUX (which you put below
as phy_aux), please replace it.

> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_CLKREF_EN>,
> +				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_0_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>,
> +				 <&gcc GCC_PCIE_0_PHY_AUX_CLK>;
> +
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "ref",
> +				      "rchng",
> +				      "pipe",
> +				      "pipediv2",
> +				      "phy_aux";

Konrad

