Return-Path: <linux-arm-msm+bounces-34825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0EC9A30A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25A041C21187
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F271D7E33;
	Thu, 17 Oct 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEk70zN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B181C3034
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729203889; cv=none; b=uQHW41gUktPfESZapTt1ihMuyc3AVgK/EwSWZZYnR/yrBvGC7oOGTw28ttJgnvrQBp2C1PUKOPmDGAbaV3PiVKtmC3i8ky6k3OqsWJjNYSkHTb7QG5E5qGsaLopSlIS5a98vSHhtTiua3Aew1oiqP1rZQSxHy4VB893EWRrk3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729203889; c=relaxed/simple;
	bh=hJcKXZZqP1q18W3w7Qs8TRcql16FNs7FzZ3BFU+kkYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJEAi+xIeR/hKLbKTrXN4bi27gVpsKM+1PnFj+B/O0bO8mQxYuJXHUYCuTMkDSxn/XQPkcBFmYCoT8JAL2nwOvpwyX1QbkDZwb7GuIDsIAzfFPh/Tvqlsgv9dylONDYFOKcrnvppd5OMhOkVspM1HS/rJAnrd/fTFmATzgqL5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEk70zN1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1712771e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729203884; x=1729808684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=NEk70zN1wvuWqpNDnzS6XQ651DatKCqOHdJH5LZjIQmvjND9pnLpEBB74kWD8Ma/1w
         jeBZfBtwukGOSale24yyRbofHKfRmxDu9PiWzjE2jBdAQYEteGl+ZX5L5bzj4E0bzQpG
         J8twK02jOsd94RWjCDKijVA39AthvsGl9eUTfDs/3UQeqR7ZRfoXAd5bqJxh5v3lCfqo
         vZNdjqfEb8CLtoasAgs8wYv2nMPCu95lgfJQqRNTHuspkx/6PmzSww/MRv8wXuoHS3h/
         lgBe6MQDWUjABWwi2mN12YmS7T7hAF9RE1wWmppq+scq76nkeCkaruhd27uFIf7aOVMa
         QTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203884; x=1729808684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VocsO7a9C7Q0Qui7xbnKUaUO0s/uFElHeUCAM0fdE+E=;
        b=qe2i33NE/x7u4r7I/8N3zDBdvMqmY/7ybAAohblfjuRe9tuj863lISAfFWzFi0SxIQ
         DwX4a7nU1S8qwTjpcbCFX6TS6Kx58yHm9L0AbC7dhxueM4/EyUTEDLKHPBxSxvkXnBRH
         TSaRViKnjm0ZsvcAsY2jvcc3ySTRuVKqqULUfanDl/p54jXbIcexCEsjO9xNE9cOkmuz
         ZyDVofsk/OuHAiXNTB9lceo3nIrwGebuFwyQQFG6YMHyQsfVrwmbFlCSMk98mRpcBlGc
         Avxs142M6PrLtmHuyBZgeM4eiHqxQfHV6DK8l19AyZdyWcJWb67u5/54g0KwCz2qFVj3
         EYSw==
X-Forwarded-Encrypted: i=1; AJvYcCXnjZKqS3ckmrEMKalF4asS/NpwADnipHkk1s4vRE+tHOa1+hAxHJQZn96OIsKOHWmt4C29dAxm3P4Te9Zp@vger.kernel.org
X-Gm-Message-State: AOJu0YybtVvjNBFb2HYxqlmOPY5OlH2UvL3mjFySFMiXiBKUElvR86QE
	HIx66b14xo98T5no6fDCBISMn3dZ7YpZvfsUylj11zQCRYc27N64IAqs57xhb6k=
X-Google-Smtp-Source: AGHT+IEa6anJV3E0K7CppiPuZYQbyLcF3shfaKC5Kb78/SiQ3aJxOxbLaEaE05j/Agx5EYEUizZnhg==
X-Received: by 2002:a05:6512:b06:b0:539:e1ea:c298 with SMTP id 2adb3069b0e04-53a15218cdbmr264581e87.22.1729203883984;
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211bbcsm44012e87.284.2024.10.17.15.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:24:43 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
	linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, vkoul@kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for
 DSM_CTL and SEC7 regs
Message-ID: <nhpeyezvodnww4m4hou3of5xy7lbvme5jydpprpmj3yzr7yarj@thiyvzume4bo>
References: <20241016221049.1145101-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016221049.1145101-1-alexey.klimov@linaro.org>

On Wed, Oct 16, 2024 at 11:10:49PM +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory. So far
> the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with
> RX2 path it will also add rxn_reg_stride2 on top.
> 
> While at this, also remove specific if-check for INTERP_AUX from
> rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
> was used to handle such special offset for AUX interpolator but since
> CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
> macros will generate the correst addresses of dsm register, they are no
> longer needed.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

