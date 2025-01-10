Return-Path: <linux-arm-msm+bounces-44760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E491BA096D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 17:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5558B3A48F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9FD212B35;
	Fri, 10 Jan 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5TQGeIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9450212B36
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525472; cv=none; b=NECC/+LojpvQPVDji+O5fwDT4NyxQG8vPKH7IOF0s+SHb5ljGlzhXu3i6rTedYk3vipEyDhvRbAHoJ2+aB0qpu/brkMarmaD9H1k52DVRKcxGo/YUX6YdJsPXhVlgTz+wwEiSdxY6nnXPfN1C6S2BEYUKp3AULvp4NZZ43X1OQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525472; c=relaxed/simple;
	bh=MljjxHxoX8GaHS+84Uy1/WpDs2AAXeW0sPr4j69SroE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7MmlnW0miLOp6e/jPSiSRBnxxysGnNEAEqvrkbN+Huo+wXClhFcqFMuRHBYrrMWONYrrtqURPszOJ1zqyzdyF1TTUx+qMzLDJkrxGCL4DE9QdRy1n+0BXsa7Pm4HiwzoJr3ZSzVvMtb6/omWLENh+d9qY23ehsAJNkp65xQxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5TQGeIp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf60d85238so427501766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736525469; x=1737130269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sO6+i0NXUmRSFkB9Yu3Q8N5mmOo8V2pYge16oXXAEWU=;
        b=e5TQGeIpjfbm0P23SOJtQKZpWMAomCS8WGRGnvwk7Msj1HAQnsXm7/WyYzjCdP1lfv
         FZM0TX+e3vWYOzeLStaFIkpHpG67dPydcXKL+RMwmdrBYWUyrf0oUofkBmKsPoYVJJNy
         j25M0zm2xhD3rxUe29c1geILUADFm2W+BIsBR2IwOMk+ntgTsviGm4tlD8yRPqidbMTP
         AAk0hZ2pZPi3pNU6yxlcG6DbgTwmGU7w1GDtlZEZdlOaA+8CYS0yqEIOXI2+sqqJ0lxN
         R98+b5DkjMO8tcQ4kM0985O6PHB2gLFIzow5H2bK55lkLJvIKFr5xdxoKfhoXzXFTUlW
         J3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525469; x=1737130269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sO6+i0NXUmRSFkB9Yu3Q8N5mmOo8V2pYge16oXXAEWU=;
        b=N7flh9qQCvaxuUKwSjFrrhRRyFmD7zs5krcDM9xk16o4ZTD2Kusaz6Las1+8dIN7c9
         B+HUowusfBLQvyC2olaS4W3ce06Y+07XZX4DfmNaurEjNwB/Ayxls7Wzz1OWwVHmg4G6
         Z1cLzNtgKtOHYDzD+Wgsx+bLUOo8bVfVbOviZhwzTPbAPgCamo6SHyVk5JBRCBprGaJ7
         2kPG9WuNDFAn19kTer9DgO3ff/aHTuqxjwJfS4UYG6hoopmmxh0ZQSvVDEl9MPWEAxuv
         Pldm7y2tXklKl2ORjb3+kRg3cRt81qUvzkIgHAV8KGa/PIZxm3ojyCAHPYX9eB/mBloZ
         38VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrdwKeWWqQnPzA8EksNI9UYBoYDWBVrl1Yk0TjcOAQ+LV7Xamc42wGLCuZqcOlSWUnkaMWrP/8Uyt2m7I8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvstt3iiTNLZxgC5vUbtqy3BiADyEo6qTMHGnZNnC6DOI75UjB
	ICGHveRWuQVECSEzhUKvxpOYhuRb3E/NVq5688fJtMKtR1BWzwUm4vopkIJEHGk=
X-Gm-Gg: ASbGncsweCqTo05dEQ8YYSPUNxbrzQZj4r6G5GJW3IaYIowpsDkjQfK6pjC+0zchTUT
	/ikXenUavevE5tPozDOjT7q2ngOU9x0fMXrkWyjnMvxhTNpQqHsgRJjw9QQGgSgp7tY1KXqI9qX
	ASRtZw1QAXbqW95YFDhVJ30h57AhRvjt79NWiJHBDs0xw9XMveGRpTiN/PHEV4pIUuE+3G8X+39
	1WPN2GEXH5mYJDIoV8Zm5JnkSuLrcLbfvo3t+wmYEs3iGvDXtoPstmqnl71KfzOdDWVfukmhGUi
	sRLCTbdW0BX86KFIfbEyVdAkbOj0zDhRwGIaW7Q=
X-Google-Smtp-Source: AGHT+IGR8Mr43qQ2KZkd4hExeY9sbgGkPznFRQnq8uVi39PAySYYj5afLQ5wWGDPffFXfSQg4AVVKQ==
X-Received: by 2002:a17:907:cbc9:b0:ab2:b6e2:fcc9 with SMTP id a640c23a62f3a-ab2b6e2ff66mr983077066b.45.1736525469279;
        Fri, 10 Jan 2025 08:11:09 -0800 (PST)
Received: from ?IPV6:2a02:8109:888d:ff00:ca7f:54ff:fe52:4519? ([2a02:8109:888d:ff00:ca7f:54ff:fe52:4519])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060e27sm183198066b.13.2025.01.10.08.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:11:08 -0800 (PST)
Message-ID: <0ef372a6-705b-4080-9089-0ad12913de88@linaro.org>
Date: Fri, 10 Jan 2025 17:11:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] soc: qcom: pmic_glink: Fix device access from worker
 during suspend
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/01/2025 16:29, Abel Vesa wrote:
> The pmic_glink_altmode_worker() currently gets scheduled on the system_wq.
> When the system is suspended (s2idle), the fact that the worker can be
> scheduled to run while devices are still suspended provesto be a problem
> when a Type-C retimer, switch or mux that is controlled over a bus like
> I2C, because the I2C controller is suspended.
> 
> This has been proven to be the case on the X Elite boards where such
> retimers (ParadeTech PS8830) are used in order to handle Type-C
> orientation and altmode configuration. The following warning is thrown:
> 
> [   35.134876] i2c i2c-4: Transfer while suspended
> [   35.143865] WARNING: CPU: 0 PID: 99 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
> [   35.352879] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> [   35.360179] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   35.455242] Call trace:
> [   35.457826]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
> [   35.463086]  i2c_transfer+0x98/0xf0 [i2c_core]
> [   35.467713]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
> [   35.473502]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
> [   35.478659]  _regmap_raw_write_impl+0x780/0x944
> [   35.483401]  _regmap_bus_raw_write+0x60/0x7c
> [   35.487848]  _regmap_write+0x134/0x184
> [   35.491773]  regmap_write+0x54/0x78
> [   35.495418]  ps883x_set+0x58/0xec [ps883x]
> [   35.499688]  ps883x_sw_set+0x60/0x84 [ps883x]
> [   35.504223]  typec_switch_set+0x48/0x74 [typec]
> [   35.508952]  pmic_glink_altmode_worker+0x44/0x1fc [pmic_glink_altmode]
> [   35.515712]  process_scheduled_works+0x1a0/0x2d0
> [   35.520525]  worker_thread+0x2a8/0x3c8
> [   35.524449]  kthread+0xfc/0x184
> [   35.527749]  ret_from_fork+0x10/0x20
> 
> The solution here is to schedule the altmode worker on the system_freezable_wq
> instead of the system_wq. This will result in the altmode worker not being
> scheduled to run until the devices are resumed first, which will give the
> controllers like I2C a chance to resume before the transfer is requested.

Nice job figuring this out, it was definitely a confusing one :D
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org    # 6.3
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index bd06ce16180411059e9efb14d9aeccda27744280..bde129aa7d90a39becaa720376c0539bcaa492fb 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -295,7 +295,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
>  	alt_port->mode = mode;
>  	alt_port->hpd_state = hpd_state;
>  	alt_port->hpd_irq = hpd_irq;
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>  }
>  
>  #define SC8280XP_DPAM_MASK	0x3f
> @@ -338,7 +338,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
>  	alt_port->mode = mode;
>  	alt_port->hpd_state = hpd_state;
>  	alt_port->hpd_irq = hpd_irq;
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>  }
>  
>  static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)
> 
> ---
> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> change-id: 20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-af54c5e43ed6
> 
> Best regards,

-- 
// Caleb (they/them)


