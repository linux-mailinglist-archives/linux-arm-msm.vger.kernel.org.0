Return-Path: <linux-arm-msm+bounces-78321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0DBFBD3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F9918C7AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A527342CBF;
	Wed, 22 Oct 2025 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tkC6Iyek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D530147A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135747; cv=none; b=OcejKuzn8LZWDF9cZRPZWKMljqUn59BM211+HpYH29JocBS0lx9qaoPbtt9kddm+AS8pzWft4HZ+RTbff32ZUxO6TyEyhJqCs8nB9v/9ijXyxVPocAXcSg6aa+QLjNptIrMdf885a1PXhIDDu96tu55m15XqN3qY0XvlDdI9jIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135747; c=relaxed/simple;
	bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOe1HNDJSUctCVfeMn3Tl2e89CPJLGAclhA5IT1fG//aC/8Csxd9Z2Tz71W0YPbP4hh8sqV2p2OmPpuOjB+SKVAhAcn8hYTwavKKo4QG62Eo/Va973hgiHEXGQG31ZRs2Av727qsfr53LCVC3DPC3iqE4EtzYzYDNveLvxI6bBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tkC6Iyek; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57a960fe78fso8680006e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135744; x=1761740544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=tkC6IyekXWvqNvAZqlRKLLBx1zlHKlMKy9AHypgVQKvlOe56k3XChntNbSdlHkAUy+
         Xf/FvunI1z2cdFIdBOKkTcdoEjf+imBkwT1skSBCHgIQj6Mm14EWAQMyGLsA3nkq2qsr
         zJssNoPnhy1Ei58rouZfoV3dX9TFV/gVxxM5hxTHWNyg7FOgEohqCG/HB58DMHNPirVk
         KNnXFthviULPqHjQ9r4aUafqb62fQgITQF6eZhsO1fq7cczxiE5SDcM8y6rawXMCTv5N
         /MVS/hEpyTOIsN7+iW/xsXGq7RdSZtfXF4nw+pU7ZB5UPs/4R29eqU1SlWLyS2TWLyUV
         Vsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135744; x=1761740544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=M/vcRyIsCPdlTD3y4wJzQb3HKKfLscOltFT1F0EeXWTqWTr+OA9OmvvWMUN4OliULB
         XQeunuL0D69Fj2FSPm+vwGA7Imd4GOORUH4EQRS0aEOH4038AsJI1RCJeqNovQhYIVpY
         PiwH3WMefb0tGC5+pj/RVsvp/tFMdMo5aweUfiX503DghR59tdrosrUybay7511p0fqs
         M8/17/H6Ll80G7t3NR/F5axnOI5wB//W4Lo23Mn6g3JHseN97m6zbCOQIbsTcAQAg5X8
         DA7KZd7O2JSNDZD0tiCTwM6PW+vhT66S6mLv+UWHnj2AqHosVvIQ+CZXdPIMYMBMRLTz
         uL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0ekUxPAcrhBHCHSxmrFmEXLtk8CqPiRy840TgK9yYMasgoViEOg5vim0JwrNku+0yuA3T1bVTCNp0OUEM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9uVShO9g8crqr4v1qd7Vq67M5BQNEytw+kjy9j2ob5ItGHg5O
	oYHH33pQpDhS3ax5+oS6zFVSlSyxQFWCEnEB/hEyL/UOIVLU+Mg4auv8gWZ21MmTu4jpeMOjB0p
	AI/x+ZoLiGRpEYfOZjZTE6TdBFghE4cmGl33S4TD4RQ==
X-Gm-Gg: ASbGncsZ+jNoYkBee2RdWs8/07d792mB35+A8jXUKNqFT/d/47hrOoDn6hqF6VGJaQ1
	mz2VgP4MxHX7Qr76rm8So63Bn+F4erY72a8DQfxTsvMWj4gbkoQH44PewRzTOrQQq6vfDtw8nCi
	Iiycz2N+mjHHjOC6wf+weFESHfEDIZpuGh86SOgpigZcT6Jr95rRIyNmhwGMRHMJHE1EiZxB4AD
	yRGR0fvo1X4gY7pNmjSztBr6067klqF969FXaMrPNug8MxUsMMdTiQk+5C4GyahAqrzYf2yXanf
	iYsZ7hD8vD1K24jw
X-Google-Smtp-Source: AGHT+IHopjIXv8jRnOM7SdbKGejL8HmLCEbi6BqZ/fl5zn8nC+umc/NX29TWVW5P2ry8JnLwjKerkQkMpRF8tHTR1Sg=
X-Received: by 2002:a05:6512:6c6:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-591d858f85emr7186831e87.50.1761135743550; Wed, 22 Oct 2025
 05:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:22:12 +0200
X-Gm-Features: AS18NWDxwRikRa37d3sfSPIurHFNsUg5soxDVQrWVC_wnbUDqwvc55kIMFCSQNk
Message-ID: <CAMRc=MdWFL_+RJXPUNLd0BTyxbt9x8jztf5SDViPQCkxSqoHdg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 9:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

