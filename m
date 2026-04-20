Return-Path: <linux-arm-msm+bounces-103783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBNELABA5mlutgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C783642DBC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21C8E302243E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED5C359A7C;
	Mon, 20 Apr 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sd9Al1z2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxnoR6Ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F688359A6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693759; cv=none; b=c8T2ApY4/yiGd7NOnWFY2dkMHtRTqSZCO/UdzJile4cgd9hHaRHSqRzqfb760k4zaqsPmFTMn7YcdbHKitvm1edKQ2R2tnGhTCIrXvewJ3EXUwWHNbG8YI9r/MeU+z7NsTTPdc4fjfrz+UV3xrKN8lXfE5dDKruHd13rzJjHmuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693759; c=relaxed/simple;
	bh=lGmqSKRT6CM/TxRcqxDkVJvKI4sTpx9Qlqby2pYKzIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqDBgvWhZbVds8rdkTbd/YGQX0XgXwlKGxOAOhghXoN6G/WNonA6lSpol2t39AdGCXLlq0aCEO0B3ZMbXb9OWWfdHMsXcrqoMmiBVptprSmVM0V2yEVuyP/R1RV+DsBDzM1en7Y3yxnXLaR0BkuAp+z5NZ4eBYkEv1SpE+auTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sd9Al1z2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxnoR6Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97Aqh2755646
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=; b=Sd9Al1z2o0RljW9X
	gdXXQHjsnb3eduC3tOnsYEAI4Eae4XCFSS8Q4+hIr1FGuhKx1xiQavvugLpFHI2G
	hE3jdCyu6dCDDJckL1tImFbnrR37mQf/SWuvz+HeKWwJMelbZnoj8x7pJ9gJw7Bs
	g0lBCic/2MPo8XetUritDWxONQbTP5OB5/EJyX9AVILU2czuEM3A72KoxCRa2H94
	DzH8Smi8PWyd7t3QguT16pNE2lyd+wfPqBwviZnsglcUKJxbvsUU4BUeAiebJp2Y
	HfPuNjF0R+rlOK4MkBDu6WH58SYe7MYWhEJfdZOTCpTVV/PvcJaRtzKz+6SiuPq8
	wOLeLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xh0yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:02:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f504f6b75so1670567b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776693756; x=1777298556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=;
        b=dxnoR6IcDWtnFuwISX4+u2a1VD9u1QzFuct1fAutOKeXgUAbBvPyfcFXiaQic+tqja
         qDHk/T+Q4HDpVkzwoDymM3a6UEH8BA4VYcOMg/CSNno9GKtB/1uyKCK/WDLmmpBVVS/B
         FVEdMczHzxJOWPmD5HyYHhWH0oWASMppiYBF9NeX2QjNkVgwhHGJLfSaOS6gBQgxcluZ
         VQtqkbCEXcfqmRJIlcZFlK9kbnhmm7TfA8MtPdn3TeUXnWs+njh5KkW8XEEpRUlGBkeE
         ZZIMbL4CrJCc43SLRT18FshYYKQ+yRMZmVi3GV3gMo08+QM1k82l6Aijg56T/fywcLzE
         qhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693756; x=1777298556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=;
        b=Manyu1fsnsrpDA2Z5sdNwCyRvZ/JH5qlHgBeWg+TEy2/NsPreNb4hyYJ5yFDjvEQUh
         kr/cQ5oPtNSJeEqTbhAVNkF9Mqntu2UOkaB74mO2gEInVB0uhWlcFrDjYraCM8epfa7K
         cacmB1shIoymySFcokGXKbLEL+UXk/qucKxEd6PkAIGEIvdKxRgYXG6zqFYBvtBl3mjD
         5gXfd5ZlLphD/as60P9QTrvKW6gGIcAibOeromaMg/s7cZ9wTMC2PqQTHlo7lgXjzGLn
         S6secdKg88ewBIdUIq/Rk9VzY2Jch/NzPin1R9B7HZ6Xf0VcVyZz/gy/pntigpZhyyjv
         U6tw==
X-Forwarded-Encrypted: i=1; AFNElJ8rqOketxMO4YQGv7GiT7JQF1pUcksob+mIww2jIBprJt/vsEKPt3vzKvcrgEDT+5Z3ItFD7+u8f5Xs8IYp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1EakOfRdOVW9e4wM+XWw/vmL987LOlewS1eMAYOMB+7zH38Tq
	b2w5xscSzXyfW0LtoIQwZKDJUwO5IOwmpM1tAXHNkK7hFxT3hO76+ykk9azneIRk2Fk4L5P4eDI
	1M02jzF0LPBnB4+GUF/G8L8tduZ5+DSmO3wJg3CWVhJK8Xg2cGVfaPqZ2Ze4EiZGd/Gz+
X-Gm-Gg: AeBDiesBpsHCqNzDWtdMnOYpXloOzIxRMhlQOMaOOuJwZw/eqPCSsBIK8xLWFQDW6lt
	7svNUt8/RVwoBOBpVgGmO9VzjpdX37rlLrmVUn6kNASN2qfBdT2M+32VXfZc6WB+bOXQa7e5HRd
	tifJTgBaDu0lGUJBgxmX8msI3+fuHdaJnkf4BxZw7wBhiAKKzpHQRjxhhuPrSZpAM+u4DorXAg+
	BDJye3HFy36Gp770t7NIYNE5UaYncQ1OvF5Q02Y6dsm5ahTMv06jJ56GkdrykKqefObmXnsQiMa
	gZRA3ah0VB9kfnHG5bDNoSJqLiHnLIemsFdvG6bkmJSNhHZmxth7X0AlG3Bedx7lh8+dRzh8yhj
	T8DG7HGrn6llhbbffhQtoRIBL4GU4Hn+x5R82lx0iq70pw1k2mZ0rt64sOUI72rBg
X-Received: by 2002:a05:6a00:391c:b0:781:2291:1045 with SMTP id d2e1a72fcca58-82f8c7d1002mr13029220b3a.8.1776693756133;
        Mon, 20 Apr 2026 07:02:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:391c:b0:781:2291:1045 with SMTP id d2e1a72fcca58-82f8c7d1002mr13028935b3a.8.1776693753924;
        Mon, 20 Apr 2026 07:02:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm13078240b3a.54.2026.04.20.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:02:32 -0700 (PDT)
Message-ID: <1f73fad2-1d53-dd35-2668-750eaf3fe00e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:32:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
 <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
 <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
 <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
 <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzNyBTYWx0ZWRfX1Jz3l3mxvFTI
 6B08RALGeCDTBEXynZj4kSlVd2jOlgGR5ApU1e635khxQowT2o0Pcr/yKWFoJC6B30yftYJomN8
 nBZ0tFv+VYhEgR3GogpG5w4khW26EvpOpMmaQhWEKWeLtN3Lv2dcQ8bxkanSiug4wZcxeaEQpCe
 6QuS21jopmY7SCRq+Z1NaNo1ma5D2pccA/jSbdCf16g66YsRXZ2nqTUmmwXsH1SxukAcGI/3sdI
 uA6/ac8HMc+xUHRr0TYV2Ilaz4w6u4h07ho014C+QmLdhBxSkwFSMaHCYg+xBReH3FcWeamC5Sq
 x4ZhsY6ZihRJQolVbw2ryqxz6/5kbxNFX5xjgW2nCm5yblP1Wa8bMflwHrxeCf+9PJACq4OsTrb
 haZen5EY5hjLAQb4PIrhsCw8t5hmeE4moP/+GZJTIrnryPYghFBYHibLMFW+GaKzJ1+7PB+gEJx
 tu1H2gBcV0QqWxn2rdw==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e631fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yYSL5V0MIfFtLobc5GMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ewcIFjdtaHyIIlUG44uziSpZYNbbW1E-
X-Proofpoint-GUID: ewcIFjdtaHyIIlUG44uziSpZYNbbW1E-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103783-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C783642DBC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/17/2026 11:49 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 08:29:21PM +0530, Vishnu Reddy wrote:
>> apologies for re-sending (earlier responses was rejected due to HTML format)
> Ugh.
>
>> On 4/17/2026 8:22 PM, Vishnu Reddy wrote:
>>> On 4/14/2026 8:44 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
>>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>
>>>>> Add a dedicated iris VPU bus type and register it into the iommu_buses
>>>>> list. Iris devices require their own bus so that each device can run its
>>>>> own dma_configure() logic.
>>>> This really tells nothing, unless one has full context about the Iris
>>>> needs. Start by describing the issue (that the device needs to have
>>>> multiple devices talking to describe IOMMUs / VAs for several hardware
>>>> functions), then continue by describing what is needed from the IOMMU
>>>> subsys.
>>> This series handles firmware device which do not require multiple
>>> devices part.
>>> given this device need for specific IOMMU configuration, I'll update the
>>> description
>>> accordingly.
>>>
>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/iommu/iommu.c                           |  4 ++++
>>>>>   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>>>>>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>>>>>   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>>>> How are you supposed to merge this? Through IOMMU tree? Through venus
>>>> tree? Can we add one single bus to the IOMMU code and use it for Iris,
>>>> Venus, FastRPC, host1x and all other device drivers which require
>>>> per-device DMA configuration?
>>> Separating out the bus definition and the Iris driver handling would
>>> provide a
>>> cleaner merge path.
> Then why wasn't it done from the ground up?
>
>>>> Your colleagues from the FastRPC team posted a very similar code few
>>>> weeks ago and got exactly the same feedback. Is there a reason why your
>>>> teams don't sync on the IOMMU parts at all?
>>> I would admit that I missed to review that, thank you for bringing that
>>> discussion.
>>> FastRPC patches generalizes the handling for host1x, FastRPC and the
>>> same can be
>>> extended for Iris. I have left few comments there.
>>>
>>>>>   4 files changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>>>> index 61c12ba78206..d8ed6ef70ecd 100644
>>>>> --- a/drivers/iommu/iommu.c
>>>>> +++ b/drivers/iommu/iommu.c
>>>>> @@ -13,6 +13,7 @@
>>>>>   #include <linux/bug.h>
>>>>>   #include <linux/types.h>
>>>>>   #include <linux/init.h>
>>>>> +#include <linux/iris_vpu_bus.h>
>>>>>   #include <linux/export.h>
>>>>>   #include <linux/slab.h>
>>>>>   #include <linux/errno.h>
>>>>> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
>>>>>   #ifdef CONFIG_CDX_BUS
>>>>>   	&cdx_bus_type,
>>>>>   #endif
>>>>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
>>>>> +	&iris_vpu_bus_type,
>>>>> +#endif
>>>>>   };
>>>>>   /*
>>>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>>>>> index 2abbd3aeb4af..6f4052b98491 100644
>>>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>>>> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>>>>>   endif
>>>>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>>>>> +
>>>>> +ifdef CONFIG_VIDEO_QCOM_IRIS
>>>>> +obj-y += iris_vpu_bus.o
>>>>> +endif
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>>>> new file mode 100644
>>>>> index 000000000000..b51bb4b82b0e
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>>>> @@ -0,0 +1,32 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>>>> + */
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +#include <linux/of_device.h>
>>>>> +
>>>>> +#include "iris_platform_common.h"
>>>>> +
>>>>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>>>>> +{
>>>>> +	const u32 *f_id = dev_get_drvdata(dev);
>>>>> +
>>>>> +	if (!f_id)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
>>>> I think it was discussed that this is not enough. Some of devices need
>>>> multiple function IDs.
>>> In this glymur series we are following the legacy way of handling IOMMUs
>>> and does not
>>> require multi map.
> Why can't we land the version that has multiple entries? It's as if the
> teams are totally not in sync. The corresponding version is in works, it
> has been implemented, etc.
The main idea is to introduce firmware stream ID with iommu-map, while keeping the
other stream IDs described in legacy iommus way.
or, are you suggesting that, going forward, we should have VPU stream IDs described
_only_ with iommu-map for any new dts/bindings?

Thanks,
Vishnu Reddy.


