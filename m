Return-Path: <linux-arm-msm+bounces-48346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C538FA39C26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 13:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A4AB7A4FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 12:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1E82417FD;
	Tue, 18 Feb 2025 12:29:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA32417F7;
	Tue, 18 Feb 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739881761; cv=none; b=hN/tI/nf+35FISOBrDSzZ/1OrTuGbqKU5EkmbjDtGXtKHAcwDM1mSNhaMuwBpbL7/br+fLHP4JY3wedrlAzEdM5L/1NtbRM56MflSD7i0+4FdVMbR4c5/eiwtzQMIOYpe7S6mOxlYqt4Lhi9E6rCYciko4ZerjI5GuDUqjTEh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739881761; c=relaxed/simple;
	bh=tMVRAzuzBpRTZlihfsRY9cdts21bPdJ/6WhLJlq511k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVOxArYpNbJBt3Z13LDMt42mCVvUTYdoGPDgE0Ld1dvgerw3I4SxYZWhwhTWr1vE4JaL0jPm8VF56CH2XzH1d2yYTA6bZ+0PeUUxwAkEHfRmQpUrfqv/7WTCtUOvCs2CXxX984R/1W1P92/OOq1hRXmf70ui+NEknkWEm1SUduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30762598511so51381451fa.0;
        Tue, 18 Feb 2025 04:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739881756; x=1740486556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+VJIQ0ApMIfEX8niiA/w5UOINZk4mk6qd15CEV+pRs=;
        b=uwXzOH6eaVOdI5dmlT8bqPljesLEhncN1lf5pLZZ5bov8357KYvNsseRqaX5VQvEil
         FSvtTxw78C82eceJxzFt3v6P9hFqH4iOm7+O3QEixeM7XQjvdcGicIZs02FHs7QiB3ko
         omfanrNzDihn42kqmmM56JJ5RuQ4So+Eaivexc4cauYl0Bcnq1qp/Zt9n32nxoDQ4eqJ
         2dVgdJbMia/v55xgvIoYjfqTI6Ebs5R1uGpbzzPRM4msZLBs1DRjiqPGwNQwri/Ya+Ji
         uyEnRzmKggrQwuwzynMxCJ8uEIl1RnU77rWsoXMPuaO/Egc34kvmCPVKLl30Vbw55Gln
         CYTw==
X-Forwarded-Encrypted: i=1; AJvYcCVbCvpIi+cqJTe2g11HGDucIsrZBuzBl+gOlycLWLjkYNSea2/Y94dzwqfL1dABpi8tP0JhGOM1A+4dd83A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2GROJlTLDtBbDcnOaW0fGQ6P0FLC3wlbZBhBAl88DAF00vj3k
	D7YpJruqpDSs2GLK2kXvgwTERPHGJBCLSp3TGGDO/a9qjlBVs1eOxvG8ipzNvA0=
X-Gm-Gg: ASbGncv/mx7e+o2sP6BmZ8Ee3BkZ3ahcJf7P68t9Y8HcGfnuSWvhIFNJLc+XYReyq1i
	kyq9u8z2j6PYn0894/++TmCZMvXqSPJTTPuPpyoubwQrAOrolInPcso7piUVdyP4WE4AAMds0lX
	ZRIl043WXLJqVLedVuqjPpm2xHJmh5ctJAvRhSWwPPjry0OcJ3UrOAX6scdRiGJc1hfU36Wyz7F
	WU2Z3icfgkdmUOkRpz2AHeZxhh9cD/IRNP2DqtdT0XliXGzsvg3biI72fYV3NGVP4AgwpD/eY+i
	ctAgHpFyX1lAY6NoQmNLtp417LBGvi9AOa3WKM877ijsYYdo
X-Google-Smtp-Source: AGHT+IHRJ4OuefJFzGrcxp3a99PyY/zCwGM+nBztZhpHnJZUfZvbuBwAxABp3dky7vx89bNLmnzLlA==
X-Received: by 2002:a05:6512:238a:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-5452fe2e9e0mr5338187e87.15.1739881755308;
        Tue, 18 Feb 2025 04:29:15 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462bfe33f4sm136084e87.82.2025.02.18.04.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 04:29:15 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30a317e4c27so18774161fa.2;
        Tue, 18 Feb 2025 04:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZvEPLNv4ieTgg5xER8MBGCw9rDU8O8RIgPrVxMueNl+DNv5psvjsYVRMvc9gEiCvFQZYGmWyOcbvmv3F9@vger.kernel.org
X-Received: by 2002:a2e:9995:0:b0:308:fac7:9cc9 with SMTP id
 38308e7fff4ca-30927a474acmr41266951fa.14.1739881754898; Tue, 18 Feb 2025
 04:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk> <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Feb 2025 20:29:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
X-Gm-Features: AWEUYZmOiTlBF_l0MM194DGfKDDxifchVc42QrgCh8BPzRfhHgMRNbv9Q3dSaz0
Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_speed
 is an int
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Drew Fustini <drew@pdp7.com>, Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, NXP S32 Linux Team <s32@nxp.com>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 6:25=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> priv->plat->fix_mac_speed() is called from stmmac_mac_link_up(), which
> is passed the speed as an "int". However, fix_mac_speed() implicitly
> casts this to an unsigned int. Some platform glue code print this value
> using %u, others with %d. Some implicitly cast it back to an int, and
> others to u32.
>
> Good practice is to use one type and only one type to represent a value
> being passed around a driver.
>
> Switch all of these over to consistently use "int" when dealing with a
> speed passed from stmmac_mac_link_up(), even though the speed will
> always be positive.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>

