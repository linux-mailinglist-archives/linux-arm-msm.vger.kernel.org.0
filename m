Return-Path: <linux-arm-msm+bounces-11602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F68598F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 20:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD1F280D58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 19:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBC66F074;
	Sun, 18 Feb 2024 19:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3QjE0De"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D91E86B
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708283253; cv=none; b=OlqivGPncn+x4P6rLQICuWDwXwc4KF7W3A2QgL9RYHEA4TZN3zE529MWh9fPHLxr3EF0AUM7jn9uWYoRKHOGTX9Lpmc38zrs5ElBeZ224DFL5yn+m8MPh6f1YsfKrUS6SyXX6K8QnV1/y7QQr4E77hyngcx7uCxkFUG5oN5FKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708283253; c=relaxed/simple;
	bh=9qEs2bLMEPI6Wpj76i7Ro8DLSaVojALPLjviypw/7Ng=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j9Tzv3jlROc+URdacR/f7jf3qd6V6zN2Z17lhF5y1yK8AnEVwg/e369bpzrjlqNaBwgzwIjr/yVZRomGp/LM7gKSG8NZd0GtxXm5LqnzHLTmFwxMKAGg5YbF899GDFsv+0fDCWHVCvzPE9YS8Vx1y8pGzdOmtcqXTPtViuk7c7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3QjE0De; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7baa8097064so255056539f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 11:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708283251; x=1708888051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UfZ9/8NPyY3E75m7VV4aWgI5OQ6i0uFlZYGhwhgUW6g=;
        b=W3QjE0DeQEyioE6wQj+5vOeMb/TdQ+txUbA6hwkK5F0Hhyf6Eg6yuhV+KAz/nvyOcp
         IeSZGBH3Gtr4Vh2yCZr1oPygS8s7WnmRchc5Xk6gRnUsSSZ2tLJMVvgDpvbKIb3H0H4y
         mnAFZaRT59twVkkH9+II05IyBstHzViCZIJfgc+BvtLR4Y67VSacMe+ad257NLD8yx7i
         lu47I2SbLN2ieE4ATnlRR/q9dkXDI9v/Zk+/1JIfGvSF/hJ5Tu7D9MXFYDQ6Yh+6beXz
         iHLi7c75iA63plSLpgbSgzBXSOQ3lZmx3XhGT/ZHFDgkEZ3uBGcDgkfB71sCr0TCxB+c
         twEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708283251; x=1708888051;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfZ9/8NPyY3E75m7VV4aWgI5OQ6i0uFlZYGhwhgUW6g=;
        b=oElxvG5+mfAX1OaGf5YLSGqDOIgxixcf4utVazJu3Nkr2E+GKhRXVKIWIY9e6zHQqg
         /dIGeizCGnvVzZAyvUzNfIjPjglybQD6lEPtKU6X9ZCZ9ZDpRofot7/MOsdmB+o4fDz7
         iTYFilSudAhvZ7gp5FlWaKlwYpPZInGfl8JNrGJckEptOfYJskwT9TgOQzsdP04ivbCU
         JyuySmP1g6GRBDe1lVHpDxGtIe1Ps+X+lWSVhUWP7/sJAO60Y8vHq5nTBJSMQm9mhJLw
         B4uHot5nwZykK1wlKit7k5CmsXo3TzwPvBvDvBV289VKyRRj77NzJuy70t/dgWah0wra
         A5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVub+6fCEI8jAQpd7I70oVoF1PdiOad0srUumv8ZFqc85bOvp+EJKcYoXNlYQ0CNcOgGT7EC0r8jsbkDBNQRNTE+XEYam7A/XnbFb3kcA==
X-Gm-Message-State: AOJu0YyRySXyVkZ3qwBioy89h65YXmVxbS6iBUVQ4FcGlhqTPtsfRMUx
	qPSO1UxQIJnFP1m6cAvyOff6RLQUMvkMtgCaJlNYD+Fucl+XEm5zV+CCM9P+ai8=
X-Google-Smtp-Source: AGHT+IH1FwjiheTYossXAiIGITYYMfhrZ0P8j+lW2PjXe7rH+tc1Om+W33AlnMg5KB7RWtHjd5IfXA==
X-Received: by 2002:a92:de12:0:b0:365:2429:f615 with SMTP id x18-20020a92de12000000b003652429f615mr2702528ilm.8.1708283250783;
        Sun, 18 Feb 2024 11:07:30 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id c5-20020a92cf05000000b0036426373792sm1759365ilo.87.2024.02.18.11.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 11:07:30 -0800 (PST)
Message-ID: <5e36928d-e892-4cfe-85a5-c0cdbc669c0e@linaro.org>
Date: Sun, 18 Feb 2024 13:07:29 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ipa: don't overrun IPA suspend interrupt registers
Content-Language: en-US
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com
Cc: mka@chromium.org, andersson@kernel.org, quic_cpratapa@quicinc.com,
 quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
 quic_subashab@quicinc.com, elder@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240218190450.331390-1-elder@linaro.org>
In-Reply-To: <20240218190450.331390-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/24 1:04 PM, Alex Elder wrote:
> In newer hardware, IPA supports more than 32 endpoints.  Some
> registers--such as IPA interrupt registers--represent endpoints
> as bits in a 4-byte register, and such registers are repeated as
> needed to represent endpoints beyond the first 32.

I'm sorry, this is a BUG FIX and I neglected to include "net"
in the subject.  Please handle this accordingly...

					-Alex

> 
> In ipa_interrupt_suspend_clear_all(), we clear all pending IPA
> suspend interrupts by reading all status register(s) and writing
> corresponding registers to clear interrupt conditions.
> 
> Unfortunately the number of registers to read/write is calculated
> incorrectly, and as a result we access *many* more registers than
> intended.  This bug occurs only when the IPA hardware signals a
> SUSPEND interrupt, which happens when a packet is received for an
> endpoint (or its underlying GSI channel) that is suspended.  This
> situation is difficult to reproduce, but possible.
> 
> Fix this by correctly computing the number of interrupt registers to
> read and write.  This is the only place in the code where registers
> that map endpoints or channels this way perform this calculation.
> 
> Fixes: f298ba785e2d ("net: ipa: add a parameter to suspend registers")
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>   drivers/net/ipa/ipa_interrupt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 4bc05948f772d..a78c692f2d3c5 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -212,7 +212,7 @@ void ipa_interrupt_suspend_clear_all(struct ipa_interrupt *interrupt)
>   	u32 unit_count;
>   	u32 unit;
>   
> -	unit_count = roundup(ipa->endpoint_count, 32);
> +	unit_count = DIV_ROUND_UP(ipa->endpoint_count, 32);
>   	for (unit = 0; unit < unit_count; unit++) {
>   		const struct reg *reg;
>   		u32 val;


