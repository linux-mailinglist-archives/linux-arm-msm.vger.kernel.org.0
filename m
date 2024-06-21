Return-Path: <linux-arm-msm+bounces-23625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF5912B00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04AEBB27A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33B415EFD4;
	Fri, 21 Jun 2024 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jpJQd9nB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76110A39;
	Fri, 21 Jun 2024 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986254; cv=none; b=fWKxeE2Yuz8eYeWztBxWkuktRX2vIvMIi8Enn6mjXXBBnYUL4aG5+n4AnnNJFag8wYnt6xvH5nOAV198vEK4NuCU638TRco+PrS4Vf9K906l9IGwpkwl9M1BgjiHs3Xx5qipglTCKQpizHKJw8pgqPTsLevuhrJygMK7y1Ek5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986254; c=relaxed/simple;
	bh=r9YHpdhmFnaoXg/aYsoCzRq2YkuWPoz7IQ4Otlr55iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RjMKWaQ0K9uR3aCRhhs8zUE/BsGBlFxlmZPCEgomwR4KUCSBC3XZGMtVhnFfnMVmpaIN89TXAeUmRkvNppbba002gdEdX3h0N5dfDyl7izZ8XzIqJ9JUiWItMsCBK9AEtx/isYllWaPpGYbVB0el2H5IDdii33pFLc6SUn3tnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jpJQd9nB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L8hWZO002806;
	Fri, 21 Jun 2024 16:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWuqR9ztbNyIAjyHZp/D+k3LERxwgE+KdMF3mnKzsBw=; b=jpJQd9nBiUc+zx4T
	GUiTIX41Vrh+bYysQK32NsmVuG5lmu+AyYbVEvKUEw6f0isltfH2JjG5TyR2Jrec
	tkTlZLtoN+Fynu//e4fHKmT+c3Bei5uH3vVE3F6ammAeuqNNoi/jeH1B1k6OvUd6
	HQrZAWJVPhg6VyoQmdRYSvN87NRqHRCsfo8nL7ktatGB1Fs8PmmGeHhRBdE9PjM5
	jmQmzhMuP0s3DSdQuGMXo7rTrWfX1K6aQVcenNJzvy2YTs8UGY1wSDvxIqSKmlVo
	8bqVahMl8rnfweHCySJ3M8Gtz3JzmNn8jDxUyryr1RYNG97Zsww4b5novLnAcI5+
	s3CzjQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw68gs0y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:10:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LGACfe004404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:10:12 GMT
Received: from [10.216.56.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 09:10:04 -0700
Message-ID: <c0dee6b8-599f-4086-87d7-cc3750b46d0a@quicinc.com>
Date: Fri, 21 Jun 2024 21:39:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0uNXG96egObUG18jCdgu8i-gcJ65t2t2
X-Proofpoint-GUID: 0uNXG96egObUG18jCdgu8i-gcJ65t2t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406210116



On 6/21/2024 5:16 PM, Gokul Sriram Palanisamy wrote:
> Enable remoteproc WCSS PIL driver with glink. Also,
> configure shared memory and enables smp2p required for IPC.
> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 80 +++++++++++++++++++++++++++
>   1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 92682d3c9478..b98766cce0d6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -108,6 +108,12 @@ memory@4ac00000 {
>   			reg = <0x0 0x4ac00000 0x0 0x400000>;
>   			no-map;
>   		};
> +
> +		q6_region: memory@4b000000 {
> +			no-map;

move the no-map after reg, to align with other entries.

> +			reg = <0x0 0x4b000000 0x0 0x5f00000>;
> +		};
> +
>   	};
>   
>   	firmware {
> @@ -117,6 +123,30 @@ scm {
>   		};
>   	};
>   

...

>   
> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq8074-wcss-pil";
> +			reg = <0x0cd00000 0x4040>,
> +			      <0x004ab000 0x20>;
> +			reg-names = "qdsp6",
> +				    "rmb";
> +			qca,auto-restart;
> +			qca,extended-intc;
> +			interrupts-extended = <&intc 0 325 1>,


Use macros instead of open coding.

> +					      <&wcss_smp2p_in 0 0>,
> +					      <&wcss_smp2p_in 1 0>,
> +					      <&wcss_smp2p_in 2 0>,
> +					      <&wcss_smp2p_in 3 0>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			resets = <&gcc GCC_WCSSAON_RESET>,
> +				 <&gcc GCC_WCSS_BCR>,
> +				 <&gcc GCC_WCSS_Q6_BCR>;
> +
> +			reset-names = "wcss_aon_reset",
> +				      "wcss_reset",
> +				      "wcss_q6_reset";
> +
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "prng";
> +
> +			qcom,halt-regs = <&tcsr 0xa000 0xd000 0xe000>;
> +
> +			qcom,smem-states = <&wcss_smp2p_out 0>,
> +					   <&wcss_smp2p_out 1>;
> +			qcom,smem-state-names = "shutdown",
> +						"stop";
> +
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +
> +				rpm_requests {
> +					qcom,glink-channels = "rpm_requests";
> +				};
> +			};
> +		};
> +
>   		pcie1: pcie@10000000 {
>   			compatible = "qcom,pcie-ipq8074";
>   			reg = <0x10000000 0xf1d>,

