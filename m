Return-Path: <linux-arm-msm+bounces-54011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C51A85CA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90C598C4A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7916F29C351;
	Fri, 11 Apr 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz+qo4Gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447729B213
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373445; cv=none; b=Z2gVv8vUqxMsAN4CaV6eZF3uC4/SwcvwS0lXwb+Q52UNRYe79NOfIbClqKkzTYCjwXKS3sjn0hSaVmbaA8pwTuro1Mj3iHiqVBXVMNyUc/odYostkJw9+7hJmdZHPG6HQOM6yuAhJnaNU13k0l+se8AUxWLN6pcyxbAptgoyeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373445; c=relaxed/simple;
	bh=dGHld92vUVbOFD/u6AtKaP9uEUe1RGPsRpaLDsrOO/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrM4/fR6/w6tPAqd56dSIeGzH7lPITVMZO2hbAmDNA5OSSuMGs2gf+3XZ96ZDJLenPwh2qTyg0lgUvy2xzjHTiFVphFdCowKKk3jdQXIRFMMBA3aru7b02T37ywVeKFPB/XghOmn85wniIVGx7wU7TLpyyrTxe0XpmgKGUztHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lz+qo4Gn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf680d351so17749085e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744373441; x=1744978241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5LlnegqhXWYoYcLoLagqAZu+k870W60Ciw5agd+TQE=;
        b=lz+qo4Gn3kxsri5qolrG9V6egeFebKxqHNRtcxRp6fWCmzfW4FAoajq3UGpmgRgng/
         2DLUO1O+zTnXVHC9JjkzCEeQpRhlYw3itR8bft4dkKpWMmAz5AaFF5xIg/zdGdLYyO/+
         IXKIZY9G0XYS8Gvkn7uXeWkGRY+2c11haossZo4tfkwEACVhjFgOZFgclUCwDf/aKERp
         bXTwwmq+Ivnhqj0vk7BWK8q6NuQqxglmoQdel0fvH24TrKVUDpN7/5oV0ejnadY/thc2
         eFxrf9dgSXSui6Jnu1CCSVm6YB+dzUf/oJbMsaYtwga/yjf8dBWU0qdS7X8KY1t7r5ZU
         I+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744373441; x=1744978241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5LlnegqhXWYoYcLoLagqAZu+k870W60Ciw5agd+TQE=;
        b=AcQcJ7Q1XAxucNYFv+TR0I2cfjtEeXH1RxzoqUaX1KfMOWYZS0fJilVVr5hszGWe97
         DYFk36qk4cVmqnCGjPYEyqtQw2M4FMQ30//yq1a9x59a473rr0rptN5xrlSgdu0cZn5o
         sMUDdlOJYke+RUzeuSet5ajJDkRkIwGSTce3gK8ltrva+/5Lc7e3BpLJZs9EUTSrWdyB
         nfGDhMAZNhQ2i7UpXQiHcDIHo6uH7oDNskI1mIu84m6rL8wFwVWzLs5oOAY+W7DSHsnx
         CtQv9FElFpRFbHqvYI7ptg4FNlbVxP5+joW5oz6MgBvhUSJH5bO7A78nlEK+lzS0cLok
         xG9w==
X-Forwarded-Encrypted: i=1; AJvYcCW91LN90OceSOUQPJnnfyP/7jUIS84FW+tczYPYni6JaTECfyfKOT/Kpi9BAotYuXXVDy2dhx0i3j8/72fT@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyALyxeuz3V+sVe0LDByLVFhYjiP2/cHWx8wq60YCg3OfSTlS
	crrSwN61+jeyf1AWcdaOevyfxJiKzv7Q/JuGI5icb5+21oV/0t/nEPMnefLWPvc=
X-Gm-Gg: ASbGnctLfKIE7dEXOjM402DmKozb+OdKMHwlj6KlvDOT5CHmFzY3+BFc34bmutaqFde
	1n00+5Ai7lTNdwRolrmM9EB9WseGmed+gMxH0AtFOub8G5D2CbGIYR8Glj4Qe/W+p8NbQ0j2+Gs
	wmjL6ZWL4l7s8QP+5LTIjDqlX2wW52fJ7tTDelRYhBoBAph1q/WyTO7FXcdaGjlqneqJEQBffkS
	jo5chFgpgTUUa62Ik0p68theYAYTg1ypZTBVvyVjYSYYT3TBKYvKDpMpFzBel6Br2qSjPzKg/4p
	eDtQQgnRbKCKOMwXEYJvt41fjc2Tmle37f9u7dHJclsskzs44TjrW3+RVVMZeP52NNIiyD+Rmx7
	En81GmA==
X-Google-Smtp-Source: AGHT+IHlOq8/ca5REmCpBpkFoqbdN5SzfkW5Ay4uvrR7nOsyWNcTGKb621SxyZxe+WjLiuuz2iXeFA==
X-Received: by 2002:a05:600c:4f50:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43f2eb51034mr62138375e9.10.1744373441065;
        Fri, 11 Apr 2025 05:10:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm80436805e9.23.2025.04.11.05.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:10:40 -0700 (PDT)
Message-ID: <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
Date: Fri, 11 Apr 2025 13:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..75fe63cc2327 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -396,6 +396,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>   	for (i = 0; i < len; i++) {
>   		buffers = &inst->buffers[internal_buf_type[i]];
>   		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * skip destroying internal(DPB) buffer if firmware
> +			 * did not return it.
> +			 */
> +			if (buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>   			ret = iris_destroy_internal_buffer(inst, buf);
>   			if (ret)
>   				return ret;
> 

iris_destroy_internal_buffers() is called from

- iris_vdec_streamon_output
- iris_venc_streamon_output
- iris_close

So if we skip releasing the buffer here, when will the memory be released ?

Particularly the kfree() in iris_destroy_internal_buffer() ?

iris_close -> iris_destroy_internal_buffers ! -> iris_destroy_buffer

Is a leak right ?

---
bod

