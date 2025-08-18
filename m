Return-Path: <linux-arm-msm+bounces-69596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD4B2AB96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1DB41BC3529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008D924CEE8;
	Mon, 18 Aug 2025 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRsQqFVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535524A043
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528020; cv=none; b=aSfL/G4nQ/lUJw5yIeoeYmvLY2tCXKw0rWCFvAr6A5NkmIQa7qK5jItY44Ai6Lcsei3UGLJ8J2sDiOWpIO+wP3D0CowzDKbKkYJ9NJCWyvWQXCutDHygK3PAe8T5yXLVR6ZdS6JswfHDoa16I2evUw1qzZhFbcUSAZN1AKL8YUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528020; c=relaxed/simple;
	bh=Lj1LaZK9KLPsPeP88aM+y+ZF723aGg2WGGRqM/crNIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM7O/N/nUvyFxuL2hp38P/0EvkxOu0Zp50ZJ+DXrx2QxaovPp883Q7iMunSyOVl/pNFrjufhOp19214ZwynJGEWS9C6sNS7osEDw8pUgMRfjB/6yRW2LvgKrkrB37PvMqo/pRv3n2iu5cdOqc0zn2cmGD3swR2YpJ/dFoS5U5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRsQqFVs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b657564so453512a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755528017; x=1756132817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4EpRe/0JFiSGlS67A9qrUfgJp+opmMz5SXits4GEHVY=;
        b=nRsQqFVsWZ7sB4wmKVgZeOP8OfOX9QWDyAPXksqCYfOBA6tD281iPhc5qp5wA5sYeJ
         XEDdkdHgyWQEzzqcZUMD7Abd03qUO1QI0B8/CXovqNuDRC/ak66sbwJDPK6X+P45H/2g
         S9P4FcBooRf8++Ax8LadvZypL2mYFWuIEJxP5UW5avx9hGJz2uEAjoU4XgOMYSYUAQ7J
         JREMmtjvuci6yjkVbBO5tMC+WfNFoa3ktxLeyTqa6mfdj0UOaviJ4nP0t4y9NeXny7Fq
         C6XBd/Uu/s4YI1S/QOeiJh8QQx2Y4vDz9tzj6Z1h3+o0LQSvyz34e5n86W2GdS93T3tb
         jS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755528017; x=1756132817;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EpRe/0JFiSGlS67A9qrUfgJp+opmMz5SXits4GEHVY=;
        b=ufDInbub9XvkxK+6juxnSqwWX66JfaVY9yExXg3XhmJ1jFu+UKUsDZYkfxQt7bfMK9
         MkJ4yClU5IPZcfP3yVgPSEHVjVCMvoIJ1TShG+MH5Jy038mF1v03OjtDKkYyEwCp1ok/
         s7pYT/+Q/DAPkdosPnlZ+58EdDcYJ5X0FHOVfsuwOMFMuU18VCWOk0/x61kn1vheqcPb
         t7LzTlKwzdsAt4Ckowy0BUofISHm9p7mdL2qiyNsuczdd8TzECQhpr6CVzeNiXk6Sq+i
         h6HqjM82QBj7sS+HZ/B8bduB26L2o247Moe8LcYK0y3ToCblrZ+Rq4YCU12+XB3LG8tt
         4qCg==
X-Forwarded-Encrypted: i=1; AJvYcCXj0uEbjYBfQr+/giqw/jSbBwWkQzxX7c796TspbC1IecRmuxcVPOgeuNfrXoVT1MjyTA4YCFl5Uu5Fz6GG@vger.kernel.org
X-Gm-Message-State: AOJu0YybPTnjj865iye13Jz+Hh+8AjxHUfCUZFoTTf64xOOTqUIVet/I
	pHv5DEAFcOUfO+AVXxVNPnTY9vofFlu3J37/oyxCQGSHVLYWaxbQK2USZ/vCPEwzBYk=
X-Gm-Gg: ASbGnctpFwzXaPS4E9Ie7fb4+Rqu4RE2gIQN/X0o5fgQT1pp9nzJ0pmMJIFEeAuWd/I
	7LWqeHFhqkUMqV8vhKBQ/ZxMfr1r99ZmDZGdEBbLSBIMKfGpguQV0gic17BEdUe7U0uBb6RyWEh
	oDyqGu27guZhPfPRDt+Zu90uy44Ap7zNwkc4xsDcEviG8bALVp5gf45CPofi0NAav77WZan2vkR
	SvI27FGGeKOQl1SlK9u6doStwyr85WE4qoKPTjF5ubPF+AtytZd0D3zIfv8UkYIdElE/2uNnWC5
	GDFELxG8OgTTxmg2M8lEi2xn7bB7UBOS4HaGkIG8Zi0IkYZBR8E3CPgriNf/RiWBJMd9Qxby+No
	GhNpwpckhL3qIbxS0XwZdn6lsLidE7QO4NKtt2I15EUU=
X-Google-Smtp-Source: AGHT+IF65mUJgoO3pjvqRQobR0K/x8gHAzD1PHn+SFpvhZ3mWC4qAoD9VA6qC1htLfq5IP6SsI5rXA==
X-Received: by 2002:a05:6402:13d4:b0:615:35d3:fcde with SMTP id 4fb4d7f45d1cf-618b095a2d4mr5698424a12.8.1755528017183;
        Mon, 18 Aug 2025 07:40:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9d3429sm7357230a12.7.2025.08.18.07.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:40:16 -0700 (PDT)
Message-ID: <55828090-d802-4f83-923f-a6eaee866a43@linaro.org>
Date: Mon, 18 Aug 2025 16:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818125055.1226708-5-srinivas.kandagatla@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250818125055.1226708-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 14:50, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Fix spelling mistakes in I2S_INTF_TYPE defines.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

