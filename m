Return-Path: <linux-arm-msm+bounces-83444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D2C8956F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 109B4352284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD46D31A069;
	Wed, 26 Nov 2025 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oz8iRin+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C023191DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153582; cv=none; b=q3E67Y/JwSc7CNTsU2F/DSXupW0dMeqzVEFdBoAqOqKTqh6EtwIyJQ+FGxWs9dgCTYqHkt4bRUPzuDhgu0l4ltZc5Niur5RNTtl6bIDd7JZCgUtKEEc+AXx0mEG9lvjdFF57GaQO+ULDor7xVHZewvmpoL2aOYMV5dqM2UX4BrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153582; c=relaxed/simple;
	bh=Ma+j9/IG0gN/ZMtP3TKUGZ11Gs/QhGIN9uMeMZmqeXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i976x6Dapfq3PNvX7pPTjaYNBcH91Mn1smHRYbJGbidiZVImkRaO/cw8bpWzC5FqdW5ABaBS9FJ8pdm0T4BhHmX4+taqlRljAO1lw1WV3Go6bqBQgK8ke9gmtpfqj1FjWd9B9Yxjz9TcAcR7g74OtOIruGdoiFQt1koI/kefz0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oz8iRin+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43300885e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764153579; x=1764758379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGVus5CDA/A0OxI5mofdpy0uE/6hkaceE4RdVntZ8gs=;
        b=Oz8iRin+MJ+BQ8g+T85uY77q5CEiqILD6pTaN5UWdZgqxz/Mxckes4Z5vsgrCNGlOr
         /hYFypca5wlf2uiiQKIC6ATNRpJzg/k9uwZZhUcKe+5W5jCKNl3IS+nuUyCGcHPTkMFe
         bcr6tOBBSWmWgyF+Y+/h/G+X1naCqHtduoQC5xZpESl88W+XCXv786DGNuyreMNyE8eF
         IEeN0gG28LtbcC0+/VCCMFI1XLv+oyV2aw5nZMdhn3RpnRyHpxiUss2KYZvqJOTa1qqN
         dim0Mq4Mc/Do9ujxcivARuk8FfpXhc+e7VP578+UXeZzpbsiSiz7IC9xyIRnUKts6iCn
         N3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153579; x=1764758379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGVus5CDA/A0OxI5mofdpy0uE/6hkaceE4RdVntZ8gs=;
        b=CY/SEkFKtkiNtH9Z+V/mia4o8cPBkNkn1XEkwRRx702qyDq/F0yPQPjUDnI5vOazxv
         y+UeVk64dlYU2aGiLmCmc+HIiwllPkI9RzWcrKCYeJtMqoY+vF9Z8QqgLeVhaBymZnTO
         jUlTBjk6lnLEPKHbO5QCDyuD7wERK7Vjg1pRbRlbFRM+antCDCZc0+n02ozmOfZpVzdT
         jL8Sh0HeSLH7Bcor5U/YpX4xim3VBpLgPUDdToPmrBVXJR7/AZ8xMa4IfDggY/i0H4rx
         wzHna7BigjD7lPgdyQN3EULswyQIAi0SceIq/YV+eIWHag0Vid1BfTfi3XqHjW3yFC0z
         PWFg==
X-Forwarded-Encrypted: i=1; AJvYcCWzPEoBh652GeRJANvwZcB9HkxLdwb4Vt7Hs3U5M+H5MStISQqZ5giNAVk2BVG6E5O69hen0oYMOhK0Yzdg@vger.kernel.org
X-Gm-Message-State: AOJu0YyHkdA6AOXFG0Rnx1w4bZ5dzyCMshhMSDQAcO4FbDUatvAISAds
	ThjNlemoqbgRVXJK/bGEvU57Ry9tflWd8hI2SDitVoATgghL7xopp5PhqImsv271wGo=
X-Gm-Gg: ASbGnct14FteFG+uoZ1Z5rqa2LPW0XHfiHXhfApdo1ThZ1qVOCFWL+1flh4/KbSI7AQ
	7aTVPVUWJLH1R9Z9Nh88Vz3keuEwKPJeWUGlNHosL3gxsgJ8UYow6rRE3h3BzWWuHS/gI3DwpQH
	F5i3+oAwsD52RSrIrMwkGvki1eX6JUOo06mYWTGF7PcKjhtUWGWZszZlODUOAaVzUn4YLYxr2j8
	yE0rnn8T0dgRZwh/TTB9NsYc5Mswxz4Eo0Z8BkSF2K3dN6U/7mu3jmfTyI/kfKxinozY1VKH5l0
	RqT/pZVeAKvDVLLMgi6TytxWdVV5Nsjjk2VC2TZ+bSp9JD4tmrLhMSxTRks0mBKUn+IzjR1s6Pk
	EpD7yp1dFzvyZcX9XEM+Wl1wHwjj6FWv7ECdFiANO/O0+lS1Gu7BcuEcl/ywwSOJWbAEGRvmtPt
	9bD73b2q8=
X-Google-Smtp-Source: AGHT+IEhisDRJKx3724AhFETUp/XTi9FCjcatqKQGEMNBIIRl2bRvFx5a0Gu/L9CGl93q9KQ1RFytg==
X-Received: by 2002:a05:600c:450f:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-477c10c84b8mr182307075e9.2.1764153578995;
        Wed, 26 Nov 2025 02:39:38 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adf0b2asm34698135e9.11.2025.11.26.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:39:38 -0800 (PST)
Date: Wed, 26 Nov 2025 12:39:35 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Message-ID: <wa5fnedqtf2prksnqmb7oin5j3e5tqx7uopypkl2qwbker3inm@ed7tag6bk2qw>
References: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>

On 25-11-25 11:19:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
> 
> The shared GPIO core code does not take into account that the machine
> lookup entry we create when scanning the device-tree must connect the
> reset-gpio device - that is the actual consumer of the GPIO and not the
> consumer defined on the device tree, which in turn consumes the shared
> reset control exposed by the reset-gpio device - to the GPIO controller.
> 
> We also must not skip the gpio-shared-proxy driver as it's possible that
> a shared GPIO may be used by one consumer as a reset-gpios going through
> the reset-gpio device and another that uses GPIOLIB.
> 
> We need to make it a special case handled in gpiolib-shared.c. Add a new
> function - gpio_shared_dev_is_reset_gpio() - whose role it is to verify
> if a non-matching consumer of a shared pin is a reset-gpio device and
> make sure it's the right one for this pin. To that end make sure that
> its parent is the GPIO controller in question and that the fwnode we
> identified as sharing the pin references that controller via the
> "reset-gpios" property.
> 
> Only include that code if the reset-gpio driver is enabled.
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested on top of next-20251126, with Hamoa (x1e80100) CRD.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

