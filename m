Return-Path: <linux-arm-msm+bounces-16540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74921899FFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294521F21474
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2273116D318;
	Fri,  5 Apr 2024 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTAfw6zN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E843170
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328066; cv=none; b=TSsZBcK7GFqpkF6Gj1anXVNhNivWIqC3ExBoJfrxA2/wXO99/0dx4CPltPBNJucWY6xTXjbyg7gFDiCP2l1naldtXrukhanaLJBDY9Y/8AZLh2LD1PsKtcpApQXnLzSbauC7sq5IIvrFitVkTamcdzEC1qltwXQch3vDOk7N71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328066; c=relaxed/simple;
	bh=6oTOBIexHbGnXLfOyOVWZsSMpB1KX5H4HlLoBIJVLV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2hyo2pFuH+8WzX3EdFMZQdYkTZolQF0ztpTq5c7DlTcKslIMhzGQZU8NmP08Y5EodmbdAMU9wPaZD7/Hl2T8iJvHMeVJ1malWhEJsw6TO9/ODqxY/j9Nn1hBS0EvJTlKLh/o4YC+i3mwMS7nu1/bMvZSh/QNEL5ITBXV6mUezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTAfw6zN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so3404249a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712328063; x=1712932863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3sgX+M5RiTUzeiSjlZDWLigpfQIMw+b2CEe8ees/IsA=;
        b=NTAfw6zNY/rh628GngqgIVjCzpnlAJ8rE0WrztLnynB+pLo6YMdhIv9KQ6KthS0ZxS
         4k09tvKRU4T0Kcx1mxlXO7Yv92dh8TGJju5PvVelBLFv71pju7M4C4q5bnr8r9rZTzlY
         57HbHtXJG85ne3tCRsB8DDBgcfTTRgRFBO1hGvCh4z3kYpW8kpYFb4fHqbollKBaF9Ip
         3L8GfwIQOg7Dpt1yvwBJtC7hp9fK/glEhwYoy6hvFdpFjliF/aCkP0ye1KbCXjp7EEVx
         IY8iRpaGoxLKkvktUxWPis+E5gHvdeSC82eDYC1MEPP/tYzRbcPdk74sg4nQ/ZuezXCL
         Bhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328063; x=1712932863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sgX+M5RiTUzeiSjlZDWLigpfQIMw+b2CEe8ees/IsA=;
        b=ANHTxlu9FRng3JgbNSvlNYKCRtEQq+PJIhZQRdWF9MrnB31zo0lNZaehuFbuQ7yh7X
         RExJLce0QlmJ2g51DeEwAbKZ2NTj0gpincDqEUpTt+iMFir0DmNMBEDaWgGdfoDOsoGr
         tCZJ+NMUZJ7Eq6b9WzwM3XYQyPzPj6gUXw2lXd1XgskUjaJyy21LPaLrhyMKYdUcmMfD
         ZdO97Ltg2vyGFW+M0+RoYI3WAzsKxn5zsavraE31Ecb7242VlJ+0V0Wdu2IGu1TMTxOp
         efXRl+wr3M6RLWuGOQhUaZX6/8peG1EuRf37QrkTMpH9KZHkUOWN36cAWNIvjBaWS8vv
         YexA==
X-Forwarded-Encrypted: i=1; AJvYcCWlmkHXFKCHbsemSRaknUhjQllMvdVb25sEO8pu8j4fXV4j/bjC+ghZCRVch/nPHF5w22YarCekvV+rtVgZkgZomvdicdWO4KOQNNb3pg==
X-Gm-Message-State: AOJu0Yx6yvomHttte53dOSmw9VUG8e3OXZr6bAdU2aWsiorhcvCSTT7j
	ZIy2un+FG3VUy9uiEVUrfa7x72h1LInwLkV4Ae8EVONizjg2zGQ5mknngyyKFRU=
X-Google-Smtp-Source: AGHT+IHBKyvwE/jKNgKCM2GarezYUH6DOzLwzj2I3Y0lemSH75Z/o2ZH8lPrH35bI0f9+L8j7/YduQ==
X-Received: by 2002:a50:bb05:0:b0:56e:2393:cee4 with SMTP id y5-20020a50bb05000000b0056e2393cee4mr1053397ede.9.1712328062668;
        Fri, 05 Apr 2024 07:41:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f15-20020a056402150f00b0056e2f1d9152sm779810edw.93.2024.04.05.07.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:41:02 -0700 (PDT)
Message-ID: <f063ed8b-44bf-4d6d-8df6-3ae0ec7f4904@linaro.org>
Date: Fri, 5 Apr 2024 16:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: qcom: allow multi-link on newer devices
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20240403132716.325880-1-krzysztof.kozlowski@linaro.org>
 <Zg_fvU-SA9nwmzW8@matsya>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zg_fvU-SA9nwmzW8@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2024 13:25, Vinod Koul wrote:
> On 03-04-24, 15:27, Krzysztof Kozlowski wrote:
>> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
>> over two Soundwire controllers, thus they need a multi-link Soundwire
>> stream runtime.
> 
> This does on apply on sdw/next.
> 

That's my fault, I had some other old soundwire patches on that branch
(post bank switch delay), but I guess these aren't really needed.
Resending soon.

Best regards,
Krzysztof


