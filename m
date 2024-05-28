Return-Path: <linux-arm-msm+bounces-20673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0418D1260
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5711F221EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BBB17C68;
	Tue, 28 May 2024 03:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d2yvxO+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD217BD6;
	Tue, 28 May 2024 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716865271; cv=none; b=cxM3BltDqXEaq9J/rm3/T1ArI19VDP0BIKvzCiS6Dnu1o4qshbTEk5lNp+EqucJoXdVAWrpTOeditQnPoboj46cj14xAGmle1k0OszjhGIgjejZYtaFS1hBJk7gfcQkpLg9ac1IK56YrP7n7dihrRuj5oWDTHK91sicJEK6u+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716865271; c=relaxed/simple;
	bh=8Rs07PERfecynx5s5/RpJ7iBfy5BVz0HmIV+jAfTlgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fGsn0g882rsnemFh+tYiKMdIwrjkuB7KivgS5Yi03vYFSDmkhBh+oO7qzXAqcsQr7n0tCGIZLABWNWicRCqz/UP7jS9apWBi1Mef0lghDMGW7L3FFsZrsJ/eeCNSysVJpkkRkTdYzDByu0PTpRMgEgMZF74Qq2Yoo2JjZLiJq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d2yvxO+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNrrFG012130;
	Tue, 28 May 2024 03:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2KOo+zQ11WgMEDh7gF8uyTLfoJU4chlwexasLNAJss=; b=d2yvxO+Am/+Fs7p1
	SP/Ilnvw0xK+1aya4iSNf3OcI0HS4g6F90FNCMPNqDIylrN2p7+7gHBY6hUfWb7U
	lyobEhxA8mgM4+lUg6K1mKNHGFuRkIBq2AJMMABFDogIhVGLxLK0da/p4ANq1np/
	leSRcm7FvpIgxNSRFnM8zrpP268hBEgroNAPOyr0hjSxhCvNQb/GwU/CdQz/B0Ev
	vq0PunlspNY64n8Vnn30kX2FLG4RInjh2DxQONU+VDFN/IQtCtPYNWeFjM8Ke6rt
	pCZNh8r9uWS+onbnoAZULmjXn579Mem5lB9r42Fz6uZ5uzjjjBtkq019clcmDbme
	f60nKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0g51ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 03:01:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44S313Uk028975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 03:01:03 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 May
 2024 20:00:59 -0700
Message-ID: <c05c9dd5-0755-4f64-9935-824081766447@quicinc.com>
Date: Tue, 28 May 2024 11:00:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sa8775p: add ADSP, CDSP and
 GPDSP nodes
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jassi Brar
	<jassisinghbrar@gmail.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Srini
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@kernel.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8OCuW-d-7rjvkWPOEAp2aN4yxF_hxzLC
X-Proofpoint-ORIG-GUID: 8OCuW-d-7rjvkWPOEAp2aN4yxF_hxzLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_06,2024-05-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=907 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280023



On 5/27/2024 4:43 PM, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 332 ++++++++++++++++++++++++++++++++++
>   1 file changed, 332 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 31de73594839..5c0b61a5624b 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>   
> @@ -544,6 +545,121 @@ cpucp_fw_mem: cpucp-fw@db200000 {
>   		};
>   	};
>   
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		smp2p_adsp_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_adsp_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-cdsp0 {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		smp2p_cdsp0_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_cdsp0_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-cdsp1 {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <617>, <616>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <12>;
> +
> +		smp2p_cdsp1_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_cdsp1_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-gpdsp0 {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <617>, <616>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <17>;
> +
> +		smp2p_gpdsp0_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_gpdsp0_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-gpdsp1 {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <617>, <616>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <18>;
> +
> +		smp2p_gpdsp1_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_gpdsp1_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>   	soc: soc@0 {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
> @@ -2479,6 +2595,92 @@ cpufreq_hw: cpufreq@18591000 {
>   			#freq-domain-cells = <1>;
>   		};
>   
> +		remoteproc_gpdsp0: remoteproc@20c00000 {
> +			compatible = "qcom,sa8775p-gpdsp0-pas";
> +			reg = <0x0 0x20c00000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_gpdsp0_in 0 0>,
> +					      <&smp2p_gpdsp0_in 2 0>,
> +					      <&smp2p_gpdsp0_in 1 0>,
> +					      <&smp2p_gpdsp0_in 3 0>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "cx", "mxc";
> +
> +			interconnects = <&gpdsp_anoc MASTER_DSP0 0
> +					 &config_noc SLAVE_CLK_CTL 0>;
> +
> +			memory-region = <&pil_gdsp0_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_gpdsp0_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_GPDSP0
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "gpdsp0";
> +				qcom,remote-pid = <17>;
> +			};
> +		};
> +
> +		remoteproc_gpdsp1: remoteproc@21c00000 {
> +			compatible = "qcom,sa8775p-gpdsp1-pas";
> +			reg = <0x0 0x21c00000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_gpdsp1_in 0 0>,
> +					      <&smp2p_gpdsp1_in 2 0>,
> +					      <&smp2p_gpdsp1_in 1 0>,
> +					      <&smp2p_gpdsp1_in 3 0>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "cx", "mxc";
> +
> +			interconnects = <&gpdsp_anoc MASTER_DSP1 0
> +					 &config_noc SLAVE_CLK_CTL 0>;
> +
> +			memory-region = <&pil_gdsp1_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_gpdsp1_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_GPDSP1
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "gpdsp1";
> +				qcom,remote-pid = <18>;
> +			};
> +		};
> +
>   		ethernet1: ethernet@23000000 {
>   			compatible = "qcom,sa8775p-ethqos";
>   			reg = <0x0 0x23000000 0x0 0x10000>,
> @@ -2546,6 +2748,136 @@ ethernet0: ethernet@23040000 {
>   
>   			status = "disabled";
>   		};
> +
> +		remoteproc_cdsp0: remoteproc@26300000 {
> +			compatible = "qcom,sa8775p-cdsp0-pas";
> +			reg = <0x0 0x26300000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_NSP0>;
> +			power-domain-names = "cx", "mxc", "nsp0";

s/nsp0/nsp/

> +
> +			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +
> +			memory-region = <&pil_cdsp0_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_cdsp0_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_CDSP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "cdsp";
> +				qcom,remote-pid = <5>;
> +			};
> +		};
> +
> +		remoteproc_cdsp1: remoteproc@2a300000 {
> +			compatible = "qcom,sa8775p-cdsp1-pas";
> +			reg = <0x0 0x2A300000 0x0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_NSP1>;
> +			power-domain-names = "cx", "mxc", "nsp1";

s/nsp1/nsp/

> +
> +			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +
> +			memory-region = <&pil_cdsp1_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_cdsp1_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_NSP1
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "cdsp1";
> +				qcom,remote-pid = <12>;
> +			};
> +		};
> +
> +		remoteproc_adsp: remoteproc@30000000 {
> +			compatible = "qcom,sa8775p-adsp-pas";
> +			reg = <0x0 0x30000000 0x0 0x100>;
> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_LCX>,
> +					<&rpmhpd RPMHPD_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
> +
> +			memory-region = <&pil_adsp_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			remoteproc_adsp_glink: glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_LPASS
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +			};
> +		};
>   	};
>   
>   	thermal-zones {
> 

-- 
Thx and BRs,
Tengfei Fan

