Return-Path: <linux-arm-msm+bounces-68883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFCB23FF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6029F7A8579
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 04:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD5E28D828;
	Wed, 13 Aug 2025 04:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ca8jKmRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D802405FD;
	Wed, 13 Aug 2025 04:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755060838; cv=none; b=O1wGxRkI593LgO/ThVJHokq5rE0McfZ2GAPL2fAg2h8PfuVnz9y6jHXHrmo71GrkdaEO49I9SDwvg9S388e9WuHYfkSQJoTHCDkGETOUxuXNDLutsyLfFe/yhNpJGpuR5zfjCM3n3eW51mg5w12zz2oBr+IxoV0EYwP8zSNI+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755060838; c=relaxed/simple;
	bh=FfBwwjQiQN1+ND4ag/wiYhG9b700n51MT/szMGvxhys=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D5N+TfY29tRlogID1ioBznhqv4trblbxlZnCuAmt49tz3nqJEqZWgV6euqNEQN4rKZqdXpfqdQ2LpUm4awDe8UeLBdl0ShOO5qPBpFIqbN++ZZlfAZZYMoF1pDV4QQx7xRXBdp+vTU0izam1BXlpW5mCWtl7TH7p+PWM04kbDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ca8jKmRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nr9g007515;
	Wed, 13 Aug 2025 04:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/sAnAeGNoXP2kp3TNROIcqC75M0V2A3y74tOLBdFK8=; b=Ca8jKmRaMdP5U1HI
	3moNVLX/X/vG0RimB4nK4LyMqWozjCkHX5EVGDWyQbvar81u2fvEn6zr78IejM5/
	yT1Ex4xjbIHFnp2leyA4qTJ10NPuq+iJ/3TWluZ5LhHvWdggrODLmWSvPhQW3k9z
	mGAI9S2Q7XEdU6Q1BGb3R+5Xh7rUbLRrHK8ZQWhxNhS0+FCvjanaYHFvksYVXAe6
	/tlWABsLuoYYzA4FD2z9uQ+HwtZ6gVJUSmpvxx2hkXS7QyIMzkWRyWqpC0oZm5G9
	PliKhs0P5+ICLKbJuogxMGhSN3GRju3m8f0bQKxX26GRRMrMAN5NT6oxaOsUTN0k
	actQBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9sj3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 04:53:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D4rqDW001290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 04:53:52 GMT
Received: from [10.219.57.130] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 21:53:49 -0700
Message-ID: <463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com>
Date: Wed, 13 Aug 2025 10:23:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Shivnandan Kumar
	<quic_kshivnan@quicinc.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
References: <20240522081508.1488592-1-quic_kshivnan@quicinc.com>
 <bc973b4f-fe8b-44e5-afbc-f3ce8a6fc873@linaro.org>
 <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
 <Zk4kFoM4wN5/BJuw@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Pushpendra Singh <quic_pussin@quicinc.com>
In-Reply-To: <Zk4kFoM4wN5/BJuw@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c1a61 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=13bii3AF_dodMXfgj6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-GUID: 9Ya4jPx8_EGHI10XRlcu7LUIzPkWV1rE
X-Proofpoint-ORIG-GUID: 9Ya4jPx8_EGHI10XRlcu7LUIzPkWV1rE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXxdUUqalkerr3
 vG3qGNIxKRHGeN1jhnyjkYN2/D5LR0i/kgvReLKWDJ1C7UZHB0Mu6FUasqCoRcI7fXMOpDFIuGZ
 5hPnV1dqi8fthO+A21SebF8l42501Qk6Rrx7PhN/hsXOtAqlL7h9b7oHmquT/naaVCV9a9OOvQZ
 UP3kD0jj4ZKa2MRtUNV0M9UCwO6K4FK/+OfCI7JIt2afmUCt4PsRlxQWBOD7NXhxRl8EUD3GIe3
 oVuWQNQG++7ajT118Ij1Bf148F+vj7Qw04Fffun3yHCxWjb08uZZXaNIi7Imn2d+9XePv9BR73P
 NYUR8WXTix6AjZMvHTnUXPmU/aCPvtKDDlddCyxm40jwEmE7xfJXd86uHx77NnhACW/plcW3TXM
 HaKgyups
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164


On 5/22/2024 10:27 PM, Bjorn Andersson wrote:
> On Wed, May 22, 2024 at 02:35:21PM +0530, Shivnandan Kumar wrote:
>>
>>
>> On 5/22/2024 1:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/05/2024 10:15, Shivnandan Kumar wrote:
>>>> Update zone1_thres_count to 3 from 16 so that
>>>> driver can reduce bus vote in 3 sample windows instead
>>>> of waiting for 16 windows. This is in line with downstream
>>>> implementation.
>>>>
>>>
>>> This might make bwmon quite jittery. I don't think downstream is the
>>> source of truth here. Please provide some measurements *on mainline tree*.
>>>
>>
>> Hi Krzysztof,
>>
>> The 16-window (64 ms) waiting time is too long to reduce the bus vote.
>> At higher FPS, there will be multiple frames in 64ms e.g. 4 frames at 60FPS
>> in 64ms. Hence, delay of 64ms in decision making will lead to higher power
>> regression. I’ve tested this change for 4K video playback on mainline tree,
>> and there’s a significant power-saving.
>>
> 
> As requested by Krzysztof already, update your commit message to capture
> such motivation.
> 
> Please read and follow this:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 

Ack, will fix it in the next re-spin

>> I propose to make it a tunable,so that user space can tune it
>> based on runtime depending on fps.
>>
> 
> I presume that in e.g. Android there could be some sort of power HAL
> that tweaks this value dynamically? In a general purpose system, how do
> we make sure that this value stays relevant for multiple types of use
> cases?
> 

At this point, we’re keeping the value static and not exposing it as a tunable parameter.

>> USECASE                     zone1_thres_count=16     zone1_thres_count=3
>> 4K video playback           236.15 mA	             203.15 mA
> 
> 4k video playback is a fairly specific (and generally unusual) use case.
> Is there any impact (negative or positive) for other use
> cases/workloads?
> 

We ran additional use cases and observed significant power savings with the updated zone1_thres_count value. Below are the results, 
 
USECASE                     zone1_thres_count=16     zone1_thres_count=3
4K video playback           	236.15 mA                  203.15 mA
Sleep			    	7mA			   6.9mA
Display (idle display)      	71.95mA			   67.11mA

Regards,
Pushpendra Singh

> Regards,
> Bjorn
> 
>>
>> Thanks,
>> Shivnandan
>>
>>> Best regards,
>>> Krzysztof
>>>


