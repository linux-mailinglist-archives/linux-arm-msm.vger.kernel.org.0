Return-Path: <linux-arm-msm+bounces-21236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD18D5EC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EB5287456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B023A13774B;
	Fri, 31 May 2024 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwkMn/s+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DDD78C69
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148888; cv=none; b=ZF3PdQFZS9N5n5ovDaCmI7cmcVfRveRm0su27RMys3xLsdP7g/WzA+XjPR7Qb5Pd+vrdmek0jv4J791xr5YHTx5Ir1FC7BxXp135vNHR0Dc33FkT4M+gtWda8AAecQDaS3qEZKPQXskclz7Fd8jjuJ6zyXa7Q/ZoX16TW6bWFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148888; c=relaxed/simple;
	bh=iY0Y8pGOe7NKlzuhxWSHCXrnuMnl+pFzytg+XGfJ2Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXICgONwtBY355OA6xBcQ0O+6rzhrxP+2u0B06+dy9wx3S1uYUfFiVRx4c67HZclnn2HDKglN4SAmVrv0+6MNWaQivTiu/ruvxRB0Sa2AI9RuVTonUnrb241j1KNX1E6BIgh96XT5npLJoollrBudqn6SOBZClDLruhQvjgkM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwkMn/s+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3588cb76276so1069243f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717148885; x=1717753685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QphDfY5f+dlpkjZJqpKBufDO6kEZfbPYC8lG8WaDP0=;
        b=GwkMn/s+V7/EOe3FUyHWdzwUUtQwqD9D3XpruOy/4uoeXDAfjFewUfj5ZgB0cYST0y
         oWw0+FQ1BrbQcoLXlStIBwQUQEoUpiuYBAKwey3RfjlHfL5ZMpCZM2Th8JasECLMJSuO
         E8qYW38sj1avZJORNE5w4RKKXfBNk4zWABtBV2BjpRiJFX4ILkQTVnp+ZWon9XKwvroQ
         Uy4XnbLy6lR+TOn+ai4IdHdR3xTZx1Js6kISAuG+3cn6H0GjnT/v4LcBR8g4UdzdiAI8
         K07rOjj/HEBaMfiLRXhn7Gh2vTS5uane4biUDnWwkIfKXBHq6n5uxm4anXXDkzN5H178
         Vt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717148885; x=1717753685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QphDfY5f+dlpkjZJqpKBufDO6kEZfbPYC8lG8WaDP0=;
        b=TtX3NSqxr/DRTZtIz5SX6WiqaOKovvkzCeaMOtttq4iPKaMlJz5GBSSlyfJ+4ggIW5
         /sLhvEXqT/hf4kIGHShGbNUASLjAtUc+cqylSRAEmwd2tvkf9ZuYy4LdUx6LOfl1uZzT
         bbcG94VXQ2tAwlIBP8axvxgSnDwGaIU7F7z3+yu3m/3Dp2usClHOnIM+TEkNXGkll2np
         aN/U1LIG5l299lMWO6j4wy5Pbx+i1W2wBZncOay5XRBU3M+QhDi0Ts0G7tWUkPmjKHsa
         01a3RBDYL34siXxinG/0ohNIVyTVzKpUXIFCwAVail75FOfJnF+27Yp7TDcyoKApCBUi
         mNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiPQie1jPEv6OYYadhqy2uJzWoINjr/zdzDYsaBAvwylJqH3c8qhNvlX4Otz799owllry8MMHgh3FT1VyJYzcdInKoxzhbyM3DP+4WBA==
X-Gm-Message-State: AOJu0Yxl2PGG85DT/Zd+rJV54v8KLi/ZwKLcw6gR1bN8BiM3Klp36T4J
	hFZQvYPUo/DOOt+qId3NlZlVetKX/TXe1CwxOhjsRTbT6W8c0GrpK/fLiyQpN18=
X-Google-Smtp-Source: AGHT+IFAQRuZmhDxjGlW6esaOhNk56To1ieBo/3ULHIoW0dljiOjAH1mTqztqjhXIUNxR9S9PL+8Cw==
X-Received: by 2002:a5d:4aca:0:b0:358:d9d4:1026 with SMTP id ffacd0b85a97d-35dc7e3e320mr4172508f8f.17.1717148885258;
        Fri, 31 May 2024 02:48:05 -0700 (PDT)
Received: from [192.168.86.191] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd062ee31sm1461077f8f.87.2024.05.31.02.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:48:04 -0700 (PDT)
Message-ID: <8fd4ba90-bd9a-4520-a287-f2119a37acb9@linaro.org>
Date: Fri, 31 May 2024 10:48:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] misc: fastrpc: Restrict untrusted app to attach to
 privileged PD
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable <stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-8-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240530102032.27179-8-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/05/2024 11:20, Ekansh Gupta wrote:
> Untrusted application with access to only non-secure fastrpc device
> node can attach to root_pd or static PDs if it can make the respective
> init request. This can cause problems as the untrusted application
> can send bad requests to root_pd or static PDs. Add changes to reject
> attach to privileged PDs if the request is being made using non-secure
> fastrpc device node.
> 
> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d9d9f889e39e..73fa0e536cf9 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1344,6 +1344,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	} inbuf;
>   	u32 sc;
>   
> +	if (!fl->is_secure_dev) {
> +		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
> +		return -EACCES;
> +	}

Please move these checks to fastrpc_device_ioctl which makes it clear 
that these are only supported with secure device nodes.

I would also prefer this to be documented in the the uapi headers.


--srini
> +
>   	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>   	if (!args)
>   		return -ENOMEM;
> @@ -1769,6 +1774,11 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   	int tgid = fl->tgid;
>   	u32 sc;
>   
> +	if (!fl->is_secure_dev) {
> +		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
> +		return -EACCES;
> +	}
> +
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
>   	args[0].length = sizeof(tgid);
>   	args[0].fd = -1;

