Return-Path: <linux-arm-msm+bounces-49080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D55A41258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 00:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A431892AAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 23:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AD215747D;
	Sun, 23 Feb 2025 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkLVvf2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40D70830
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354495; cv=none; b=nAvKDPiokRhbtFG1k9DK6vDAQAX9N4fJGRqaPqgyToMcc30IjUe9z7bc6xt7ga0BB42ko3/4UxwTErUoWSUoe9rf/yoCn67v5lneNTsNH9ogCv64RC5wyGwyjzHW22UIp7l3ZsUrc992Y1F3YygiQi2ZjT4xENFtEFon3zQ09Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354495; c=relaxed/simple;
	bh=yBWzsyr/XNm6UaYOSTJcDGaRT2g3B3VBzdxrx9oo+LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGC43Mocm9sr1ZSII8lUyA2iIJaToGmMGc7JPNJURLAtz4b10hcX4F0Z1erIpp6GscsS8UjtrnplEn5ap1t+bPvmGSRpWxC39eXy7ADl5f0VAHA1ioQHNUUX95YXafgd87iTdFP5N++qopmtxq/r0XXFDi93FPW0C8riYtBXN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkLVvf2k; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30a440effcfso48695701fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 15:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354491; x=1740959291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=bkLVvf2kXf166mx8Xgj93WnecWs9Hqun8jP73qvFhH62NFs2nCEvYFMudYBCk3fhAQ
         lfnGM1Z8vW4rjqnaQpkbBLMk50ZT0E7KK3ZB0/OTCbw3WGWR7LE6f81SJIIME3xaKQC2
         UUVVegjIZrIho8atw04XG59r+5PdyF+8eCCIWopzy6Xw2UeaEqDFx5aIOmNS4r8+2TF5
         W2DzuT1T5sW/iwOIME9n2quQbcsc50ncz42C7ALc+2s/K4AGmjWEoc/Ifs2p1g7+W5+E
         WO7/ZlknJe53kSF5gfDb4yowV2LoANsyQPJOkvqc761V+yBCYILz6IvAC9cnbhPT5QQE
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354491; x=1740959291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=TCV/Ew8BfUot58i9wERDXlkUqT5QHY2SEMa6S8hVBbkbZ8+mxvNeeXl420d4cusIWt
         GwpsMZWryDKdgEhIu2rU0ksHMpJZQ1wOWEgkJ7iF9qWQrxGEtrQTiJRbomC36SUkB66e
         fDsQzgcTY3B5VQw0vCd5Gs+b1S/eI0WYZQ7ZB7Q3YKlbFIC0dxzcAmlzJExb2u/QOSHe
         XkRGhmlshK/+ALaIBodur1qm49aOto0jpC76vPykkfs8AWfBLs4tUirkovoifhmB1h/q
         h7xZrnYV+pUszwOo5MsqJIhyt1gGQKXJzuEcfHPDuorghAfBVx5Li17z+QUFMY/9WDFM
         SRag==
X-Forwarded-Encrypted: i=1; AJvYcCUQHGnXXpPTEruK79ZVduMUNJqt8xTO3Z64WY97r3EDeeeK+OAGzdzdmGOy1BbM7diDuBF+KiWKYoOOhMtI@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpkJ2YrZJ1AsTBcDIjNBkf0KTYGe1uSkDrb7Xlqk/91T5EAe1
	shKM4FzPHCFx9Gw52LGCentlOna1d/2dA07lYCSh57vwuUH7dwx8fRYyTzWwZLU=
X-Gm-Gg: ASbGnctuzKLNXp4BbATtK5++BCx9PA1CU1SsAOEYTcayBEem6eP/WsoCQD7inUHQQCo
	2dEhltu9Bl7cp3E45gVpHYJjr7DfCr5gGwZYY0rop8ra4ixUhf5Y41glQF2OnQTdNJ8lrj5+Leq
	Ne3/lf+G7RC9PTDSU8Dy0heDz8f2/1/bjmOR0wEhF8dAUai9XbjSbLeLk4SpiNc6mQlOIBAPru6
	vRKRdtQzOGfrn8vpC8muSqUAbHGKr3SpmleqZBKIMg8JjQU2Hrz8BWmGJXMYXuCkxApNsA+rKkB
	SsvGoPjMfuadidAZ5TUk1X3Ib6Scb8L9sdlJQG5JpobuvbzXXhVHm0ICA9hS+4PG1PxkHKsFTwQ
	SfLkqdw==
X-Google-Smtp-Source: AGHT+IGXmEWcaphU72erBHimrC5JqF3fr1E4pBz3cUxisqWzEmoQZicuyftwCeCY3akeN/V+TAZxhg==
X-Received: by 2002:a05:6512:3f29:b0:545:1049:eb4f with SMTP id 2adb3069b0e04-54838a00232mr4288474e87.0.1740354491225;
        Sun, 23 Feb 2025 15:48:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452a67e6c3sm2955721e87.1.2025.02.23.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:48:09 -0800 (PST)
Date: Mon, 24 Feb 2025 01:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Message-ID: <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:25PM +0200, Ivaylo Ivanov wrote:
> Some SoCs don't provide explicit reset lines, so make them optional.

Is there an external reset or some other signal?

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

