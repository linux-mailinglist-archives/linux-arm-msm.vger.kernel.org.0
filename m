Return-Path: <linux-arm-msm+bounces-29737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4F962195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CE6F1C2427C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15F215A87A;
	Wed, 28 Aug 2024 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nOsfdB/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB591552EB;
	Wed, 28 Aug 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830972; cv=none; b=khNtVHhNXBHYR9WLjRVwyr8z5XrV0IpyLFu8rFTzkOkI8kGPL5Yzewmhdy1BboD59MmCPsEi//hTzPaB4+vldjBrZ3frs2BJYui/NV/6s/yTjz2MC8mTRSBlcWKVqCQ9JsJaYJwC3C0tCZm/gi7d3s1Z/Z1EGFWGo8dCp1PEB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830972; c=relaxed/simple;
	bh=x8lNSgnyVAVfqukk19F7f8nycin/R7tfovVRZ46bXi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jg+H8QYTjNBaIThOkusMB1709IeOELpRECA1H/k/PPe/9G95lmNR1i7nUGE555BoolRi1iRa3o2TnAz02E2ZPFFNwejlQXmxXpPheaaT2GDb2QSB865JAZez5VzObm5cA40MoC1nAJJDaQIDImpLUfILmWtLkiTf6RcYVgg7o6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nOsfdB/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLa76g020980;
	Wed, 28 Aug 2024 07:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCWsgOxbrgIosIr/7BN8CKVX4ttXYcnDeJzlJC+bpzs=; b=nOsfdB/ir34lCuT4
	kGeOm0NSkg18khZYFpoE+3KJ9Pb+UpYlnEM6Asjb82x88BA9holzXINwcG3Enk2N
	Sr8UzCk/uW0NLYabOiaLtl7VzwSdc2iYqCp+q783FLJLXc4IFmPN5ykHrETCSx31
	AbW520bq0CR3nZzjlhxSBP1tQAZtzaDNyU0LKu/Cz0z9yO+0WKWcWa0nFYze2tt8
	YV3pOyqlkdiTINeq7MTyrQFxXT2wcpfIwnQFCq+M9dZN3H9aEImzdjTtMsxO3Fpk
	2MCy2UbrC/MN0WrCuTw/QX2WoHQiZ3ePcrNLgdfc7lcU20DR0ZxFQ2yJByOlUpAV
	baLqDA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0h2yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:42:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S7gh3i018673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:42:43 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 00:42:37 -0700
Message-ID: <955c0fdc-5b04-42d6-a15d-58966c7145c4@quicinc.com>
Date: Wed, 28 Aug 2024 15:42:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: add initial support for QCS615 DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-5-5599869ea10f@quicinc.com>
 <gtoz6fzmukti7mbdihsw5ycltoozhrxgery536rh6dgpcqoru2@gd27iemigqae>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <gtoz6fzmukti7mbdihsw5ycltoozhrxgery536rh6dgpcqoru2@gd27iemigqae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9vCTBPG4BHIOexPTsJF0IX0SztEId7Fa
X-Proofpoint-ORIG-GUID: 9vCTBPG4BHIOexPTsJF0IX0SztEId7Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=820 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280054



在 8/28/2024 2:23 PM, Krzysztof Kozlowski 写道:
> On Wed, Aug 28, 2024 at 10:02:15AM +0800, Lijuan Gao wrote:
>> Add initial DTSI for QCS615 SoC. It includes base description
>> of CPUs, interrupt-controller and cpu idle on Qualcomm QCS615
>> platform.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 449 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 449 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> new file mode 100644
>> index 000000000000..cf7aaa7f6131
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -0,0 +1,449 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +
> 
> No need for blank line.
Well noted. Will update in the next patch.
> 
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	chosen { };
> 
> Drop, redundant.
Well noted. Will update in the next patch.
> 
>> +
>> +	clocks {
>> +		xo_board: xo-board {
> 
> xo-clk? xo-board-clk?
> 
> But if board, this does not sound like part of SoC. See other files how
> they do it.
> 
Other files also added ‘xo_board’. The ‘xo_board’ is the clock that will 
be used by other SoC nodes, such as rpmhcc. Currently, the node can be 
deleted as no one is using it.
> 
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> 
> labels are lowercase.
Well noted. Will update in the next patch.
> 
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			power-domains = <&CPU_PD0>;
>> +			power-domain-names = "psci";
>> +			next-level-cache = <&L2_0>;
>> +			#cooling-cells = <2>;
>> +
>> +			L2_0: l2-cache {
> 
> lowercase
Well noted. Will update in the next patch.
> 
>> +			      compatible = "cache";
>> +			      cache-level = <2>;
>> +			      cache-unified;
>> +			      next-level-cache = <&L3_0>;
> 
> Best regards,
> Krzysztof
> 
> 

-- 
Thx and BRs
Lijuan Gao

