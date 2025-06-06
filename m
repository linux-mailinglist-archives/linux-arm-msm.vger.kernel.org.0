Return-Path: <linux-arm-msm+bounces-60485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C314CAD0432
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 16:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72B347A4BA4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 14:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC661A38F9;
	Fri,  6 Jun 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwoObaS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F71922F4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220985; cv=none; b=cEuA27UH8H3Rfn0ZQSPVEujOTJyo877LC2nrHRf8OO93DWsmm01lkdxBVpbgbhFVFf5BgyfX5lGuSZt6B3yotoWqS8HOBK2bv7WDz8dKaXBaidrwiFphRbvNeVTkz0wbDzISKxe96kgyvQUewL918PmhHC+y8zZZsb5TO+Fzt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220985; c=relaxed/simple;
	bh=MRHAloECyV7awIn1pBF28oHNT8VJoNKSlHgGIP6nbFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIwlDKRKIbNPldE7Z2EpRJqdR8YjJrX1b7MrkX+GEYYhFD7qpFxOYlyvUWjRR4NVQpU3wGcZ6IeTLerYMJpvMz2opiF6dmcGGTcRB/A4sbtFjqinz7q4KeorM3aIpTxWu42zr+kpp7qkPPtHHee5AISo6CuhtLB21M2Fctz5FOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwoObaS4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1350286f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749220982; x=1749825782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkwyvK78VqUgKCW7wfISBRdrqwzf1Kodzs7ruamvtIU=;
        b=cwoObaS4BzQehWQumYqgocJlbTJAEpXMJa53n5GnofXR4emR1zCbH6SNhnT0hPNZUS
         11Xw1kw0Tp6Gr7RTHif21ygLkuzP8K4YWE611IrJi2JRnwP5buDhj+4lEz4i0oYXsK0J
         vhgnRzRLZ+4yLjz6MYVTF2ClHoxMiNWb2dfq8HRq/r+CMty9v3jLMOsc9/0Tq6tny9e4
         MYBAUb5vfUQtFwVl5LmmWpMof0SmVv4Eq872qTePhyyGS4YSPiZ16bYSUuhUMe9/U/rF
         pR1+enHWoRRsBpeHomOZmCLFlo7hRx+iuhInNWtcO2+4ismsXKNCjHi5w8xaW+g/II7M
         cW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220982; x=1749825782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkwyvK78VqUgKCW7wfISBRdrqwzf1Kodzs7ruamvtIU=;
        b=tLiJl7QmvGKV4OmkEb+OUnZFGLqhCme4rZKAYaHPnIt6W0OIruDZUN6Ycjx7q/L7Nu
         wwSrURiC0JXoZgMgfanXYlRjI+ZK79fGEhSahHnQkFd+S+CK9gRr7sl+QpNGlVhT3Zwr
         7+T7yu6dqxuUYPiQkHr0sZtMQGH88Jssf16Zb31xVqfyrM4iwsFRIUy1Z7gASO+hRL51
         /FDnh1jUAK7ZFv0zGMntLOI/M+eYmdR6uJatoR6CGrPEbib2F+FP7a9JgB33CBzrz1F5
         S8qOsGtFDST/gcZ5Y8sFvmpkHcdneeLUwXriOR+doJ0kqgRr+V7hY0dLMm4BxQ34HWLi
         /0tw==
X-Forwarded-Encrypted: i=1; AJvYcCUkpoL2ekv2l7L9OkpLwOJPXbRo6eMF/SwZub8JPoJjRirbVmf+rnKno+HIkVVjKowxeLCxGVzRk3Lf6GXx@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHFt5YNgImTrfSI5sh3tHNfAiF8QMl2jyPPALO6dSlXO/stc5
	G29WaLOpJy6c9qaMSkMM5sSgOU4nODUUXAm6nPIadltjWWAuRz5YeAragASONneDZPQ=
X-Gm-Gg: ASbGncsxIE8950cY5BMEZm5b51BITKxE1pb6IcLpLbJfSHSG9jSIevtHvmDsXoliRXW
	c49Lr4Fgxxg8369ljqeCa1EH2ian6Oz3MllgADdk5qBBhgDM9BRoiwhlga+IfUCU3BzU4D0kCPv
	77Jo8TScP4Qh7M/Q9FcWyQ7N0AD81Ue6+zoTIzLWw274811dQuAZ4q+C0PhRnm4j0NkxqQTSo3h
	vnLbb3ylsa60pZXzPb3ts3qbOWkQK3Jmux0TrIDHIetAHpBmKTJ+QsIU7cSg6CjhJEi4CmkPiOX
	s9gPJrXmEQi3+MDyBNOdrKICghKm7FuU+PS31djTULg1mir/uwpo5cFVayEnYnNavyVyo3JAmI/
	FVJ/LxPQY6i7Slmdo/XlhxP5jMTYaSjxGiVb8lg==
X-Google-Smtp-Source: AGHT+IGS7Wybf+10qczHDb+s/ZW1EOGQH6Fn273BtwmHQS/UKM1PO+aqhbN+skEAkwby7IIV0ZcOkw==
X-Received: by 2002:a05:6000:26cc:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a5319ba427mr2457378f8f.11.1749220982107;
        Fri, 06 Jun 2025 07:43:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229df09sm2085274f8f.6.2025.06.06.07.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:43:01 -0700 (PDT)
Message-ID: <2ce9f14e-b0cf-41f4-84f0-6e80749b9504@linaro.org>
Date: Fri, 6 Jun 2025 15:43:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 13:33, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v2: fix authorship
>       fix spelling mistake
>      
>   drivers/media/platform/qcom/venus/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>   	init_waitqueue_head(&core->sys_err_done);
>   
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>   	if (ret)
>   		goto err_core_put;
>   
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>   	if (ret)
>   		goto err_core_put;
>   

Please add a Fixes: tag.

---
bod

