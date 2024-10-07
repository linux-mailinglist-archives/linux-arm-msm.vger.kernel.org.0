Return-Path: <linux-arm-msm+bounces-33333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE299261E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65941281270
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885A617C203;
	Mon,  7 Oct 2024 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VCDOTumr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66371474D3;
	Mon,  7 Oct 2024 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286453; cv=none; b=VObmDmhJrtEd1ClLNES8Sn55gcm2dW4M7S78XLjKMbDyJkRfE9cKVnz5Nk74IkeM6pHAn3xJBOv/45gE4AeetK78wsXOFj3T8INjMkO6snGI22un9K+d5u7TBW3PoECIog+73hv5QoE85GAeLShzO9DJ9eqy7xZPIdPHsacN9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286453; c=relaxed/simple;
	bh=w1JPwOuGMB1004aCwZMzDIyN+BF5I8TqvdKAVnJDWaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QUjNP57cTngS1jMCxWFkBvksrBlkCnaigdyIX+MDa75mvwsY5eX6ylO6Wudw0MqGgRABrj0bUzKHKQTeEojn6IgTdUoqcCEHuyUVDa/j/E1lKGVnIzkhNOdjGHhfRUk7DURmR367Bf0xNdCcclAwzLZhdBBPi6gR6QAG1RqUNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VCDOTumr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974Snxx026380;
	Mon, 7 Oct 2024 07:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qad9gZVp3kFIE4ZknuVMl+7OJNfkTfhKg6dE2Fa+is4=; b=VCDOTumra43aT7yW
	1lk07ywUyvC5oA10RR4bTbU5O5Xl+5cesa12rER0JYQaYoqgpKRiKDinHPpwFW86
	cuYW76IQgFMNk/XKgSxID6c+9fcDdWjvzIr6K13Rkkn25SJ73zJAcL/gHg7phpom
	nHoJGewB49kGy1uX4/iKfzah4OdgxIHWOIYyX2J2xgKSL4id4eHMuHRQAf0iZ8i7
	BbgslxCfgiH6xxVzypkNhPV4gt/79JAM/Qh6RXZr8ZBcvkPcdDHmL6DuleusHibm
	6dmfWY0AX5dfRJysrmtXbnYnpwlW0Qqqws4/zXoA6k3tfP38Qjd9UchXvVO4H+T2
	BfB4zQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu6ba3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 07:34:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4977Y0uF007392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 07:34:00 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 00:33:56 -0700
Message-ID: <963d6859-73cb-8098-7457-ad7855e17491@quicinc.com>
Date: Mon, 7 Oct 2024 13:03:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V3 3/4] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, Amir Vajid
	<avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-4-quic_sibis@quicinc.com> <Zo5ySyiQ-vnGiLQa@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zo5ySyiQ-vnGiLQa@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C3omJ5ch-gB0TEreE0UEh7HyEnepuCnD
X-Proofpoint-ORIG-GUID: C3omJ5ch-gB0TEreE0UEh7HyEnepuCnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=824
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070051



On 7/10/24 17:06, Cristian Marussi wrote:
> On Wed, Jul 03, 2024 at 12:44:39AM +0530, Sibi Sankar wrote:
>> Introduce a client driver that uses the memlat algorithm string hosted
>> on ARM SCMI QCOM Vendor Protocol to detect memory latency workloads and
>> control frequency/level of the various memory buses (DDR/LLCC/DDR_QOS).
>>
>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
> 
> Hi Sibi,
>   
> just a few remarks down below...

Thanks, addressed them all in v4.

-Sibi

> 
>> V2:
>> * Make driver changes to the accommodate bindings changes. [Rob]
>> * Replace explicit of_node_put with _free.
[...]
> 
> Thanks,
> Cristian

