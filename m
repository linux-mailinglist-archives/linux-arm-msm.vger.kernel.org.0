Return-Path: <linux-arm-msm+bounces-28464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1B9516CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6950E1C221BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D4214373B;
	Wed, 14 Aug 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEJk4MK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2D1422AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624947; cv=none; b=PopveISFe6A4De21Wwb/Nay0095VvK9rm6bZAS4NlPbq9l7+NqDEatlXcw/Ku20oKtS/JAg+JNyHJ0TBZa5W8H56QqMbU9N6J0r0B6TpsLlI/kAlZe1cLc0JQZIdKPwGmq/tsO7mPtyHdQgQXPkLQRDsawzpssJDAjHFZm0pVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624947; c=relaxed/simple;
	bh=1QfKCLMRnNPzmvyKlrpuDS58cibY7JPKGSrw1Fiy1Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGUMl2k4Fh9/XLTqQfgiPAKMN82rK4dlt+p4aUuSZICsuZV2vqR3YU34MBdVnd2hsvXee3mKYtgHPWJHiwdsmewCQEPdD1rKUdI8Xddv45Zr5NRJ203mCSo2GM8i9/ZMOCM4phnuNktAML3yH224ZnF3zKfe6WKIIEOLfTzTzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEJk4MK3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-368313809a4so353901f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624944; x=1724229744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3AyfZexU22I2sH9aPnSL5GuTFz1W/ENho/AlFGBB7a0=;
        b=CEJk4MK3CZS+YK43bn+qrW6bbbUDjcX0xgjwbHGYz26i98fKa85krHbezelrZOgBLH
         ojcDcZlfTczn4BIdleq77AwHW64cyymaAVGFXZLhQvJs4yn3j1s+9+kespzKAD9oJfFO
         ADRxIAPJJVTT/+NMbNDLUfnD/72mw9VfhV6tAfEk8F1luMBam7CkdmBGYImcHkxdHzmC
         01MJ45AI00gcqQINIJEXfiPab71A13Ra9RRffq0vuNOwynlpeGK+/BBI6NiYN3xaEsqo
         rRTjq++kcgPPKVqOiJBz7+CC64nY18bt2TiMv3nP3pz3VsXUf0tii0t2+pI/39g8IOKP
         UOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624944; x=1724229744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3AyfZexU22I2sH9aPnSL5GuTFz1W/ENho/AlFGBB7a0=;
        b=QIkcPyDX4iqHaWU/qLZ0NgfA0EtVfEAnGwSMI3P7iZwgVAD5mJvhv7NQ6BsdnZwaEC
         cfw8HR55T2XN4GizSPqubf9tpxOQCkFDtxym6tclOzhK01cSUp+yjD+AYwhcTVgOPOVi
         ghxzg4cdUqLaDQwmprcbKvjVyRi8CUSe5w6NgCUTcSBbbtQbUxywAj8S5+WNjxrPOqc1
         jdHND2VpDNdE9MVY07iEQlyBNiVi/225TPsiWjWRMuakO9bq0XuYy7BXC6jZEgLkWGq+
         dybK44j7NpuBlTzVy4t0XOhKFWq8diM50khJcUtX8PG0CCJqJ5dqsCFvr+M48jCuw1Dq
         pcSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9UJDFmc6364UJGo1uEnWGAXpY5xJWU1Li4kpc2RTM7g2ci2AS/n7D3bhmjwzJ28guuQbZ8ubiTL4aq3dxnahKprUZIeg/b02KYflhpA==
X-Gm-Message-State: AOJu0YwgcZ0LG5Pbns4dxVkOc/Kqs2UvF9Qj9SkGCZ2H9dsD1KKEJC6F
	gpt+49VIGplSzwIpRkuoRv7lTxxGXGhkKlDrXVQkJuuWadG0/IZIzRlqhA45Pus=
X-Google-Smtp-Source: AGHT+IGQisfWqgtdPNDL3251nLqNoB/iLdOa4Y+g5fQHv6/ZcTIQfBAbps6K9TvAvJILM4MqhlIIFw==
X-Received: by 2002:a05:6000:2a3:b0:366:e9f7:4e73 with SMTP id ffacd0b85a97d-3716e3ead69mr5763290f8f.5.1723624943698;
        Wed, 14 Aug 2024 01:42:23 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37179646104sm962415f8f.113.2024.08.14.01.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:42:23 -0700 (PDT)
Message-ID: <ede0cc89-35ad-454c-bcae-5a77dc3bafa9@linaro.org>
Date: Wed, 14 Aug 2024 09:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix error path on configuration of
 power domains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240813210342.1765944-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240813210342.1765944-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2024 22:03, Vladimir Zapolskiy wrote:
> There is a chance to meet runtime issues during configuration of CAMSS
> power domains, because on the error path dev_pm_domain_detach() is
> unexpectedly called with NULL or error pointer.
> 
> One of the simplest ways to reproduce the problem is to probe CAMSS
> driver before registration of CAMSS power domains, for instance if
> a platform CAMCC driver is simply not built.
> 
> Warning backtrace example:
> 
>      Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a2
> 
>      <snip>
> 
>      pc : dev_pm_domain_detach+0x8/0x48
>      lr : camss_probe+0x374/0x9c0
> 
>      <snip>
> 
>      Call trace:
>       dev_pm_domain_detach+0x8/0x48
>       platform_probe+0x70/0xf0
>       really_probe+0xc4/0x2a8
>       __driver_probe_device+0x80/0x140
>       driver_probe_device+0x48/0x170
>       __device_attach_driver+0xc0/0x148
>       bus_for_each_drv+0x88/0xf0
>       __device_attach+0xb0/0x1c0
>       device_initial_probe+0x1c/0x30
>       bus_probe_device+0xb4/0xc0
>       deferred_probe_work_func+0x90/0xd0
>       process_one_work+0x164/0x3e0
>       worker_thread+0x310/0x420
>       kthread+0x120/0x130
>       ret_from_fork+0x10/0x20
> 
> Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The first version of the patch and discussion is found over here:
> 
>    https://lore.kernel.org/all/20240806221204.1560258-1-vladimir.zapolskiy@linaro.org/
> 
> Changes from v1 to v2:
> * added an encountered runtime warning to the commit message per ask from Bryan.
> 
> I tested this fix in both cases of set and unset "power-domain-names"
> property in camss device tree node, and I didn't find any negative side
> effects of the fix.
> 
>   drivers/media/platform/qcom/camss/camss.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 51b1d3550421..aa894be1461d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

+ stable@vger.kernel.org

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


