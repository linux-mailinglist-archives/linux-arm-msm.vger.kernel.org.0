Return-Path: <linux-arm-msm+bounces-23909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924491472F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59AB2844BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558A3136E0F;
	Mon, 24 Jun 2024 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPrjd8Rk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B345007
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719224145; cv=none; b=WqtzUsxVCex6Q4V/FAEXh2JDxawgX3KoxY3LlUNgCbZFr7SriUaQmYc1bd4FMUWi9cuvrXn8s2Iv+JpJF+y70gjuO9vW9ZwaYWznRrytQgInyPLOswYQ8dd3G7gCWUmrNFAkUYXzX9fzL4ZbiEHaIr0qC5QtEuiFdvsbUAp1krM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719224145; c=relaxed/simple;
	bh=Uf15in9yBsOauSmzPbkwgFiI/Idp/7pLGB+ASx7TbLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTU0gHAvqeJjjtLWo5Gl7AGqcJXTtfPbiqxf8Zug6/aiJ4GimvCwG0QIkOFa8EZZe5A7ejg6nv8S/4BV6J2AAMI1l3FrfGEpZQGpLgaPghpwTVYDjA2+3aZe8yPSma9tZBDM9GFBUmn8UKnMborWpoqIhPNhP6LHi/ZrPKqh04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPrjd8Rk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3632a6437d7so2374744f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719224138; x=1719828938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RJvLP8dzqTufXS9PhipejEFfcOskTHLuR2GTJoAFLk=;
        b=wPrjd8RkDEbYDm67J/3d0bmlFoFw+rafxHDy6sElcwVbd+8HrWC+KzGG3MeAsQkV4h
         MsMhGxYrx6PL7iljYgYslEdjwbFmHakYZV/Pp8hzLeYD/mDyDjQkQXP7TipbP8HoV/Oh
         R0wWI8BetXBv/SN4WoIoqJ8dOSbsQ3uJx83A13IRkXLcYdAEKYKd7RsTfo8UwOfqoA7N
         nbwIppusF69CZtgOt2X8+2/A7NqIcS/zLED427n55VBvUBU0DuYXXEyWojA6w5k/E9kn
         RqpTTxHfqb3+w8hbK981xGy2ZZ4zGmGON8+BtDAwQ5QAKJegtC48GviZiQZMbJrWhNQ8
         CBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719224138; x=1719828938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RJvLP8dzqTufXS9PhipejEFfcOskTHLuR2GTJoAFLk=;
        b=Z9jiiLYkDpZm2DDRinClX/X9UOQOKcucsf3gJsK7N/uifsP7TOiz6+SL0guphemBGo
         4RX6poFuRR6sDwKwCm2xRaL8upEdI8ieLAENrQr2v5U6xiGbwDnRwWze/0cjM/edArVA
         aOUghe9UFR8O4r0Jv4R47S9w8sbAn5ihmv/PqFkstw34ozkNgmVcWUl8VAo/PbqaEjM0
         lgLmc96MmoQIoyt/LFOFzAV4uYEchuHLTJERu1NzBZznEscR3b0p3MvlxAtzvdz4rfw0
         KlJqWyLYciJnsxHaqDLuYNvCyPNpdI6E7jig7TcW5cM7cOin9rn28unFUSwgK3h2qY4N
         xBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9hCkRjuTSDI2asZSy1bmaBgWNH+BlF1eKHIxi/Yqo0OqejKjqXNKDHLXbP+4BJsVKsEED992cPCE+ce66odI9/3d6BeAVMVpKQhvRAg==
X-Gm-Message-State: AOJu0Yw0KPZGxsD58Q7Xa7YL7pgbKVmq9zvWGxxk0EoZpAalxNY/6XTl
	WJsnRdDc8wrLgLRbbj8r+NDVVgQz51P1XtvGxX8isqMWkpWOsE5fsW3WeRnbmIk=
X-Google-Smtp-Source: AGHT+IGu9bYT2sY76dbujOp4sqYEQ5wKe/R7j/GmetRkhI5WP9tkfkIDPJoaPNs/bCovRDm0gZzVdA==
X-Received: by 2002:adf:f990:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-366e3267fb9mr4020106f8f.9.1719224138105;
        Mon, 24 Jun 2024 03:15:38 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910d5csm134233475e9.36.2024.06.24.03.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 03:15:37 -0700 (PDT)
Message-ID: <2e8bc8d8-375d-4143-8ffe-7444c9eab42a@linaro.org>
Date: Mon, 24 Jun 2024 11:15:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] Add debug log info to vfe block init and set clock
 rate
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
 <20240624-b4-sc7180-camss-v2-7-0dfecdc50073@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v2-7-0dfecdc50073@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 00:22, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> Print out missing clock's name when doing msm_vfe_subdev_init().
> Also print out min clock rate required at vfe_set_clock_rates().
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 05fa1adc1661..fbbf38755c0e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -579,7 +579,8 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>   
>   			if (j == clock->nfreqs) {
>   				dev_err(dev,
> -					"Pixel clock is too high for VFE");
> +					"Pixel clock(%s) is too high for VFE, at least set to %lld",
> +					 clock->name, min_rate);

Pixel clock %lld Hz is too high for clock %s
>   				return -EINVAL;
>   			}
>   
> @@ -1452,8 +1453,10 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		struct camss_clock *clock = &vfe->clock[i];
>   
>   		clock->clk = devm_clk_get(dev, res->clock[i]);
> -		if (IS_ERR(clock->clk))
> +		if (IS_ERR(clock->clk)) {
> +			dev_err(dev, "missing clk %s", res->clock[i]);
>   			return PTR_ERR(clock->clk);
> +		}
>   
>   		clock->name = res->clock[i];
>   
> 

A bit inconsistent with the messages

stick to "clock %s"

---
bod

