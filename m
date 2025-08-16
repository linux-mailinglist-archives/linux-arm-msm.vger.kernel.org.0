Return-Path: <linux-arm-msm+bounces-69431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC7B28D09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701115C3A13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7577291C02;
	Sat, 16 Aug 2025 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="civYSYls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13025156C79
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341404; cv=none; b=k/rlo2OOK4t7Z+u3r3KtDDhu9x+xehI8g9bGml/pCiTG8JAV9n+ed3lEsqfNYITHVsumTO97br5ebPcHHRPppETnD6qIgxDlwHpy8whoMta3bQgXt6AvMNQWWVO3U8IC8dC/D1qm0FtteDoUedTz2CKbKf5v+XLOkIwKbUUp94k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341404; c=relaxed/simple;
	bh=doz42PD32C7caXkh5JHONCE2ZOdONZJc6Yx0NMQtnSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoueEoAnDkH2PfbFm9lFTZx+L6wAk9VHKdjzcQ/YSThovxbCjiV7gY8xF8YXtG6OaLQ7ZyPScdxERbvMeJqYnwk2b9NEMjDKuSkdDQ1zBUpmom1VuCQSEdz+wo0m5ZK5WwkVdUxJ2S4vhTHq2ArKAFuGXXpri4ZR+Jl61dIwwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=civYSYls; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso17702765e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341400; x=1755946200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwwivMGnEw2uIFchpfZdnqFMVWS3GjK/zVl2JQuqPm0=;
        b=civYSYlszTqujTcerSF3GMsRE3F3MT5kFJ0r1tByjMyep8shuH1/6RJnLGhhIBw0c0
         mr3l6hNlvx+fzSQEZtcebCmQ/wXvaaE865jU0CvNUuLHzOBlxbJKkSzkI72guOI2+DUx
         kQWjws2D7tdZsYaF/CEcLveD7oFPNiYoFYCiFq2iG7Cpb09mVBYloyRyvMhXGi3HEOe1
         72lskpcYZah4k+yZjn32uMYI3iUTW3VsSsPzrIWXhjWIE62T9A79yb3KKgVIhyqI8Kcz
         jVMj5lEWveAkscVCTrr+P7SQD8nCs5tLfiZ3v4kuFMA0stdhFboeTe3HyRSy5UnpjSD7
         xXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341400; x=1755946200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwwivMGnEw2uIFchpfZdnqFMVWS3GjK/zVl2JQuqPm0=;
        b=uMmVNtN0aOgK+Q2EtiYTaOlea/zvkDveVF0TcogPIuf2b84QbV1t18cuPeKtgAWYh3
         euOjmShwwD7SLDgSyvAcbNVRk70TOibg5Cm47MLUQBOUVNVW7/Hm8ZG6OfIua7/3314x
         UBF9AkRTK8VNoRF7jPwV1q8jp/u8W1oHG+rNrwRl60M/EceNB5CMrdvVX2i6jfP6Iwv3
         wcpnJ235qWUtN6RPAUZH2Hpt/fru0c5p4ioqZ3eVlNW5K5JHOKW4Hg3HoSN6J1vQPt1f
         J/87W81ke0x5c5xcl4nfe4JtthAsUZV+DDmsQ/BS05tbAylt3lFr/2waZeiO6jr0dCah
         UQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFJXWKH3GBA4dPfn0CYWthNr6llDhFUBBpVtvvf3YszYABwZQwTBIEIXQkC9gqKvqBRoGCA/2RWge93p+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0tdgOAMZN2Il5ccjQw80AvgGaYh/VyMCwrIPrp4nNF0h+rqVD
	m3olwa6KZKPy1L8Q60oXkrSUHPufy/gL092BF+3pXGrEAEILIqIqDwch9tVplDI5EqQ=
X-Gm-Gg: ASbGncunEbamvc6Clw5ynvKzPB/sJUTvKdF/Lw6o1/yirOEgjl+wiEIl0jrjooDQA5c
	9vwqkICElHa2fEcBkr2MKoFnxboFfsYjbg/dtnKsdfG+CibzZd9uTDEdgrH/vdHI6nrhZNLcs1Q
	s1cqLeCG3932bz7ewWB0By+NvcPXf+vN9iM4DL8QLttBqhfJSvUdC/BVjv2xHClF0uKAHDQiJXD
	MEd2c0usqG9QwnwW5eEaUnV0aJodeM9ASRIgisOz2sjyZ72aR3gysI8dUB9N0ennNEMCu/MWJe5
	ZsTk7C6ixtfvHJycRmc7vRJ7Hvdvfj0DNAbhx3TnoPqNNKihHtolWu6DP3tiGr8WYVVBEcylmcO
	mupKxd5JyqENTML1PFvvN7yZm2e3yDOvAS/9P5btf+/qUtv87ikoX6tx9Pe+ttcxD
X-Google-Smtp-Source: AGHT+IE5o1fNVVbU2Hem8lhgp/yOa9qYSWveharYtFOMpSTzQ18tGJVdXt4smsZsAVwuhr9xInUKkg==
X-Received: by 2002:a05:600c:474d:b0:456:1ac8:cac8 with SMTP id 5b1f17b1804b1-45a2180b6aemr48450885e9.15.1755341400420;
        Sat, 16 Aug 2025 03:50:00 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a27fd554bsm12863585e9.13.2025.08.16.03.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:49:59 -0700 (PDT)
Message-ID: <d6c26171-8be9-4c15-a105-3d641558032f@linaro.org>
Date: Sat, 16 Aug 2025 11:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-7-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-7-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> Update the vbuf flags appropriately in error cases before calling
> v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
> scenario, which could result in incorrect state reporting for buffers.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 23cac5d1312913b8dac44347ae66cb80a6a15deb..38548ee4749ea7dd1addf2c9d0677cf5217e3546 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   
>   	vb2 = &vbuf->vb2_buf;
>   
> +	vbuf->flags |= buf->flags;
> +
>   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
>   		vb2_set_plane_payload(vb2, 0, 0);
> @@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   		return 0;
>   	}
>   
> -	vbuf->flags |= buf->flags;
> -
>   	if (V4L2_TYPE_IS_CAPTURE(type)) {
>   		vb2_set_plane_payload(vb2, 0, buf->data_size);
>   		vbuf->sequence = inst->sequence_cap++;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

