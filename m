Return-Path: <linux-arm-msm+bounces-57060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B5AAD605
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 096FD7A5579
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D01F20F08C;
	Wed,  7 May 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EZ8QvTp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C98420F081;
	Wed,  7 May 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599099; cv=none; b=mU7GZqqapR9RIi0zkvAp4EyazSHgoeHt3vHa4dbOOymHYzSQeXUReTVrp2K1j5wB14iGV87x7yegvucxztePEz5tuQw0YrOp6KRSqs2GIps5OdN131OpShhZdI14RwrUVNScd8jUVCs2Ppr+Arl1oBswy3Fc+XtrjmIuBmJzRSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599099; c=relaxed/simple;
	bh=BFQAilsQfkkW5TKAYbuvAsi9ETojm1QM8aafoWYFGsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MM0WxJyiFy7yrqZLTuoTDOInAhgPDsTlMgrQR/sgfJA77zldSKcYDnqBMIlAd1B4EyZ22dXlnOTWbJwZ/y0/DzhWzdUpybJljf3SI63kCbLVrWeyLCBQj0zseHfACmkqTYkqXAMgxAk7NfeI46jlFa/W+fISq01UTmJjcNcv6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EZ8QvTp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GuGB018182;
	Wed, 7 May 2025 06:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8R/GT/bOHvk4uAN3n3vAvKXvU2kOcAalS8QYNNaCx4E=; b=EZ8QvTp6Z++SqYfM
	lInNhfcELV/jhqGA+2errvSmksyv3qPEv2v67FXkWDuKDOa28tbCTpLzUGABp6xE
	96+e/dfWPaRmvdwVBJa8qN7tvY3HEfwZl7fvLpbPIjCrkfCniq1yrj4LvMFRlvon
	gR5xbzOVO1YTPyXJelPEkzcoy7xF0tONwYWI3FDVpW8vGnffdx3eUhI4ovlCAtJV
	6GBQyOsXaf49xk1IVlvnTyCt7MAXy+QaT5rNCRIPUG+9KpORFvUS6L+QvPk4CDEb
	mNc1gawNBed9Wlu31x/fWhCcLSsV5yibrBSzxxTOYzkpMG2KpXpr/KGKKZYh4YgR
	lHI1Tw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbcmrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:24:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5476OorZ018055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 06:24:50 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 23:24:43 -0700
Message-ID: <58ea4571-da8e-4c95-9f3b-2fb620b93955@quicinc.com>
Date: Wed, 7 May 2025 14:24:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
 <c8e36d23-3325-4ad8-91da-94f9f31c3c15@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <c8e36d23-3325-4ad8-91da-94f9f31c3c15@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -VwfRwuHfcXCVGyyfmNbWVQmbt8L5q-m
X-Proofpoint-GUID: -VwfRwuHfcXCVGyyfmNbWVQmbt8L5q-m
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681afcb3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=rdDY_BgHlA3xo_wucG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA1OCBTYWx0ZWRfX2IhwYQmajtU5
 tov5KmrXXU/4dMHudxKUwmjkDLjAfHonC2OcuRRwEMNczB77kLajckel1Dg42aQakCx5aP0Uerd
 h+TBCMSBvX3Tmg20dYpXxctBZEoGH1wY8voTyeaOvVXlULszYfpXKalLAAW3pYwNWS+fCBgJfMu
 0rzqPooI8/V3Ia7pPuWD4vnACEa5/UzRRNwp/SqCdcoRhk4ILr6M7aI+YSShJzzxa5j/YpI0mq5
 oDONz39jaNeBZD1EYqGClRyxwENG4t6NTKLg0a7ciozGjXM1U7Wofe63wIezqQsDdo5FrIwAxeN
 ZqVvFwXDdr2epkYhtLy2fvLF7DVV2dkUsplNRt+YjCTivKrcREjWrNnMQI9aQKum0MGI7PZZZwX
 PbgaKT9GhyxMQrFhx4yAi14gnLC2qX2lx/dmuVAOxzqbfr8rE/o0mWrTj/jhJa0xAq5L4BOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=862 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070058



在 4/23/2025 5:29 PM, Konrad Dybcio 写道:
> On 4/23/25 11:17 AM, Lijuan Gao wrote:
>> From: Kyle Deng <quic_chunkaid@quicinc.com>
>>
>> The Shared Memory Point to Point (SMP2P) protocol facilitates
>> communication of a single 32-bit value between two processors.
>> Add these two nodes for remoteproc enablement on QCS615 SoC.
>>
>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index edfb796d8dd3..ab3c6ba5842b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -332,6 +332,80 @@ mc_virt: interconnect-2 {
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	qcom,smp2p-adsp {
> 
> Remove the qcom prefix

Understood, it will be updated in the next patch.
> 
>> +		compatible = "qcom,smp2p";
>> +		qcom,smem = <443>, <429>;
>> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
>> +		mboxes = <&apss_shared 26>;
>> +		qcom,ipc = <&apcs 0 26>;
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <2>;
>> +
>> +		adsp_smp2p_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		adsp_smp2p_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		sleepstate_smp2p_out: sleepstate-out {
>> +			qcom,entry-name = "sleepstate";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		sleepstate_smp2p_in: qcom,sleepstate-in {
>> +			qcom,entry-name = "sleepstate_see";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +		smp2p_rdbg2_out: qcom,smp2p-rdbg2-out {
>> +			qcom,entry-name = "rdbg";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		smp2p_rdbg2_in: qcom,smp2p-rdbg2-in {
>> +			qcom,entry-name = "rdbg";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>> +	qcom,smp2p-cdsp {
>> +		compatible = "qcom,smp2p";
>> +		qcom,smem = <94>, <432>;
>> +		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
>> +		mboxes = <&apss_shared 6>;
>> +		qcom,ipc = <&apcs 0 6>;
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <5>;
>> +
>> +		cdsp_smp2p_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		cdsp_smp2p_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		smp2p_rdbg5_out: qcom,smp2p-rdbg5-out {
>> +			qcom,entry-name = "rdbg";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		smp2p_rdbg5_in: qcom,smp2p-rdbg5-in {
>> +			qcom,entry-name = "rdbg";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>>   	qup_opp_table: opp-table-qup {
>>   		compatible = "operating-points-v2";
>>   		opp-shared;
>> @@ -3337,6 +3411,11 @@ apss_shared: mailbox@17c00000 {
>>   			#mbox-cells = <1>;
>>   		};
>>   
>> +		apcs: syscon@17c0000c {
>> +			compatible = "syscon";
> 
> There is already a description for this block above what you added
> 
> qcom,ipc under smp2p is mutually exclusive with `mboxes`, so adding
> the above isn't necessary at all
> 
> Konrad

Understood, I will remove the qcom,ipc in next patch.

-- 
Thx and BRs
Lijuan Gao


