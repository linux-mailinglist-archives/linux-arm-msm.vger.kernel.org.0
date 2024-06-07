Return-Path: <linux-arm-msm+bounces-22064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06689003C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58312284240
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340F3187350;
	Fri,  7 Jun 2024 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mqvwoaSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DDF187324
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763970; cv=none; b=o4ndiCdkUGcWMqOaYG7c1PwiCINRRM1OpqzcJhhQtS8MfBIOkGYKnDwBhFIRHjfFLZfJznyAFEDdrCWsw4zPbHgJaKn+YTHXpnvJvxYgI6LRSh5xzivsqUiOrXoD3aTVX3L7yl7WEb0bMXrbTw2XtsM25+LzG7S1YttWfxsQ0pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763970; c=relaxed/simple;
	bh=DO+PIT/EJMox0z4MVaaerBJVh16m1+q/CufQuXZm2ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SO9FvSxuALT3+GHoXADHChTTod614HjdBZamdVcKNC73/HCjbOtP19WmKGsS3/+TACNSr629Wt1dsBN6y9EUa2PoCDEHdSxVZI4ua9TRPFXQ1UOk7M9D9tNrWzmtqh5m59xkB1E30Gb9f6NrRxRIVQ2rHf+lWBOr9sRo6p0eULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mqvwoaSt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63947so2624271a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717763967; x=1718368767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqD6XhPELg3ekIrsN8OFaQlLrK5OO1qpE6V+0H8DfXA=;
        b=mqvwoaStNzcUZ8gJXM3LokMi+4BfZddPYzcU4BsmQd7Hpdo9Zua8Q+Xt4vvjWBzota
         K9/4kdNbKPjT3JHpeeD9iUu8KxjmVyfZr7zuT70dmVkty7z0fMO5l8WgdVtxAmoG67Zr
         NjdJlStKpZ6I/luvDqj7XqJWuDwcWFEOXikn7kleuwQHm2qFp3ykLePMJxM92GSEM8wU
         4itUMkrm4ekJ2EWV0mhGBVPlihAZAinQSreq8qVMuE4duWqxDeaXCpZT+h6mz5s3115O
         Squ1E90nL/l1juaO7M+iJ/hlvrolLEQ9PWY6gjU+sKBvqroBb2LAjLew4Wi6nPrbbFvJ
         kJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763967; x=1718368767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqD6XhPELg3ekIrsN8OFaQlLrK5OO1qpE6V+0H8DfXA=;
        b=u6P2dygUcDKw7WIzdiJ3CV/T0k27psaZRQONBuzw98QEvdUJoSA9p0diQ4Obtp0TQE
         qBaLWD/+eKuE7NapfjWMNP3BthFpnnaYunFqViph72qWvKQFLMjI3CaMeUANjpbMlUce
         xOs3SekWlaDuY/Af+axfQ96yE83tb0ityydHDbselmdJYC9i3C4hMoZ948YtRuZkCJgR
         X87zveRhW6Ltozpt8Niu1OWuA6B46OGJQ/7PK5AbWjrwxCHleskbQ8DIjwoA2hbu3jGA
         dR4ODritE3hsdGMDkY9fC13ZB/Cd6fAqPBpmnU0atKY7w6dWHyqXCkWDL9I+JslzC4sB
         U6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9GTc+sTZX+2YimIByfJK9cyo9KZCiUTdzIRHlMOh0iRNQCIc54TqAOBRDXZoY5x1PlKQZlmWpatb2UbZJ49LLT+yn6rQRAgIlkAIlPQ==
X-Gm-Message-State: AOJu0YzztVyGsKmV8rvjcer1J8H9nFu0wpbiWflQKZLXBk7IXiNIRUda
	cGGKpHBzhsVdinLZfyAWgZaqZTNrjuZrXMMHpIxXiIQ6eWk/uzK9CG7eDrYLryk=
X-Google-Smtp-Source: AGHT+IHFsnXGj/HVopUpVNgtnvfTWQayW/r/JXohCR6sS47qkuu0spIm9tkwy9NxuON/tIaN6PleoQ==
X-Received: by 2002:a17:906:50e:b0:a6e:f6b0:c4a4 with SMTP id a640c23a62f3a-a6ef6b0cd21mr17804266b.57.1717763966672;
        Fri, 07 Jun 2024 05:39:26 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e7fesm244044866b.183.2024.06.07.05.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:39:26 -0700 (PDT)
Message-ID: <d9ddc852-2414-4314-8179-9ebba98d3ab1@linaro.org>
Date: Fri, 7 Jun 2024 14:39:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] misc: fastrpc: Fix DSP capabilities request
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable <stable@kernel.org>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-3-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240606165939.12950-3-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2024 18:59, Ekansh Gupta wrote:
> The DSP capability request call expects 2 arguments. First is the
> information about the total number of attributes to be copied from
> DSP and second is the information about the buffer where the DSP
> needs to copy the information. The current design is passing the
> information about te size to be copied from DSP which would be

*the size
> considered as a bad argument to the call by DSP causing a failure
> suggesting the same. The second argument carries the information
> about the buffer where the DSP needs to copy the capability
> information and the size to be copied. As the first entry of
> capability attribute is getting skipped, same should also be
> considered while sending the information to DSP. Add changes to
> pass proper arguments to DSP.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4028cb96bcf2..abf7df7c0c85 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1695,12 +1695,13 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>   
>   	/* Capability filled in userspace */
>   	dsp_attr_buf[0] = 0;
> +	dsp_attr_buf_len -= 1;

The commit message states "As the first entry of the capability 
attribute is getting skipped, same should also be considered while 
sending the information to the DSP.". But it doesn't explain *why* this 
is the case. Please add a comment here explaining why you subtract 1.

With that change:

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
>   
>   	args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
>   	args[0].length = sizeof(dsp_attr_buf_len);
>   	args[0].fd = -1;
>   	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
> -	args[1].length = dsp_attr_buf_len;
> +	args[1].length = dsp_attr_buf_len * sizeof(u32); >   	args[1].fd = -1;
>   	fl->pd = USER_PD;
>   
> @@ -1730,7 +1731,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>   	if (!dsp_attributes)
>   		return -ENOMEM;
>   
> -	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
> +	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>   	if (err == DSP_UNSUPPORTED_API) {
>   		dev_info(&cctx->rpdev->dev,
>   			 "Warning: DSP capabilities not supported on domain: %d\n", domain);

-- 
// Caleb (they/them)

