Return-Path: <linux-arm-msm+bounces-36249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6119B40A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 753B62833C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 02:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9112E1E0;
	Tue, 29 Oct 2024 02:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gPwHhdJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006234400;
	Tue, 29 Oct 2024 02:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730170534; cv=none; b=q7qi71YecK7hBrzSbNgGGJTr0Ih+o4VoZUmSOaWQVCSnqAQ7TKJQkSLvEoUKMG3PTxV+VGq3D4fzKd4FbPV34ET6n9d8dT0mupEzPouOZuEWLcPnMPHJ3jbUabj0J6LKBMHGJFy6OZ2vKbUu4cv+tTUwTVr62gSFSXf4HO18DzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730170534; c=relaxed/simple;
	bh=13WC6/YJrvnfTJKXDZTOqvZh3P/jsc+gh4Fk89VTH68=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pezY8Nww1tBnkgMIG3ckhUqmq1Bio1erpmxsVFSn+Ypj7YqC0/M6NNDxb2Xr7o/S81In597cK6/cbOD/hfDJydfFxucAcE3GdkkitfL/6pW+yt//0r5AWzwutXQ1ZcAGkwvx/D72GPLQiFCLWhZNVeHkoi6Hc2OueMM//P8kEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gPwHhdJF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SLTExr004837;
	Tue, 29 Oct 2024 02:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9veXxrAtnqGvDjugVwp1cHEl4z2hgL4aFqqHof0U2r8=; b=gPwHhdJFOYKAYNRN
	2pXylffBtjtle5jCPgy+C2q6XIcHNCKYI4OP5CwNAgqK146eF4k+TFfsLXgHklEI
	znjBI/EyX3P8G1qlNaVn3fJ5Iy05syvW2gzRPF1ngbNOG0oXdOqR7PunniJEvLX7
	mc9H8r6qfzE2sFsplBzSYDZYc93anHn8kCjyV5MkIte0OUaAkkvR8T/n/ulEVsNl
	maQL747yeVokQXHZixCTsav0iFaUP13cmVa65HWayPLQ7vvPVO8dNcvuuCJ1bQCk
	A29FjGBlPg2WWwnDFVEgwtBTX8VSDulctlVL20HtY8khGdlydJSWr7EChC5UED3l
	C9m2sQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt6xvsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 02:55:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T2tEFk005739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 02:55:14 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 19:55:10 -0700
Message-ID: <bd9004be-31c8-4d82-9167-a74100798918@quicinc.com>
Date: Tue, 29 Oct 2024 10:55:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS8300
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Tingwei Zhang (QUIC)" <quic_tingweiz@quicinc.com>,
        "Jinlong Mao (QUIC)"
	<quic_jinlmao@quicinc.com>,
        "Tao Zhang (QUIC)" <quic_taozha@quicinc.com>
References: <20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0McHIL_njl0gTt9m7IkJu1JS2gYaFM0t
X-Proofpoint-GUID: 0McHIL_njl0gTt9m7IkJu1JS2gYaFM0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290021



On 9/29/2024 9:53 AM, Jie Gan wrote:
> Add following coresight components for QCS8300 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> Depends-on: commit 8aeb633ce9bb ("arm64: dts: qcom: add initial support for QCS8300 DTSI")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
> This change already checked by command:dtbs_check W=1.
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2149 +++++++++++++++++++++++++++++++++
>   1 file changed, 2149 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..0b972078e130 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -277,6 +277,18 @@ system_sleep: domain-sleep {
>   		};
>   	};
>

Dear maintainers,

Kindly reminder, Could you please help to review the patch?

Thanks,
Jie

> +	dummy_eud: dummy-sink {
> +		compatible = "arm,coresight-dummy-sink";
> +
> +		in-ports {
> +			port {
> +				eud_in: endpoint {
> +					remote-endpoint = <&swao_rep_out1>;
> +				};
> +			};
> +		};
> +	};
> +
>   	firmware {
>   		scm: scm {
>   			compatible = "qcom,scm-qcs8300", "qcom,scm";
> @@ -1363,6 +1375,2143 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>   				qcom,remote-pid = <5>;
>   			};
>   		};
> +
> +		stm@4002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x4002000 0x0 0x1000>,
> +			      <0x0 0x16280000 0x0 0x180000>;
> +			reg-names = "stm-base",
> +				    "stm-stimulus-base";
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint = <&funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4003000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4003000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					qdss_tpdm0_out: endpoint {
> +						remote-endpoint = <&qdss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4004000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					qdss_tpda_out: endpoint {
> +						remote-endpoint = <&funnel0_in6>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					qdss_tpda_in0: endpoint {
> +						remote-endpoint = <&qdss_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					qdss_tpda_in1: endpoint {
> +						remote-endpoint = <&qdss_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@400f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x400f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qdss_tpdm1_out: endpoint {
> +						remote-endpoint = <&qdss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4041000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4041000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					funnel0_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel0_in6: endpoint {
> +						remote-endpoint = <&qdss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4042000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4042000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					funnel1_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in1>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					funnel1_in4: endpoint {
> +						remote-endpoint = <&apss_funnel1_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					funnel1_in5: endpoint {
> +						remote-endpoint = <&dlct0_funnel_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					funnel1_in6: endpoint {
> +						remote-endpoint = <&dlmm_funnel_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel1_in7: endpoint {
> +						remote-endpoint = <&dlst_ch_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4045000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4045000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					qdss_funnel_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in7>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					qdss_funnel_in0: endpoint {
> +						remote-endpoint = <&funnel0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					qdss_funnel_in1: endpoint {
> +						remote-endpoint = <&funnel1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@482c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x482c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					gcc_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in20>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4841000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4841000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					prng_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in19>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4850000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4850000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					pimem_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in25>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4860000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4860000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlst_ch_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlst_ch_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4861000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4861000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dlst_ch_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlst_ch_tpda_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4864000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4864000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlst_ch_tpda_out: endpoint {
> +						remote-endpoint = <&dlst_ch_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					dlst_ch_tpda_in8: endpoint {
> +						remote-endpoint = <&dlst_ch_tpdm0_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					dlst_ch_tpda_in9: endpoint {
> +						remote-endpoint = <&dlst_ch_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4865000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4865000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlst_ch_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in7>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					dlst_ch_funnel_in0: endpoint {
> +						remote-endpoint = <&dlst_ch_tpda_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					dlst_ch_funnel_in4: endpoint {
> +						remote-endpoint = <&dlst_funnel_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					dlst_ch_funnel_in6: endpoint {
> +						remote-endpoint = <&gdsp_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4980000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4980000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					turing2_tpdm_out: endpoint {
> +						remote-endpoint = <&turing2_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4983000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4983000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					turing2_funnel_out0: endpoint {
> +						remote-endpoint = <&gdsp_tpda_in5>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					turing2_funnel_in0: endpoint {
> +						remote-endpoint = <&turing2_tpdm_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@49ca000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x49ca000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					sdcc_tpdm_out: endpoint {
> +						remote-endpoint = <&dlst_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@49c0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x49c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					rdpm_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in23>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@49d0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x49d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					qm_tpdm_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in21>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4ac0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4ac0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlmm_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4ac1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4ac1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dlmm_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in28>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4ac4000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4ac4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlmm_tpda_out: endpoint {
> +						remote-endpoint = <&dlmm_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					dlmm_tpda_in8: endpoint {
> +						remote-endpoint = <&mdss1_tpdm_out>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <27>;
> +
> +					dlmm_tpda_in27: endpoint {
> +						remote-endpoint = <&dlmm_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1c {
> +					reg = <28>;
> +
> +					dlmm_tpda_in28: endpoint {
> +						remote-endpoint = <&dlmm_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4ac5000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4ac5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlmm_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in6>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					dlmm_funnel_in0: endpoint {
> +						remote-endpoint = <&dlmm_tpda_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4ad0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4ad0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlct0_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in26>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4ad1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4ad1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dlct0_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4ad3000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4ad3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlct0_tpda_out: endpoint {
> +						remote-endpoint = <&dlct0_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@13 {
> +					reg = <19>;
> +
> +					dlct0_tpda_in19: endpoint {
> +						remote-endpoint = <&prng_tpdm_out>;
> +					};
> +				};
> +
> +				port@14 {
> +					reg = <20>;
> +
> +					dlct0_tpda_in20: endpoint {
> +						remote-endpoint = <&gcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@15 {
> +					reg = <21>;
> +
> +					dlct0_tpda_in21: endpoint {
> +						remote-endpoint = <&qm_tpdm_out>;
> +					};
> +				};
> +
> +				port@17 {
> +					reg = <23>;
> +
> +					dlct0_tpda_in23: endpoint {
> +						remote-endpoint = <&rdpm_tpdm_out>;
> +					};
> +				};
> +
> +				port@19 {
> +					reg = <25>;
> +
> +					dlct0_tpda_in25: endpoint {
> +						remote-endpoint = <&pimem_tpdm_out>;
> +					};
> +				};
> +
> +				port@1a {
> +					reg = <26>;
> +
> +					dlct0_tpda_in26: endpoint {
> +						remote-endpoint = <&dlct0_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <27>;
> +
> +					dlct0_tpda_in27: endpoint {
> +						remote-endpoint = <&dlct0_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4ad4000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4ad4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlct0_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in5>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					dlct0_funnel_in0: endpoint {
> +						remote-endpoint = <&dlct0_tpda_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					dlct0_funnel_in4: endpoint {
> +						remote-endpoint = <&ddr_funnel5_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4b04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4b04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					aoss_funnel_out: endpoint {
> +						remote-endpoint = <&etf0_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					aoss_funnel_in6: endpoint {
> +						remote-endpoint = <&aoss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					aoss_funnel_in7: endpoint {
> +						remote-endpoint = <&qdss_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc_etf: tmc@4b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x4b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					etf0_out: endpoint {
> +						remote-endpoint = <&swao_rep_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					etf0_in: endpoint {
> +						remote-endpoint = <&aoss_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@4b06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x4b06000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					swao_rep_out1: endpoint {
> +						remote-endpoint = <&eud_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					swao_rep_in: endpoint {
> +						remote-endpoint = <&etf0_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4b08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4b08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					aoss_tpda_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in6>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					aoss_tpda_in0: endpoint {
> +						remote-endpoint = <&aoss_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_tpda_in1: endpoint {
> +						remote-endpoint = <&aoss_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					aoss_tpda_in2: endpoint {
> +						remote-endpoint = <&aoss_tpdm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_tpda_in3: endpoint {
> +						remote-endpoint = <&aoss_tpdm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					aoss_tpda_in4: endpoint {
> +						remote-endpoint = <&aoss_tpdm4_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm0_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm1_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm2_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm3_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm4_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@4b13000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x4b13000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@4b80000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b80000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					turing0_tpdm0_out: endpoint {
> +						remote-endpoint = <&turing0_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b81000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b81000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					turing0_tpdm1_out: endpoint {
> +						remote-endpoint = <&turing0_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b82000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b82000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					turing0_tpdm2_out: endpoint {
> +						remote-endpoint = <&turing0_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b83000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b83000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					turing0_tpdm3_out: endpoint {
> +						remote-endpoint = <&turing0_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4b84000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4b84000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					turing0_tpdm4_out: endpoint {
> +						remote-endpoint = <&turing0_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4b86000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4b86000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					turing0_tpda_out: endpoint {
> +						remote-endpoint = <&turing0_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					turing0_tpda_in0: endpoint {
> +						remote-endpoint = <&turing0_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					turing0_tpda_in1: endpoint {
> +						remote-endpoint = <&turing0_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					turing0_tpda_in2: endpoint {
> +						remote-endpoint = <&turing0_tpdm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					turing0_tpda_in3: endpoint {
> +						remote-endpoint = <&turing0_tpdm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					turing0_tpda_in4: endpoint {
> +						remote-endpoint = <&turing0_tpdm4_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4b87000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4b87000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					turing0_funnel_out: endpoint {
> +						remote-endpoint = <&gdsp_funnel_in4>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					turing0_funnel_in0: endpoint {
> +						remote-endpoint = <&turing0_tpda_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@4b8b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x4b8b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@4c40000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4c40000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					gdsp_tpdm0_out: endpoint {
> +						remote-endpoint = <&gdsp_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4c41000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4c41000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					gdsp_tpdm1_out: endpoint {
> +						remote-endpoint = <&gdsp_tpda_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4c44000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4c44000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					gdsp_tpda_out: endpoint {
> +						remote-endpoint = <&gdsp_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					gdsp_tpda_in5: endpoint {
> +						remote-endpoint = <&turing2_funnel_out0>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					gdsp_tpda_in8: endpoint {
> +						remote-endpoint = <&gdsp_tpdm0_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					gdsp_tpda_in9: endpoint {
> +						remote-endpoint = <&gdsp_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4c45000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4c45000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					gdsp_funnel_out: endpoint {
> +						remote-endpoint = <&dlst_ch_funnel_in6>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					gdsp_funnel_in0: endpoint {
> +						remote-endpoint = <&gdsp_tpda_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					gdsp_funnel_in4: endpoint {
> +						remote-endpoint = <&turing0_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4c50000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4c50000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlst_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlst_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4c51000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4c51000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					dlst_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlst_tpda_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4c54000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4c54000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlst_tpda_out: endpoint {
> +						remote-endpoint = <&dlst_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					dlst_tpda_in1: endpoint {
> +						remote-endpoint = <&sdcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					dlst_tpda_in8: endpoint {
> +						remote-endpoint = <&dlst_tpdm0_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					dlst_tpda_in9: endpoint {
> +						remote-endpoint = <&dlst_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4c55000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4c55000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlst_funnel_out: endpoint {
> +						remote-endpoint = <&dlst_ch_funnel_in4>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					dlst_funnel_in0: endpoint {
> +						remote-endpoint = <&dlst_tpda_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4c70000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4c70000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					mdss1_tpdm_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4e00000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4e00000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr_tpdm3_out: endpoint {
> +						remote-endpoint = <&ddr_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4e01000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4e01000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					ddr_tpdm4_out: endpoint {
> +						remote-endpoint = <&ddr_tpda_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@4e03000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4e03000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					ddr_tpda_out: endpoint {
> +						remote-endpoint = <&ddr_funnel5_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ddr_tpda_in0: endpoint {
> +						remote-endpoint = <&ddr_funnel0_out0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ddr_tpda_in1: endpoint {
> +						remote-endpoint = <&ddr_funnel1_out0>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ddr_tpda_in4: endpoint {
> +						remote-endpoint = <&ddr_tpdm3_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ddr_tpda_in5: endpoint {
> +						remote-endpoint = <&ddr_tpdm4_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4e04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4e04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					ddr_funnel5_out: endpoint {
> +						remote-endpoint = <&dlct0_funnel_in4>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					ddr_funnel5_in0: endpoint {
> +						remote-endpoint = <&ddr_tpda_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4e10000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4e10000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr_tpdm0_out: endpoint {
> +						remote-endpoint = <&ddr_funnel0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4e12000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4e12000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					ddr_funnel0_out0: endpoint {
> +						remote-endpoint = <&ddr_tpda_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					ddr_funnel0_in0: endpoint {
> +						remote-endpoint = <&ddr_tpdm0_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@4e20000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x4e20000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr_tpdm1_out: endpoint {
> +						remote-endpoint = <&ddr_funnel1_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@4e22000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4e22000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					ddr_funnel1_out0: endpoint {
> +						remote-endpoint = <&ddr_tpda_in1>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					ddr_funnel1_in0: endpoint {
> +						remote-endpoint = <&ddr_tpdm1_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6040000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6040000 0x0 0x1000>;
> +			cpu = <&cpu0>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm0_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6140000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6140000 0x0 0x1000>;
> +			cpu = <&cpu1>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm1_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6240000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6240000 0x0 0x1000>;
> +			cpu = <&cpu2>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm2_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6340000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6340000 0x0 0x1000>;
> +			cpu = <&cpu3>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm3_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6440000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6440000 0x0 0x1000>;
> +			cpu = <&cpu4>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm4_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6540000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6540000 0x0 0x1000>;
> +			cpu = <&cpu5>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm5_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6640000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6640000 0x0 0x1000>;
> +			cpu = <&cpu6>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm6_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@6740000 {
> +			compatible = "arm,primecell";
> +			reg = <0x0 0x6740000 0x0 0x1000>;
> +			cpu = <&cpu7>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			arm,coresight-loses-context-with-cpu;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					etm7_out: endpoint {
> +						remote-endpoint = <&apss_funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@6800000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x6800000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					apss_funnel0_out: endpoint {
> +						remote-endpoint = <&apss_funnel1_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					apss_funnel0_in0: endpoint {
> +						remote-endpoint = <&etm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					apss_funnel0_in1: endpoint {
> +						remote-endpoint = <&etm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					apss_funnel0_in2: endpoint {
> +						remote-endpoint = <&etm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					apss_funnel0_in3: endpoint {
> +						remote-endpoint = <&etm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					apss_funnel0_in4: endpoint {
> +						remote-endpoint = <&etm4_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					apss_funnel0_in5: endpoint {
> +						remote-endpoint = <&etm5_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					apss_funnel0_in6: endpoint {
> +						remote-endpoint = <&etm6_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					apss_funnel0_in7: endpoint {
> +						remote-endpoint = <&etm7_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@6810000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x6810000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					apss_funnel1_out: endpoint {
> +						remote-endpoint = <&funnel1_in4>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					apss_funnel1_in0: endpoint {
> +						remote-endpoint = <&apss_funnel0_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					apss_funnel1_in3: endpoint {
> +						remote-endpoint = <&apss_tpda_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@682b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x682b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		tpdm@6860000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x6860000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					apss_tpdm3_out: endpoint {
> +						remote-endpoint = <&apss_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@6861000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x6861000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					apss_tpdm4_out: endpoint {
> +						remote-endpoint = <&apss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@6863000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x6863000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					apss_tpda_out: endpoint {
> +						remote-endpoint = <&apss_funnel1_in3>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					apss_tpda_in0: endpoint {
> +						remote-endpoint = <&apss_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					apss_tpda_in1: endpoint {
> +						remote-endpoint = <&apss_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					apss_tpda_in2: endpoint {
> +						remote-endpoint = <&apss_tpdm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					apss_tpda_in3: endpoint {
> +						remote-endpoint = <&apss_tpdm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					apss_tpda_in4: endpoint {
> +						remote-endpoint = <&apss_tpdm4_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@68a0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x68a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					apss_tpdm1_out: endpoint {
> +						remote-endpoint = <&apss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@68b0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x68b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					apss_tpdm0_out: endpoint {
> +						remote-endpoint = <&apss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@68c0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x68c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					apss_tpdm2_out: endpoint {
> +						remote-endpoint = <&apss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@68e0000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x68e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cti@68f0000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x68f0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		cti@6900000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x6900000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +		};
>   	};
>   
>   	arch_timer: timer {
> 
> ---
> base-commit: 85ede034bcec09fe47a6f2531115176be6837017
> change-id: 20240927-add_coresight_devices_for_qcs8300-5938ee8e64f3
> 
> Best regards,


