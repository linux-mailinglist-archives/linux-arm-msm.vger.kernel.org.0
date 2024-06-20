Return-Path: <linux-arm-msm+bounces-23334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B890FEA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 10:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BACF7B258CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 08:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0C918EFEC;
	Thu, 20 Jun 2024 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XMBjNsFH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC417C7A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718871623; cv=none; b=rMU1tYJKJsK35oe2lhbnkOGMX8id5FQ8yDd7IvHvQa5yVNnlpNZ0M7raZvkiaLCCqM+7K1UGGNlRaELi3/Q92tfR1EMBgz5QyWOgpthw312OuYbC5h1fcENtJYkWmlGuq2zaRZN0RkqYkXpYqwpB3JaQyRMhcy4R+aCaGNkg8cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718871623; c=relaxed/simple;
	bh=B7yX7rbJbYr/mTm0lEL9vuk9v/WQvi74pV0s5CSPcDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDjvtq4CXGD3rNQeGrGQymzAkfZKvHFbCiLkLLpKy5+U0xGWJgtB8z/HBiuKio2LvnVG7ALjAqBC2STd4+2588cQm0AM9hoD8wwetGGnAwSimy3Hq1WTcUqj5F/uCj08zVV+DkE3pw2zNzyrCTQ4u9G9R2YO4xwPZtK3C0U96VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XMBjNsFH; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso649024e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718871620; x=1719476420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7yX7rbJbYr/mTm0lEL9vuk9v/WQvi74pV0s5CSPcDg=;
        b=XMBjNsFHBUenumwD5DnIx1adUHvzgD616LxC82BGFmHLRvyX35B74Az9RK5fsvjJ1T
         T0+O7u8w2IiieexySugHQxyCmglq20KE8kAMzZh5VT8apQsVbQ2J37+y0gIgvc17UULw
         VtDUXyQkiP+51ZEWdS78HuGoYlbnjjPEXy+Uy5EWG0oSPL6VaIuxuT+8Phj5LenD6wKQ
         JQNrKBjYehQNMVfpLxwISSb+Zyu4RIyTX+FE/z111yNEi+nGeIjs7N1IQUM7d+5LNsWP
         MNSf9am8EwviAG2UKxNmaj78uYqdnttvXQXaigJxnvLEWYVWpNrZ5P0kH7hb3efpjrqX
         DsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718871620; x=1719476420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7yX7rbJbYr/mTm0lEL9vuk9v/WQvi74pV0s5CSPcDg=;
        b=X1kGzI/iuOHt3G1OrrQ/OQFUr0533qOw4Cy4/0AbdIsvsF34sSjnygnqvodc8Q4IzR
         HNxJMOc3+PKPJEFDPEoVSUIXqso3wtvjlb5JwMGObT7V4BmWMJQOPE+R68sMqXLFIskm
         MY0GaGE9ochEzAgGbtjbzoYXEjJ5ZqKYKoNfrWXnZQTERQC2jcbXwRP1aEdZMH5Wbc5v
         e0h2lp9aCqHEwL5NoaSpx4Tr7MrhU7NC546VcaK505umarlPy7CbvEy7szEyzkIMpGbn
         Joh3ia43BCkGHB+866p1ajSAkUf1d6dYwH/Y7ENs5YFHRCGH9S/fwTQmVoMx13+cP1Ia
         Xrmw==
X-Forwarded-Encrypted: i=1; AJvYcCWzpguba1bu84x1bvgJxrl/QFcV27Zaqf9ZkJOxAZiSlVRr0ynaCsE4JD65qoqRtfc2tjE5xCBNYS7JkORu3N4H+4rQ2vUY0AYtCKPWfw==
X-Gm-Message-State: AOJu0YwPkOBle2qxSbALjUTbp9fTkvMtQpwUX4R6IcUX2H8s4R258dW6
	wybjabR7aVICfO86Sow13eUq4EQiYIcITP6tvSJBYlW9EY8Ky6PD8SYK0jx4FpHZrhrhGWNdl8b
	Xb0Ogi1bFx01a0dUNW38iteJEnW4SLKyEZkIGIQ==
X-Google-Smtp-Source: AGHT+IEmop4fSjADk7pSWeD8ON7nqhqCNYoCXWB9xXRFCphWhGBBKaZ3FTBp7MgrIlYFop2ThtyzgoBlAbqZbHjT0uk=
X-Received: by 2002:a05:6512:1182:b0:52c:86d6:e8d7 with SMTP id
 2adb3069b0e04-52ccaa2d4a3mr2435101e87.13.1718871620038; Thu, 20 Jun 2024
 01:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl> <20240619184550.34524-9-brgl@bgdev.pl>
 <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
In-Reply-To: <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 10:20:08 +0200
Message-ID: <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>
Subject: Re: [PATCH net-next 8/8] net: stmmac: qcom-ethqos: add a DMA-reset
 quirk for sa8775p-ride-r3
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jun 19, 2024 at 08:45:49PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> > the time of the DMA reset so we need to loop TX clocks to RX and then
> > disable loopback after link-up. Use the provided callbacks to do it for
> > this board.
>
> How does this differ to ethqos_clks_config()?
>

I'm not sure I understand the question. This function is called at
probe/remove and suspend/resume. It's not linked to the issue solved
here.

Bart

