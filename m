Return-Path: <linux-arm-msm+bounces-40111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA29E20FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 051AF16264C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921FE1F7584;
	Tue,  3 Dec 2024 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YEPhEVrF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933533FE;
	Tue,  3 Dec 2024 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733238219; cv=none; b=akZ7gbOCRE9IsSoC7hGLVWsgDvV5rj8lT7u9LAYBrnxPXnisB0q3crksDzw+pS9m/NMf0pKLPukXVkkQ13q1kx3SOHMTtTNgA/4avepW72+h4TXjHWTlrLGErnUV4Yj12pJqt6TukVzRrzrXSkxwD+xl3c06ets6i+YQfDN1kzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733238219; c=relaxed/simple;
	bh=mBYRXw2fAY2rADsGqfrX/V45Ur3RlgA4Uz9jGwAr0RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PWLdiuoVhqQ5FoYg/OVe5Qc5V+/2FErhzlfweqxs+U7TwXoCRElgLRuvTMWeU/sxsGZrlHCNOjdq/bFBDAV/56JzwkVFmHlkqybG/y1vzGYAuE1/REZCGuFOT9l+A942mjCJPIVi3UzfDJs1/hwZiLtd6Blf4EU/RDPwQa9H4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YEPhEVrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B39qfIw025869;
	Tue, 3 Dec 2024 15:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FH9erZS96n4ZTw/Bg76WPXMK3nYn4CXdCAOmD6/eekg=; b=YEPhEVrFL6T4SVhI
	DUoppbbjIktJbGeAkMT2Ykl2Im6fG5vNqd244mYkpPbBQkBRtg6TToOM3s8wBn2u
	ficbEWdWDrVWixKIiJAo69H3Bxr6UIxRjAH/AhYkojKvxGlmGHj460Cjp3RQ3y3K
	0ziyAmQxn2zMX49owUQllr2LegF4c87ArVzmeFxDm8Xto0dlP1nwaZcqsgCsOGSN
	ZC8FhLvm5AwonAhIgSRB1P5l29+UR8RFY2/mGXpnnpet9hY/ui+JhK351z6/5qVj
	RJOCOEsXYo2oFBBDUhwg5d5SXU5FgoXpxjaa/WhNWzyf8GlC4kBJ+mt6PyTLL73G
	//b62A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9gqew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 15:03:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3F3T6U026257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 15:03:29 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 07:03:24 -0800
Message-ID: <e6c17b91-e771-480e-b46d-f11c167a96bf@quicinc.com>
Date: Tue, 3 Dec 2024 20:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Shivnandan Kumar
	<quic_kshivnan@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
 <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-2-074e0fb80b33@quicinc.com>
 <ZxEwVShJuMH4J1Hp@x1> <9179759d-7af1-409f-8130-1136c9ae4ecd@quicinc.com>
 <daqa3krsp6emdha6h7tlcelsggb6qeilnojgtfxjbp5zw4n6ow@xzwdmu55ygjf>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <daqa3krsp6emdha6h7tlcelsggb6qeilnojgtfxjbp5zw4n6ow@xzwdmu55ygjf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pLAoaY0_fsUXMsB6E8PTMqaMDhOArjt_
X-Proofpoint-GUID: pLAoaY0_fsUXMsB6E8PTMqaMDhOArjt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=960 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030127



On 11/15/2024 4:18 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 06:39:48PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 10/17/2024 9:12 PM, Brian Masney wrote:
>>> On Thu, Oct 17, 2024 at 02:58:31PM +0530, Jagadeesh Kona wrote:
>>>> +	cpu0_opp_table: opp-table-cpu0 {
>>>> +		compatible = "operating-points-v2";
>>>> +		opp-shared;
>>>> +
>>>> +		cpu0_opp_1267mhz: opp-1267200000 {
>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>> +		};
>>>> +
>>>> +		cpu0_opp_1363mhz: opp-1363200000 {
>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>> +		};
>>>
>>> [snip]
>>>
>>>> +	cpu4_opp_table: opp-table-cpu4 {
>>>> +		compatible = "operating-points-v2";
>>>> +		opp-shared;
>>>> +
>>>> +		cpu4_opp_1267mhz: opp-1267200000 {
>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>> +		};
>>>> +
>>>> +		cpu4_opp_1363mhz: opp-1363200000 {
>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>> +		};
>>>
>>> There's no functional differences in the cpu0 and cpu4 opp tables. Can
>>> a single table be used?
>>>
>>> This aligns with my recollection that this particular SoC only has the
>>> gold cores.
>>>
>>> Brian
>>>
>>
>> Thanks Brian for your review. Sorry for the delayed response.
>>
>> We require separate OPP tables for CPU0 and CPU4 to allow independent
>> scaling of DDR and L3 frequencies for each CPU domain, with the final
>> DDR and L3 frequencies being an aggregate of both.
>>
>> If we use a single OPP table for both CPU domains, then _allocate_opp_table() [1]
>> won't be invoked for CPU4. As a result both CPU devices will end up in sharing
>> the same ICC path handle, which could lead to one CPU device overwriting the bandwidth
>> votes of other.
> 
> All of this should be a part of the commit message.
> 

Thanks Dmitry for your review. Will include this in commit text while posting the next series.

Thanks,
Jagadeesh

>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1588
>>
>> Thanks,
>> Jagadeesh
>>  
> 

