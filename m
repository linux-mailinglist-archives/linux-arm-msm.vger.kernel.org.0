Return-Path: <linux-arm-msm+bounces-32023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 532D097CB41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 17:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D7A1F2361D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 15:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD9F1E522;
	Thu, 19 Sep 2024 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EluOQG+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2676012B64
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758067; cv=none; b=m+HG0kM2MRdtv1Ku4eQ55VfY1GfkRJrvYgpMWoMSXq7gBvDLv/Zm6xEIQKpX0fg+Fnu/PA4+YwmjRSMH5n+elai/pPUlijBccrZGV3EcyXGsa91O05Sh3IhJIuAEtkw8BV+zd9JVkTAM11yi4bB3M6CGEvSR1GdX67OIFHMwCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758067; c=relaxed/simple;
	bh=eLZmuvXn/fL4WM7Jw14Bq199RP1dgflXKrn2gGYALlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GejzSYOzobReMRG90KoIH4lXvB2ixtYX2E1z3vDAmKzV/YoUEAbwXGpkSzhzGPpzf7lL9aa9mgYGM7/4ydys8TDd3b0O8X0E7RFXhOVi2qW6LxtOiIBOOFCi/iJ8fkpSjP7dcAXpogZTIlZTmEjIvhOC5is22+mWpE47hv/CzW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EluOQG+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JAS75E027505;
	Thu, 19 Sep 2024 15:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLw9cYn82I5U6HjJdEtejWm+SXNTfIGz8BTQuDN+ooI=; b=EluOQG+e9zif3WkS
	NmvO8xIDMNOlOHSXTb1pzhUe8x7wc3K/SlIkbWDbr743jD+/L43bepRmk4ipeJ+b
	wSMSWiDAKNMjVspqEcWrqpcmM8oQL2aF/3Ad4vF4wH9tRL03CghfadLSUtvHFHQp
	N+grGzFCMuEn6E5wwTmZ86xwtuDG2rmO/XStHCT77H7UEggmmI1jX+OqiZwroljz
	rTXxSJiM7f0pVuWxnNtw+omR0N5/G6CvMjbUA/yzZkUli9cHWdFKPlCSHa06yTLf
	qcb9cPqAqzO1RORj31zPanKGGzs5jwLDoO/Ijl9opWBh3+HBubHU1hhqKg0ycbX0
	Qolpxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnwr87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 15:00:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JF0sbX025300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 15:00:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 08:00:54 -0700
Message-ID: <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Date: Thu, 19 Sep 2024 09:00:29 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>, <andersson@kernel.org>,
        <jacek.lawrynowicz@linux.intel.com>, <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vuu4e4NILdQYs1MvxImeLQO7LzAwCNcv
X-Proofpoint-ORIG-GUID: Vuu4e4NILdQYs1MvxImeLQO7LzAwCNcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190099

On 9/18/2024 5:41 PM, Konrad Dybcio wrote:
> On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
>> The Sahara protocol has a crashdump functionality. In the hello
>> exchange, the device can advertise it has a memory dump available for
>> the host to collect. Instead of the device making requests of the host,
>> the host requests data from the device which can be later analyzed.
>>
>> Implement this functionality and utilize the devcoredump framework for
>> handing the dump over to userspace.
>>
>> Similar to how firmware loading in Sahara involves multiple files,
>> crashdump can consist of multiple files for different parts of the dump.
>> Structure these into a single buffer that userspace can parse and
>> extract the original files from.
>>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
> 
> I gave this a brief read, but.. aren't you dumping however much DRAM the
> AIC100 has (and then some SRAM) onto the host machine without the user
> asking for it (i.e. immediately after the AIC crashes)?

I'm not entirely clear what the concern is.  Too much host RAM usage maybe?

In short, I think the direct answer is yes and no.

We put the dump content in the host RAM and allow the user to decide if 
they want to save it.  The user has 5 minutes to do something with the 
dump, then the devcoredump framework automatically frees the content in 
RAM.  Typically the user would access the sysfs file provided by 
devcoredump, and save the contents to the file system for offline 
processing.

There are a few other GPUs and several other devices that do the same. 
Panfrost appears to save every BO the user allocated into the dump, 
which would suggest that the user could create an arbitrarily large dump.

In the case of AIC100, it is technically possible for the entire device 
DRAM and SRAM to be offloaded.  That is up to the FW to decide if all of 
that is relevant.  Current implementation of the FW is heavily 
aggressive on what it selects for the dump, and current dumps are in the 
100-200MB range.

It feels like you are implying the user should somehow request the dump 
by having devcoredump publish something, and then hook into the user's 
reads of the sysfs to go collect the dump.  I worry that means the 
driver would then need to determine when there is no user interested in 
collecting the dump, in order to continue the reboot process.  I expect 
that would be a 5 minute delay (devcoredump deciding there is no user 
interest after 5 minutes).  I worry that users would object to such a 
delay given customer feedback we've had on getting the devices into 
service quickly.

-Jeff

