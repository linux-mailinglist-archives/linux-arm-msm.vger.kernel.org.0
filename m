Return-Path: <linux-arm-msm+bounces-21234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B18D5E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF107B2988B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F311422BC;
	Fri, 31 May 2024 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGVNquEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F32138490
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148191; cv=none; b=BO17gYaPELoeQoAMqUDO3feDZFb29e5ImQpqUmpX7LnCV3Ggcedj5HtL4KKogrNwEQXu+S4dchMgvpuSbJsW82QUHeK5ZCyxqjVsYJ7jJl8Pp+rDdiohZsll+imVwzusFc28baPLqBZPc7pa4StxF8MpGEZc6Nc274xS8hMByrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148191; c=relaxed/simple;
	bh=ypzlDlyeD6OBpBGbfrvhK4Qr2DmtcCy4TkdN/A9qKAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=up7Y3bPA17wszQtVryRNzACwBBHF5TRODKcXw8zHob0AHvzWW6IzgIhFdQj4V8+XWJuN0XAYZzPFV/A+XfKMVlByYTxykfW7g1/H5uumZAvnuNnPh+yYrDPABru5ErMuQDgeDdcJe85A02qPlp/9Alzcf/uT4RD6eVhTvrWm9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGVNquEo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so9978611fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717148188; x=1717752988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcdLBOINP87SaDpYnAUw0WSUnmkqMYhFo7uH6mOOQg4=;
        b=NGVNquEoTCylOpy4qwRLeNXGpUeOOF1OTWLNeVC+CKFM1RQrpn4ggVx7hFinEl6KFz
         z69NVkq9J3bs6uM/0yAUC5eR95E79Mz7VWC47YolVjbOJLSqWvBh2h6pGifaSbgD8c6v
         eNMI1dtYsXw3Do96CmMKB6ZLiQK3OgAoqeeAeYEQuTmp7Wf4gHGBautxUTI/YWHAWY+t
         B7vclE7q9TO3G82rKOBg9h7sFB3wqarZ3iQmtGjlpmIlfsRsuyYtTJslQLhZT7Rhr2jF
         CrWaCuDgxNVPUpKpCTo7ceiFlNsH4UF4No8+/HnVfrqK6F2In6mbYOGNqTOKb0PF/4PS
         uv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717148188; x=1717752988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcdLBOINP87SaDpYnAUw0WSUnmkqMYhFo7uH6mOOQg4=;
        b=NCBWvkCP/kcey7zFRP87pbMeBnXGZpAcmAd0ds1uuJN4H37XEUbLOVrfDgyaX18zQj
         05l37VtCSwrFKWQethCSpU9HtNE3NJYFIycM4VAYtv2L2lABXle+LZYyJHgYQ6P3oLKX
         jrYEHBDIcF0SJ0KicrXoQkqdzyQfeA3qVre3icIG6iaso7LQy1iSJDu0JfvYWD6GBE4t
         p6SC9c8ecLlJBaXSr780bTZ7W+MAQlAS3mtTEPbYtoUOyZX6r3CPd56juBBCkS9QN758
         NY1j+upxuSwjMavCUwPgl8ufvQgR7bWixEFEaVur81ay81o5xzb8N64D/dKb88LWxtwt
         4PqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJGmEHVIcl9vb68DE8dIGStNkK3m45o1MD6Y/XxEnfeFHZSZBRkP98gUKdr5IpsMIInwCPanpL3U4MIkEVoCH1rx66PCwwhcWVEjN3zA==
X-Gm-Message-State: AOJu0YyPR6QH7fSV3Gfyak8FKC6Gsf1/NxhXfbzXOzpigx0wqd2ugWLz
	PPPvQyPn9/a/t/oQXHq4y9lsW9WIe82ouJRV8CBWPKqt4ynGCKe5IVOxUi5G0xw=
X-Google-Smtp-Source: AGHT+IHlP6EtO9x8mgVBl8nidavrwbrS9YJKsrW3JUzRcWNGSEwVfabm8K60LFQ7LqI61N3Uu90TfA==
X-Received: by 2002:a2e:870d:0:b0:2e9:8a16:fe31 with SMTP id 38308e7fff4ca-2ea950aee36mr10497401fa.2.1717148188184;
        Fri, 31 May 2024 02:36:28 -0700 (PDT)
Received: from [192.168.86.191] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b838b83sm19727145e9.10.2024.05.31.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:36:27 -0700 (PDT)
Message-ID: <6bdd3a9e-2c02-4b65-89ac-918a1157b120@linaro.org>
Date: Fri, 31 May 2024 10:36:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] misc: fastrpc: Fix memory corruption in DSP
 capabilities
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable <stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-4-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240530102032.27179-4-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/05/2024 11:20, Ekansh Gupta wrote:
> DSP capabilities request is sending bad size to utilities skel
What you exactly mean by this?

Curretly driver is sending 1024 bytes of buffer, why is DSP not happy 
with this size?

> call which is resulting in memory corruption. Pass proper size
What does proper size mean?
> to avoid the corruption.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 61389795f498..3e1ab58038ed 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1695,6 +1695,7 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>   
>   	/* Capability filled in userspace */
>   	dsp_attr_buf[0] = 0;
> +	dsp_attr_buf_len -= 1;

is DSP expecting 255 *4 bytes instead of 256 *4?

--srini

>   
>   	args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
>   	args[0].length = sizeof(dsp_attr_buf_len);

