Return-Path: <linux-arm-msm+bounces-40112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BB9E20D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F33928527D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549E91F7591;
	Tue,  3 Dec 2024 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y17tl2V0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C833FE;
	Tue,  3 Dec 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733238242; cv=none; b=U+Li2Dl+SpnrYPzFCkEAIBNzHHcpX2VpDzWo6IpQfXX5ZF6CbfFC1OR6GrHwI+Sdz0VwuawxapTe9kAo3wtRd5pj1OEKu+2HfK4f3UtwZLwXa+9Mfg3oTHd/DCsLzvZwLASJOYQw/4Syw4NFRSeQ9hozNKl+/zgCF9RFfF+22hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733238242; c=relaxed/simple;
	bh=oZxcYeeBKfP2Xf+eDmjixDYj1PkvTZRQCoJoWW36lg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pIayI8E+qo50JmwpwRte4CaK/3D5UTSYDpqndpCMpoU10oii9gMeznuRk8vjfjKK59XxCJoYKidR/mvDhaUeu+j6E6iJS9NPxYrgYWfZa7Sy5yQ7WFDk+AatXu6J5IWd3j/HB2GzaMVhhxPfNgW5ajPYNElwvXj0de3ZcPxo8zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y17tl2V0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B36NGek024941;
	Tue, 3 Dec 2024 15:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MY7TDK45v9rxCivZyWPBJNhQjz//IUsfYUZw5ZsKQRY=; b=Y17tl2V0UQ3A5LmA
	agcuIl0bUonzdbvFF8vltUEadKeYOM3ugkAOYiqd/GP4yKpaoFrVkHUwvEwyIyQ0
	4Yyf2WLLTxPXQSmWcYi4nMBYcXUdpsiDUga/lcuMTYRZ3TaV4U8q0bcp5Q/Bz8Gl
	aBZZaUVwj7A4Hov0mIrIWwM2COwK4XDI5SHKfCVv58DETha+fae1Sd6AARC6jVIA
	BQMSZgfd0SRQCwi9PKhEtoUrIaUs6ibLTgmwlIFCHk7YqhvLOctdapoh/jL5MTZD
	CDXaElr0VzvQ9sgSX1F1EvTI3LGkoGtNw+D91M+0WNXIHVpLIM6hBNFikPm7aOHq
	rHQ1RQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnys7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 15:03:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3F3r8g025733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 15:03:53 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 07:03:49 -0800
Message-ID: <d78e6fc9-2238-4f55-a604-f60df8565166@quicinc.com>
Date: Tue, 3 Dec 2024 20:33:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
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
 <5c3d91e3-e9d3-4e8d-bd4f-f7cbe765dddc@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <5c3d91e3-e9d3-4e8d-bd4f-f7cbe765dddc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A1pciyluYGEhyE04isEvtUXARHh2q3PN
X-Proofpoint-GUID: A1pciyluYGEhyE04isEvtUXARHh2q3PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=730 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030128



On 11/30/2024 8:02 PM, Konrad Dybcio wrote:
> On 14.11.2024 11:48 PM, Dmitry Baryshkov wrote:
>> On Mon, Nov 11, 2024 at 06:39:48PM +0530, Jagadeesh Kona wrote:
>>>
>>>
>>> On 10/17/2024 9:12 PM, Brian Masney wrote:
>>>> On Thu, Oct 17, 2024 at 02:58:31PM +0530, Jagadeesh Kona wrote:
>>>>> +	cpu0_opp_table: opp-table-cpu0 {
>>>>> +		compatible = "operating-points-v2";
>>>>> +		opp-shared;
>>>>> +
>>>>> +		cpu0_opp_1267mhz: opp-1267200000 {
>>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>> +		};
>>>>> +
>>>>> +		cpu0_opp_1363mhz: opp-1363200000 {
>>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>> +		};
>>>>
>>>> [snip]
>>>>
>>>>> +	cpu4_opp_table: opp-table-cpu4 {
>>>>> +		compatible = "operating-points-v2";
>>>>> +		opp-shared;
>>>>> +
>>>>> +		cpu4_opp_1267mhz: opp-1267200000 {
>>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>> +		};
>>>>> +
>>>>> +		cpu4_opp_1363mhz: opp-1363200000 {
>>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>> +		};
>>>>
>>>> There's no functional differences in the cpu0 and cpu4 opp tables. Can
>>>> a single table be used?
>>>>
>>>> This aligns with my recollection that this particular SoC only has the
>>>> gold cores.
>>>>
>>>> Brian
>>>>
>>>
>>> Thanks Brian for your review. Sorry for the delayed response.
>>>
>>> We require separate OPP tables for CPU0 and CPU4 to allow independent
>>> scaling of DDR and L3 frequencies for each CPU domain, with the final
>>> DDR and L3 frequencies being an aggregate of both.
>>>
>>> If we use a single OPP table for both CPU domains, then _allocate_opp_table() [1]
>>> won't be invoked for CPU4. As a result both CPU devices will end up in sharing
>>> the same ICC path handle, which could lead to one CPU device overwriting the bandwidth
>>> votes of other.
> 
> Oh that's a fun find.. clocks get the same treatment.. very bad,
> but may explain some schroedingerbugs.
> 
> Taking a peek at some code paths, wouldn't dropping opp-shared
> solve our issues? dev_pm_opp_set_sharing_cpus() overrides it
> 
> Konrad

Thanks Konrad for your review.

Yes, correct. I tried dropping opp-shared but it is again getting set due to
dev_pm_opp_set_sharing_cpus().

Thanks,
Jagadeesh


