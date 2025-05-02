Return-Path: <linux-arm-msm+bounces-56495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC6AA71C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17C493BB2A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51587253F09;
	Fri,  2 May 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqXgdKSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89278252914
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188939; cv=none; b=dJIgEnhgeYZ+0BqSzgM4FxkpLaZ//N2O0sCdzNQVkVH9dOiOl/As8irD2+EdUF2QNrkQ9dk3NlMegsO7R0q9adNIfgRd55JfGxhlo/btQ0iQE5G9wNbFOmOV/LiBFBHqNI2AuTq4faxwx9T52clE1dURXLdgd8dZ6ZDUkWZml4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188939; c=relaxed/simple;
	bh=hezViJURrVOoPpXb8OTUuWkHgUlYO5MOuHtWGN/Nd/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWmm6Qqzzl/6pEm36AOcH7z4ONfjoqTSttiyh07f85/2V070IBJ9EOzFQzgNYMmT9CfSMvsMTsQALiMME6FTQSQ7isMVmVehmvwceunRqAkNP5MBCxcZC2CBiAFiW93Tt1+VZlNWV4dsovdBFy2o45u9f+4KI3H4v63iZ8bU5jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqXgdKSm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so15888585e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188935; x=1746793735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=VqXgdKSm/IYlvWiR8iG7ny7q/2EZ2yEKC8oHQzZxn7XHf7I34f60cCCEPooFJdsKUR
         qifW/f1FT6wqHEdfdoEWDW3ghYPe2N+qVouTVnOZT3xlhyXUioi/m/fLcgsYcdcqyOiH
         UjHZ6+b5QyEHUlAktoKIvI7upCwiITZOw1byHtFGhZBgDo5NgDYYRFujguzj58QatDO+
         xyAqakFsHe/tsyo5Mqjbe0pVCjpIdsiFND5DQAIsykrbgRogppOQt7apnGqODlfY/tMV
         33rw2YvYWUEQqHHVroHxnxya5jWkL9XuqLSzkBRHBDT1Jv5mIT2q5KuQ8PIdvYwabe9u
         /cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188935; x=1746793735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=JqX/rBHY/Rv/0nj+7bxcFx2lZcJjO9TLcRDrdYmMSeNAqcU0ZQCoHcbOT0PUOsmOwe
         z5Ma/iV823J9E3bnkiYooZFBUKhu5YNO4VA2/ybyY7ykFXHdzuneGMW2LG4haAeJmuuC
         E1+HH0liA8C2TIgGmrH4f1yxy5VOih9ozGQ4K6Fuw/RmfQkPTiBN6fyPtgJi3WIZO5jG
         OoXwq2lRxp8g5GOtGG7SC1TBGTtRy1PtDzOefuyW+2jAHNz9N0kIar6+TBz4jUHfYHtA
         VH6gRwpBiR8mtgllxOyZ+7gxDhDz7r70U+hwcwTQd5kRcczYlimEZwDrp/tbF6WIQZzs
         NQfA==
X-Forwarded-Encrypted: i=1; AJvYcCWzwrZ2SsP7b6RGGWrd10lSqTN6zJp4yKtfBGxERkklzTKNLoSSPzYC9ePX5BX5feBDt/XNbW3lhwYQ36u8@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCIxtXzNFjwhAhO9AIvxm7iRbHxrrUKYfE0kcJUVARaV38TAm
	sSeRAyVIEnOZRSVuRTVqbrtCIhguAN+c8XJBtLUgl8xK6coDzmTmJtGRP8RB4sE=
X-Gm-Gg: ASbGncs+CgCgbvrZdXJMGmcBDYmH1ZI8GYp+p7bGKoZg/YopXrMCImk31Ieb8/zUH7r
	VrRPL/he+p7CXZ7bHikXA5nRixnEZV1A8YU/gjzL7RRfpFqUu8Enkx4u6qGsE4wa6gMS3sJLddh
	CxAEwIUuwzXfEIOlgKWuugTuvsDz6YfU1ql7WVsnkSk4ufQsFAsHQ7Dlmp6nf630EbkX+X1olHQ
	8Tv0zS10Io3vd66Kpz5Pq6eVvSVIP3z3wTNFxT1IhTHTkcjZNqzWNwKiWyClUnZcw9wTXPqf+nG
	BauAfzCK8R0mTT1KMY1lZPIHehWtEgAy1eLupN4Pf5jsl8OyZ+jpk085FaA5ljP1K1J0WIDVdGs
	t9E9nkoK7qImxb9dK
X-Google-Smtp-Source: AGHT+IGjhiW8tlzqpxgk5VoUKCEl54e77Nr773Jlan97Ttw4cL9jyMAsrH6+IC+FpMkUAZB5kV3tVg==
X-Received: by 2002:a05:6000:220e:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a099af1056mr1924634f8f.51.1746188934794;
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bc0sm2020496f8f.20.2025.05.02.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Message-ID: <54d9f9a3-6567-4d36-a020-78da0f656ed7@linaro.org>
Date: Fri, 2 May 2025 13:28:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] media: iris: Fix NULL pointer dereference
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index d1a2a497a7b2..4488540d1d41 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>   {
>   	struct iris_inst *instance;
>   
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>   
>   	core->state = IRIS_CORE_ERROR;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

