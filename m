Return-Path: <linux-arm-msm+bounces-27865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE18946F75
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 17:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D555E28165E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 15:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66EC41A92;
	Sun,  4 Aug 2024 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BePnZuNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FACA934
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722783819; cv=none; b=qXMMlWdCcZkk6O/3xqiV5hoKvMa61ZWchE/W0yLJMucgrJm4FlVEjIhp7yIhrWcASf9QVVbO9MHU6oK+6g8y9wrQL3Vgj/S61S7tTcR4+Ugk2Df+e6pNMJg6hM+nhTvd9yKNpgnhFA5yajJ3YTmeEVw7HbNDfVhVghINOotpXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722783819; c=relaxed/simple;
	bh=64fQVaczufE3HS8AgC+4WNqdmfTFZLjyFnUF9JCrBCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRBU0wSwvypo7UqGhzkXu38d8ybSOLMlQzwOuGp3OpT6voK2DcIp+jaH2bBE3Z6EfRIQ+tThz8ROf4jZhWBU7nvmBY4ohKCDuxXGMcXV7R6i4YoHfNbDbHjFMgnu9vJvN4IquhvZSpUfQ5zEI8/qHpxwi54Fu6egkw68cC3XmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BePnZuNN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso1804602e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Aug 2024 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722783815; x=1723388615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEwiM67K6TOyUjPbByvDl5BteCRvkr/bmWWcBlwbZ5M=;
        b=BePnZuNNulffrLMEFWGE2Hzjy64m4HroHTil2zVLTWaooJpRY3cADWtWhvoJLsoJEZ
         CP+G9yjX1mbDlQruA3vCyFQNX/gkjSwbeWJwu2/TVfU8ivXNU+fk/mN8XLmReo0gws+m
         Ok/azfLD2LyvHlwQThVQXoex75GyGpHwxXoZM6kYb3k8d2wjhDlZTY8R8YREfaOHZcHH
         PkYvLAArE1pDS66c9WXVMiD8FNkFuht9XtFAJFP8Qadouad0QZlKpwQjg+IU2juwlPLz
         RQCL+61jqATJnbP8cr98Zaoqic/MKcPCumHzpx5X8T8c2ViOCsqxOP3E1i3ItacK54Oy
         74MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722783815; x=1723388615;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEwiM67K6TOyUjPbByvDl5BteCRvkr/bmWWcBlwbZ5M=;
        b=LgoBLyVtanAp4ZxS5avU7ksr3tffBEhDcvp/rp4a5Cel3Yjvx/1X5nS+P0AB+Kh8un
         MaxFGzA+YjHShml8MhmLk+Uu5r9a4TJr2nN9nsiAWneeDYqlQDVAW81D86d0pCPc21Tj
         rk28oT1mrN64ldRyLjV0N27T2UyBSCejXPL2/7H9+Y0G0zj49ggO+6k5m74WV5Fgutfp
         kE4ZEP8DNfJQ2OTYW6KMcYCl6X7c59pSFO4FswQ7BwvrkECcCNeExdGuW9byRaAHWnk4
         ioA3msOwxwq5GEEiTR+2ZdYHWBtoPv7XiY+gvepi/FbvbbiZBViPmbXEMCJfl76aKfeK
         NLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdSTBFezD43NWiIqL51lh2OPQIMcKf9T5WtnRKjlS0O93XY+yvpnlu8rGP5F0vROKe6mIiI75YvKEOErPWIUS2dk8Sj4FTm0igUY9alA==
X-Gm-Message-State: AOJu0Yx66hWqtxwTDKOZm/k6E5wC6sLExRFInt5stLcULXwltj8U20il
	Rr+nbGhfYN4j0/33O442H/k4/7tVueAkmhc4U8oYTh1BskCcvQevnGRwj3O8DYQ=
X-Google-Smtp-Source: AGHT+IGneXt1dFxPw+SaUnLoig2VToT62r4amOZ66tPHFqLmbLdAQjfxHZeozGHFzarvcyNU+kSM4g==
X-Received: by 2002:a05:6512:b29:b0:52c:e047:5c38 with SMTP id 2adb3069b0e04-530bb36e672mr6513893e87.15.1722783815026;
        Sun, 04 Aug 2024 08:03:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83a03b403sm3745364a12.42.2024.08.04.08.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 08:03:34 -0700 (PDT)
Message-ID: <b00f98db-92f3-4fb2-b268-0d94e52d28f4@linaro.org>
Date: Sun, 4 Aug 2024 17:03:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: fix missing codec version
To: Johan Hovold <johan+linaro@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20240729131351.27886-1-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240729131351.27886-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2024 15:13, Johan Hovold wrote:
> Recent changes that started checking the codec version broke audio on
> the Lenovo ThinkPad X13s:
> 
> 	wsa_macro 3240000.codec: Unsupported Codec version (0)
> 	wsa_macro 3240000.codec: probe with driver wsa_macro failed with error -22
> 	rx_macro 3200000.rxmacro: Unsupported Codec version (0)
> 	rx_macro 3200000.rxmacro: probe with driver rx_macro failed with error -22
> 
> Add the missing codec version to the lookup table so that the codec
> drivers probe successfully.
> 
> Note that I'm just assuming that this is a 2.0 codec based on the fact
> that this device uses the older register layout.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


