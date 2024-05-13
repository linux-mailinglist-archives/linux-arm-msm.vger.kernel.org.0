Return-Path: <linux-arm-msm+bounces-19808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1A8C4717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 20:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B76C1F22C4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 18:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1900339FFE;
	Mon, 13 May 2024 18:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyfEyhzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E640849;
	Mon, 13 May 2024 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625881; cv=none; b=VbR+/GYF0cDqEk2hArXK/hFEFd71qycf9sfX/t53YZqr+iIaYR1dhWs5fKdMpKyBxxuutCTOwJ+yDXxJ5WrCxw3qM2QPUvc3Cse9XRhZIysttS0ADDw7WxIrVA3+zSLdalYpet0YSorrxBDByr/51giWe3BMvyWZ3Ngz3aKEE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625881; c=relaxed/simple;
	bh=V+isaCSZhCjRM6q/lNr4SqvHnAMAfUr4V2ylici215w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSMD2pjONzrSNSiZu3XTM+7E6eeEW4SsjfVkuzI/pCrkcSsMO+O/txjFTR6IcBR3kl9wLwdRR4Ag5gWzPTczPMyAsimQ73hH+JAJtW8zWSe+CjLkdPdhFy4lVqwTURmyOx75DJ7DzZpwxUL8Z3voxtpu8dz/JsyTWuLe4opi3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyfEyhzi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41ff5e3dc3bso23688475e9.1;
        Mon, 13 May 2024 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715625878; x=1716230678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7YHwZGAPlAJfMZbQVg4rYz7guv/kQNSmsLj5uQr7xE=;
        b=RyfEyhzi6T162kF8oQO6oZkO4QR1Z/28PfbiOYZ+FdawSp3rBctuTaA35YJ7DIucme
         R4SJoitrZOP8eLswacgbjaBwC6UqLfkIdMgYP93UW3vzv9Jj6OvZ4/jTwYbG5obMcznc
         csNM95D+gwE2jizptx4BHEdPndmbmaxUbtDEQcvYWgAgxpBgAfdQwz9gpiQ3tuiCNaQM
         v6HufRExb3nm3/e5dEXOCPcQ8YYa2e9DRTGsYqeBo1VN+xjG3+I8H4sRc42EGi+WKRrZ
         +RPnw8TdxPSnd/B5UiehH9UqSsfy1pdgE9Pbx4H7YQ6HPqwWRuEL/4wSIcSbqXwgxqAO
         zevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625878; x=1716230678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7YHwZGAPlAJfMZbQVg4rYz7guv/kQNSmsLj5uQr7xE=;
        b=wDBGYQSFnP3kudJBHSLddmb/p47tllG23ro6h3UqNobFwnsuExjrF2rV0NNqdVnY8f
         1UTZh4FVqdv1rNdQLV7YSjM9Falal6tbHx2xXWh1TAb3gzwKeXOANLfZ1ipezshSw9QR
         dau9MMCe+LoLReVsorOlfN3SCt7yovRGnQ9hC+rEO1PRdPQy4vOlTnWSWa8i1qqbAd0r
         4VzIAPfNpcKGlxB4OBJqKdN2C4wgbLWgSQYfk2xGcDO107ImhrJ+Zbu/0Sv1OKL+RAIm
         khJ2bIXDIgM46YQ65XHF8TZQMVcB156u3OAecW5edvSVn9v5+WeuY90mEnOMQFXW909/
         Ug2A==
X-Forwarded-Encrypted: i=1; AJvYcCUHFyGwgBWHg26G61L6L1bDy1QX+7IoD6By49rurb/N8kt0Ol0GXLyJ5jUw5wx2dKMGHAIRFvUjJomybEHNvgTiVFe6HhVVjd6SuTytXdFSPqWG/DYRlqUET5C4z6trMey4rcZvgqN2
X-Gm-Message-State: AOJu0YyJysE+X1b9KJliNc8btvv7RKDiidqi0af5rsAD4YQMifc54slm
	UWvxA06+8aX3r7hT2nCndwxy6mxuab+4vHpVeF0sUV1z1jZd87Am
X-Google-Smtp-Source: AGHT+IF7zBTcIFLiTi46x3uVkADC+UX2XcNcYdPPZ8YgAghzbFRye/FiXNHlf9LviG5sOZkNNQzTbQ==
X-Received: by 2002:a05:600c:1d21:b0:41b:97c5:ccc7 with SMTP id 5b1f17b1804b1-41fea9320bbmr69197895e9.8.1715625877429;
        Mon, 13 May 2024 11:44:37 -0700 (PDT)
Received: from [192.168.20.170] (57657817.unconfigured.pool.telekom.hu. [87.101.120.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9426sm164700615e9.25.2024.05.13.11.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 11:44:36 -0700 (PDT)
Message-ID: <01889053-bcf2-40cb-86ad-2f2bff56f24b@gmail.com>
Date: Mon, 13 May 2024 20:44:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from
 Stromer pll configs
Content-Language: hu
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Varadarajan Narayanan
 <quic_varada@quicinc.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
References: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
 <baa81202-f129-4ec2-baca-6ca8b476a37d@linaro.org>
 <21cedacd-f454-4eb8-9b2b-33a14592a6c1@quicinc.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <21cedacd-f454-4eb8-9b2b-33a14592a6c1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 05. 10. 18:25 keltezéssel, Kathiravan Thirumoorthy írta:
> 
> 
> On 5/10/2024 12:23 AM, Konrad Dybcio wrote:
>> On 9.05.2024 10:08 AM, Gabor Juhos wrote:
>>> Since the CONFIG_CTL register is only 32 bits wide in the Stromer
>>> and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
>>> IPQ5018 and IPQ5332 configurations are not used so remove those.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>> ---
>>
>> Hm, it sounds suspicious that we'd have these settings then.. Could somebody from
>> QC please confirm that everything's alright here?
> 
> 
> I checked the HW doc and yes in both IPQ5018 and IPQ5332 CONFIG_CTL_U register
> is not implemented. I see offset of CONFIG_CTL_U register is removed in the
> change[1] by Gabor.

Thanks for confirming!

> 
> Given that, should we also drop the pll_has_64bit_config() if block from
> clk_stromer_pll_configure function?

If we can be sure, that there will be no Stromer PLLs which implements that
register we can drop the check. Also, since the SUPPORTS_FSM_MODE flag is not
set for any of the Stromer (Plus) Plls supported currently, the related check
can be dropped as well.

However I would keep that as is for now. I'm planning to remove the
clk_stromer_pll_configure() function entirely but that needs a bunch of
preparatory patches which I'm working on at the moment.

> 
> Nevertheless, for this patch
> 
> Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>

Thank you!

Regards,
Gabor

