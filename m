Return-Path: <linux-arm-msm+bounces-87843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB5CFD37C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B62823030930
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BC532470A;
	Wed,  7 Jan 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnE3kJBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM0vuCGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9813043BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781758; cv=none; b=lSSc9gwCBWaDZpZahmM42FtEins5Ar2i84ejNdcdV2sMHMMv0wSqNbY362l44QdaINSq+wjPNfpM12qH7N2QRqo+AGG8VvYP5aF0FpdxAG4O1LEgqJVQETDsRcxjolN4NyYdjut6uAJvOApTC8Z8oB373iFOlV14ZsnUKmHB54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781758; c=relaxed/simple;
	bh=MkZUUsosIbWtTh1KywQEeJbpJQNDdOS1yOnEsYAIu5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHQBDNVU65ND8ut9CtFFg4OelPnYFTkdgOj/X/FJDOuTTbh2f13bnLTj/s/EpJ+oTjw5yGOtyU8bdR7zLJ7MbufVpY9QYPryoNPxytUkPlz2/W8qL9aT2kO0jCNKMF3TeQfbb0GafRN8MVSG2QhJ0bdN3UgGw4ojc/rsf7In9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnE3kJBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM0vuCGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dvJ32593341
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=; b=RnE3kJBy7en4oJgq
	qBuvTRr5VmIOMPF0Er52IDvAHAprFpzRKwj09LhsNGL58LR88K2/Mi5NeNTncSjJ
	225TGaX2lmhAhhSANzhNfH3KVs60AEu9PwwjGQc+3bAy/1S+mu7FeuD5P9fIn45P
	7QvOeDpy2HMEPaDCw4ML0zKEdW3lgpDGJ3lNoBRkuVWOLmBmhTRwaL5O8de4HJ8F
	NTwzIlaQ34HDHKaByFQB+eROQBNjkqbyK/Fl5rqjk8HUq7PY/G73mcuyScn1WZin
	frbopWfh1678UxIb1fWr++2uZdEHqPyVudiXD/l2vWQXhtFMqVA1bxPBMeXF3xSq
	5EJACw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2905dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:29:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9208e1976so3091866b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781756; x=1768386556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=;
        b=RM0vuCGHspIUZ/CF7y+hcjyAvMiQWW4t88fXEJF29VaEUPB/WXsmdF+filEZzE86jP
         XSzbiY7xu8Bx08WYDYrhsQ3pgUHai3cNukCT57jKBjwS6iv7DgImzg+eYYiuuOmy7Szn
         yCIoEcwaHACVbQjxErxu4PrypBn4oAGRmcUPbP2SLCQvH9e4swXaNdwTTURpKW1Uvl0j
         7W42wwEs9MKtW3MsGJScjl22KSbHqvln3QexRCNrFLmSgmS2+YPjVD2Rgrt+xMvuvuRr
         KPUz4a/zz1/v1+dwoUaSU99FxCMZQUI+EzXEhMEQWdPlnDvjxSiwM4sfBzjnEr7toLQQ
         09zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781756; x=1768386556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk3VdG8u9PPmzTOfTx2vyiB9nQj1fTzdDljRD9EVFr8=;
        b=S5RRRsT1/8CFhxtPvKpf3OpSEswqDyS05WYH9Qxh7uUtS6WcDNgBCMz+/L9+is+FJ5
         ghWH8QNRdHEhhGrspBI1EafvJdIpXzJmQpIMtomYIln3EVa6u1LhZuDziBdQTt2ItW4v
         fEelf9npCsJleJv3skj47D2uQSowwuZ53zVFlzjiDC0aRkT462PZkJmdjN3yjyaHfWPD
         YkA7ISR01DdgowS+LyWZfUYoBuPv8EEnI7irvCp+1/KvM+oYe2TKQAyZY9ueLaqBur12
         W6XZRKDxHNIvbYP/u00wjqajeaoO2J1VdicvgZ7NQd8vNGSf/ywqIoREa9Bd0Aejc8OO
         nv5A==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2rpowKeZcGzgbwresf2OgpOH61eiJKkpt2ru0/lF/ZchDNUZIxR9CBNXUsK3bl4tYMiQSaEhf/DyyQEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDNjylTyj8KiNfVdMBzuM6zFBJkybgN5t3tLWfeWjkRblet7S
	QnM+iOd5WK9vgRWnEowFDgFkrpHTunjYF1Ds37dc5a7JxY9F3iM929R4ls4LudYmv0TkOznjn3L
	0g6PAaZ+KymO0tGkPd7G8yhDCGaOVxWbWUaY4qgYJAXPBCvyEFUGTg1K82IpSngMdgzAq
X-Gm-Gg: AY/fxX4NadbRt/jY4wn2B8RSW83OZpj41aql6nL2UdaPz/dtU70fpPX8mkxNFCmY6BZ
	F/Ab6fSkEpU9uulTTvYaWG3TO1Tqr8vDGtXaNA73xSVQei3we82gGJ2Z+Yk2rh0JPQm6eGSyixj
	FTRspMhx7cu65tiZlPYLj7sctgyw1CYkaOSdT/O/RA9H9sWIn9jWFEKrcsQ9974woOZvqiAiM9j
	L9AG5ha+MpbcBFlC2DgpYInC6hGiHGFqEhchtsG3ifkYXyk9MxS12RBoNWPkeVJ1CLq+QNd07c8
	yVN69rbkl7ulgbYEeUQiPdYq5dfbEk6K+7LZPH9zSWpV9n9hBw5xgrX8frEDdh3WVdFdb7ckTMR
	4Yj6FcMvDIzZiFURbhk2fvnIXLn5jekG3r2Hc/Jke6A==
X-Received: by 2002:a05:6a00:2790:b0:7e8:4398:b363 with SMTP id d2e1a72fcca58-81b7fccad22mr2005757b3a.54.1767781755802;
        Wed, 07 Jan 2026 02:29:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCiNAIBU5uyWlpVFXW3FScEBoUAkVX1z6Qdax3oFu7IDUlYGwR8gLa1CL8OjcZk3UenhR2xQ==
X-Received: by 2002:a05:6a00:2790:b0:7e8:4398:b363 with SMTP id d2e1a72fcca58-81b7fccad22mr2005731b3a.54.1767781755357;
        Wed, 07 Jan 2026 02:29:15 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81a8fafaefdsm4225240b3a.45.2026.01.07.02.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:29:14 -0800 (PST)
Message-ID: <9fc65bf1-400e-4908-ab40-dc4895948e50@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:59:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qvk-bADPGasaGEZvKdQaZ_Ntjowwjfua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfX32EFWWqnG70X
 sWIqrhn5mIGZuIKgHaoM5sI7QUIL9Z9IKuLtzQw64TOhv1zllhYgQdsAkt1JK9rj5nagxUQkRya
 kN11JA8L1OCzDyzHXqPbksxaheYkVCVpQny9bF+w635shCHbJU2VPBCTS4Fi5onseFnth4PFmT1
 1HhYi3rjNdAq/n57HPNClvzbwkz5QljFqhBYTyPoW837LnjPFaMl17KuvTHgolvy2LMzudFwOb/
 k0p8Kuokc/o0I7MZPU7p33QlmijsJQU0sZJyqEqzM7rc5TUjkTaF33q/AXnDS3osZpEMLaX4X/C
 2ZxSSkP7jlQdzMX9aKuaE0nExdzRofD2sgnniv2/Nkh1S+BWneKb/tJcfRG/Zf3i6EULqsrXN8H
 RYDrgUTPjHS6sM52KoLazYZgmlG2EYH/vh1sWV9Pae220bO6UtlnT9opmp18o+eGIOF7BOU2jZy
 VynZw7bMYY7GqsTd+Xw==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e357c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=72EP17BqmB737NicdN4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qvk-bADPGasaGEZvKdQaZ_Ntjowwjfua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> Revert the check that skipped stop_streaming when the instance was in
> IRIS_INST_ERROR, as it caused multiple regressions:
> 
> 1. Buffers were not returned to vb2 when the instance was already in
>     error state, triggering warnings in the vb2 core because buffer
>     completion was skipped.
> 
> 2. If a session failed early (e.g. unsupported configuration), the
>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>     to stop streaming for cleanup, stop_streaming was skipped due to the
>     added check, preventing proper teardown and leaving the firmware
>     in an inconsistent state.
> 
> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		return;
>   
>   	mutex_lock(&inst->lock);
> -	if (inst->state == IRIS_INST_ERROR)
> -		goto exit;
>   
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>   	    !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		goto exit;
>   
>   exit:
> -	if (ret) {
> -		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	if (ret)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	}
> +
>   	mutex_unlock(&inst->lock);
>   }
>   
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>



