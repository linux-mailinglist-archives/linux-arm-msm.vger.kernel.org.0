Return-Path: <linux-arm-msm+bounces-86944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663BCE95D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3080F300294B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E5A30C62F;
	Tue, 30 Dec 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8ysGjiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0522874F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090311; cv=none; b=XUYiBY96+fu60+CbY3Ojy5SJLEZ/NlR02zHgCY2FxEnsF/6FThnXKR2koyN0XystslOUJnDqZAa10PLxyUxX00giy2BPxtOAW7BoBIqkc1VaRiLyqy7W9hkUsYHq7TfOK9JTiBqSL/PpbRtpzl/hWmkohR2TTa2b078rKG21hLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090311; c=relaxed/simple;
	bh=3bq4wS41sElH6HN97Xk+wCPENH1Pwd1DGUbqR7V7hEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6LRZAIefNVZGjbp6YaM9Nglk9Rt7+h2/QJdwCSjlGMyQgOMZl46CfTJi2qLk10ooO7myQ67Ft6RkXApfAyPtF7BRIe5vZOoFP8pQjbLy1B9ogeUIWC5rtmwEYlRtLQUn+4e/4aoG+R13IzZGtYUUbYmpvCgbvoWiIiaebo+7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8ysGjiS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so12093270a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767090306; x=1767695106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A84L5izMWerjv3l5VUK/ThKlyQecyYUlcn2gwusIU18=;
        b=A8ysGjiSqf9QeKSn9jN+oHfmfPLwKMWjxRKFA7KgRhQFkBNY2AF+yXGPddzessPIW+
         8cS3o4T7N95Ko9fQ0LG7JawoP1HqzS+5GISMpSrei/VOiO2pC7pVj7n51L2zytCQ1T6y
         u33n6i1D8Yp3lhqEXddFDD226QsG1yOmRgxeBjDa2eYsccYWwgI0PF53ORjT+k5bujr2
         a4o+DLwdLNL/U4i1SIQQv2uKKKfZIR/kFjnwPzr3ksYpD5ZSriSxEr83NPGn+a2lYGvn
         okD4zuOVnfBC/MR8HrIDxxE4C56mWu+ua/A78TD/t6/FM4fkoQhUE6l9t8n52AhGmxPo
         WYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767090306; x=1767695106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A84L5izMWerjv3l5VUK/ThKlyQecyYUlcn2gwusIU18=;
        b=EIkpmO6bvvZvmMm5qjTY0Rhb39JfHjJyHwnoXoh8hzxn8Je86FjBxGa5Ma6dMFyJPG
         9/BUCo/rtcNEOdnpOHAh3QzSocllYHS9yYDAUOHgTkYSsnnVg6ZKuvDaQgKXF1NT9btW
         EMjryTnLEzvAZtxFlHazxjfc6m96kKQFlJrv9sBX8I+SOe+rFU7s/7+EcgOfBuyi9gia
         aEzqpo9ULrYRc5jhDqqE7Go3uRwC+u8XU8TdpvRB0dNqc4YBcyg7C29EtMgXy3UJ17GZ
         OT6FD2JYouZVXDNSkzfkUoSIYp00lWo0Oax1bhFs0XfCejmYBbobynO3el2y9rY+WAgc
         FoIA==
X-Forwarded-Encrypted: i=1; AJvYcCXYEoFcutjq0+YiwwnetBVFBFMZ86zCJU6oN/UdkHdaAI1FAWdAtcdOG65ZgvTN5xJz2wmcyIFJ72N79sHr@vger.kernel.org
X-Gm-Message-State: AOJu0YxFh8rW2evaxITwEok/NWF65p7VMNAxvOEWzAhGmIi8rQIFn45/
	lfr1QxXR6Va6H6V2xYIGR3s0I1sJR+qWbNUmUyrp+DRdU6YgpGu6FZBNMYMv2C+GcT0=
X-Gm-Gg: AY/fxX5p5AvckRiM6f/NtpTTJCkjN96ttweCIViPLb0FlIiIPvin6bY8q5cH2gzkE8i
	/k+cp6tT1pC3A2gT1P4u0SkAZ04Tdf8CN46VqKjnje4bZ+aakJvisMu3c/vF/ylFAZEnRxzwjm7
	VTdMVhIgSpPMAa4V9v2aOmxKDmFEXVA+HwL7yUX5Vt2SP+hz7scZiQSZYIYdDdhN1Ya+UypWHXb
	/VrXWykslqspVv3gRs+lee1e2flX5+dLZp2AwCefZabX8Vuy0Zc6MB/7eJLLenFC2B97FfR7cJw
	39PzJwb+weX9pg0iifL79Knx5FV7ZwYMuTwjNWatEBcFcHGvtJO/H4hFe4RHfu4s0QbqippWda+
	t8oEN6FhRgBZsKX7XJid9gMYO40iLmRNb70pQ4XXpoeyiaKxKwMAM+LWZcI3S5M0L+klXlwXPay
	n/qahc8GjHiKQ6vCZqXjUaaqCdipd2BYXLsDSy9YrWt5e7KWg4h14/A2pxews+TsyAMw4b6QHI3
	ojzkHXMbFdvzkwQ88KI0AeUpQBwyHfZbK0SXwko5MIClQMeQBSE8gBPQnQmPeOtpfZyNB1yQnq2
	YA==
X-Google-Smtp-Source: AGHT+IHtjFq36fKb/W+hEgTGU8xzmwqZqlmZ4nekHBAp9M3fENMh3Rta2nGIQX3/7oQIixs7qoB9SA==
X-Received: by 2002:a17:907:6d12:b0:b74:9833:306c with SMTP id a640c23a62f3a-b803719a492mr3238157166b.47.1767090305697;
        Tue, 30 Dec 2025 02:25:05 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm3660996166b.23.2025.12.30.02.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:25:05 -0800 (PST)
Message-ID: <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
Date: Tue, 30 Dec 2025 10:25:04 +0000
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
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/12/2025 06:31, Dikshita Agarwal wrote:
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

This revert looks strange, should be something like:

commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD -> next-6.19-camss-v2)
Author: Bryan O'Donoghue <bod@kernel.org>
Date:   Tue Dec 30 10:20:01 2025 +0000

     Revert "media: iris: Add sanity check for stop streaming"

     This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.

     Everything is broken I give up.

     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c 
b/drivers/media/platform/qcom/iris/iris_vb2.c
index db8768d8a8f61..139b821f7952f 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
                 return;

         mutex_lock(&inst->lock);
-       if (inst->state == IRIS_INST_ERROR)
-               goto exit;

         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
             !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
                 goto exit;

  exit:
-       if (ret) {
-               iris_helper_buffers_done(inst, q->type, 
VB2_BUF_STATE_ERROR);
+       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+       if (ret)
                 iris_inst_change_state(inst, IRIS_INST_ERROR);
-       }
+
         mutex_unlock(&inst->lock);
  }

Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your 
commit log ?!

---
bod

