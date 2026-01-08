Return-Path: <linux-arm-msm+bounces-88093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2453D0330C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0F5B300EA13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1CC4D90A9;
	Thu,  8 Jan 2026 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCr3FMJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E74D90B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879586; cv=none; b=rssrkyTPHVfEiihhfi/Om/CEHjmXPLULztfbA9AElWwldFeOyGl9b/rrNQzseiDxfXcgwf/0ow1c00pY/YIT3m1g+ioe3QBa1BxCAZTjXA9QyZB4wWYkeJk+KPenFkdk0v9fC4yh2bYTUqgMra8J+W9St2aj2fXs8oDrYv3RjAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879586; c=relaxed/simple;
	bh=hCI9wYQ6uI2Nplbg3MyIHVUziIeFUo1oeGPbCby+ShA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8WenG7j0HEndXV+XFFWKDmokOYRT6CzU/Y8THVH1Y8UDaWa+Ea7v1oP8sNYkN+YlpokjdUNviWZf64gwvpjsfZkf3hhkHIS3uaPkGL0q6z3r5XZPHN8ZzqhgUYa9SeBCS4tphZh0SrPIR7tpDKdqKgpz/HT8JKNWmNeFPBICGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCr3FMJB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso34794845e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767879582; x=1768484382; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qXQz2rsVUCTFDHKFBQRt202TfAKpQJw5L1CIs2YJR+k=;
        b=OCr3FMJBDMU5sXNZhGzjbvf5HdjRsC1UnL6CmCHykjJz56119IoRHqF2MAVkS85zkc
         r1wJKrGJZ3iIn/3xEEb/dRQyNFjlcn7vLayQUEGm1lPfV9KJjv5tVUPP3ccth2uapRJY
         XS1QXbCmvmMNoMLTl0s5ni9Gb//kfL5GcxD3Ylb1cx7jul0wA5QI0tj1axabw1PbrcJI
         2TMiMPMeBjY8UbFOs2uiw7avmtN/H/ikrr+fpjpju4WY6dOwkh6rMz9KJmD+pvfXmxDo
         bU8AyLGsst5MgWC8agqpqRJB+Jpv9faXClQA8e3aBILO9rsyQJrTtbR/4JJrDjKVIJDN
         w5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879582; x=1768484382;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXQz2rsVUCTFDHKFBQRt202TfAKpQJw5L1CIs2YJR+k=;
        b=rIf8eVz9cbgfkEoK7UDoIhjyQQ9zxYkV7ZyOOxa3XsKEoVROwdIt+PrS8vGzhUIHc7
         MyBxbboFu3wLKFFwX3dJMzDZLpBO2+G8Z3ZpUr71NKfUBUi0I3UTuc4R0u2aV8muCuy1
         4cukg+EtiIBHq5e1vQ3iq2t8Iv9hzUA7olBh/0Dmef9Sl/OE3ZeLKsMgEjIZv/0xFo/u
         Apm0nXO2pHFH7Fj5yK191E0WPqD5PDQ8q4pU0lTY1bFpW2JhrthM24nzCKIioPK7Phw7
         B34VNNw6M+R9BXx0DKI6TKuzAcccDG4rgFrfOQurQDpusQkJoFT6qnHSKiXV8H6/p4Cj
         1Znw==
X-Forwarded-Encrypted: i=1; AJvYcCUgBz4YclpNKKVnHKWjsrylvj1tbKa/1LVvVSSHvNxm317bhXT8Tdn4wZI4Czy+ygWQ491C0myRGJarKTrf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4AJESEycKomQPPe4GsGtbMPvoZU8pUMzJCuUzVveRLOBRiuj
	9IWZVNOfEHo0V+Y7DprnUOASbksLFmtVLBWfr8hv6GfYkAJErxRLT+vQ
X-Gm-Gg: AY/fxX5vV17QiaSZPHb8AZdFO5rf6tqt/yJtYe+Yf72UHBPXAG5NeOT3oRtN0EAm6Q2
	ig8DFikBd7gpU2dv/ZzYV9zNsTXKdlAWP6gI9tbVnV3Nlui1Wn0HpbT/UwK8txBPsMPoZ1Ih7hH
	LafvuC6wMAyXUjWwD2LNQSALMrnqXCR1sKvw6yVkpz5UKJP8zzrY5zYJMLeOtlUYIfzz06aTQKm
	XVE1cNaVWZnKCVFO+hxMKE8XVtY4OCks5lQAC0enn8bkXqQP9ni5mcRzmYdM4JGEQHcue3nGK+i
	G7FXioE7+gSWjX3a822dS8IUB3nlqXK3ZBHYRtkGmjZ2ODsjrMRTkAX/JfumtIXV5x9/BSmtciu
	2vH3cHlQ4OMnJwDh1WE5v+WCjr1vVOeEcmlqyHgnJmAG5Bm9VdelMoYNDLDW7aySHiXvEJBqsVX
	xEtGOS+3KF4WXfxMnvc28=
X-Google-Smtp-Source: AGHT+IEX9m28A1mhHxExSBVLDLm4HTtI1a7RzBU+5k4F+/tjYzMhXRZ6k4rk+t6E+by8bAuxtzTq+g==
X-Received: by 2002:a05:600c:8b58:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d84b4079fmr79676385e9.35.1767879582169;
        Thu, 08 Jan 2026 05:39:42 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f620ac8sm148629245e9.0.2026.01.08.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:39:41 -0800 (PST)
Message-ID: <b2713df7f8cb520f3ffbc783a9166499db13bb15.camel@gmail.com>
Subject: Re: [PATCH v5 03/13] dmaengine: axi-dmac: use sg_nents_for_dma()
 helper
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson	
 <andersson@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
 Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Andreatta	 <thomasandreatta2000@gmail.com>, Caleb Sander Mateos
 <csander@purestorage.com>, 	dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese	
 <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,  Lars-Peter
 Clausen	 <lars@metafoo.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Mack	 <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik	 <robert.jarzmik@free.fr>, Lizhi
 Hou <lizhi.hou@amd.com>, Brian Xu	 <brian.xu@amd.com>, Raj Kumar Rampelli
 <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, Andrew
 Morton <akpm@linux-foundation.org>
Date: Thu, 08 Jan 2026 13:40:18 +0000
In-Reply-To: <20260108105619.3513561-4-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
	 <20260108105619.3513561-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-01-08 at 11:50 +0100, Andy Shevchenko wrote:
> Instead of open coded variant let's use recently introduced helper.
>=20
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/dma/dma-axi-dmac.c | 5 +----
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index 045e9b9a90df..f5caf75dc0e7 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -677,10 +677,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep=
_slave_sg(
> =C2=A0	if (direction !=3D chan->direction)
> =C2=A0		return NULL;
> =C2=A0
> -	num_sgs =3D 0;
> -	for_each_sg(sgl, sg, sg_len, i)
> -		num_sgs +=3D DIV_ROUND_UP(sg_dma_len(sg), chan->max_length);
> -
> +	num_sgs =3D sg_nents_for_dma(sgl, sg_len, chan->max_length);
> =C2=A0	desc =3D axi_dmac_alloc_desc(chan, num_sgs);
> =C2=A0	if (!desc)
> =C2=A0		return NULL;

