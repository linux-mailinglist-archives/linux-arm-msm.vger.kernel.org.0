Return-Path: <linux-arm-msm+bounces-64629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F44B02307
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 19:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E620A80CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6B2F1FED;
	Fri, 11 Jul 2025 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUUd4SId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D72F19B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255871; cv=none; b=OLyl+FtqpFMqq6+sRaiwlqjrc6BZKhLj3SFK9HOSxgIj05VPZ+vxJvFhR0N+qCb7mYaKqBJL2da2Q/F7ZcWri+acFiHdB+KKyrenMp9ly6u6MOAYTN41Pvf8WnZXHQpxvZHqhdobYF0WHVXKNH+VQq+WIcO16fa2/f2v0TIw4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255871; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6ng0PbURmGy53lcw1HL0Zd4ck4uXI5Bu5855ccBWAcgSS9erlMk5Jhz/QTaRJ8KHgco22nBPkW4ZoRaETJVkiMCnJ+cOV45ePHXegMEr82Qr7yhZH+DqxkvwqqiokIxvdGj1LZCOBN4tz/aD+vP69aMgKTtLI6eSPA3fg9EZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUUd4SId; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b553e33e6so18271561fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255868; x=1752860668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=RUUd4SIdJbvakysuyj53v/ouHK9sZMKllZGJ2C8yMk44LRa+g3eH02ZWskxW10QwJ0
         RFfRpIlkxTlPVK4mN11YJWSQEebePr71rOabZTT6uaDoUC9rKzzuMRZp3yA/LbiMfW6l
         FCd4t3Kci1fx43bhYAFtq97wWLQgBBve/BAn6K09JXfcrSgKyttrpyWl9jYpL3nwljAI
         4863pNLzhlBm1lDUIv9W3t+5HiLoWquy4kxLVaGdkoeuNczFNKZbv+VnjkcacoZv9vu5
         /Gi4M7Ei5GBWU3sm/l9bfCmwWY9wnEKVFEAnXP51eGwBY5T5+RRbnCUtDb4GwtWFIr9s
         BDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255868; x=1752860668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=aNJgiwz+1YjwKvJwua5nw4POdVwf0mg9qWUWAgmLVyAJZKuIffBUhxtCsgIfYM6l8e
         7E3MBLKrY3QVN8lFBPv9TOIgxrGv/xQoAdw3XMA9+k7wYO1W89VEFx7cM+asSSds+6aT
         R8OoVal5L4MC4TbBJgYOkrej/uFpi0N0ygIloJByVioTRtqQWX13wzOrdqkCKzjmX0+V
         ssDHQOgfGVaB/GOffFfqC87ZZaK9xxgXrJG19eyT8XBVCLZNypWHgBdF0rwPn9ffWZgl
         30pIfcUuZj/5JH7CNuSpNYu89XFrM1l+dCXV1AIBaW358cA5PRhj+NofGMHJpf+kkpIS
         AO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnR5EPg43vhRBTsLWIDfVRE2fwTZXJ0sicJTeVG8SWTwzzWgKEW13Z3a7SWFtYuOzO20EaJXpIz0xOE3W6@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIkx982EXYMYFiTZo62M+DJxZq45OvxqH5XW7NnzvEFYAnU5W
	kiv6Z2Miv3jYISbdxEGYuC5ZTAWEWfM/d0FVKWtpwK6EXqemWiw+RGfWdgM2nPmkPZYVjEzFtBf
	3HXXSBl9aB5nNYXBqGjQ5ORH5zpERSY5A8KjXPk7mGQ==
X-Gm-Gg: ASbGncttsB/O+ptFC4sPYlAmjdBWGe0UriLHFzT0wYDYs2SUDatWT75oiSBHDkokx04
	nB56P+c4K9R9z/8GIJfXZgzuVMcmxX0RsRtzO/nnGqEAOavdA5/CFsZWOA5mlpWFhqp1RFB/6V6
	emOVIIYkE9xINRFO2m7RxbCj5qMRYDQw7TxrIfzwKy5Ljc7XykoifnVPi4dW2sMpBDIgxpxjRBy
	3Yq5y8=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

