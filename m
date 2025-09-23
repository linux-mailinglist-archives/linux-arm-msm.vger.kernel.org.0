Return-Path: <linux-arm-msm+bounces-74493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65418B94404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 06:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C19178755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 04:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F20309DB5;
	Tue, 23 Sep 2025 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WxU555Tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0182853EE;
	Tue, 23 Sep 2025 04:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758602937; cv=none; b=Hk0Wzo6MOx0RDho2CBfjVzS2dATKQ3XiKj5RNZl0ykgvbBhyDB0Mqblst88f6TZpSJ/pLyHLbqdNkiFT5xc9ep6CANtQcO3SHTT9G/uqHhx+YA3/VmvZEgeFD0ql3akds+sT/bSGIHflWUcPiwMKWC4n2JO7PD63bdvifkMa/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758602937; c=relaxed/simple;
	bh=cOYr9JoLylsck1/NBxUODYkAXX7OQDmtO3AAwF444QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QoDEjUSgE/Ga5aqe3iWU0UXoW8end30L4k4gGkfYUZ/D1M79Juy3WJFoyEFJvb/plJw9+ZK8K/PJMgcw11ydK1dIM7tM5GZy9+LDwZyZtIthAoJE1L6rpgYw0yeeHIa8eOWAxMsbSMsFxqOUrummeUebPZZm9ZLfl2+F+Ap3LDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WxU555Tx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N4W4Lj003559;
	Tue, 23 Sep 2025 04:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2We8ulMy2suwOYO+qZaeuNvG5RhEjK+m8eDV1zDG/Y=; b=WxU555TxXQPUlD+a
	0mYDfKIo8WdRioo45Y5OgsgQnel6W/iXQlPAF2KqSbldVbG022VGNu+7yENhDApl
	KjNTw6w/EXpzymlU6wj34bd7epcYofUwze6fuWqqVPFy2JKeIUI0AR+R2fyxPlLL
	hjrKFlGpqB7yvomHeFVgsRoCIMVNzAkFh6X6W1UMyuWTTLB1NR/0T6nithZe5b1/
	iDOXeqbgQkISbmKO//uuQ7QspwhL04UclOYAJ1BhpBqajt1B+SC6CKhZJj4U3cOg
	EsSf/jRvKVyxGRVgAys6XxDhbMnIx17MTMG0U9l+Y/uB8/VN1jFqqzYd7YexCHyG
	U+D7JA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajesm5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 04:48:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58N4mpOA027858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 04:48:51 GMT
Received: from [10.219.57.130] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 22 Sep
 2025 21:48:48 -0700
Message-ID: <d72182bc-f8d4-4314-b2f1-c9242618eb67@quicinc.com>
Date: Tue, 23 Sep 2025 10:18:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Bjorn Andersson <andersson@kernel.org>
CC: <quic_bjorande@quicinc.com>, <krzysztof.kozlowski@linaro.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        Shivnandan Kumar
	<quic_kshivnan@quicinc.com>
References: <20250905113923.3944347-1-quic_pussin@quicinc.com>
 <zywvspwty3be4eadssi6sylqkhgsioramuamvvoui5tfmml2i6@zsl2nuuos377>
Content-Language: en-US
From: Pushpendra Singh <quic_pussin@quicinc.com>
In-Reply-To: <zywvspwty3be4eadssi6sylqkhgsioramuamvvoui5tfmml2i6@zsl2nuuos377>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vvZwewqFEyVkY8lz3majQ5EdmkGss77C
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d226b4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=UwZu3d0_CZYvvoKxNc8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXyMj8AVr/B9vl
 rvNBqIhoDSpiiobCnBsnZjvynFVS8UnlDjDiYX/HAh2FtTzjKjv3uIbwTa3vJhP0/1V7JrfF1XO
 0vJEBV7C1Hd798WCl2Vy+PSWEjNMfkHQVC2Hq/xsrkVMJJepHuDl6VzpnSBG/pullWdHqd7Bu/H
 A8kllW8yfPKkIub9UDg1bhYPkaRJ/Fii964qebfxU3ERb9jopzqr+K6sgsurlRK2Uk2bGlTuamR
 cCzv+dnB/XR4C+B4HtUyVfj65hGCB4ZwFn2A4pQMxtCBhBJ2Ikvy3kY/QGkuvwIn6rjOa2EQuHW
 QPsx4UYpVJ0XVfzCzleY+fQXkNrqPWI8s+6trTeie5+2/loHxOctZjA3xkxrtf4LIy0cwdVuELX
 FmRmLGKB
X-Proofpoint-ORIG-GUID: vvZwewqFEyVkY8lz3majQ5EdmkGss77C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168



On 9/6/2025 1:17 AM, Bjorn Andersson wrote:
> On Fri, Sep 05, 2025 at 05:09:23PM +0530, Pushpendra Singh wrote:
>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>
>> Update zone1_thres_count to 3 from 16 so that
>> driver can reduce bus vote in 3 sample windows instead
>> of waiting for 16 windows.
>>
> 
> Please start your commit message by describing the problem.
> 

Ack, will fix it in the next re-spin

>> The 16-window (64 ms) waiting time is too long to reduce the
>> bus vote. At higher FPS, there will be multiple frames in 64ms
>> e.g. 4 frames at 60FPS in 64ms. Hence, delay of 64ms in decision
>> making will lead to higher power regression. We tested across
>> multiple usecases, and observed significant power savings.
>>
> 
> I asked in v1 what the tradeoff is here. Is lower number better in all
> cases? What are we loosing by making it 3?
> 
> And why 3, why not 2 or 4, or 7?
> 
> 
> I'm not saying that 3 is wrong, just saying that the commit message
> needs to sufficiently explain why 3 is the "best" number.
> 

There is no strict algorithmic logic behind selecting the value 3. 
We experimented with multiple values including 2, 3, 4, 5, 7, etc.  
to evaluate the impact on both power savings and system stability.
-Lower values (like 2) made bwmon more jittery. 
-Higher values (like 4 ,5 or 6) were more stable but less responsive,
 leading to reduced power savings.
-Value 3 struck the best balance, it provided efficient power
 savings while maintaining stable bwmon behavior without jitter.

Sure will update the commit message too.

Regards,
Pushpendra Singh

> Regards,
> Bjorn
> 
>> USECASE				zone1_thres_count=16     zone1_thres_count=3
>> 4K video playback       236.15 mA                  203.15 mA
>> Sleep					   7mA			   			6.9mA
>> Display (dle display)    71.95mA			       67.11mA
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
>> ---
>> Changes in v2:
>> -Update commit message
>> -Link to v1:https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com
>>
>>  drivers/soc/qcom/icc-bwmon.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
>> index 3dfa448bf8cf..a245a8b2cfef 100644
>> --- a/drivers/soc/qcom/icc-bwmon.c
>> +++ b/drivers/soc/qcom/icc-bwmon.c
>> @@ -827,7 +827,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
>>  static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
>>  	.sample_ms = 4,
>>  	.count_unit_kb = 64,
>> -	.zone1_thres_count = 16,
>> +	.zone1_thres_count = 3,
>>  	.zone3_thres_count = 1,
>>  	.quirks = BWMON_HAS_GLOBAL_IRQ,
>>  	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
>> @@ -846,7 +846,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
>>  static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
>>  	.sample_ms = 4,
>>  	.count_unit_kb = 64,
>> -	.zone1_thres_count = 16,
>> +	.zone1_thres_count = 3,
>>  	.zone3_thres_count = 1,
>>  	.quirks = BWMON_NEEDS_FORCE_CLEAR,
>>  	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
>> -- 
>> 2.34.1
>>


