Return-Path: <linux-arm-msm+bounces-78190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674DBF708B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7CD619A2684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9945632E73E;
	Tue, 21 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOkxskzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44C2D6E67
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056518; cv=none; b=LYAYFA6apX4S7RxFh6llHiTWicgD9uw48vZV5KT/5I9AbnXT8sdRsJNiin68S4lek/A9TPXTuEAY1WhGPNZp/e3t8wk4lgzFU71mVVVg9brgwQHjFEghLV6XWNM0xJow049AgjjpWuPYT1GyDfQ1BakFkRrbdkgKWWFksXsxPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056518; c=relaxed/simple;
	bh=6K+Ya9AoUD4PI0lKdjjQSEvFS7cWapIsir5GAcL14js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLUmFiHMTVSNh5rqFGyvrztpIyQ9i+zA2Z/fmDOJP1ME/+1v+7R/6lMSe047N8cOhUm3mjb/JZwKsPoHtZA0BZ46n858uud5dUieHdnR/ZOCsFT+/naKqkQ4A1uzEtYkipk0lz1v/y5aRfaFkauwIQmt9x05LinSIpJNtmoJpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOkxskzi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47109187c32so27155945e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761056515; x=1761661315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2UPlKlBMRgDPmUCzuIFXxKg63hxPHeMGbfNf2loeFc=;
        b=xOkxskzioce3lQEoalZkrzKD3R5XHVi9qE97WB+cR5KCdBzQix/MGRly7XXG+BFZ+h
         vtBWPZUH04AZayOkK9XJkIcnpC85DjGiPCdpPJsL/zFQMaYREAOtM9mBYOhicr+eHK6u
         BPEdJ1OfQkXFF/D2FaVAqe703dc98Jg+ejmaLRO82GOecoPIu8V0XSlDZu5DNEiypA6D
         Ey/BmKV8ZeD8Veg63etcwX1rzoQh83F0JwLwIXhq5ZpzbzMDVhi1UCPR/UxdOq5Ka/VK
         fLuCSO3A7cHvN5wdE4h2ZqLOWxle9w/tor4BSoPSbpiiL6f6nfgwkT4wZOTt0cGjTAQT
         DSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056515; x=1761661315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2UPlKlBMRgDPmUCzuIFXxKg63hxPHeMGbfNf2loeFc=;
        b=JGESm9PA8VPIoN85rKc0TFIlPlJz1mBGS4RkZmhZClQbOKXCbg7PQKIUF7oPnwdeDg
         oeH4yfxxorKujiz0UG4LF1JfARi8EcMG5mSBBDOkXMC5z3T1i30fRgk2k0JrEeiQIffJ
         ZKX0Ls/QsCS6SaaYD8cR+gp+SMzCy8OlR5uYud2njv4wBS4iPyqjk9eic6TApHn8CEl4
         2Dy/N7VTdEm8SUmVYvJuxK7Ke/15SMln7YIyyjhu6ZBnfSwY/HwuCdfnI2ggTgvs6jFB
         qG9DZK0W/Qz5wXEqdfTzjqh8pQJbDu+nkvGg6g2Y3R0310+m/qepagYj9hfOdjOut4UN
         /DHA==
X-Forwarded-Encrypted: i=1; AJvYcCVC/DLAyFhCQ/cuUEOqhavxjVqRH4Qnajfe6rVspCjxg3ILCDyk0JkYVomZbWAY5dsaozK159hzWewJ+5UY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KnSa26wBOUlPwXZjujwC4K3/m7Ceqv4Rpm9ssf2vFnZ7UgzJ
	t3+655ysOsoQKVfTnLKwE7SsD/trdqu6JwSoQAkYDdM3YMkmDRva2wBhm2RY9v11LkM=
X-Gm-Gg: ASbGncudtd3Y2vpq9GCdX92vAkVD10UTFEJj2Hy0wjhSWC2yHcIS2a2I1lUP8E67oee
	mKut2SngbPn1RvnPrduFlDUpLVUaouE+OgKmkO5iPsQKYWJVkEVGOF2jODi/Me21KZHdhkXtACm
	OaorAga+fy6mz7gyskA9+OPo02p/idJYnfsZjE0/w0QXppxmfU+P9OUd+YFBuHrk7FUFvmfzFfW
	rARZXG2uroyvPXIv1MYRv+jUr4H+nJOb8uFxr5d5vb7QJSoZ2Gde5DTm+RhxU75U31HRK/Q55Ym
	Bls7uP1w1a1AGObodmD9m6fEUcQ4+9CkSoi6W6tkLxjeUFa6PLAGIPvqUxr8c7cppp83FC0YRB7
	MVRP0FrtM+b6rMYBQJEHdDAqJH++Q3Fj4KLEwVm7p3/MWA6sw3rs2LL6IXzG+y4IUIM7KpUgZ
X-Google-Smtp-Source: AGHT+IFgUwtFyMQzVFuUZ9DJK1ExlofFZ2ywTH/htMIthIxsBbbqiw9fs64De3rLyJVpj6OFqtdPYw==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr133669265e9.33.1761056514836;
        Tue, 21 Oct 2025 07:21:54 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4714fb1b668sm229301885e9.0.2025.10.21.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:21:54 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:21:51 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	srini@kernel.org, vkoul@kernel.org, kishon@kernel.org, sre@kernel.org, 
	krzysztof.kozlowski@linaro.org, u.kleine-koenig@baylibre.com, linux-arm-msm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com, wenst@chromium.org, 
	casey.connolly@linaro.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 07/10] phy: qualcomm: eusb2-repeater: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <yyllvqn2i5mqyetf4c5c3k5xyrz2yfxwbkun22zhx6poumt7dn@k2pt6rcemfdf>
References: <20251021083219.17382-1-angelogioacchino.delregno@collabora.com>
 <20251021083219.17382-8-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021083219.17382-8-angelogioacchino.delregno@collabora.com>

On 25-10-21 10:32:16, AngeloGioacchino Del Regno wrote:
> Some Qualcomm PMICs integrate an USB Repeater device, used to
> convert between eUSB2 and USB 2.0 signaling levels, reachable
> in a specific address range over SPMI.
> 
> Instead of using the parent SPMI device (the main PMIC) as a kind
> of syscon in this driver, register a new SPMI sub-device for EUSB2
> and initialize its own regmap with this sub-device's specific base
> address, retrieved from the devicetree.
> 
> This allows to stop manually adding the register base address to
> every R/W call in this driver, as this can be, and is now, handled
> by the regmap API instead.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

