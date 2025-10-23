Return-Path: <linux-arm-msm+bounces-78594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F3C01164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 967D518C3C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EC7313287;
	Thu, 23 Oct 2025 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DS20vGZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5131076A;
	Thu, 23 Oct 2025 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222105; cv=none; b=ASWrZGpyty8IhgsnOlXYaD9IWAQRZ5mmHzpCXocJ4ntr3JiMD6kUE76HuBLMk/UGbTLtZCBReAVAFJ/wWeszYYdRsuHwiOqL1oE9IOZL/5qThO6g1weiuboSsXFBYWuSA1WNzm3fNKFP3WuyxlkAwpuBQN8DE7zAXAFXfoLKKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222105; c=relaxed/simple;
	bh=sMmkPGhdpplWALni+IITkL/qb28yjH+xEfSEqV/P9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K7Fykn1ruesHWQqq8K3D2jMj5v6g9xYTlNut7p8HduY/KY5VH+PePS9W9u3dobxlWXW7Kineov+b93niO1sMHDi48TlqBDI0v0RF9jSHZ0kI3WVz2xy+ZRW9BA/ucOgUiYCizDGGaBLeIK7gLdKa4aDyyP8NKWobuq5iU+2Zwrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DS20vGZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6Idra020167;
	Thu, 23 Oct 2025 12:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flI7ugfkonKzNXPkzz6v8j+r7iR6ZIV8NzhFfcuiNQ8=; b=DS20vGZZxA8709bc
	rl3T+SYFFnnvhxsidUxTlWxrnM3pOWJumROtkTltZV/VzvMQ/6U/D3VLff0Nf4Bm
	7UW9n273G6Ez2CpNTAk6OBVuDC3BHZR77gkUikxnDBF2XJv+/1Dd3ChZPW1jTKJQ
	Sw4vnMsnyf8TmPzSwnU6bFC/6UY5onZaMgkryDMco+ff3hvw2k0UJMkBKJcXVUIV
	d+9t8JrsV/3gqXfN49z8wrcyLNqHH2EEtJgQPJQynVgb9L79S5XMRiROqvTH5KmY
	QV2V+h+nwesYbD1eoKfoyD4qYd2bdzGosvoWm5dkVeBhVM3CqamGAD32X4I+LYnJ
	cTut9w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prk3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 12:21:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59NCLbmC022925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 12:21:37 GMT
Received: from [10.151.36.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 23 Oct
 2025 05:21:33 -0700
Message-ID: <053cdafd-1abd-4f1c-8f48-9da38591fcaa@quicinc.com>
Date: Thu, 23 Oct 2025 17:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU
 thermal zones
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
 <1039aea3-47c6-4205-826a-636e595f127d@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <1039aea3-47c6-4205-826a-636e595f127d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX1XQBLUZcyyGL
 IqhjjDxkeakQmkbcvuZvgN4AlugSC9uEfz41aoRtgga5FBYrmKx923JdmEOUrhFu6sNiyc1c79R
 RROybqRLCydavhleORhtu5RqnYHPOHC5AkQq6Q67YUB7dF1B22G6nhYlYjA60eSufnE7zd8LT9m
 mH51969LSEbQs/u+HsFTbt8gTzbqR1jsCu/g9idkISVoW68ghvRWAqn8pc+//lKlcAEEL5ooUUT
 TXqm7uPjpbNS++ocf+RFkDllzCU6a97XqrJwlQkximJjeyWEWf7IomCarWUlDGduSbtLFZgyJA3
 9FXz3iFeF5MnlSpVt+rVFulwgBPPgmiLtwMqJvebBeYGR9oJBQ/KaTlPbq+vlCxW9Ao+XRgxDl8
 gW4xPF2X1AvCWDUalHJ/3fSPOLd6LQ==
X-Proofpoint-GUID: y1mVgpig00Hh7CLRhsQhXgu2odyX-4An
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa1dd2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=lvJb9Z2Iq2x4Kuo4DdYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: y1mVgpig00Hh7CLRhsQhXgu2odyX-4An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 10/23/2025 2:09 PM, Konrad Dybcio wrote:
> On 10/23/25 6:38 AM, Manikanta Mylavarapu wrote:
>> Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
>> passive trip points with CPU cooling devices. This enables proper
>> thermal mitigation by allowing the thermal framework to throttle CPUs
>> based on temperature thresholds. Also, label the trip points to allow
>> referencing them in the cooling maps.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> [...]
> 
>>  		cpu1-thermal {
>> @@ -1254,18 +1269,28 @@ cpu1-thermal {
>>  			thermal-sensors = <&tsens 12>;
>>  
>>  			trips {
>> -				cpu-critical {
>> +				cpu1_crit: cpu-critical {
>>  					temperature = <120000>;
>>  					hysteresis = <9000>;
>>  					type = "critical";
>>  				};
>>  
>> -				cpu-passive {
>> +				cpu1_alert: cpu-passive {
>>  					temperature = <110000>;
>>  					hysteresis = <9000>;
>>  					type = "passive";
>>  				};
> 
> This means "software will start throttling the cpufreq at 110C"
> 
> Is this what you want?
> 

Hi Konrad,

Thank you for reviewing the patch.

Yes, the intent is to initiate software-based cpufreq throttling at 110°C.

> Also, is there nothing like LMH on this platform that throttles the
> device way earlier, without OS intervention?
> 

IPQ5424 platform does not support LMH.

Thanks & Regards,
Manikanta.


