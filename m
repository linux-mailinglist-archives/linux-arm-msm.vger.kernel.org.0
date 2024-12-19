Return-Path: <linux-arm-msm+bounces-42796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE619F7CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 15:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B5D1886837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 14:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DCC2248AC;
	Thu, 19 Dec 2024 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L57pPNhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2A433CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616994; cv=none; b=Z+ThmTLZ/NThVZ9+Viu5P3KRy1HtlQZUfwdCDk68NoQJ7ZevLhw5i8R/01itDuWQXsEw27KprdzjxcN+xmcEgzrmWp9EgfvKLJ+iz1RozRpVosepLSCVlpvdlT92ITfqgw38Wcjprleiy7SZOLPHNbwrBKu5GlTI1JVerENGKSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616994; c=relaxed/simple;
	bh=yiGRUJwjsQCL3G6F2nEr7hcrvA4M3eBm6meSLftaLs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsrXn444+yJ1mrVpOp69RxhRIsua/f6fywppFoM2QsZpy81ycpkwqBO6zl3w6i27H3ad0v3fmesWFtzAmpg1S96hcIxab71KAla6J3kDHxwjRHowtoc9bWEGx/axYmKTJHvoufH1+kIrHd1sC/1hNHhyeVOUuaMCV/O1VrdaDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L57pPNhy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso9207455e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 06:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734616990; x=1735221790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXZUFqb9xwB8UfFG6y2CJGv6YTLp395j5ATjgKVbSgA=;
        b=L57pPNhyTkysZvRLILU1WXE8fDXilFGR3UJ32EqwLDqqQkrTnS3nw9E1WZI+JAn/tU
         +508f4KzxmjcFZWRWJFRb5xtRemjIzryZtAQQeirRYQ6mR998nFm4aklnNWg66PUmP4V
         /0WvROL/pNBSDZCxHr6lPMoUOfc8/68ZcIZwv841RA1ioPOzJS0Q6oMKfoJBn9OXD7dj
         70v3zNxO/qvdvlxafD3s/g7hdI7GaCepDj6pMulAMrrMuqD5erKUQJzFJp5/ICIEZheU
         9ri96ADGXrefzLaZfQIWxOtkAiPVMvpXkYJrAsC/yqoVOhe8b7pxO3ECXwaFb0kaynT7
         JPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616990; x=1735221790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXZUFqb9xwB8UfFG6y2CJGv6YTLp395j5ATjgKVbSgA=;
        b=n91K3X3aq+fh2KNYwuqbgeFFaUTPubZ17aqCmSwi7M/E79wcyYE059ik3XDBvZXi7v
         JMerSTmcfGB1uCHzqRMp4k2m/dTtakaFw+Tjb3dsKTRZFZwMbaz3venVgEGmOOHXvprK
         WjR+UFfsy1aHkaeTEz5OvCPYE6dPCtromT5dv+EiYUjUkdTvyqHqBCSHJT7K5hpWpEWK
         z+OxW0ScgyTxgIaro+fP4QWJzV4HbvASty3Iz2LhkKIvyGfQX4T+jMwAgqnZHfGhYat1
         toahrUPg/tYNb0dJMaOhfJXKAyn5VTsps1m5+4L26p5bIWK/oLua5T6wY2Nk3knPNG7N
         6D+A==
X-Forwarded-Encrypted: i=1; AJvYcCW7hpWMKbx97J46xlRbZxVVXh/Wm7Epb5Pl1Up+2yBnBDCiy9NUk8DWv6tB37uvUCv5uLJk2beFbHPJUry4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+LLE7bmHJ+ZAPiHl9kq1N3l2ELmdjYhkRp/I1wbL5BjfgoUU
	Dnmn/CnJlSBj74r9sfegminckh94gm6RZ9yOlMzn90Df7suslae1Sor6EbUzfKE=
X-Gm-Gg: ASbGncu/RjxRzuysDqBEgoaSaYvm3aLfvVaB8SpBWHSbZz8VSlnmgYdhPQZ4vlMSUOW
	b+pqPGyi6X8Yx2UQ5I6kBa338WsxgmfUUgVCKmj2hDqaFjRNSbiWTJMenKUtXUyODrFeZ/oSz1t
	RYwz1li8J46Ra7AOUf1C73YSmyp2Q/ItfQIB4aCIj+3w2Ik5Um0BnkNgXQo0sCy2wu8he8KKc0k
	PqkU4UIzGRsOZcwgo9/AIbiu13IdMB1kkKMH72ee/0Xkbk4QHmgXgpBSB3K6qEl2jyu/w==
X-Google-Smtp-Source: AGHT+IGyI95U2ui92gYhnr7jJ7oUrNU3MvE2Krm7vhzjpIBY07DCVjBZHmYYbmYJ3aag0N+d2GREMg==
X-Received: by 2002:a05:600c:1c16:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-436553ea696mr62377185e9.21.1734616990116;
        Thu, 19 Dec 2024 06:03:10 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm52532425e9.27.2024.12.19.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:03:09 -0800 (PST)
Message-ID: <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>
Date: Thu, 19 Dec 2024 14:03:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219053734.588145-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 05:37, Sergey Senozhatsky wrote:
> This partially reverts commit that made hfi_session_destroy()
> the first step of vdec/venc close().  The reason being is a
> regression report when, supposedly, encode/decoder is closed
> with still active streaming (no ->stop_streaming() call before
> close()) and pending pkts, so isr_thread cannot find instance
> and fails to process those pending pkts.  This was the idea
> behind the original patch - make it impossible to use instance
> under destruction, because this is racy, but apparently there
> are uses cases that depend on that unsafe pattern.  Return to
> the old (unsafe) behaviour for the time being (until a better
> fix is found).
> 
> Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 2d27c5167246..807487a1f536 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -506,18 +506,14 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>   void venus_close_common(struct venus_inst *inst)
>   {
>   	/*
> -	 * First, remove the inst from the ->instances list, so that
> -	 * to_instance() will return NULL.
> -	 */
> -	hfi_session_destroy(inst);
> -	/*
> -	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * Make sure we don't have IRQ/IRQ-thread currently running
>   	 * or pending execution, which would race with the inst destruction.
>   	 */
>   	synchronize_irq(inst->core->irq);
>   
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
> +	hfi_session_destroy(inst);
>   	v4l2_fh_del(&inst->fh);
>   	v4l2_fh_exit(&inst->fh);
>   	v4l2_ctrl_handler_free(&inst->ctrl_handler);

Two questions:

1: Will this revert re-instantiate the original bug @

commit 45b1a1b348ec178a599323f1ce7d7932aea8c6d4
Author: Sergey Senozhatsky <senozhatsky@chromium.org>
Date:   Sat Oct 26 01:56:42 2024 +0900

     media: venus: sync with threaded IRQ during inst destruction


2: Why not balanced out the ordering of calls by moving
    hfi_session_create() in vdec_open_common() ? to match
    the ordering in venus_close_common();

---
bod

