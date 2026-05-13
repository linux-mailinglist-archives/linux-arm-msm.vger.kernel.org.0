Return-Path: <linux-arm-msm+bounces-107342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OErsLIyIBGoJLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C06534E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ADC530DB0CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6411F311C32;
	Wed, 13 May 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC33L7yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2GptbDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2DD30BBB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681437; cv=none; b=tklDZG4cVBThUns73U8n434hRERvGJcVoEHB+Vu9cGXs8yeNdT80r8kfDJ8/fidkfoVyW9AHjY26axELmKmPigfhV8v5qEzOHJqrHpnbv3XrxzibOJZ73Bevtffib2afc10Dvs+4QOtNX/mw7LRgqUVO9v8EOtyb+VSa+nbnRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681437; c=relaxed/simple;
	bh=m+3FvLJO+xwOla0OXf8VoQ1DLjG55to1DazANcMJeII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vk1sn/3OhexbN0L5nyNhjjxaf0ojA3rDYsSPzlGa5N9SkrTw/SKhloiBPVdsBJtzCgoLLRkTo4hOdpL5baZNnlfQi1Gz4fqU4u61ItIgeJpPJM6PTQP4zmfcPwmtSniHzLkApp4wcUt3u+W2UXjVrzvz5OJZ2z+MXzZziSL+wUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC33L7yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2GptbDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBxUoB3324708
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=; b=BC33L7yK8qOiG5Tb
	6HgF1vN2BdmjRSiTnfwFvBYTDniXntRpyVwmizZa9cvsj9GaKc52Wrrfah3Ku6+n
	+WlKdQTos8iT7u7cO/mF1HDk0isf5NFakCqwDcNTdIACXsRNcOz/ga5YoN7ivxUU
	t060ScJtuVBz8U5iK1FEIC1bzJdoWGPEntqOO64DPA63/1LI7BQQZy7fLIjuH9ZF
	j/hwdFH63v64ruuQLWfF+wBSHiWU4VbAXr8bpdEdsUrV5lqzkm1tb+EXUoPJEaKS
	0qhGImPjFUkMfp2rB5UruW/erDnABLHvlTB6BzNDmhhaL0gFdnnGxnheQt9dIjKq
	u7Gi/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9t7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:10:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8271fb4407so4626383a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681434; x=1779286234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=g2GptbDT7UT/fg6I4Nioo15yiYtmFr4RKnqmHR8q9p9+EfQNUZ557yNH2UbRPcKgTR
         N52cfB9J1Fzs29peXpaoC25mg+K0s0iP4POerwa706Zznmh3T3SPfZvN28xuH71SyYUU
         gMMh0pWnU5KQYD1vaF8y2OdJcG9T5x9HlI3x7qaoYyuse7o3jHUfkBf8Dlm36d6Gp54L
         YmHiY1rqaaRhTl1Wh/IomQwAAqA2tMVqmme4mHPShDUXdckbSQxylGhJy+9nL6PCNTI4
         FY/w9qfQQ37YK0WKrO1/LmKY6Rk3d8NaXsqw7af0xe3AvYQtEUZh0vPmTsEf06Eluhyw
         tSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681434; x=1779286234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=LC431qtDpchg+DbcFeMRUjaON6nSBudQELJhF/vVQX7vaTouDpmjUhgqoUEHvQIjiC
         FdywNgNBJ4yRMwoK5NihMYBO46e0dBOhq4VRij2RKTIATNVhtJn/qLsXH1ziAbZS/Ulx
         /uZP6aHhnQkkzqThCosPunSOaSNZ4Od7PsHtBiL5VMr+uCQHkJ4gPKK6SB8ewptK14Hd
         +g4/vvQs96o8QtUSj8662iD880NBEQYjDt8pECJOdfjbq4e8fTxqKlJdsU5Rm061s64v
         SjEUjPv3Bt173GUaUb78Z76J9YjJvcxYmq4bcF7CQ6W6QQ95YuY+h2HN0gbspFwIdyGp
         bcDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9isMnkeqGWbDqQzfhZEWXztMZpt65YeGyW8Ro+grcXLvpiPqKrHbi1WecKMOliv8k9cgdnnnzfuU7spuvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKIFY4UTGQdmiXPWeo8uj28VFux4lsYc9UThRqj9k+celKvh1
	noS/SQv5D5WtHI+zGt/2vAukbYPTW3G0sA77C3Bu4HHUgUiDcUa+9mhDA2/ZfGsUnkCfdbdcgZv
	BCF/wQfodhfMaUEhPYO9RquXkn1FBb3vBfa1PRjIgC3ISWXn9JFnFNGRsvYJCPNUAmZ0b
X-Gm-Gg: Acq92OEMwiTwJWibPxO3bmZpgjZf8JZgqjGs0nujTKLj0MlAJyIy4Z/UwNtErc4spRB
	BExjKrePj8SDQ5sYGp0iYrhfylarzrogbU/OhHExNWzefslghiWxi4gjzKbSp0jYXsU2l8b6pKA
	Jwsj1mTugL8Wy2kvXJ8+EpHwvwQsGb7MQwfp37mJo2u7r+tboty7tUNJfW9tGPdmKinXURcSCMG
	ObVzgUbkMKsyNlYYYWz8aqa160aiRg4eLs/Ijq2qOXT/p+Mlb8A75YCnLjLrITJEbbi8ZigSVgL
	OOt+2kgpsOv+CUcFQV2zdli2itt8JjsLsNGM9Xlx9IRmUcKXOYeL89mN3DRU99aXuvQC+aztIvz
	hpIcmHjf1SZppItUoTAyi5QGKJfKGKeo/ew8FdeS5amTiLfxat6z+NC8=
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492476b3a.18.1778681433461;
        Wed, 13 May 2026 07:10:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492383b3a.18.1778681432540;
        Wed, 13 May 2026 07:10:32 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm33068690b3a.46.2026.05.13.07.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:10:31 -0700 (PDT)
Message-ID: <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ziRpJQCc0b9pfa04uQuucfewYUj6EEz9
X-Proofpoint-ORIG-GUID: ziRpJQCc0b9pfa04uQuucfewYUj6EEz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NSBTYWx0ZWRfXww3l7cIHQlZZ
 VhiacKYTqhZ5oCddzEu205cUAmd1le4aV+bvgBRulXDuCCHeXByCgqC9ZYEzEjyyO27Wb+5qtvD
 UqWFEZn7ogjY/AXXP9bGpzl7WJt/5s+uex4e5ppVztfIZALPchXNjUkVxC/vRAHNdXjvwRhmRq6
 BkhfGUBxZtxpifMCDjIiVqWyb4oDu8uqlXsQJDXhTXRksAbdfrIIge6y070KSxXvpRyJocSpG7+
 tSY5zvy0KGFwHUX4YONw5Cxy8QPGQPd3rXCNtX8REO/Ypwy/abM28zi62lw+J143WJwq2QDxYaj
 SNRSzO5VLEDghzEyjcN8ON8w4vgfXI9HujLEWfM/OGL4GEXSYEFM433VcX1jYA1/7waRZvKz+pU
 MLytSDOxoteObf9MD64cvREicDou6gjPMhFZM9fv74+3oTjx5xWEw7b5nMQeoQnxFgGkMLEq34W
 W6Er6WP129z3M1+XF3w==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04865a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZIVIcBtmlPlGufRlQcsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130145
X-Rspamd-Queue-Id: 42C06534E70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107342-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:17 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>>>> The current clock and power domain enum names are too generic. Rename
>>>> them with a vcodec prefix to make the names more meaningful and to easily
>>>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>>>   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>>>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>>>>   8 files changed, 67 insertions(+), 63 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 55ff6137d9a9..30e9d4d288c6 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>>>   extern const struct iris_platform_data sm8750_data;
>>>>   
>>>>   enum platform_clk_type {
>>>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>>>> +	IRIS_AXI_VCODEC_CLK,
>>>>   	IRIS_CTRL_CLK,
>>>>   	IRIS_AHB_CLK,
>>>> -	IRIS_HW_CLK,
>>>> -	IRIS_HW_AHB_CLK,
>>>> -	IRIS_AXI1_CLK,
>>>> +	IRIS_VCODEC_CLK,
>>>> +	IRIS_VCODEC_AHB_CLK,
>>>> +	IRIS_AXI_CTRL_CLK,
>>> Why AXI_CTRL is better than AXI1?
>>
>> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
>> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
>> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
>> especially when platforms differ in the number of AXI clocks they expose.
> 
> => commit message
> 
>>
>>>
>>>>   	IRIS_CTRL_FREERUN_CLK,
>>>> -	IRIS_HW_FREERUN_CLK,
>>>> +	IRIS_VCODEC_FREERUN_CLK,
>>> Can we at least group them too?
>>>
>>>>   	IRIS_BSE_HW_CLK,
>>> Is BSE a core or a codec clock?

IRIS_VCODEC_BSE_CLK would be more appropriate here.

Core and vcodec (video codec), it refers to the main processing block 
and are referred interchangeably. BSE and VPP are the sub blocks inside 
the core/vcodec block.
> 
> Unanswered
> 
>>>
>>>>   	IRIS_VPP0_HW_CLK,
>>>>   	IRIS_VPP1_HW_CLK,
>>>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>>>   
>>>>   enum platform_pm_domain_type {
>>>>   	IRIS_CTRL_POWER_DOMAIN,
>>>> -	IRIS_HW_POWER_DOMAIN,
>>>> +	IRIS_VCODEC_POWER_DOMAIN,
>>>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>>>>   	IRIS_VPP1_HW_POWER_DOMAIN,
>>>>   	IRIS_APV_HW_POWER_DOMAIN,
> 


