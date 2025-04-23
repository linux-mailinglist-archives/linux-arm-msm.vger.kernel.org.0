Return-Path: <linux-arm-msm+bounces-55100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555FA98581
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0BB442664
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8EF25C804;
	Wed, 23 Apr 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5ImFb+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80025C806
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400585; cv=none; b=bOHpBxA3OdGynQ1urwfU+Te0ahvXOQpUWm+EL5RWfjA206hoJM1S95Th5lQOECbngJXsHRrQm7FcAuy9jX8FqvJGd+ZhIJ9FEp8JB2cIFIH1ge3+hQqHbI7yTGLlQRoR2XYx0DZdkP742+iIfBy9Tow4potiar6e2MuXoSfnTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400585; c=relaxed/simple;
	bh=HfajR4jkoRL29+tIXfodAl7lyAx8wExv/1di+VXnfEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n50dx+HL8qEdnGK69u/nIfnzP59H2WEqwFGCqoQAr3J/weP7qJTyEsfTkNB/iad6AAzFKc2gKcInbnVrMQBTTptlF8j0cWjgYjpCv/sOolDP4BEkjn8fvzJVciBDILe6U5SVywZhgJgxJYmNSKzDnpXDKgjf2P8zXfYcIIXpp8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5ImFb+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iN8G023235
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IJOhUo/VX2ZSjPsc4BMKNKU4usWbdjsJil7nFv3fuY=; b=P5ImFb+ijMrucFZ7
	ss1wDWWID4k5kR0pY70Sbi8UGl5gbfuHzxXi/melTqMfG3BhAVQv2ZsJkBIV5abU
	G/ASu+u48zFOw9FepRVrgnqavImvzwdhJgm4Tt9K620kLn1/vJdDKbzRd1IAl0f2
	MQZyGd1ifaCBMr60CdTgLkPbNcRMLkmdRRiOZ2UShQWX7PBrcVbRW91X6CXlsCe7
	RB9lImilI5LUwiFnioomyb+MKadqhur2sZ2nHnmHPjFm653CGrf0/D/M//mv5ZQs
	Z1lNxnZdznp11k5f1KWODFAGbCve/G4mi2f7rEKS3FZOQt9PddQRfDvCVparG868
	NicZ/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29m3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:29:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766654b0c3so11938161cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400580; x=1746005380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IJOhUo/VX2ZSjPsc4BMKNKU4usWbdjsJil7nFv3fuY=;
        b=v4Y02hqtcyKj2IpJeVtGxci3d83QBVJmfj336bh8+cHolxorE1yUBTxiDbu5qLquJA
         sFPP/fM55k8x7cCWSc3jVu9WcSJk9qbP46DENspWqJgivlh9ybteBMcYTcr0jejYpNc5
         RD3J878oMxYzr/sTOC/IpsCNt4729ZULH9JaWk/HOxbicQ6mJn5XwB3nL/WEbtEQHb/c
         XBmqJiuN5tIxcnZWxwxczcckzk4X63pTcKdMrhfAlEGIH7xi0Por6wXl8dTEFYLeelLm
         G4p+KNJxRrnzosyDxLX1+I6G+7NFQ8/1LQOkh8UPqDk+1KpIOO3hWOSF1HirWNFVx/NF
         Lb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvVsbS7mykSV3GPcvsXIPUaaOpRnFf/nW1ZhV5j8jvL6ky9YUOoAOoaFPEfAJtW10gA13D9FSIMHvSRHPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZmCoEYEJSQkCw+xzPTvV6AUgqufp4tXI4X54R0AwUbLmalin
	aA06oSqd1LYBBT0fFKMwsg7bwWZIVGvy1ZEzK4LeIuHZsoGEbJpQqrwoKR+fi2g0hBnGvW1o/Ps
	60SbVT6xJRyDxfoAiIwERg474EnLmsTBU9dF/+CeBfWXVS8d9/Y1iXLJxa+f0KlOr
X-Gm-Gg: ASbGncsJsmFdW7HJH8ljP+zxSMmkcthC6uHiwDur0+8k4colHJTNUGCmTHMc1Yd/5YI
	L3FcN4SpZQnAySI7FraCTuWK8d2sxe+nltWwK+6CibbbSWqOXvThghH17nDOcsDwzAPcr2QYkr4
	DmEb1TtyqlvPFuwQ+6skZKaG7gYmvsqaCURT5eVgPW8fFoeBZuKLqUmceOPBbYB1i5FQkSD1evC
	hyPwalpUMCjYc+amyyO/EjVRyuXEge62yOhXbQQ0rzkv1tBPdz2zUqcyua0cHGLX8U1DxKVC/GS
	dQZY2+08P2GNrcHJGpmJTOArZJi9yjRRi/7OBRHltnGLzkRjghtCHHpKgV0H46+2ynA=
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14403171cf.3.1745400580389;
        Wed, 23 Apr 2025 02:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdny5fOZQ/qOaIGMfGM2UJEzXsu/AVomAsa8SRTqZeN1JSrDmSVwu15sKN8rjBrgJBsxL5+g==
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14402971cf.3.1745400579936;
        Wed, 23 Apr 2025 02:29:39 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b30dsm789693766b.18.2025.04.23.02.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:29:39 -0700 (PDT)
Message-ID: <c8e36d23-3325-4ad8-91da-94f9f31c3c15@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1hyab4UOUBp5EBfloUOfKVJw_6DS7CpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfXwfJdWdS08OsW e02ly0P84R/06g4Ejai2XnLQQmzfA+RhGxFWgeH2tyEn7UJ9Y59qZGTcmLl9BfyJZkRGk0N0t+e fAf1ZuEhfdA6IDxRokuKqVxFvwd+q8xbYXAabQJ02ByQzaW4A+Itz21lM0+xJ8YQFaPAIypgivb
 KczoEl8AfAFNIPzv30h84MC5M0Y2dUu/Sd2KqO8qrEtVSVSotHv+3jl6S31PsIn/xlAIBEYQcHR pV2zqR63NSrS2QKixEX+fBZZTM9oODe+c4p9TObnSTlSBcr4G+3vI+LR1NfFNzgNbvL8xVoGu2D B/I8OAzRtXrSYCeoT3GpoXfrEFJoNfBXa96Q7b2HJ3AcmZaGPzRI9FXPv0ggkk58ymI36nmpLCL
 MCu37RKvRNJHE5JqsZnDV0sB+MJ9JeXYn2zTl+KW/Ix3Tr2xSDlNtX6lbKQoJgUv72YDyrIu
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808b305 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=IXTFuLhWsd_PX2s7ergA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1hyab4UOUBp5EBfloUOfKVJw_6DS7CpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=927 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index edfb796d8dd3..ab3c6ba5842b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -332,6 +332,80 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	qcom,smp2p-adsp {

Remove the qcom prefix

> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 26>;
> +		qcom,ipc = <&apcs 0 26>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		adsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		adsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		sleepstate_smp2p_out: sleepstate-out {
> +			qcom,entry-name = "sleepstate";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		sleepstate_smp2p_in: qcom,sleepstate-in {
> +			qcom,entry-name = "sleepstate_see";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		smp2p_rdbg2_out: qcom,smp2p-rdbg2-out {
> +			qcom,entry-name = "rdbg";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_rdbg2_in: qcom,smp2p-rdbg2-in {
> +			qcom,entry-name = "rdbg";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	qcom,smp2p-cdsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 6>;
> +		qcom,ipc = <&apcs 0 6>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		cdsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		cdsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		smp2p_rdbg5_out: qcom,smp2p-rdbg5-out {
> +			qcom,entry-name = "rdbg";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_rdbg5_in: qcom,smp2p-rdbg5-in {
> +			qcom,entry-name = "rdbg";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  		opp-shared;
> @@ -3337,6 +3411,11 @@ apss_shared: mailbox@17c00000 {
>  			#mbox-cells = <1>;
>  		};
>  
> +		apcs: syscon@17c0000c {
> +			compatible = "syscon";

There is already a description for this block above what you added

qcom,ipc under smp2p is mutually exclusive with `mboxes`, so adding
the above isn't necessary at all

Konrad

