Return-Path: <linux-arm-msm+bounces-28722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC72B954020
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799072855ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 03:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB7943687;
	Fri, 16 Aug 2024 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y6bktreR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB22F46;
	Fri, 16 Aug 2024 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723780327; cv=none; b=CErDgZDEsSSm+b67++AophoYGBD2CRctdo+B4QY8qpMDCfrTfgCOk0nIRzU+TBu5yBXETb43HlaZRtYM31+G511Enay++4gy8bfp6oFjBYU//QQUY4h+ixiyfV9pYj5J1StoQLgLluBRqIyhaM/peWP9JKiPbGMOzArVKnSSIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723780327; c=relaxed/simple;
	bh=oVH8wz5URkfR5N6IsHA0olZ7NNbc7PJWyvIL78FUhpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ugHcFDhSmwwmyIvkP1/TpTnW5pzFdKoBHu8IWC913EsQA7rzavFYJzDJ4sOvY1tN46PBDYY3LtCAy4rfPib5tgWC+ULeHMCEu6TRfHicZNM0YzlIkegl8eNf1QSVNMPTDC1DOMM/fyynqIIAwV+BS3T7leOChM4LnzJpIebNEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y6bktreR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FG1H55025482;
	Fri, 16 Aug 2024 03:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNsW+GJ6Kudx3rdI8U7I1i8ybKjiPsDgSiJOHiFjtaQ=; b=Y6bktreRpy9Z/kZ0
	2+2JX+sBOujCO1mqDqcaBc1OhTbLdtEw4vOw8YsX3oTZdudolm0rpybGglKaqd39
	dxNgXBPjmvSxTNqU0bM5YiSuzvHiXeKKyIhEXgaCi8tWSZ6E63QzwM+9L6ZsB0KF
	wntpLTRAQd2G2FHYdqsVSSUKxwqsQ+PARlx2SIvkBx8zpURoaX88ZTE+4JtzfqLo
	9eWye+s6HeThzhfmKj0tbN0lCcAbcD8u7/FLvNI3oXm9SHAXE2KzD0WpusMeIkGv
	Gh3Uwv05VV8IHV4wX8wDz5003iXGvn/bkuRC+Y363V2DrbYwowKo2PubgBVEheqU
	nlBJtA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411957tvvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:51:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G3pf1v006374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:51:41 GMT
Received: from [10.216.10.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 20:51:36 -0700
Message-ID: <2d882c88-fd56-c512-0dcc-8825ba920b51@quicinc.com>
Date: Fri, 16 Aug 2024 09:21:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] perf/dwc_pcie: Always register for PCIe bus notifier
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>
CC: Shuai Xue <xueshuai@linux.alibaba.com>,
        Jing Zhang
	<renyu.zj@linux.alibaba.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Yicong
 Yang" <yangyicong@hisilicon.com>,
        Jonathan Cameron
	<Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_parass@quicinc.com>,
        <quic_mrana@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-3-ca47d153e5b2@quicinc.com>
 <55303289-bb41-4e67-9912-4cf4335244ca@huawei.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <55303289-bb41-4e67-9912-4cf4335244ca@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VBabcIP9Ib1-NyQOP1j-dJZni_u4bo3j
X-Proofpoint-ORIG-GUID: VBabcIP9Ib1-NyQOP1j-dJZni_u4bo3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160026



On 8/15/2024 7:19 PM, Yicong Yang wrote:
> On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
>> When the PCIe devices are discovered late, the driver can't find
>> the PCIe devices and returns in the init without registering with
>> the bus notifier. Due to that the devices which are discovered late
>> the driver can't register for this.
>>
>> Register for bus notifier even if the device is not found in init.
>>
>> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> ---
>>   drivers/perf/dwc_pcie_pmu.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>> index c115348b8d53..aa1010b44bcb 100644
>> --- a/drivers/perf/dwc_pcie_pmu.c
>> +++ b/drivers/perf/dwc_pcie_pmu.c
>> @@ -741,8 +741,6 @@ static int __init dwc_pcie_pmu_init(void)
>>   
>>   		found = true;
>>   	}
>> -	if (!found)
>> -		return -ENODEV;
>>   
>>   	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>   				      "perf/dwc_pcie_pmu:online",
>> @@ -753,9 +751,11 @@ static int __init dwc_pcie_pmu_init(void)
>>   
>>   	dwc_pcie_pmu_hp_state = ret;
>>   
>> -	ret = platform_driver_register(&dwc_pcie_pmu_driver);
>> -	if (ret)
>> -		goto platform_driver_register_err;
>> +	if (!found) {
>> +		ret = platform_driver_register(&dwc_pcie_pmu_driver);
>> +		if (ret)
>> +			goto platform_driver_register_err;
>> +	}
>>
> 
> This doesn't match the commit.
> > If any device is found at this stage, we cannot use them since you don't
> register a driver.
> 
If the device is not found then only we are skipping platform driver
register otherwise driver will be registering with the platform driver.

- Krishna Chaitanya.
>>   	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
>>   	if (ret)
>>

