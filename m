Return-Path: <linux-arm-msm+bounces-46476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450FA218F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43681886996
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7349A19C561;
	Wed, 29 Jan 2025 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/7ianeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443A1A2392
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139008; cv=none; b=SJZZ74cbN+UF1To5A9486e2d2pp0scspPEMGdMQ/Pla/mskEMlptYpYvgFJSaBwK812OLUFnux8nxgNXCrJ1fshnNBP/cYjU+moQSuCz018P7nKhoJUrblwhPlW1q31rE6g75F18z/XB7qBf+Wd3q7cJn7s28PfmoYInDsIwa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139008; c=relaxed/simple;
	bh=uejUUST1opmqRaTR5XJy0DFI0pe4QxyBJmqR4mHNSN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D65LFfJ6jCeem6y7WO6e7Zzk7acEGz9E1zIOvL/gp15VSlOdE1D73AfzCTuEvrruYM9tn47H3KQiOtzYk8aYLIbWLPoOdb+YIpg6PDy+KAU+Sru0VsCxuZFUoBh16KUYhbyBg44VKjxQMeMmVDsGy6eQSomt2KkqM8CtS4AnzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/7ianeD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e06af753so3551014f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738139005; x=1738743805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=x/7ianeDpTPoctFVpNkGhR5GGtRIbtERCrDIO7asEbMHW5oo5ZYnprYsa5NfBkRv8r
         SZ+ATQGaQmVchKPDC1OeUKidCtg8sAqHaN4Y1/XZGRlzOxrVJRlwLBQWgYLc938Iieyl
         0S1ADwW5hCTfN4g6J7D8yDjMxbgJ81fKU7fvDdNnqcHsICemTDRYdLc+2mN27/mEetsq
         ejYH0AJ+XOmTSzT6EjXFBKiUAvoQFUYnYUyhhkcxIztoG4t/XwL/ymdZxFpXwty6u2h+
         yjrfWP3ReouA3B267a3Hlu9XgMRatWspFSh+da/60nYlPtoyJ29+q3j/P6xJAVyjuQKr
         KLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139005; x=1738743805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=H/YvFl+XqznBp2ZWKo4aHupjpA2UANW0N7NpVXTDR+2D6qTiaVZdcb+8XB4nMfB37z
         9gdVVwOi1slW+bB9B/1QOhj0+f/w29D7ivleFm3J2jhVlm+rgstgoWxuNUoAFYGgECjc
         bvyVzen3KsJKA42dtvF6fWIlRYx/2lIxK1MVr/C0b6xapYm8MWrY1aVxCybcFImBdT20
         UZJlL4FN3Ivoo5Q4QHUPoobqNlK/yqP+zX3ksFB2VnFVnfsV9kMlvjnodiT4++rNzXGr
         HHRwwrNHNcNifGfAQSFWFg/EHbwjOrkyrkfIpb5z19jeF7Fz8jKiFZgIvBQPn7aKMP6+
         7Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCUMHY8C5zucmyzwJypsmfYGIzLckQ4neJsLruxPwtl9TA1v3itPScNdVmbg8RXtzINBabUbL5YDKybYG/MA@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFTKfU+CD5/9xs/spPT4jgEPaWhH3bDdYszbyPwxfd6t/GhkS
	waLtRT7CxffYk35WfYweBY22XzFyUDIhVxgPS6F5V9NFVV/DqNDp2w2CeDJDeWGFglBU0x0MNy9
	U
X-Gm-Gg: ASbGnctzXfKYAWEK+stKWG9z3y0z5Xm3leTTZ1FFAK1Wr2cgPOjzhHesf/4OUCV59gW
	1oUp0G6+YALCtux1uuUIGcxbMSQqkBHtwp7tVW8SdbuGBG9t7l40N85tMWQugrlgnjpJK5ww6b7
	edNIIY/zUZDEzD+GcHdaIaKx7Na5AXbJ676CAII0+3KqjWQdKV/HWvLcJUlFGRTE6/63pD/hSA0
	qGzEdZxU3lz+NhKcy0eANOIlVut9Bg9U22d2fdstlU9QjeZW85fZMNh5kjj8uFAS13oOg/dfS30
	40PoE5h0s0hjCDyXdzXhmA==
X-Google-Smtp-Source: AGHT+IFfgVNZLk86gjY7HWPBeAQ2yJ5J2A4B5xehdoWawG9xRKTdLfChNruGhUqnheXhhsiFsS4cJA==
X-Received: by 2002:a5d:588c:0:b0:38a:8f77:4b with SMTP id ffacd0b85a97d-38c5193206dmr1538571f8f.5.1738139004561;
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188673sm15954574f8f.46.2025.01.29.00.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Date: Wed, 29 Jan 2025 09:23:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/13] Modem support for MSM8226
Message-ID: <Z5nld1JiaqWgmlZ0@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>

On Wed, Jan 29, 2025 at 12:35:32AM +0100, Luca Weiss wrote:
> This series adds support for modem remoteproc found on MSM8226.
> It also adds needed device tree nodes and enables modem used for
> location service on matisse-wifi.
> 
> Also bam-dmux node is added for mobile data which is used on
> 3G/4G-enabled devices.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v4:
> - Drop mx from .proxy_pd_names for msm8974 as it's always a regulator
>   @Stephan: Please check that one also since I still picked up your R-b

Sneaky! But yeah, since you drop mx from fallback_proxy_supply, you
should also drop it from proxy_pd_names, that makes sense. I didn't see
that.

Thanks,
Stephan

