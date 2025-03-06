Return-Path: <linux-arm-msm+bounces-50429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE98A53FA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 02:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A8A18928AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 01:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DBD12C470;
	Thu,  6 Mar 2025 01:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oltz7y2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E655887
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 01:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741223535; cv=none; b=j+VSOyzpDx/2iIAjRQVaEM5on/jHqXI3mBWf8jTpCl+vsx83Foju1gk8Ie2S8vI+sV2v0GpC08lgidFt3oikOFdAkZ693b1ELwj8b4NNUlY2WJg3L0AZa+D8MCorBVnuWsAVnUFfd/IiJR+DrHMF8HGYgMWQM+rc6SdNe59vCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741223535; c=relaxed/simple;
	bh=V8bDAPc4cr2bLjiiGkoBYZJfi5ZNW7LVUzibc3K48nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAOy21Fa9HYJ0AzXbWaASfybBwFUgXseNS/+YhWm84BqPiauXi1PmvspO2oGGuf6EAjQpjcezFEO+cofLZ8gjUAg2tZPtAhZbuphMpuco3WTLiZAX6+xc1ReZc7jwfzBZCZHA++tw7PNNAnJiCZb2ZqZ77/uwAojWJcA9sBQLJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oltz7y2t; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e702d481so43238f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 17:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741223531; x=1741828331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+iqukiSlMLeu8kSd6ydP0HqsHZUGYTz4P9o72wMC4=;
        b=Oltz7y2tGSk4ldAVdJ2WwYzVqZcp1tYoGdqhINoOEml+NLIeK0OdJZD6Fjt19KVSVJ
         4K4Raj0Kgo8w+/t+ISsOmgbs0+5QioiFJ3zD3AEKRXNe5qbCfmAH+7bKqv8ZYhyjdn7g
         g1DvaT5NvSMs4J5Ioo7Nk2+0UjHNSezrBxDoODdY689F3YDfjGJeQWJC9Wx56lBXCU9X
         Lx0a+u9Lbp2tiiMMtT5Lzi4L/Wx3SILqDSTILT9zxHHaH1+tvP5z6tNb41mnYXTI12cB
         0SGIPsC7iq5ogjei/XJqtW0Ijwk3IOeROv6x9XO6cJ7hydLT/msMh2FOvu1uzAaj9D3Z
         Mxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741223531; x=1741828331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+iqukiSlMLeu8kSd6ydP0HqsHZUGYTz4P9o72wMC4=;
        b=O3oMmj1hL3UKbN/8NZ62vFWABGwlVfdETzXRnfrLJZ9OOWl+eqcgVVW05WXngE2/rK
         I+0DpU+BlEtE9Qt/pMh97Rd1upye5u+Hkh8sTEzm3LzH1z7hqdvm5HVfuMmOlYOHoCGP
         8Sy/j+dzyRo6Vnt3IrJe87Kt6qsOzFmqJ6xcNoJ0sBsvYGfAcRlt0NsU2mqntLbZNXoj
         ds3GxIke16XrLud0XkakHmsn7+Mc4i1sSrd1q+OX0VnAiQO3miDPO0dB7ICsqcR2mD1O
         qYNEuAiAR5HJ1xJyg/VYybVRX3cdCM2TNvpWYqiJldasQ46dnPOC1rvdy9PCOVWvvrXU
         25dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq8X/zKizNh5+zRlgqiEFVB4uSyPmc2+FHWbUHJF70Dt54XrG24tEtPG3G2ryUbwAmtvrByi4qHnyzrny3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1mLMZkmOin7aEMnd97qj/zB9XGdXBeouvEH/CHQjhEpcRwGnB
	V4oYwZfCNlP0rbLU2UMWtVT2b91reYwPbsyO7hGVxSiIKR9MdVSmuqbyK4cTQ1E=
X-Gm-Gg: ASbGncvGCvtumqBWrOiy/h3aNSm92G8BoaSaNiNUdwHD9PCa1Duj4Gg3NML6GtHd+Pf
	lu05ctf3trCMeGV1PvQYCPRPlHcVJ23GgcpO/4u98i2VdAhmUlFDgnoKQFwsVSK2YKe8hXqNbzf
	88VRUe4vjpYs17Su2g6bsH7a6tvLuMg0XG+yOdRR/+blBDThxYkBwvJW3fOcs4GxwZ+Hw2P7bFu
	sebbqwkGHl18gzFfegU/CrAaJ0Rra1VdGqvbIeRN0jtdr0Uy9HvEh5d54uriZ012Dh/cLta9/qM
	kQlGl/YN+bR1RQ1xx2wa8k1HdonaK4LXN+Ymw49UsXGGIRRlquqBh3Q/q76v+6e8ODc1QrGMd5Y
	NTlReAXclEg==
X-Google-Smtp-Source: AGHT+IHKxmZHEuQ99hkkG0TUhCpLtqRQ2jcyh6L2PyQhB1NnKBtw7TcNNfosP2ySPRu7Ae0J8pjZLQ==
X-Received: by 2002:a05:6000:2703:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-3911f7706fbmr3732068f8f.33.1741223531434;
        Wed, 05 Mar 2025 17:12:11 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103f41sm199146f8f.85.2025.03.05.17.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 17:12:11 -0800 (PST)
Message-ID: <8c96d87a-b31a-40a5-880a-242542806f7b@linaro.org>
Date: Thu, 6 Mar 2025 01:12:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] media: iris: Add handling for corrupt and drop
 frames
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-8-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305104335.3629945-8-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:43, Dikshita Agarwal wrote:
> Firmware attach DATACORRUPT/DROP buffer flags for the frames which
> needs to be dropped, handle it by setting VB2_BUF_STATE_ERROR for these
> buffers before calling buf_done.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c        | 11 ++++++++---
>   .../media/platform/qcom/iris/iris_hfi_gen1_defines.h  |  2 ++
>   .../media/platform/qcom/iris/iris_hfi_gen1_response.c |  6 ++++++
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 305b630ca269..e5180340383b 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -603,10 +603,13 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   
>   	vb2 = &vbuf->vb2_buf;
>   
> -	if (buf->flags & V4L2_BUF_FLAG_ERROR)
> +	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
> -	else
> -		state = VB2_BUF_STATE_DONE;
> +		vb2_set_plane_payload(vb2, 0, 0);
> +		vb2->timestamp = 0;
> +		v4l2_m2m_buf_done(vbuf, state);
> +		return 0;
> +	}
>   
>   	vbuf->flags |= buf->flags;
>   
> @@ -626,6 +629,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   			v4l2_m2m_mark_stopped(m2m_ctx);
>   		}
>   	}
> +
> +	state = VB2_BUF_STATE_DONE;
>   	vb2->timestamp = buf->timestamp;
>   	v4l2_m2m_buf_done(vbuf, state);
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 3bea643068f9..bfeeea643300 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -119,6 +119,8 @@
>   #define HFI_FRAME_NOTCODED				0x7f002000
>   #define HFI_FRAME_YUV					0x7f004000
>   #define HFI_UNUSED_PICT					0x10000000
> +#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
> +#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
>   
>   struct hfi_pkt_hdr {
>   	u32 size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index b72d503dd740..91d95eed68aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -481,6 +481,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   	buf->attr |= BUF_ATTR_DEQUEUED;
>   	buf->attr |= BUF_ATTR_BUFFER_DONE;
>   
> +	if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
> +		flags |= V4L2_BUF_FLAG_ERROR;
> +
> +	if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME)
> +		flags |= V4L2_BUF_FLAG_ERROR;
> +
>   	buf->flags |= flags;
>   
>   	iris_vb2_buffer_done(inst, buf);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

