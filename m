Return-Path: <linux-arm-msm+bounces-25976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC692E825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 14:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429331F25FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C685515B971;
	Thu, 11 Jul 2024 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWuobwHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC615B132
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700368; cv=none; b=AJg2gR2RMESTwbbeuZxG7S39xmJA/yzF3Bg4vIG5kOGWGtdpm3mlzl4blrW46/3tUKGMP6Gh9DMuIue055O5inZVHgzqzvyo0hA06L6x7sQdP3wrn2D2dB+TPoQWwGYqn9WhvsAYMEJchaN6P5Ure4urhkA3aQnLzKM/rr0V8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700368; c=relaxed/simple;
	bh=ShoApCPFJ8OT++92dM4/QSOnjbYm8rOtDQtsUkF0IDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7WtafAB/Dq6MuOhr3UlgCawoqBP9pgemWPRSESmy9CotHCshTiAdPUXfAgpVHfSppLVtIJxKqQca7dsKuG9hl50yQAa45ESdz2MY6YSH2Sm+Rf9T8g4oJhx6GP16iWlwvxxWlXsmSIJVTEZN8585GmlYe2yJ18DcueSwj3GNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWuobwHA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso8578081fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700363; x=1721305163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+9tg0Li/AqyrMmzIO9QGRt9whheokHUzC6WmLohbNQ=;
        b=qWuobwHAB/UQxev8J6cFDYyE4w7/ImR98tP/glecydPVFUpcIJF3dwe3aKBWm9dYMo
         itgldbEvkShKCjZihHUMlNJg24fYf/4y4ZXQlVNM8wjDIhD+d2GYmE0A5XVa1Ex9kRgW
         OzdKaEoRTHcyhkT7HuTrOX5EaVm9zn9WPAbwDYFwqLokv8vi69ahQqD5rmgy+zej1gf/
         qVWxOqURCTRUpm80qNKsJJWdCrmXyC0Wrlq/clxF7sHM1E+P8k6GSIMQRKIaJnR+MEwM
         micVf+Uequzf/p9ey/Nq1xolMnzwlSijW3fesrMdeRJUQFG2VTM1HlWFQ4RG36do3+BE
         n2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700363; x=1721305163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+9tg0Li/AqyrMmzIO9QGRt9whheokHUzC6WmLohbNQ=;
        b=MPhPeIFzyZT1aMaByix/W6/tMuXRJI4WVxJUDEtE5ChN6XLUrYX1DP711rLWBaZzlb
         RQ6v6sAH79Zlm9ZTWZZCWc3Drv15Tfx1lV+gd0veLfPM/7MVxkoe+ffpTV/3zn9ikX0D
         EQ48uX37MTGJtKX0nP8UcqxNhyid/UO68uTfyASjTRd+Jy+xYMDOI+gWaB85jMM6kcNs
         g6ptpkzXCV+FgEeBUOua4eizof9GR+QXC7XuaZmP2Ae7XYJ9/rLc/k0gwz1xv7s9P0oh
         xgOmmDNYykSpRC7wRv1PH6eeDnlJsXvU4mqJ6SurpexiS/Xnx2hb9SVpl+sWBhOBN6WL
         XPYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNDnEfkG+5iOkzqSYB0eHthjm96nngRYZmRM14rw2RjPD1FnguY2l9Emm9e7Km0UPeGYnol7F7zJeWOp/mL7kqpRi3hN18SWYzOBEcaw==
X-Gm-Message-State: AOJu0YyYqo4754bUly4fbsb5QCff5Af9gjTnJBtqolutH8wV+mUvC3yD
	HhyfCtyLnlLYpi92zScMXRq5kuSXg52O8EpQ4LavVUg5tqA63vfCCNpcOhSR4g0=
X-Google-Smtp-Source: AGHT+IH8XJ9x1TRFe6JiT4Wf3t1Tb6DvI9x+xL3YAtfaHFGDRg1d0VfdwZDgWq5WbIZ0C/RWbk2mjg==
X-Received: by 2002:a05:6512:15a0:b0:52c:d750:bd19 with SMTP id 2adb3069b0e04-52eb998fc7cmr6784566e87.8.1720700363175;
        Thu, 11 Jul 2024 05:19:23 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42651531f1fsm250412815e9.0.2024.07.11.05.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:19:22 -0700 (PDT)
Message-ID: <96f14a07-0b82-45b4-8c72-edeb1e2e52af@linaro.org>
Date: Thu, 11 Jul 2024 13:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
To: Kees Cook <kees@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-1-kees@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240710230914.3156277-1-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 00:09, Kees Cook wrote:
> Replace the deprecated[1] use of a 1-element array in
> struct hfi_session_release_buffer_pkt with a modern flexible array.
> 
> No binary differences are present after this conversion.
> 
> Link: https://github.com/KSPP/linux/issues/79 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..42825f07939d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>   };
>   
>   struct hfi_session_release_resources_pkt {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

