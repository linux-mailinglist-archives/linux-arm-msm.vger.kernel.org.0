Return-Path: <linux-arm-msm+bounces-38404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A29D2EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 20:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 307E2B2A7E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32091D0F63;
	Tue, 19 Nov 2024 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGIMntYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A501D0E21
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732045041; cv=none; b=mZRBmWRvRFLz8/V5EzU5/cpF1MfndVh90V9J3SKVVxzZhhvyCBGhf//YCA9LpwW6qaJU6VK2Pz3NTVah6aHXhHNK9E06JSBMoFVyondyfCWZR0TXYGQjqYUhmAngD0jVwJz34z+ueyNT3IWRJNvGBygnv2uvoo2mfu475mogFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732045041; c=relaxed/simple;
	bh=4WUsRG+jUTGOH6GZS0Jn15Kxz1vwJeJmhrF/5snu5EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Px1ex9RCmE6w3NThedq5zBvRS0Tc/ZnncSiXrKsCOd08wDGnKTkmKnto2+pel8wGzPAvgyTfUMzNB79Imhnd/Cqsl8DE8KGR+YcKCBUlFrTlx3vWp4qCSTbwpmpxGsbUQUVuSx5Jk4sX1NwOCisk0IE56fJRkN/sjpth3zn5wiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGIMntYq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43158124a54so4161535e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 11:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732045038; x=1732649838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hxlFvij/ZEjGN1MCcEsA2qGkS/XD29eeUgFlVEB7nLM=;
        b=DGIMntYq6RrTIEvdCBM//AsEzrtcJFmMjxUWIseLYhcaI2YGTxNCK72CzQ22B4eLV1
         4IkFEOSshlAK6B00ezn3iTAit+OMcZn9GD1w0qw5QXgObBeQGo1MUwRnQU485I3OyiIL
         NrF9npLg3xreBhq9AfdkMl45xPajbI3Kdasc8c/CjXymircQs5qX5o5usHPK1gAXY9Y2
         +0FXo6oVoLmZ9rB5Yu9T02W1ptMrhwiNiLSQglrfU/vaVLPxaiUElxQJJAgGzEz+3yGv
         HLN3XGBQrsIKR+H4T4Qj69sBzUCFWosNcXLl8/LtlgowW6q8fbaN7LV9UUKSx2DrEJMr
         5OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732045038; x=1732649838;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxlFvij/ZEjGN1MCcEsA2qGkS/XD29eeUgFlVEB7nLM=;
        b=oy1OZ18CTHCxZRId/227IkhS8cbrQpcLhv3GgDowccNu3IYlnp5xRpvjpYmmoIEAFJ
         BsoKBx78fwjVxriJKdXKDgNhyyPmGyd+oRUf5e/pcCCGbngQq5KA20rXP8U4U0ITX/O0
         tE9N4q+81deTAucfkQikBgxIKBPURbY/FsYaSOzTxy/H2M6gQmxO+8EONi77pbXAhiUd
         ea2D68z5ag50ExwTUZp9mAwZj0+ZQRzP/i38JUUMFx5UqnBU3qMP5FG65bs+Cn3WZ2h5
         Dgz18ATkCzoYVm5XT/N0fcV1ghETsN0OrTGp/lCKiWDR18THlCpHeHhkPh5SP5+bvAoi
         V7og==
X-Gm-Message-State: AOJu0Yz5Qa3pw2TtQRwggVuVNKcHJkGQc4FRIuiGIS2DjSfUSVebBJ0s
	TAmdUHg+xC8RKS877w7Q0YYlXHoYhFbeiW9pnbV9TiO0upKTgEZQ0WGsHRtJTeA=
X-Gm-Gg: ASbGncsC7tZgyqujYRgxmChaOFcTxsD3vKGLRtfXAqlniZrXpuy7GCWTIAIttqSqu4j
	3RkIvR9BmcjGgoGluDVHBXbNp6BvO0Tva0/S0eUzPUR8x4g0RASmky9j1HQ7mKovNt1HTNr35WW
	wb/y0P0daqGDdgImPfQIiVzhRygUzXrknVu0TIy5DjyUrtlS7f32WJ7NWjFfXgxAJrnI/HvjuGS
	T0v6y1+f7sVhZxVfuO0khHor/hQMspmBDoeQiTXspZ/Z299VIbC7Rop7BGccBoIBRFCOw==
X-Google-Smtp-Source: AGHT+IEfxHZ/bh3pnAXH7HujNQIk/LVuiWotqDESjFDdoRKIBz9grgL85uRIkssQGDgyNuM3ikqQ1A==
X-Received: by 2002:a5d:598e:0:b0:382:4378:464b with SMTP id ffacd0b85a97d-38254b24edamr4715f8f.10.1732045038436;
        Tue, 19 Nov 2024 11:37:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254905294sm129183f8f.11.2024.11.19.11.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 11:37:17 -0800 (PST)
Message-ID: <3bfd6343-de4a-4cf5-a4b8-55a3531eb41e@linaro.org>
Date: Tue, 19 Nov 2024 20:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 4/6] firmware: qcom: scm: Cleanup global '__scm'
 on probe failures
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha
 <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-4-7056127007a7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-4-7056127007a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2024 19:33, Krzysztof Kozlowski wrote:
>  	/*
>  	 * Initialize the QSEECOM interface.
> @@ -2094,6 +2104,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>  
>  	return 0;
> +
> +err:
> +	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
> +	smp_store_release(&__scm, 0);
Heh, I should store there NULL, obviously.

Best regards,
Krzysztof

