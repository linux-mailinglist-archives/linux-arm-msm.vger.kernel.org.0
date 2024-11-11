Return-Path: <linux-arm-msm+bounces-37465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EC9C3F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4E451C21953
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 13:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA4D1850AF;
	Mon, 11 Nov 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aZmqv6ae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D47158558;
	Mon, 11 Nov 2024 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731330603; cv=none; b=Cw6oFFBHYw9mmTD895jXoSWEdYHLi096Z+rZGWci9QsbM9tlEI7WpGs4Tz2nUvwvibhMnkluRVKHZ180MrCxTIsdm7wTENRIeZRe227pIZvpHeahAzZSzD2CcWgmsYMK9SFE6hbDIIJP+Ywy4dN8gy8UEK7I6alxM9Dy56Oug8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731330603; c=relaxed/simple;
	bh=ousX+3GHB7wGIoraQ08Zoo2gBqx1LoCHpPOMTrH2VIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pFPb4C+ZI4CLos6n6jKCmivL4ejHeIkeZ+y/zELYtEA+RL6gLsvA9dWtg7VnZpF87DSuPv4rQ78gys2kHGfVkDJuZI5Yobv17o4F3HkTpZZ19OyG52SdCG0MZTF0TVfnT/nWED73oZ3bblUyMx8GFzj8zvxDpqrg+wz3Tbijmsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aZmqv6ae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCAQ8d032406;
	Mon, 11 Nov 2024 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHv4y8gXFcsSx9Dqojo1tzxhO75dEf8tLjEd853vz/g=; b=aZmqv6aeQ4Hx+1H0
	9Gg8zIlR3E+bqvAFJgstkcbf4Tcgy/VKHyRFcDR8HaPxDACQXeRW2T/bdMyJaDvU
	LYAGeAQqTUxRutYeYROnZY53pxC6VxQcmHNo3RXbU5JRUIFTjEAz4zSf9fpqEgwJ
	s3Jrru0qyAhkolZgulrkp62Wtkkw6S9UOJCGiW6KR8ft/x4u/FTQ8Nj4vl8CaI4s
	Ouex+snmLddVTb24y6fG0VadFDQqO4xc2p1t5dqhDmNQO1+HPiagUCH+2mxPIc3+
	OAjaZeY/G/9u2zQkRIwOLsXuCJc5MvI23e/12rTaXT487yxBAkn4ksM68nqHmAX2
	P8GD1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syy248a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:09:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABD9u04030767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 13:09:56 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 05:09:51 -0800
Message-ID: <9179759d-7af1-409f-8130-1136c9ae4ecd@quicinc.com>
Date: Mon, 11 Nov 2024 18:39:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
To: Brian Masney <bmasney@redhat.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
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
 <ZxEwVShJuMH4J1Hp@x1>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <ZxEwVShJuMH4J1Hp@x1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0xJapzRg2XawwIJthEUOccaVD2sA96hm
X-Proofpoint-ORIG-GUID: 0xJapzRg2XawwIJthEUOccaVD2sA96hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=889 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110109



On 10/17/2024 9:12 PM, Brian Masney wrote:
> On Thu, Oct 17, 2024 at 02:58:31PM +0530, Jagadeesh Kona wrote:
>> +	cpu0_opp_table: opp-table-cpu0 {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		cpu0_opp_1267mhz: opp-1267200000 {
>> +			opp-hz = /bits/ 64 <1267200000>;
>> +			opp-peak-kBps = <6220800 29491200>;
>> +		};
>> +
>> +		cpu0_opp_1363mhz: opp-1363200000 {
>> +			opp-hz = /bits/ 64 <1363200000>;
>> +			opp-peak-kBps = <6220800 29491200>;
>> +		};
> 
> [snip]
> 
>> +	cpu4_opp_table: opp-table-cpu4 {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		cpu4_opp_1267mhz: opp-1267200000 {
>> +			opp-hz = /bits/ 64 <1267200000>;
>> +			opp-peak-kBps = <6220800 29491200>;
>> +		};
>> +
>> +		cpu4_opp_1363mhz: opp-1363200000 {
>> +			opp-hz = /bits/ 64 <1363200000>;
>> +			opp-peak-kBps = <6220800 29491200>;
>> +		};
> 
> There's no functional differences in the cpu0 and cpu4 opp tables. Can
> a single table be used?
> 
> This aligns with my recollection that this particular SoC only has the
> gold cores.
> 
> Brian
> 

Thanks Brian for your review. Sorry for the delayed response.

We require separate OPP tables for CPU0 and CPU4 to allow independent
scaling of DDR and L3 frequencies for each CPU domain, with the final
DDR and L3 frequencies being an aggregate of both.

If we use a single OPP table for both CPU domains, then _allocate_opp_table() [1]
won't be invoked for CPU4. As a result both CPU devices will end up in sharing
the same ICC path handle, which could lead to one CPU device overwriting the bandwidth
votes of other.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1588

Thanks,
Jagadeesh
 

