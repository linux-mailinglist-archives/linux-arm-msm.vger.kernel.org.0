Return-Path: <linux-arm-msm+bounces-82186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A4C67C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1E0EA29D25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB712EE60F;
	Tue, 18 Nov 2025 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DWxGppj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D462DEA8F;
	Tue, 18 Nov 2025 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448395; cv=none; b=VG6DoDTMFhwwYyNBcdPrNUY2MzZITtGc1W8LaAYd093DVhUXgyNTvP1lIeOD+adNI1Tqan8csm+9zgS3eyzTxrpiQvkrN/q62J5fDpY0BI6Rme+AcCoocpCtcxAJaJLMNlXo9thCt/HKTY//l4gCIcXkrxNscp9LdeQg2K54Pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448395; c=relaxed/simple;
	bh=EjA5vDm0Op4QxEH9K+SK0VUn+d+2KQ2NPjutTgHXP/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V7r17e0TTvRU+Mz3fm4olQ8kZ0n6k5aRVRCuPFHF/Rql0E65k1ISAJ3cgQ0ec7Q6xtpOg+XM/cLUEtx1QTDcqo+zUAQHSWA7EUNPbl/oCBf9eq4bh/j9ekxn5BEwKjzwyrVHoPpaShOl/5r1CLcIOwK+b0G2HddLCSGAdLBNFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DWxGppj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI62P8q3671205;
	Tue, 18 Nov 2025 06:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq/i52jiwSMlptf0H3q0Yy0fcgFkhoOEY4QT3Bucd54=; b=DWxGppj5zlN/4OBU
	AkGF3xlHb+0X6uYqsqeAy62LruF8QMw+Ni4qjWGBzH0BDwmQUfELOYcqd4LNRxrX
	QZhhzPYsof3OdH3CaQPpq35AOdyAb1L9JnZULv9pnV3PUQnONxv63KvMXG1J/rZ0
	v3NM78XxqFoSGCd0MJo/EjlGpaSxOiSkxMtI1kg/GCuMLnw5PQv92jBbpVFhdHVA
	ZLYB9MfSYIDipCeJMknbRGAqG9ociFls1M04YfCkANaojD++iJyHfCAUrd5br9kq
	A/NdU0VxngjEI0RH9Lxc6TiheSErX3nwAa8yYhqt8twAR6rkh/BFEI+BC0o525fE
	fJ3OYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g5b16b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:46:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AI6kPqK012112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:46:25 GMT
Received: from [10.217.223.10] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 22:46:22 -0800
Message-ID: <283e7a7d-c69b-4931-8e54-d473f0209abe@quicinc.com>
Date: Tue, 18 Nov 2025 12:16:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>,
        "kernel test
 robot" <lkp@intel.com>
References: <20251117062737.3946074-1-quic_utiwari@quicinc.com>
 <121a5d34-e94f-4c29-9d58-4b730757760a@oss.qualcomm.com>
Content-Language: en-US
From: Udit Tiwari <quic_utiwari@quicinc.com>
In-Reply-To: <121a5d34-e94f-4c29-9d58-4b730757760a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691c1641 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=L8fxxsVMIK7yTSvqquAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: yKWcV-vDCo5PaHv5hRlSkH1BUnkx6EHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MiBTYWx0ZWRfX2XDom9HuqI4R
 3dy6appvwx/egeSXR9q0aG4glBEDwsZUCsaW9K+52m+f+zpAPC8Zw42SPURJqJlH0FjKQPy6JPI
 MljElZeX84pwxWlScebYGRpVOu6bgv7kHtuwWh6h3VnBJe/Csr3HgYGV5NhzXO9vN12LIi8GTID
 7vIwawfWtbqtQwVz1aFwRKlfsI+PMnrKh4hEVuQG0v80UzGDcICCeBgJCkcNjBcELy3kXJbqXKz
 QporBu61OusUcxD3AGtfgFghufFHkyKGFQUknskn0uki4lTLUqfzqN5YM6gclpHtbDFGrNynT0l
 vqpfKYfU1uF+RZ3aFixg++TgzvWFLTDmdUgHQV2Ts3SujgMWZLmbXk8XocR4IAkBBd/XqSavBWd
 6+aCEMhs+MzIoigcj3rE9Lkb2TOsqQ==
X-Proofpoint-ORIG-GUID: yKWcV-vDCo5PaHv5hRlSkH1BUnkx6EHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180052

Hi Konrad,

Thanks for the review, please find my response inline.

On 11/17/2025 5:55 PM, Konrad Dybcio wrote:
> On 11/17/25 7:27 AM, quic_utiwari@quicinc.com wrote:
>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>
>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>> runtime power management (PM) and interconnect bandwidth control.
>> As a result, the hardware remains fully powered and clocks stay
>> enabled even when the device is idle. Additionally, static
>> interconnect bandwidth votes are held indefinitely, preventing the
>> system from reclaiming unused bandwidth.
>>
>> Address this by enabling runtime PM and dynamic interconnect
>> bandwidth scaling to allow the system to suspend the device when idle
>> and scale interconnect usage based on actual demand. Improve overall
>> system efficiency by reducing power usage and optimizing interconnect
>> resource allocation.
>>
>> Make the following changes as part of this integration:
>>
>> - Add support for pm_runtime APIs to manage device power state
>>    transitions.
>> - Implement runtime_suspend() and runtime_resume() callbacks to gate
>>    clocks and vote for interconnect bandwidth only when needed.
>> - Replace devm_clk_get_optional_enabled() with devm_pm_clk_create() +
>>    pm_clk_add() and let the PM core manage device clocks during runtime
>>    PM and system sleep.
>> - Register dev_pm_ops with the platform driver to hook into the PM
>>    framework.
>>
>> Tested:
>>
>> - Verify that ICC votes drop to zero after probe and upon request
>>    completion.
>> - Confirm that runtime PM usage count increments during active
>>    requests and decrements afterward.
>> - Observe that the device correctly enters the suspended state when
>>    idle.
>>
>> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-lkp@intel.com/
>> ---
>> Changes in v4:
>> - Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
>> - Add Reported-by and Closes tags for kernel test robot warning.
> 
> The tags are now saying
> 
> "The kernel test robot reported that the QCE driver does not have PM
> operations and this patch fixes that."
> 
> Which doesn't have a reflection in reality.
> 
> [...]
> 
I may be misunderstanding this comment but the bot flagged W=1 
unused-function warnings under !CONFIG_PM. In v4 I added __maybe_unused 
and Reported-by/Closes for that exact warning; I didn’t mean to imply 
the driver lacks PM ops.
>> +/* PM clock helpers: register device clocks */
> 
> Missing \t
> 
sure will fix it in v5 with other suggestions after my responses.

>> +	ret = devm_pm_clk_create(dev);
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
>> -	if (IS_ERR(qce->iface))
>> -		return PTR_ERR(qce->iface);
>> +	ret = pm_clk_add(dev, "core");
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
>> -	if (IS_ERR(qce->bus))
>> -		return PTR_ERR(qce->bus);
>> +	ret = pm_clk_add(dev, "iface");
>> +	if (ret)
>> +		return ret;
>>   
>> -	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
>> +	ret = pm_clk_add(dev, "bus");
>> +	if (ret)
>> +		return ret;
> 
> Not all SoC have a pair of clocks. This is going to break those who don't
> 
> Konrad
On the concern that not all SoCs have "core/iface/bus" clocks and that 
this could break those platforms: i believe the PM clock helpers are 
tolerant of missing clock entries. If a clock is not described in DT, 
pm_clk_add will not cause the probe to fail, also on such platforms, 
runtime/system PM will simply not toggle that clock.

I’ve tested this on sc7280 where the QCE node has no clock entries, and 
the driver probes and operates correctly; runtime PM and interconnect 
behavior are as expected.

If you’d like this handled in a specific way, please let me know—I’m 
happy to implement that approach.

Udit

