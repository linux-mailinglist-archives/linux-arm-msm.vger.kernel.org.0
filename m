Return-Path: <linux-arm-msm+bounces-12095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6585EB92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C9C91C217B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 22:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C7712837E;
	Wed, 21 Feb 2024 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tE5CbTty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187E1272CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553244; cv=none; b=XVxzyCy0cqe5sWNVJ1X2vIqADj+8vZPBn1Jg6ICdbz2t/eUfeXjlR1UugWfJLqFztw7zmdS2jlviDflOB4jeXF4jEg9CX4GjXmuigsligd7M9OX3F4nKqIfo5s+ylzOy+9hSH4R5qXkYccwYbWNEAArCRi2TBxyqlaV5QLr1pzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553244; c=relaxed/simple;
	bh=iNidW3f5wsCISbKAXdYoDRvGkkbi4875RfDnKAT5TGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cc6gay4F43I3x6o7y1JeAtY+fXxQ/E5BUDa31YOP3qLf0wQiWG+PAh4mlKWnfX0bn4hB+fPV9fTEj9zciSi/95+hhFMTNeOsDtkIZpmAwEVm1IrVPKiT5Skilno1VOh2pBeEjPJptk8Pji6M3bcqa8DMN3UtPvn+V+6jqwDJOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tE5CbTty; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6083cabc2f9so38854487b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708553242; x=1709158042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=tE5CbTty8JoVcAb7WjBqLRfrAV27yaXE5g+MkmfL2vfm6VD/EBCADX6YbvvGGvfWqE
         ECkjUVRifnTAdb3lHfrQP2o4c7YOr0y1RfN37DQNm8QSR1XCDDdQTQw7ynSRW6rQGBi3
         4QGRhIwUT7iAJxV6VznNSo6iQ647Dagfkp3tyToU2dkjSo+Xid9+Mrn1lO3Qv9yu0iDE
         5uM2bl5B4bj+nMG/ZTKyVQVwIxtNBvg/W8GlZzPCR7hnyiAsWBvPrEnNNUoSSq94txlZ
         RAmC1Bke4WkKePOkoeR5bLH7FC4vvBfo+x7+zVTLs5OCMRtRf5EJUKfq9XLLa1JUupMO
         nO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553242; x=1709158042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=CNz6nbyCycL3xjqWlzeOFbNUsJTCkIwQQtkg2idvuFg0spUBLe1U/63IfOwKkXL7Q2
         6GYHDGyXB6YRvoTykI8fafdQvwjMcyePHTv1lg0eKQRPbrf1JeTPoMC2oV32ArbdnesA
         RnACKjZ0IvHNwTVWdrTZXxpS/mxdf4+yvaADwlw6nlMgbacuU/PxMpj0AgrhooKD/4CX
         5xYZNWQRfDtSHZtEotewEJjrrVGW8EvgrGkmZq2q2HklExiAxjwm0OokQGN4jlyOzIa4
         LYl7Q2zIxV7ObFQkvFV+GHM5/3BXUlja5jY4E+WSmGOLeS/bQrcFV3cIQxTAooU79mEY
         uDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdHP7YRG7TQRzj5jFnQRM68SY0iKbIXch457S/bHRDV/cUvORps74n3323TKSZFxNUPsx1HQ0Fq/BQea5JGOfGmlw1iyMpAj/3fGGZeg==
X-Gm-Message-State: AOJu0Ywf6b0NNN8DZwHcTx1fgIFUhcXAdkOcswPsfj6Au6AxWSALoGuu
	iUeuSMfoVJBsUHy7hHYy0IimtDwrgVaEV1+d3qR7Ni+UHj7Im7JBuL4cbySf/GrPAqyy07BwzWk
	mQPDi9Dr2VpwAvq1X+OKBygeDttYbKJ2FuQ9xNQ==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 10:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

