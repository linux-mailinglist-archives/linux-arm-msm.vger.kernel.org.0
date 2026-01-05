Return-Path: <linux-arm-msm+bounces-87396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3563ACF2E00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D14BD3073E2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16C92F6184;
	Mon,  5 Jan 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGHdH/6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K46E8ve4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66D258CDF
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606728; cv=none; b=gikFOCXEkC3n9VNC9H2BYeBYxMU1Mj9htnbTT9IfuPI/eGyHe0CUpszdnC4RTFxSUQSsbFzR2cykSSOXc9lV5lbUsLhcuP9GgyfBQLgoLowvEs/4TQx3GGUrfRKv6QbpVMoRlfF+jxAtRau+6tPLqcnx282tJyD/J6xWxQXGKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606728; c=relaxed/simple;
	bh=PY/vWrwkmC3rE8an8wbxBfu+JdIgIZc28Y/3rJMRg10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXxBZs0wtoBJmrwfXyoqKNJueDtXMLDp83icLJOV0pepSmm+XzOJzzY+PY4WEqJcIGZbeb356twBW8XlZWMLJRIl/wxyJ901nLcAzFMhJjDIk7uH9pDJRxxoZ4C6XxAME6FKZ7jeBcjN+Y1PlQqvuY4hNO1IzK4L37ly9l8F3+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGHdH/6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K46E8ve4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605850pt978589
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=; b=gGHdH/6O/7EfnN4H
	Dhh4cPXdMFa6tc3Kr/FiQ4NwvlUQ0DiLR7NhnUiE0DqPAqlQ+EQwGy8tu1THiVq0
	0BI4VhenJZn8+rUEuY2SVtxMYsCwOCeWMF5w/v1W2H1pOrqmYbqKkRbd5qaSH904
	gm4odX6aE2LSMerWByJjVLvAIF5GjtTbMWxpgDh1uEjAXakb3jweqm2py8xSw2CC
	D509SCJ3QmPec3eWVNBKs6UEovRFVveWEfTunVTChSq0bUtp+UjrnIDA+8nyrOcp
	ygqD0y1Hn5MC8zRD0dVUWgf207BxYbJk+XEKQ27lGjvTWysF1P9WTINaRniDlRwJ
	R3OGQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgbk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 09:52:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f177f4d02so329585235ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767606725; x=1768211525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=;
        b=K46E8ve40AMnWBlbsyB8gKO5hEKUmPGwqRBJ1LQ5w175Gh237MxexsbsmgQOjznBmr
         +bon8odxBRCI/AHPMY9LVJ7QPDxKNDN4rjRbHMrpKoq23P4N6hQQp6EoyoPr3lXEdphb
         AmdLi3mrIqWupItIH5X3a3h3XiUjOW4b8++rSjnTI0rcG77rB2nsjvieaVYsB5UAYhu0
         NI3YCGmTDNfxExU4fPiz2+3Nj7fT+tORoawyqga+XxCLxRv7ZWg/ASgbo9k/wjcfLVVF
         rrN98VGqrC0LoJtfK2oxGWYTwkxEETXOIre+GTtHwEiMq3lIZBwX6T2k65qbpek+yhgl
         lJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767606725; x=1768211525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=;
        b=wi6T+l1AlfqPluBRMWVNJxMoeFdMWdJxK8/xxuXnPIU45tJfFuFpG+Ymorigt6IXbO
         0SGRKev1Fd4qmZyiny9JUHz/MXn0ptbH1FBS2iFwMXAeallSGEwgo3M+6VfSOEGdiYEE
         hN4D5CjmuOc+m+TJwBbCwcqK5YxBA9EP7jkhY9hxYXvgN4LeEcFqFvGhl0Du++HDp3wi
         DQ/XAHkBT842FJsRdFfeBvhVAJ3Gz0GHUY26zoMFR22+BaxqMjAqO4grgQEGtvLppTm8
         i36zsRadQhJn3pZ1Kx8/kPqGGnZNEsjO4OFLUjU7ML+NRmWtDLhAv3fzKWHBqL3p36MP
         QyIg==
X-Forwarded-Encrypted: i=1; AJvYcCXMFBS0xAktOA4i6VizerH1CdcKiixoNsgSfLXBNScuHP687qB3/EwGDe5gtwjwXVLcb5SO5e0j1vgBpCTk@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYzOES52vbMdCdAZokQHM6DWS0BnNEJXCWNV2mR36F7nIqeUK
	E5KQei6kJoCAyehsdKk+ZKrvsefXdPNmFGmdL8eu7AWc7Pk8I2R5R+dkjODGbjWW8Um9jLSCFz+
	TLfWuRlkp6vmUrsYIAdPwxzds7j5nxleGvLGAImbHUA/uPi5+iblFUKPDEU1NI5yYmCKe
X-Gm-Gg: AY/fxX4lSzHO6QRfl5ctc4AbhGr8vNFo/zzshSxoi8zWssY9seZ32VsrpNDz5qQHZ3O
	qX6DY4fE4Q4ktMNMLAlDQwH7ij6PJ6QGBhFlhEh1GVZv7MiqIbkvvTCQoLCv4QMcHH44FJgppF/
	LbL6gmxmfHjLW11VPRU9yTeuGI8ZAXsAFFX8aNY+IovvOxW1foBze19eGisfY00sEVEt7ntrel1
	4C9RI8ogWJnYcP/znvGYs5BeU5XvYJz08u/2t7l3/IO1t2fulIUDhs4XeZrUosogdVLlwiLojod
	Cv9I8/FaH/HcEWLWhGt/j9S5+rtAZmJe5FvyrmdJXurMTpDs5NkzKrQ8nDCu7851uYN3XYBHfCE
	MSax8Iihc9t/DMP2zYNCGCqimka1URsGb4MOLLLpqoc3Q
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr527919375ad.7.1767606724661;
        Mon, 05 Jan 2026 01:52:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQjZNT26R3hug1VetovPBZshR48geoV8oj08OmGFIuvl1nrIlFHq0cRbx3/mJ/zcumVZnUAA==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr527919105ad.7.1767606724130;
        Mon, 05 Jan 2026 01:52:04 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm448829815ad.33.2026.01.05.01.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 01:52:03 -0800 (PST)
Message-ID: <a899436d-d14e-bd16-7727-e342fcd02de6@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 15:21:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
 <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O79-dr2DpkDY5rpcBWu_eFuybHGf99vv
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695b89c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qBENiv7BgfysxtCeYdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: O79-dr2DpkDY5rpcBWu_eFuybHGf99vv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA4NyBTYWx0ZWRfX4ukHCJk+H+Al
 UKuoJPBobGBcC2PUGKClVF0s1Hatcgmn/dS3iKkYfTPjFuTgC3mAyQs3zpHqLDVSuidSDsl2c82
 Tersqhk7YKY/YvMa1coY7w+D04loT5fiuxADLkDPcyFZ9jXFLyo6ggRcubS2L5iuW65pWQ37a1z
 OwGx9RzZbtWG5wdQN475xk4thDjIAWw+4Z4XiR9v1BhUbBpOBmwFQi0FkdpLrOiw6EDE94bKMbf
 yEQ4ygLfxoYfbHt0uTrKSxNovnmbIwplnTO4HfvHv8gNsTDwRwyOXipmZ0uJH13oB1Qjqcpg2x2
 WdwXe48vZ9reJG/oyyMd2BhZ4hE5nRaprJH/IHmjwE/I+z0xgQA0MLA5J9cAkSiEgTRyHgkcJIs
 GKf3x8rharbHX2HAlIoDJjqVg9GMjmixDOtQt7VYC95NiUZ29z3uDVtcgTwVMMgoKXRlHYm6o5Z
 RfwBZ6pDcxEvAnO1pGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050087



On 12/30/2025 3:55 PM, Bryan O'Donoghue wrote:
> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>> Revert the check that skipped stop_streaming when the instance was in
>> IRIS_INST_ERROR, as it caused multiple regressions:
>>
>> 1. Buffers were not returned to vb2 when the instance was already in
>>     error state, triggering warnings in the vb2 core because buffer
>>     completion was skipped.
>>
>> 2. If a session failed early (e.g. unsupported configuration), the
>>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>>     to stop streaming for cleanup, stop_streaming was skipped due to the
>>     added check, preventing proper teardown and leaving the firmware
>>     in an inconsistent state.
>>
>> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index
>> db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>           return;
>>         mutex_lock(&inst->lock);
>> -    if (inst->state == IRIS_INST_ERROR)
>> -        goto exit;
>>         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>           !V4L2_TYPE_IS_CAPTURE(q->type))
>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>           goto exit;
>>     exit:
>> -    if (ret) {
>> -        iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +    iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +    if (ret)
>>           iris_inst_change_state(inst, IRIS_INST_ERROR);
>> -    }
>> +
>>       mutex_unlock(&inst->lock);
>>   }
>>  
> 
> This revert looks strange, should be something like:
> 
> commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD -> next-6.19-camss-v2)
> Author: Bryan O'Donoghue <bod@kernel.org>
> Date:   Tue Dec 30 10:20:01 2025 +0000
> 
>     Revert "media: iris: Add sanity check for stop streaming"
> 
>     This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.
> 
>     Everything is broken I give up.
> 
>     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
> b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61..139b821f7952f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>                 return;
> 
>         mutex_lock(&inst->lock);
> -       if (inst->state == IRIS_INST_ERROR)
> -               goto exit;
> 
>         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>             !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>                 goto exit;
> 
>  exit:
> -       if (ret) {
> -               iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +       if (ret)
>                 iris_inst_change_state(inst, IRIS_INST_ERROR);
> -       }
> +
>         mutex_unlock(&inst->lock);
>  }
> 
> Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your
> commit log ?!

Yeah I did the same, revert and changed the commit message.

BTW, I don't see any difference in my change and your commit, anything I am
missing here?

Thanks,
Dikshita

> 
> ---
> bod

