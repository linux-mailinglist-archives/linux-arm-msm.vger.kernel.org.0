Return-Path: <linux-arm-msm+bounces-39514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD79DBEE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 04:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A0F2819E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277B51527B1;
	Fri, 29 Nov 2024 03:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aOIrt+wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3013C80D;
	Fri, 29 Nov 2024 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732850027; cv=none; b=f1HbzT9lbcRStqNcvQ/kieQEex6dDEaRcV75Xqk6XZ2edMKB5pfWo9pFGd5Rfw8oU4Y6lWVVLTETswm9fmT30zXWF27iMLVhW0ZghXkYXqd/x7R415zWvoJMdk3NfjaiJL094HcnGtau8Tq59hZloVOt1wIVoxIyLBHInvQK5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732850027; c=relaxed/simple;
	bh=oCiXwmYSuYTuCgC4gyt9psduj4w5C3C49kxejYtkAUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qiLGVXuc6PRNny+jvdkw0eoF+xcMtcNMw6QH6CrAmtpCz7lvpcxZUCg2cd11Xp8WAwvIGTbtw0UdZbLdHwshUue+02AmB2raR4VAG1uLP2uehkmD33Q8oBoK6O8fUmYeGSWPe6eL4r8ByMD1LTq1O9ikYDjbrQbbgr6RMnx44kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aOIrt+wa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLh2kN003301;
	Fri, 29 Nov 2024 03:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bJ+WEiVEgaL9ON4SZEKQ7F2QFUEWmi4P0r3ZZuKakQ=; b=aOIrt+wamggA7xOT
	xBfTBIQi2YuQ59+d3P4fzyD5Wo9iJOefEdvfGl3lucOZm7Jg5BcmyQInuXxFrb/T
	InK6vBGUQ+bF4w3OdmDa175Zr6ebpnXKAx+4H1rFLE21UiZXf4EYrDOAloRaUFku
	Vi8hyz4Mi84ev11HlvjNO1qmyrfPSCTwc3SZ+kknkMeaDiUgly1/+8zu5YSi1B2I
	nh39jjJwYZTHPb1h9WEIC0KOCmbQs8j05+VOE77rYDC/0RFv39s0c03v/pR7rk3V
	fSChM1/sHRFuzbCPhp4nqfMKN1xkg5zNa943H719LKB3rHxtdb5VyW3TiZVVY8AH
	/RDQ6A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvv8yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 03:13:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT3DZfk032241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 03:13:35 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 19:13:31 -0800
Message-ID: <3bdca75a-39aa-4ad8-a3f0-8124a0977c06@quicinc.com>
Date: Fri, 29 Nov 2024 11:13:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
 <hswfcxj6vlutl7covrbqqzueljv6nkm3q4qrgccii3zh72qrig@spfbtrvrar5f>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <hswfcxj6vlutl7covrbqqzueljv6nkm3q4qrgccii3zh72qrig@spfbtrvrar5f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EeLEciBfORcjoVRiix2OaqBS4TwvytZ5
X-Proofpoint-ORIG-GUID: EeLEciBfORcjoVRiix2OaqBS4TwvytZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290024

On 11/28/2024 9:29 PM, Dmitry Baryshkov wrote:
>> +#include "qcs8300.dtsi"
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
>> +	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		xo_board_clk: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <38400000>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <32000>;
>> +		};
> Move both clocks to the qcs8300.dtsi. If you wish, you can keep
> frequencies in the board DT file.
> 
Dmirty,

Move xo clock and sleep clock to board DT from SoC DT are due to review 
comments in [1] and [2].

As you and Krzysztof discussed in [3], there're pros and cons for 
different solutions. There are three possible ways.

Put these two clocks in board DT is aligned with hardware. These two 
clocks are provided by PMIC instead of SoC.

Put these two clocks in SoC DT can reduce duplication since they are not 
supposed to be changed on different board.

Put these two clocks in SoC DT and set frequency in board DT.

We need a unify way to deal with this kind of nodes and keep it 
consistent across Qualcomm SoC.

Who shall make this decision?

[1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
[2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/
[3]https://lore.kernel.org/all/4kopdkvbkrpcpzwteezm427ml5putqvzsnfkpmg76spsple7l5@mg7v3ihwxnit/

>> +	};
>> +};
>> +


-- 
Thanks,
Tingwei

