Return-Path: <linux-arm-msm+bounces-24915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D39248AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 21:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D67C1F21985
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 19:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595211CD5AD;
	Tue,  2 Jul 2024 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e8P6WyGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33991BC070;
	Tue,  2 Jul 2024 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719950370; cv=none; b=SkCSkpMrMhl5q3eNhjbMlu6i8DYWLV4w1fm6y1AW+lv/drbAVYvdG3Z/8roDzXnSpFaHCtpYvL8D9Yz/z5sfLFYA7xbeMM3MDB+urbk+GvummiQ19N9bgz2s6sriWU8cyBG9fFAI63uYmlFfSDcK7DOUDn5MiKnxrzw97vNDLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719950370; c=relaxed/simple;
	bh=1owq8sejY6fMHWNWpgh0I6xoYaHBUnIsV+8udC9ATM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LaZPHF4VSRUKypg45U6gAfiAZP8h78BMlNePgTx2HLlaGBVuZ6y4k26P/lR6moEiZxydfiHr3XDuc6CHk3py/IZhXAvhKrNvcveB+8grM282+Knr76zKVejHB1BLcb6krLIEddB3qMuYN63npz1g4Iczt90oBnkNdSUIJ8+2ESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e8P6WyGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462EVAnh028794;
	Tue, 2 Jul 2024 19:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AygC3yJSa1NGcWVThZdMeR9JEegi1U7zO7HhgmeIxMY=; b=e8P6WyGJbTlwjPfo
	037VVwdzjNJIxjmV8sbLHcfmYNpwHFmI348zuho09A/YeY1MNqpovhkz9DeTje/c
	6DZQvXopolqyfLgpaekOrhMKICT8bjxCjdSWwdEa2841s/MeDHQxXXhK1Tz5/E2D
	/eW9XGPaUr08GzYSYeKGaBWyBv32iIdBqI+uCSOBeWnAYtXV9j5IxLiVsvFc4aKB
	w7pk2UzyGQAxIlEusRMgXaaNyGBrXkhXM9pYUL6kVZNeKGJ2XDV5G3TZKfyQmupr
	uv2f0zyKSwbScqMcWYyriE+lKg2DA+ZL/g6/Jat0ZEu5ZlMgCrjuBwbL8NruLISU
	j/1/5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kcth5mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 19:59:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462JxKJO026977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 19:59:20 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 12:59:14 -0700
Message-ID: <f53bc00f-8217-1dc8-5203-1a83c24d353d@quicinc.com>
Date: Wed, 3 Jul 2024 01:29:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
 <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ffa229y8pQDlHCH_7urUBK73y0grENma
X-Proofpoint-ORIG-GUID: Ffa229y8pQDlHCH_7urUBK73y0grENma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_15,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020146



On 7/2/24 21:25, Johan Hovold wrote:
> On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
>> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63 ++++++++++++++++----------
>>   1 file changed, 39 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 7b619db07694..d134dc4c7425 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -69,8 +69,8 @@ CPU0: cpu@0 {
>>   			reg = <0x0 0x0>;
>>   			enable-method = "psci";
>>   			next-level-cache = <&L2_0>;
>> -			power-domains = <&CPU_PD0>;
>> -			power-domain-names = "psci";
>> +			power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
>> +			power-domain-names = "psci", "perf";
>>   			cpu-idle-states = <&CLUSTER_C4>;
> 
>> +		scmi {
>> +			compatible = "arm,scmi";
>> +			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
>> +			mbox-names = "tx", "rx";
>> +			shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			scmi_dvfs: protocol@13 {
>> +				reg = <0x13>;
>> +				#power-domain-cells = <1>;
>> +			};
>> +		};
>>   	};
> 

Hey Johan,

Thanks for trying out the series.

> This series gives a nice performance boost on the x1e80100 CRD, but I'm
> seeing a bunch of warnings and errors that need to be addressed:
> 
> [    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> [    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> [    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> [    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> [    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> [    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> [    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.

X1E uses fast channels only for message-id: 7 (level set) and regular
channels for all the other messages. The spec doesn't mandate fast
channels for any of the supported message ids for the perf protocol.
So nothing to fix here.

> [    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
> [    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1

The duplicate entries reported by the perf protocol come directly from
the speed bins. I was told the duplicate entry with volt 0 is meant to
indicate a lower power way of achieving the said frequency at a lower
core count. We have no way of using it in the kernel and it gets safely
discarded. So again nothing to fix in the kernel.

> [    9.913506] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> [    9.922198] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!

Yeah I did notice ^^ during dev, the series isn't the one introducing it
so it shouldn't block the series acceptance. Meanwhile I'll spend some
cycles to get this warn fixed.

-Sibi

> 
> Johan
> 

