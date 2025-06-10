Return-Path: <linux-arm-msm+bounces-60881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD1AD45B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD86B3A6800
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D136287515;
	Tue, 10 Jun 2025 22:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNuDHYPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BEE286893
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593336; cv=none; b=Qwy31fLYsXqztxY7M4brBc2knxYmODdqSdGGbsukhvTQrAQpiBryrMPqKnj+WiLSZ7yAbc7hxCCtKmIFuBAO8rb5rpmdk6gR6l704Qjv+aljAX/Iiw9mkRBBaDUYyuprp0le0wa00oTLlRBrid5LO5IkmmhUfhVHcsq9gfKc7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593336; c=relaxed/simple;
	bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsWPhPtXP999q9XwjvcTU5phZIM8aDWtG3xUS40S/iQuIqLQk1szBD6qD6uNIs2NhreQzbTsTcwdyAn3RTlHomtLjMmu6xMn+yhwjeAO+/iso1HqROM9zSN0Oih+a1OLt+Xd8G2wUoxyzikrLdoFgShgPC5LIJbiB4RYGZLmHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNuDHYPl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so6438043e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593332; x=1750198132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=HNuDHYPl+K2Zm5Mnxn2A5pYoDofWUVMI9eny4zxnJqj9L+tNaq3dT9srblTB9Cl+Yo
         cMdG/rtMGo02HzGBe2TU3voDdHpHg5Eb9cK1o/VLXS0Ng2MjiKY9lrmh0Un6XNL643eq
         cEhhRXkcoMAEZTdH0eBxGpsluQHJJtox9sdfAuS5hd0vRva4vdtsTOXF8ChPGfVsOLvR
         KLOza4yaAa/VOROLBFy9QhzupDz0JVGzXkYMKwwFLmjR/rdX2++MX6ESNmNZQOceaQuJ
         oAFBK9EKp6EK0rChdUA5oZfrJ35zRnxZtJmqJqVbcocgfahNKuCTtVGupI6Y82qhuSh8
         qcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593332; x=1750198132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=cEWC6gwcaedgBmlQ+T0oSN4oGsGrzS4X/0/JOWlMZ+DdW2nIKa/RL03uY50b70O00X
         N1zxstIsmQPy2n/3fFgPXdpAecNSUctGMBgYnvXgFZ2XA78ZainLnF8o/daXoyh+/Epc
         ZqshVgjM2yxX0uZaLy2TtjTuBTowHFNvVClmbvjoX/t+uHj9BTZiHpjJhAMptMycQGoO
         p6rKTNau6FGKabgszwJ2LHYOi1tQPBygzsbDAsNG549YIXrpiIgEsJFHKYaCLAp7zqi0
         b9h1yWahX5M6syGG13aTSBWZ+9zbziQdqEZpE+55plHfe0p4Kem47e2FgnB9jKaF9N9G
         933Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvHB2JiRH9Gnf8jPQqwBcJROobADU9ZpY98WQIOV08wDxNhX21/8VjdMkBCheuG/0WSorR8GqqZbXerbsg@vger.kernel.org
X-Gm-Message-State: AOJu0YyZyVUjdRr/CAsHoLFrqopk9YiIHsUKGZ6Q1Mn3XyXlzQ0UdsJu
	4ycOBPRkB6j9z/YDmqWyHn5Tjq6rDnL/UN2ZUwkc7NAzlqmPk0VegBjKJAk+eWwQ3iI3YSJkGaN
	ng4xqmAmccF6ux/vf/OmsNDgbZvz5P+2Jy3VXHK8SMQ==
X-Gm-Gg: ASbGnct7Otz6b1j6+VvPodg0zW+VAZo4P3oAH+1XQI1CfATduxGPADMrx8SHPeM7d/Z
	odV+GTZOKUzUZeoKvcPB8oeFa4hoNO4w4JLg89nmcvIKebTdw07kvkLnkYBZL4IYQ+tJj5Y+PY1
	l/mn6wi+Ya/D19zsxnLtS0xJa801zMTjIG23uThfe+nW4=
X-Google-Smtp-Source: AGHT+IH8MetiTltiLxVsoQdcqnz9SyKbfeIivBe6BgaYPax7FqypUr47bqpDDYKrtQHdmKVxRlIZT6Fr1Q1yswx0lfM=
X-Received: by 2002:a05:6512:3b96:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5539d327776mr135286e87.0.1749593331540; Tue, 10 Jun 2025
 15:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org> <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:08:40 +0200
X-Gm-Features: AX0GCFvL7R8uIhwfFeu8Zy5wwVjWQCtUtnOLFaGyd-WVGbMxfXjNiZWqOaZW5QQ
Message-ID: <CACRpkdb+1uYy92975JbFUgvO0GWZBru1A8gOsF_VY-opzxopSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

