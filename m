Return-Path: <linux-arm-msm+bounces-85101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D2CB7D67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 05:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDFD430206B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 04:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195A52F1FC7;
	Fri, 12 Dec 2025 04:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FknDMwOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGCOSTCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0732EDD78
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512644; cv=none; b=tFHPxO81zD70OmBm7uNcjRoxGYI+RI/eFgXsvsBjnZLPNaIQe1wixrr992ZWyfSSUV15axJqWGHsf8Fn+boQlWm8O8jIG+Quo52TX/WXY0/jJ1kV0H0cUMR1FaZEWRcWy+o6Q2tq8FQnz9lJEua1TpHYCg9yziiOO5PI8+O5R3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512644; c=relaxed/simple;
	bh=CUsdKubT+VP51iisTwTL1TQHDmgHK/6IZOH+0IcDSG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgqHCck4JpT/6/yC0xnfDd8Ahum//19y5xJxPMRMrqyG13/uI2Ip2/u+2VUQPeSlz5rxeCyNT2USLaGqVCsHi4oVsqq8lbtqoldZcahqcnr6uXzIod3tdq2MsVQG3VemXBm+/K3uknpkpZ6lyrQoQFT/j5QZgDvYUWsZQsP2ubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FknDMwOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGCOSTCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBNe3rR2604142
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 04:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=; b=FknDMwOUTIPU+RA9
	wDz9T05R4nHwNqC67h8hm6NS6GcyGKV7qIIBsgy9OnutJnhwxrojypZ8wFcNBUGx
	s/yEG5Ud7r5bR3aj38Xwii92wIx6zZyuBJh5PnLyM0BQXybGlOXT1KheJdlGBtHr
	6WJJlRkJ5qeEXQU81sWisHMxLffDy1WFv/cQhOlHAufoXBOgqht2sXf6SZ9gmn8F
	IC30Q7L0zXcGtUIfMemTNYHcXHYr0dwE4AWcozZzw6OjjCnrUgqy4GbpGg3mhdUm
	lmCet8ftQQOxVBf3T+1F9DNBnI/BUABkxSg6U+EaAJJQREO3gaoIbtFbGrxFmVBJ
	gebb3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b07u40h12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 04:10:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7d5564057d0so1881921b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 20:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765512640; x=1766117440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=;
        b=FGCOSTCfLCUF9n+OdIIFOwxsTYBTQn8Cta+85AHo7isEfgvYj9XFPwLW3WZZzHVweE
         EpW8gArGZPlQBpAdsJxJ6dgelphYpEAdrc3a/cdCt1jxnuF5sq6JlozJG1H1WiC2i9tt
         YuAX0H5Rds2situExl6OjViGWnjkBcRvlUQF25PY/QSlcMSgVoaEM6rRA2Kz2v7imyq+
         9iaJ/rZigq+1O5eWLr1aYV0P4ayo0gmTJzOd31pAboSfj+0d15blR/5eKpoZVo6Pyr0v
         MLJibVhZBJSG/TBZ/i2v0BIx/Ig0UiYEOerjU4FQ2CapN+XdZ4okQZdwUKGdVDwWANFu
         LdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765512640; x=1766117440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=;
        b=dINcsjhGfoPfuSiVhLFcfnyeM4PnaXWoA+FMjc2WC5SoQDqAkGSJ7S7gGScYfuzk/E
         Q7K6BjYZdA+/jabG1pZaDplSqkamVnwtiP+zRqbZj/+a03mPXG5nHqag3SQsn90Py+Fh
         nUuwjPRXYO+MogDvfjIXi+y1wmRBh0OC1y9zf0+4uyGCT3CP40ObPNr3OBP419iZ1QB2
         KDKrsFzg7sHRZsw1zLQTmmgq5dXmCW8HiTuU5rI8mX1u7SVuG3i1MVxPPr4tLn4CGd35
         U4wJib12ntGT1cSw1ZG8YtO8ap5Rqimn0bSoxcDhb50CzNomTQcQKtxoXwNxG/2khzYu
         FJpw==
X-Forwarded-Encrypted: i=1; AJvYcCWGqKyt4CD1Ybok76lfUU0VhFpOFhx0wlmcS3G8bbeJXJ/0uqi9BOd8x44jp5PTlRTHjRzMMaiMlIW7GD2C@vger.kernel.org
X-Gm-Message-State: AOJu0YyfqvjlUGASP7kXVFwAcL78rrUqKf2LwariR39jr/L3dk0eCP6G
	UqttDtEvV+NytVsyUvZAeSpmDPVP9/Wa9XlgrsKn4xBOv6CZy36/g6mbQ63NsWQ42lsn+QLYNh/
	8ZuDwOvNnPeQkgWlU/8hoAliO9ylzIGYKw7L/KJaCwECUkKIydi3xnaIAGOsQuTqxRlskXESOza
	UT
X-Gm-Gg: AY/fxX68iAmj6fzjlknj6p+JKS0KEHAPFRd22m/sH4uS2VS5EC7zkdfNeU+B57SOkam
	+ilxWybHMXgzobBREW38CbkuvrY5CIjY50Nmkp/N4mctTglPAsMSl8pdId9Wj5Kp6Xjg+QVWtf1
	Eo7/qbyPkbcKMU2FVTOhUQEEZYtTYemYUhOZ0XFci2DHTDihQqyib1mLlgJUQG84qlIoSx6wjEE
	2qrkyI3hZW4qQPyI/YX9+cm+wj74DAm/c0REytMjLzGa0okyiE2erNWkCOEgHhj0lc+4ExIqJUB
	wPbPuh747I3opgpQvGYLRs8CjWbsYv0debSFM0+1UkTsK4s7IEHmsfkFQzGyEg7Ws2mmm7rLH04
	gMqQTPE1F6Wlp6wPuyUFIXGn9Pdg6m3Ex1IsoSeVdqp7d
X-Received: by 2002:a05:6a00:2883:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7f667e15912mr906862b3a.28.1765512639968;
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYBRxy3S9HL9yJtZUjTFs5oovm764BaCYG1LSGUFPuUXBV5vdAiMZ3IjXWeW2UvU5fxEc96Q==
X-Received: by 2002:a05:6a00:2883:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7f667e15912mr906839b3a.28.1765512639462;
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
Received: from [192.168.0.171] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f634c229b9sm740509b3a.43.2025.12.11.20.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
Message-ID: <9892e02a-63ac-4cf2-b1d8-f37f6ed980aa@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 09:40:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _9osDZ4QhRj_4wjT6h5o-LF4y9el5-No
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAzMCBTYWx0ZWRfX9jHbtfV8qFXP
 lmCmSgrAtlOsvZvDtbd8Lru7TcO/H8hH3fg7A1GkKhKMt3vNwRaC0M5O7iVughk6gHw6FQkC5e9
 5PhbSIszVo8DKP7smS642vtvyZpU5DmQLI1zLrQzRcbTF3uAPgPDEQBF0n1WKOoRAZdmdWCXRUr
 pdaxrG8hQQSnPWf8FedTEThpxZ0/IckQlLnQ/sYNhwtZfpYro3E73GYq1zBotD+7dGSOHLiovVp
 k2AFtEMwE38euHMzIjuT6WyZ4eTMPg/xLC1iUGmN0EuDhDAlwAkXA9GCdXkWJoaBG8Z2vnnHWii
 GxTTMpakZ8nlNWJFM9VA5vKA1kim7RZuI2nO7KtOUUy7YziyG4bmaBYD2lXYJaxNEJkib2KTd6K
 fGyjbmyJTFpjHBmTlC5tZnFJCYpw8g==
X-Proofpoint-ORIG-GUID: _9osDZ4QhRj_4wjT6h5o-LF4y9el5-No
X-Authority-Analysis: v=2.4 cv=f/lFxeyM c=1 sm=1 tr=0 ts=693b95c1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hygMGN85jNpciXajp_8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120030


On 12/11/2025 3:20 PM, Renjiang Han wrote:
> When hfi_session_flush is issued, all queued buffers are returned to
> the V4L2 driver. Some of these buffers are not processed and have
> bytesused = 0. Currently, the driver marks such buffers as error even
> during drain operations, which can incorrectly flag EOS buffers.
> 
> Only capture buffers with zero payload (and not EOS) should be marked
> with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
> branch to ensure correct handling.
> 
> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> The error state assignment in the Venus vdec driver for Qualcomm
> platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
> only to non-EOS capture buffers with zero bytesused. Ensures false
> error reports do not occur during drain operations.
> ---
> Changes in v3:
> - 1, Update commit message.
> - 2, Move empty line between tags.
> - 3, Update cover letter message.
> - Link to v2: https://lore.kernel.org/r/20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com
> 
> Changes in v2:
> - 1. Update commit message.
> - 2. Add a Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>   				inst->drain_active = false;
>   				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>   			}
> +		} else {
> +			if (!bytesused)
> +				state = VB2_BUF_STATE_ERROR;
>   		}
> -
> -		if (!bytesused)
> -			state = VB2_BUF_STATE_ERROR;
>   	} else {
>   		vbuf->sequence = inst->sequence_out++;
>   	}
> 
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


