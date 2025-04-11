Return-Path: <linux-arm-msm+bounces-54026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF7A85DEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323134E01BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739202367CD;
	Fri, 11 Apr 2025 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlCpiLHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E92367C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375889; cv=none; b=vCM7yINxJLlc+XgdvPLR2io81bObWbFekg7EBUc+y8uKriRPD0gFt6zDr3FMCNmdZSHqY6MglBOCQ2gdU4Kf3XEVe0Bnc2Z9jSORL/aTgz8AuqSxvRvGxq1Su+9qPBdTRmLFoONmMjnJBfdeNXtBwHHgDAJvsFF5p9l+78KTZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375889; c=relaxed/simple;
	bh=Qmeh4hTchOwJYVtrYQ6NlZZQ4TUWUgCH5SLxLm+RCwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOivAbPdJsiyKn8pfJ0fjEUShTjEt65HBVU1l0iieQHrJ4sJOAu0IXGGZU63lU6TnfR7vYXcmdt6klV5B8ooOlUyBYhdLwia6EPMFIGf6rDJ8xBn3oQ5/SJMl7k0CVx/8Yuc64l89FoWDYety4JxWEvprwfhyaGvNoeBiOIowyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlCpiLHx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15660245e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375886; x=1744980686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riHuEPZaH2UzIe43vzXOZGpSbV5+ij8h98YzpgoN7WU=;
        b=jlCpiLHxp2dAkRvXFqmssoUe0g90glCYHmNA3zAPfZqoJ4WF5X2dkHfJP1dW4hm1e/
         eO8oK6D4fVjShVCloGxfQKvhwTS2ni9/UWJbsDsEDh4INTfQQa8RiOPJZT2uzuV9cQ9G
         hvXLJrWnbSVXNl9UReAgnshe5YYFjJutLXFJexpuZFZ+cookTMsmFkruMmpfGer4R32d
         rRyTptqNJDpwKjJ8IjbP9kzA6rViOfl32WRYWNA5M7C1p2mx7Z8pMfKEJE30JEjz2qLX
         FD5QGaCuXJZb+cbNoKhcDHrxnA1IOD9EyX6hBkf1EcyfYNGOOAfLKs7nCRIirxXYyG/R
         +dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375886; x=1744980686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riHuEPZaH2UzIe43vzXOZGpSbV5+ij8h98YzpgoN7WU=;
        b=FYxDvtIAyXQhb8zLDwigCP4u8NFbrKjc+PnDKuxv1Gt6qQK0g7duwtLYQ8SGlntomN
         TfmR8Gply7Ojdncz9vhG4xyFwNhjgOyb364NsjYuLp8j9Kh32FL74HN5oOOU0QZMzIpQ
         rMndnUpSp0J0w1mIyWSTuy40us/nc9RCkSXSwStsz9hwF/C3QNcIAAIncPL7+Zk18fi3
         11cPcXfueHLOtlumBpjCeCG6omqkg8fC8nnhtEpy1V7QyTAmajB3pNylFtxXTngrqUZh
         IMcRwRpg22c9YaZPhkz5YnY3jQwq1UHHnN0Wcfz0LfzxAL6aU/hw10hU63pquYpDWzkF
         2pDg==
X-Forwarded-Encrypted: i=1; AJvYcCXoGjLSrsRPNEXpD384x89kv8MvyyNq/fJR9mF/0a0rIHSg8O5QMxsvXtmuhW0VUL9KSiGtC0ICfCOhYdhF@vger.kernel.org
X-Gm-Message-State: AOJu0YwLSo3YYbwGyEP7zBDgLRw3Pt4oPPiHFHJh0pcNGSsmeAyX6ELl
	8Z79Vl7vFLlu8Uv9i2zsGNVZnB8crRiiuIEKuU8feuXu9ly7kk1uvcWWYJq8Sds=
X-Gm-Gg: ASbGnct6O4HK35gTIBPEI15Uyy29cRT4v6egt6K69XfaymnBhGihnMkQnKej+ux0Q/0
	kpIxtX2ldSd4iJIm1ypU3BL17F4GlPW/aaNEqNUATkaWXcjAyFXiH6d/vQZsqkk0Gw8mcHubiFV
	Z4hdG+m1vz5RzcpMGg3xsM54W7JPKt/Z5OS7fWjg5I1ZUEivs5CBsv1hyx0WF9TXapdwaCp2Iq3
	Ol8f4nMBZFAwkZoh/IuLkDFSy19jb/ggKy+TQhoLRW2rw5cqdbJavH/VGxJTqiekMeaW5e65tpU
	lmu7tkYMO4MYDP9Xybzlp8YKxdTjb1vqlZ70U7iTjFu89HLYJ8ei9GfG7hwWzTbDPl1WJhXXkBF
	kZ/DE8Q==
X-Google-Smtp-Source: AGHT+IFAJk+ThCtQ5r6Ogz7zXQnZLWvFSOxBBn0d7BWFfnRxGWxCV0FsKjihE47cYfeE4hCS+/ne5w==
X-Received: by 2002:a05:600c:384b:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43f3a9b1564mr29467745e9.31.1744375885776;
        Fri, 11 Apr 2025 05:51:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d57sm84182605e9.34.2025.04.11.05.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:51:25 -0700 (PDT)
Message-ID: <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
Date: Fri, 11 Apr 2025 13:51:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
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
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>    length.

Any buffer with a zero length must be flagged as LAST, else that buffer 
should be discarded.

Is this another bugfix ? Feels like one, processing redundant packets.

> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b75a01641d5d..91c5f04dd926 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>   
>   	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>   
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +

Is this hypothetical or does it happen in real life ?

>   	return 0;
>   }
>   
> 

---
bod

