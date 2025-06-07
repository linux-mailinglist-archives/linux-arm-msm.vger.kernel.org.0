Return-Path: <linux-arm-msm+bounces-60507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECFAD0C14
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 11:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4C33B076B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A4E20C028;
	Sat,  7 Jun 2025 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaGkKhYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908353B2A0
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287827; cv=none; b=Un4zjCEiQXf+rDzFBd+Y/Qm1j95vmua4pJtwEDlZAjqsfGxY9COHq4Npc3lHtddJhxf6G5Zbajqn6Jtn3u5BcsbKJ1S8kEB/I1jJ4zyn+q/yYw2iuwtijHbZJ34jjHZTBtmdJKhmMUaYnXpfuQTBzj/QpyNa6xQNQqpm1bVg7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287827; c=relaxed/simple;
	bh=eeiSOCGD1Qf0WEJDz2vodAFCYclFaLExwW+hwWMLokI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy2dkFeEfadbOJGeq4Mupez8SFNYlP3GgdLmMcI3aThgiaVkzwonYZVbpX648eUqfVX6kmWYhPyv/Y/67EgReSxtaLFhNag0VufEnWx6mo6g1M8yoiNwhyxXRD1iNb2TsBh3MrODjMckw7Kd8vrGof4kyScdnuB86+OYuOa7tO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NaGkKhYZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d3f72391so37194035e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749287823; x=1749892623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=NaGkKhYZOpB8njkfofHiE6yVtjAYwzixHav/S9McBw7Dkh+lEeYQMGHUHgVWswTLwV
         J1Bz95qglpgE6DlaVKhx31/n4eZxFfWootyqPNAGCGoijOe8ErkWUmI9GhW/HUxCavju
         7oH0/XV05iOBr9kbKdYDBI8siUMBJ7drDzYfTy5Y57VK9JTh/pE22qvgIQbdKhpZKTQu
         VtAUrB3iuvvJK500oZ1QOWK0l5H+cunhP8IezZcNYO/dna2+OL8JxFI2RVj0g0uWoZTj
         Lyvu7Ec8+tpwpPjrZZMS1shfM1pgF/dVMsz62GWhKK4ALcKqN+smYGLq6Ot9FGAlwBB4
         knmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287823; x=1749892623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=Vkk41NTc9+mKVVnS8rtnM9c8m4pNHT0YfRKaDS7rYUs7mHQHUeVdqqNqxb0/EhOVEI
         ACzAcqZ40oRkW597TzMd91jAVdzRCTvYsQHaUUvUekuTU6lkyvDf7iSBrMy3SnX0db6W
         RxsxARsm/SwUN7RedUVAuMKlqIN3EOHCc7HdgjxcdoW96fwlHxQJN5R5oYKL8AnfB6HF
         STpLEiHj9WOFaR1NFDP7895dcg9eNHdEsSdas1gTs/FP1wyGcvILzzhd8owQVqrUXwRl
         xnrG6XNKj1xk0NWXeIEF9UZbF4mOcus/mcLnzbRvj7ncsnHJFDap3K87elh6kOTzlHZj
         s8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVVTA1HCBi7lx9GUuiNJHwqxoJpm4gJkzEdFWLZL/wFrzERKVaGl+wQtf68BV4E9T7qI308oC854ZzVISX2@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKuT01qdxIUCzzLU5rb91mWM5bibjFKTQuQ4fsYudqEnv4aR7
	l6Qgn5KeuaLE/UdEK0HwRo9Psatbqzqz3KflALOuROtx5vREwAxZkXUHw1Km9XGmHNo=
X-Gm-Gg: ASbGnct0EvkVt0h6sA4MbLMOTiDVpeWa77Nrusb6C+6RdGlUzGlY4UIfw61U9i8wmil
	AVCneQ0L+9GjVSvQ1g3Gdf+E5gvSq9d4rv9AVG/AT2vQgl4Squ1GEApn79Q4bPK7M7O1XFrwmY9
	3eVe0HUcwvJ1vXdBzCzyUbAWdjfIeA6I8BVpGIRo/X6CzG4yOG4cjVDfG+LdOrVga6pSosCllzs
	eBAx5PewjcGgioHIeFYcMwyFJggICX6TJiKNTJQ87X7fTzydIQG3nr38mNk9DPSkpUqPWrX+lRp
	RdHTc0KfQ4Sd/B9d4H3cJbt2H+/5xd8hSmVMgmbu7L1peDJXqll3VNrtLPOkGBt7IrjoZSDUGlC
	x/9qlfwx5h2qt0HjS
X-Google-Smtp-Source: AGHT+IEeHEg+Hg4x2iy77C3/j05y23jbIyhzffYAMnvjZeeaQdFPQuoxmXUZU55UnAxgWdjFJ4co/g==
X-Received: by 2002:a05:600c:c178:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-4520147f531mr53614315e9.19.1749287822790;
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e055ff5sm50162105e9.8.2025.06.07.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Message-ID: <6e3646d8-24be-41c2-9aab-d4397ab3afb3@linaro.org>
Date: Sat, 7 Jun 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 16:25, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v3:
>      Added Fixes tag
>   v2:
>      Fix authorship
>      Fix spelling mistake
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

