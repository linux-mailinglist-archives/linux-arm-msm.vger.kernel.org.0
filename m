Return-Path: <linux-arm-msm+bounces-87837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8256CFD27F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CBE230019EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2143090C5;
	Wed,  7 Jan 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glHxouxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzS4tm4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200E9309EE2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780393; cv=none; b=hDX+E7qNc+vLHD/2YgZuuPAfB1irdpSv6oxfJWp8F1LwguZ7xijCVY/oQbAt+Wi3QaONAtKKMuFAd4pgfWPKxQdhhJnwUYnA2gj6MNzpo/+ARmqIhuhRRBXLlsO7Xcg/VTz5g7W+WTnpci+nOMqHucYYECxuxgf3Nr5YSP5L6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780393; c=relaxed/simple;
	bh=0BRTxWxGjawK6eMAOZak+mLfcQ0fkqslVtWiDati0lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PaQmS0yAJsMtYqS0ATCwrde/l3aAsthnvEFD+YQLTxsH6SCbg2t64AovCVTTr4lJlksXL3Gubn/ckWb7dF0An0Ofw/Y8VCZsoN/4kZmjlmq3kW/IpgU0yEt0H+OFOiBheP/TOwmLjmzNiE+fXdUJCZYhhkD2+lyw39atgR3kxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glHxouxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzS4tm4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q4js218380
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=; b=glHxouxMdhFtLAO+
	M2YWjJ969QprB+ykSxHbzEkhXlT8d/BQ6nOGq4M3XmwFNMFyUgd89RVNY9Wry6pr
	PvQezU+2LkzjsjwnpoOR3KUsSQtoxFoQuZjVWjY/BLAfgSdNSqHCIxuaDCyfoUqH
	nuOKDHg7xjgwK3VE91EZCJ1Nekq5+Ye14mKKS5beaIcpxmL4NR6KjzJ0vve0tHzI
	+2A3cu5MKWIAkTSwTFXxh/mQ1vfhf78dcn8ADLSFQZjhu45LLqUj69S6MIsabvVh
	+UHmudo+VdOViww7dJhLBAMduusUb4u1NU976lsd8uhdogegLpCNGgvDTz1EbwLU
	rE1faQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn8081ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:06:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d203988so4000068a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780389; x=1768385189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=;
        b=LzS4tm4TVtNP65AdRTzcfa2/qo0OOEKz4O4T8cdGk692WWnEVR33d8thk62GS0nY3J
         nBlYsR5fxabqFGbiAcay6aYq+wgwDK+k3c9voawnOhPN7OcWC4fhBmnXBl+V1GqJO8V9
         RfC7t93GWRg1chVaf5E+u3rirwv36NNOgBKOhoobY4YDsuiRaNGKwNmzAFKEVcPINalG
         6WQ+H6hTnEBWBYREmt7M+bWhV4tcVQ0oiCxmycIjKAsVqS8SBJ0BuVvrLapxgmKFB8U4
         Mnm4c7zFKz7NNzzoOtpt8Xf0r+AgJUO9y1EgX0v4aHpYhNgyG4K3ZRjnxQOO3CylmGGv
         1eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780389; x=1768385189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=;
        b=qpIDvrItaYj5adfNtxRl6WDcefyitbvvZ89eVaXJpegtHzp9Usfmuibvq5zrFJNwSB
         mmtWob863ovFZk5P0XWZ3/Mehy92+RdSzVsSZw4ovRhmtwhYi+T6Rqp0aGfV43wbX9XN
         W0sZda3LQEptXYjUUTCpcvUL5jtTIC4KH+Ky5gqON9cy8TvZap4Ba7RXPNyVnyYvbyKM
         x1iyS0LWnYV9KcFqz+doWxp/oz2YZcZ6HPgvqDEIA1MW6vkI9qw0NmKoiGA/NG41AozL
         JSSuWl6Y5XheA5539j8Egjmy9tTqxX/1oVyEM48MY5Iy8tF+DE9MsOA9o0WV7hIo00Pp
         LC/A==
X-Forwarded-Encrypted: i=1; AJvYcCUwl8eaIyE3QQ9aRoOojHgHH9HOEMn6UnrJqTOvJLVqo34XolW5H1+iJgDuNB12aCstZkPw1HGO7DVZNBDA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ysRk9Hot8pwxqKJgQP5LCKLvHQNoTUghfOnsKqrrw7LptgaP
	vG53GSrotjlJw6uVvqpxEALZvA7iZOVLiGMfFlIw427qbBneFsztU4iAnzW4Ep9iHIHbdvQF4xH
	UspOGMMc0Icm016TXAOAMS8y//isLDKViHFDTY/TZ5fau351ykw2CQqiPkD+KocCcB7qh
X-Gm-Gg: AY/fxX6lxK+RL/M/7y8GKusiuaPK6ij9vKQhI3EUKQugR0sQlQVDpNRu4r+7nEBFTYr
	VXHXO/1QjlJo2/fTgYvYIy0D03b9vt0is80JWVRkQL5wgM660/w9igmKNUDGhQHC7M6Ej8LT09V
	8Lbj1mARTEAqpyR8lPLJaYg620RDtID3lvhMiN5kP60O1+wHOipePw67omqDFeZMOg3yxhvd02U
	2XbXDPcqm35IP/kRexAd4XvLGvJJD6ziBElLkUMgFMlSXVezRobz7KTJx8Z+WhBvzuCCM6muZLD
	435MEjfpw9hH4ccTCxyG/0EAoaNaTMfSd5x01gRrObVVxyAOgH5tGKFlVm2owgcrCtrFqGIutxq
	lpa3joyyl6d6vhZnn++MMi2nVT4alGxGhzF/OWqCyxCRa
X-Received: by 2002:a17:90b:57c4:b0:34f:62e7:4cf3 with SMTP id 98e67ed59e1d1-34f68b99fcamr1639022a91.10.1767780389425;
        Wed, 07 Jan 2026 02:06:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH36iLpr9vxcCvZo6QMDXLFAaGlRxVLK6uL2bVx/IVrS35zHE1kv1B5Lq6WmZwEDYPJRwjjYg==
X-Received: by 2002:a17:90b:57c4:b0:34f:62e7:4cf3 with SMTP id 98e67ed59e1d1-34f68b99fcamr1638994a91.10.1767780388976;
        Wed, 07 Jan 2026 02:06:28 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb7419csm4691982a91.13.2026.01.07.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:06:28 -0800 (PST)
Message-ID: <205df0d4-e04a-9871-1250-fdd04096ac38@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:36:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <O9VbTIO27YZQtoP7kUJIYBpFFDhMXlbbJR8jyMEolmhNR3bdeVgUurIu8vvs-Fwft5BcsNOje4d3_ofI1hPe8A==@protonmail.internalid>
 <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
 <002b8748-eee3-4bd8-bdb4-365ea949a969@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <002b8748-eee3-4bd8-bdb4-365ea949a969@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e3026 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I88IWsW9MQcBA6jClv0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NTInGUvbXO2bxm1uqJDWBsfA6e42Jwmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX0rTiXWZo6S70
 +BXYh8bRKPn/nPBnqrDieSh2YWZHYLVWC8U94VeP1JgRoj1SamSqWDTUBbMTZlwDzqLXo/110EM
 0mQoTPeC/W0ARJiWH/4JdP4Nqf+JGLYLj8rb7QMM392KJ902hMSjF+C5Qmr0h+CVHf0gfxvVyL6
 Cohv9vsBQAfPkbWes33ro+TuMsLTHZAVzbvgAacjonPomVzB/oV68F1wSuaovb9yjOHoQxD06gv
 3Cy6U/gFsRRtjgK2jRuHi9SjmoLVJ75D4TtHYT+DUYOzo/bvuLd6mCxr5aHJjLzC1qcu41BF213
 by3CNliyju23sChouCnDjVro7f82BwzljgjPZFKz7M8tr3ylgidHrgcf4npCqSgr7u1XE2X1G+n
 wXDqgiCGQPMcimWFV7MtQyYPRPWpbuBzcaCIzOVXQEkF6GbHoXJj9Z296PMJ94cDvdZD2p0GuH4
 wjreGf3+3rJ2eiiit3w==
X-Proofpoint-ORIG-GUID: NTInGUvbXO2bxm1uqJDWBsfA6e42Jwmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070081



On 12/30/2025 4:03 PM, Bryan O'Donoghue wrote:
> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
>> session_close is executed, which will kfree(inst_hfi_gen2->packet).
>> If stop_streaming is called afterward, it will cause a crash.
>>
>> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
>> to firmware to fix that.
>>
>> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index
>> 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct
>> iris_inst *inst, u32 plane)
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>>       int ret = 0;
>>
>> +    if (!inst_hfi_gen2->packet)
>> +        return -EINVAL;
>> +
>>       reinit_completion(&inst->completion);
>>
>>       iris_hfi_gen2_packet_session_command(inst,
>>
>> -- 
>> 2.34.1
>>
> 
> Are you sure this NULL check is concurrency safe ?
> 
> i.e. that ->session_stop() and ->session_close() cannot be executed
> concurrently ?

Yes, this is concurrency safe.

Both iris_hfi_gen2_session_stop() and iris_kill_session() are invoked while
holding inst->lock. For instance, iris_vb2_stop_streaming() locks the mutex
before calling session_stop(), and iris_kill_session() / session_close()
also grab the same lock before freeing inst_hfi_gen2->packet.

That ensures they never run concurrently, so the NULL-check protects
against the packet having been freed earlier without racing.

Thanks,
Dikshita

> 
> ---
> bod

