Return-Path: <linux-arm-msm+bounces-45033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297EA10FE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299A1160D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070841B6CF6;
	Tue, 14 Jan 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aThKnQAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713413D891
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879004; cv=none; b=MOqgT6W7q+2rOkWRtJ6qFF/53dPp8OmurhT4cUHLrgJ/8FPhYdnoER2biOH6Ok2mHWMwVM0BR83QWMSfkzgqN6tXEWV+5eylycX3FH73xxPNBa7tvM0yV1AgIjN18Uzkv8D7mOiofiWiMr3l47DDJ+G8jehjFAKcksQaMr9goQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879004; c=relaxed/simple;
	bh=iJ2botgNorAHUDTTEM+60JBdoVOL8qdzy0R/kn3ucSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g9bDQy9287yCZHuc+b1glgJOCEH9qmGlv/mHnQ0NF8sKI5XeeOcyBdmWSJ51sWJ9snWWwwVUPVZ6C301SnAp3nVNp2SLmnFdGRVOzS6C8NOIq/rR2FZ9JSPZ0gmaydt/IAekg3/dOVMCxNDTvBQIfnh4HekCQeSj808oBx4QgAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aThKnQAb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso356674f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736879001; x=1737483801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zaEU+fKkHTSCeQzgeeLu51Lif3p8LXyFbHdtAfVVUM=;
        b=aThKnQAbZQ4HUbmGdRsuqgJQmZtuFT2BjRX5z9z2P98BHQPre/w8fTlTjrRauzFG/U
         hKFLcJeYYCixVzSp0xq70CLQ7Wkfni415wnVBQ1uu0ZTtyOhsW8VJjqNgzFe4cWxCLOY
         EKmLxwtdy2SzK9/nP9Eev35T9JFj0YfFVAK+N5Wo1BUY9KqAa3fCTcVDH3+kNa2YAJFO
         IXaywHBltN4J5AtC/oaReocFzfnI6rvAHEuwTU8tzDaw95IijglSafhC2oG3a92iQyQM
         VEKah54IFw2nKZYjiKl0PcAf2tuJJY6IZLj2jkQKJOTcqCEfvftEipdSJXHEBwp9Uugn
         9Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879001; x=1737483801;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zaEU+fKkHTSCeQzgeeLu51Lif3p8LXyFbHdtAfVVUM=;
        b=TennPkXoPkHkhldDlLHg9F6uLnS6j5EJMiActFIzL7pgnzOsUoUhp+wuQMK1JYT0em
         4cxV+RSYcwyNT+CP7P+hkmHLunhM/k2r4y6c8wv0bubzr4QyP7r0a1x1dbbzxs3WW4gw
         KPYh1A5+i/3sJiy/LUC7aRPprTGonHwxHFu+XGWlL7CmnaOcp81Z4EFeVa3lo9+iWHxe
         LmElLj50WlW77YM+/Kc0hLD3bBn8w0Q/89BbET0JsYDxwyx1fmtlkKRqeQZj8CxwU5z2
         4h2czfCNnFflI8WO85N9y7RTVeZHWsrB8z4S2MWsvgVLazBfqCi3nxpxwXLgHbgHf9KJ
         BX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtbMEDIHjEcwqC2FseUMjYfmlvCHhEe3skA9sjj6YCJuPKh2gA8iklRUI6FDcBUf1DDMnzxSRZRh29iTkD@vger.kernel.org
X-Gm-Message-State: AOJu0YweZ9SK+I+0Lim6V24uM3LlQ7+0uTmOU5opBpRIkf2OdaM1kwqb
	4DL6RaD3XAMdV4EMyCVprIwIgZ2dezxQZKCORB/sojxym2r4NC3kAaMMsqUYPn8=
X-Gm-Gg: ASbGncsNERjWJmqvgtxqn48hQU2nQjptsfMoV76QjiNpkbXV+1u5bFXIrq87drfD2Aq
	oc//wV8UTj01EdE2dwAtR+icdqEBpoPbKqInkknf5pIQ7eAsTW4oHr/EjPbqDkAfU4iZSHLU4iQ
	ZFqmW/mWECkApyLnyFN6ZGjhQZNNHyLsvm66DaPTAMAgXbG5L3qBw1m+zrSxu82sBEVC90BkYAK
	KABXsDqFXWw04fN7Sl6YSmf5RPy4WQRlkpaxuJ8PpsvsGi/4Hl/oQSrEUMbhpgJOD9uUaGY4s+2
X-Google-Smtp-Source: AGHT+IHmpm8WTgEywXZIsAcy/sxtVrD1zv/JWxGm2FtAPzOMwfxhoKqNhtJW9nfd9wo1LHaWdk9eLQ==
X-Received: by 2002:adf:e3c4:0:b0:38a:888c:6785 with SMTP id ffacd0b85a97d-38a888c69bcmr6627077f8f.6.1736879001448;
        Tue, 14 Jan 2025 10:23:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8209sm15760756f8f.70.2025.01.14.10.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:23:20 -0800 (PST)
Message-ID: <c1147188-f179-41fd-bd53-2d1ebfc8d860@linaro.org>
Date: Tue, 14 Jan 2025 19:23:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Use str_enable_disable-like helpers
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 11:56, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/bcm/clk-kona.c  | 3 ++-
>  drivers/clk/clk-nomadik.c   | 5 +++--
>  drivers/clk/qcom/clk-rpmh.c | 3 ++-

I found one more place, so v2 is coming.

Best regards,
Krzysztof

