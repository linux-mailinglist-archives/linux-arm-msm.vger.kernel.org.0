Return-Path: <linux-arm-msm+bounces-22928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0C90BA04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 20:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D70A1C2399D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 18:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942BA198A35;
	Mon, 17 Jun 2024 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhrp9DpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A0198A29
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718649972; cv=none; b=PE5gjGXha5kRu9aZaiXWZ5YdueZF1WZlpXaqAOlZ8ASgRv10X4V2ToaTGq0wrhkuP+7IcN9J29M58esGk2s5YvKuVNLDDLIJ8Sgq5RzssPHPM9tA2jbkQKNKVJyB4UBVAV6Lutk94ibMWVVskQWBHCWeQkWgIA3c7NO+zgMg/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718649972; c=relaxed/simple;
	bh=vrAyJilbjcV5By4evqrxxBOp4Ux0PY6zIiSvzKsRCa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ju0PcaYgwU6g1hYE0PGFeIoXRoFhbaqA+b+DaFSFBTILpId29NprU1Mzm7h7GmQanI74m5J8bm7xOG1FVBElZ3M+veHYeEz0X4A0Xw/8sKgA0WJCdcrhiQNZpArow7KSTGJxvdbzp0fbAQZ6ypZ4zdqpX1s/X/v/tnM/Q+ac93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhrp9DpT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec1620a956so42983591fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718649969; x=1719254769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgOgT/09Gam/jySqVngD92Hs65MR72xFegxS0POAmPU=;
        b=dhrp9DpTCelF22LL0cAoCQxhCRWGO0EmsChOhEr7wuXKRJYnPpBB8cuqvRyzvwnXrS
         bMl5qjvN161UvU3HSJkPcwcyIK9KHsfRuim4LPu0Cn10LBVbHj3LpTonwa8xhs8bdK6n
         il7qu6oYrFpKhPTERoK/iTR9C53HCFodOTN/rbYe9czXz6J4AuN0d/H27G5on+ixxm15
         b6PgJT6jqj1rfYAKdpYDhlG4Hc6EBOA2KpaVjABhe/gzq5j70q46i5VFABrwq8Zm1laU
         tW++dfXDhH1mQvqZcpGxcyL9qcOxYDAcZqjjBa33vWyxj+mE5mFx8A/NeqbMZVV7jWlW
         C/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718649969; x=1719254769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgOgT/09Gam/jySqVngD92Hs65MR72xFegxS0POAmPU=;
        b=sWc5qyS0O341jmj2Gn6Kdmi22JDyvC+rEUKgLmpKDj11bKjtgij49eaBnJzMfLrLLA
         tTc70aUYtaejo69Np2i4mONutLvINp1XuOfksThVkGNPwIs/UJSQ/CBapk5BmfFRSzFC
         Rrp3XVUzdqqQH5fky5l7qsmbxZlOYwp2IJnKMW3ZOvHExOZB137MTCkAuW1VWxMiBGYs
         14+QO/KCSUNvdwQuGjLvsxS6BtkHnnnuC9S9C30LGHuDLYLK109bRpYRMKtCLmawHD45
         +pD69knbq/TOMTH9E2e+IX14gvK8MZRHR4+mUuzoG9hozGNBnGpj3taKOFaqB7evsMLy
         VFJg==
X-Forwarded-Encrypted: i=1; AJvYcCVzCLycs4jQVBAU2uiXf/Oygft3xm1e4D50YOMigx0ED9pL84xy7q5/kEpyJs2mLI1bXf0S5F1SEh1glTFBtAV2sntmBtio8N0qqQJcHA==
X-Gm-Message-State: AOJu0YyMhsM/AwBYAfsg6vRpi1e2mMi8dKGo7K+MnRr1IgPY1dsaWshf
	Y1A/bvMnyCzl/AsSD7dSk1nhZKOumsAWV3R+duy18ObaXd3c7PdwNk0sg3EHY/Y=
X-Google-Smtp-Source: AGHT+IGTvrqA0QMatNcJ9Ht9SMK9eh4QoBCbNSEqn42ZlCChdETJHTwIvkwYiX47qYq6wfh+YlZliA==
X-Received: by 2002:a2e:2d02:0:b0:2ec:2525:95c with SMTP id 38308e7fff4ca-2ec25250c0bmr37270941fa.23.1718649968683;
        Mon, 17 Jun 2024 11:46:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59? ([2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78400sm14420951fa.84.2024.06.17.11.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 11:46:08 -0700 (PDT)
Message-ID: <5960e011-dd10-41c1-8805-765e0c1ddcde@linaro.org>
Date: Mon, 17 Jun 2024 20:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] serial: qcom-geni: Fix the timeout in
 qcom_geni_serial_poll_bit()
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.3.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240610152420.v4.3.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/24 00:24, Douglas Anderson wrote:
> The qcom_geni_serial_poll_bit() is supposed to be able to be used to
> poll a bit that's will become set when a TX transfer finishes. Because
> of this it tries to set its timeout based on how long the UART will
> take to shift out all of the queued bytes. There are two problems
> here:
> 1. There appears to be a hidden extra word on the firmware side which
>     is the word that the firmware has already taken out of the FIFO and
>     is currently shifting out. We need to account for this.
> 2. The timeout calculation was assuming that it would only need 8 bits
>     on the wire to shift out 1 byte. This isn't true. Typically 10 bits
>     are used (8 data bits, 1 start and 1 stop bit), but as much as 13
>     bits could be used (14 if we allowed 9 bits per byte, which we
>     don't).
> 
> The too-short timeout was seen causing problems in a future patch
> which more properly waited for bytes to transfer out of the UART
> before cancelling.
> 
> Rather than fix the calculation, replace it with the core-provided
> uart_fifo_timeout() function.
> 
> NOTE: during earlycon, uart_fifo_timeout() has the same limitations
> about not being able to figure out the exact timeout that the old
> function did. Luckily uart_fifo_timeout() returns the same default
> timeout of 20ms in this case. We'll add a comment about it, though, to
> make it more obvious what's happening.
> 
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

