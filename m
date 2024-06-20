Return-Path: <linux-arm-msm+bounces-23452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10039113C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAFFC2856ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB6D762CD;
	Thu, 20 Jun 2024 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjHRTABg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E87581F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916883; cv=none; b=jUA4kd1OpfVOI4vJlsFaKjcFQ0Z5IPZIRbYIA+m+aNLa/l2p1DemAcYKzrwZ9twDl51AmQBBH7hlWpZ1GP7+NAvfx171zy1aElz6lBQS9NkrcGbeDX8vd4VuWY79mR3a0C28/O+HQ+2BVwMenud5q6Zd3vMUdW7BjkQ/Z5zLMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916883; c=relaxed/simple;
	bh=ZgXjC97h5MuKsrDnXsPtqasAzjkA1L4/qZxU8zgq8dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBkbKscT9R2fr/AIWERswrYOhJWj2edBt57rgvNg8kruHI2JoWTdqYBvIAWrSAiXIXOvO4BGgLj9DVZDfKhG9rs2mCZcMfuLSGQmnRzkodFQO5qTsc+IY1BNadpQ61P9iuIxUP1Cq9GqTpKVHdKjM/RJY7PUpl6/L+iB6MIXiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjHRTABg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso1469924e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916879; x=1719521679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugwCB2vYGLO9qBAziYraLolUxiamWxJkohpnuEn7xv4=;
        b=FjHRTABgefpuzDhOKSeot1a81Hd6SjBNRf1VsHz+J3WAAVs41xZvo1sDaQWO5eSg3j
         OXcRPpm5L4YuRLQ0LVg1ghKpUZaHsbFFstvXdAa04HLJjyD2l60ouDsvQoqgdD4LBlUb
         tYktMP+dg7VG0+xmQwoEWHzi0hUw/Ro3FoOBvPV11dUC271qqYWTQQgQZ1i2YBXiYwVi
         iSPysD3p27DAzJXOSiDAxQB+IRM565c7ry0n9ZYK4rq4w2I7qhmsoX5fDKydaICsjRkH
         I4iHWl/ztXSeGKIQSb+XAV1IbettFbXAr32IBHat5ABLkk0N0dXIoibALZ11tdOjs4bC
         x3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916879; x=1719521679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugwCB2vYGLO9qBAziYraLolUxiamWxJkohpnuEn7xv4=;
        b=qrPNzlEYTgOjVTfUFAlyoq9rMLV/cH10sslo9Hc+j+XCeh34gIqeKf/w3K+mdJ6s6X
         hT5VSlfQK+BwEVCcn2ayEdwE/56vo7ggqDCJv4AT0fPI6hw0whJKynEcqEOsVOHO12W4
         CY29xaqJDzLVfZFgo761rv/n3xNC27LKIN0ffG39sMOG21ezcJBBkDqdKD59G2pFQfRy
         LoyFCbfC4K1n4yZNLUwV2WG/HaboPRCZ36I2NBG5DjGKwh9Y20KskYtqLBzvJfvZZWgb
         UXutllVr0RLuhYIxuRtAcRU4Btojza72t60L17i4qY2qOH+yPNTe8B3NaBKu8jP6Uup5
         o/gw==
X-Forwarded-Encrypted: i=1; AJvYcCXjfp0QsTiuOzi7dbL4FPlOn9ELnbmPJ2ltrEF20TLVxYDK3N3zw0Hl8A9ZbuPPu12Av0g5wGNFWjRn0j1ZTd98Sk7AU2VghIkE0DTjWg==
X-Gm-Message-State: AOJu0YxerNw+1sgWfhLW4tzgyNtHorAfvQ1wPm3a0zZ1kvIbBYyXlJXI
	gNWLa+FYFpMj6GuBAD+urCPKmNCSRXvPPc31gqEWZD7f6LWNHc7yJ4rPJX9rWGk=
X-Google-Smtp-Source: AGHT+IHnFgbLo9Xcp+69vJ7BWOOt187psCaIWf449B7p6z2+NscRcPlpcLAiFhI9a8nNstz7XcQabw==
X-Received: by 2002:ac2:505a:0:b0:52c:c156:15c5 with SMTP id 2adb3069b0e04-52ccaa65800mr4307687e87.41.1718916878938;
        Thu, 20 Jun 2024 13:54:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287a7b2sm2169544e87.190.2024.06.20.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:54:38 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:54:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/7] ARM: dts: qcom: msm8226: Add CPU frequency scaling
 support
Message-ID: <2dr3dyqu3epnrdpot3iwatkwq4uxgcmkoh7mzru2pet6xllarr@izq6mmyquffk>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
 <20240619-msm8226-cpufreq-v1-5-85143f5291d1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-msm8226-cpufreq-v1-5-85143f5291d1@lucaweiss.eu>

On Wed, Jun 19, 2024 at 11:02:49PM GMT, Luca Weiss wrote:
> Add a node for the a7pll with its frequencies. With this we can use the
> apcs-kpss-global driver for the apcs node and use the apcs to scale the
> CPU frequency according to the opp-table.
> 
> At the same time unfortunately we need to provide the gcc node xo_board
> instead of the XO via rpmcc since otherwise we'll have a circular
> dependency between apcs, gcc and the rpm.

But it should be fine, isn't it? Clock controllers can handle orphaned
clocks.

The xo_board is really a hack and should eventually be removed.

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

-- 
With best wishes
Dmitry

