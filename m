Return-Path: <linux-arm-msm+bounces-70147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6DB2F6D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F524AC6586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3AF30DD3E;
	Thu, 21 Aug 2025 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcHuGezN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2230C340
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775772; cv=none; b=HFA/iGAJCxNI08yoTe5EXIEipXSuCArfJYJmBf33tFDVhR0517VBWqyAN4eBnAAtbe40GS3cT6eNx4lhPHpM7vQdKvTJisixeztistadkygMNP6mN5k6s1AtEFIloAhzS9iM7tQtMYIaumN6qwWjwgoodHskuzj6fonXDGKX1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775772; c=relaxed/simple;
	bh=ugqKLFVMtPcn++sTmPVPHBoR7r9xcjVBC4sj6ZCWHTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieqbtPy2Ql6OJlTFdl21mroS1xWkGjAP+ic5DhiztXmGVn5HHR16DLT5ocAU+X95xcZv2buaiDK52cgM4ydyiavCYBChkrsgsaMQMTg6sfcxDKgnG1p7/sG5AvEi/DLTachdWEyrPB69Wl4GLYnUQje29mC58FOUBLrblI0TS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcHuGezN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce5090b1cso806103e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775769; x=1756380569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=hcHuGezNOHLfBYsTQf8rBLa6xKJst6zpponuFMRjm0Cat7CgMihFKVb19NEsdHK5Xn
         LDzw1qw41pZJcurTJOExnh/P4U1vmsCofxdkT0gmhwygqtxXQyDmqSWSG/8nyg4PfXTS
         r3XJpf4kpzi7jip176YPCSL6RPTRR/1D+xjUFOuscSF6Lz5HRp7ItS0JK+X02by2zAae
         jYybKDi8E4z7lMcr/RJLhKxTYVprvWi+5Z+2fMKD5C5akAEa6kRleaB21DAgCv0zaT6y
         ky5SU4mooAUVsGy0hpA20tZpYd/5Nenn90B5KxOFCPRJHTG9riy+75VI4Dw7SWFAGYbt
         sk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775769; x=1756380569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=kRQ0SlUCl8eRr3oDnN5ypyQAR7u98KnXvHT6+5uE0wxW5oN2YrzNhFq8IlZlwjP33u
         fuLNaSOI/qqZIU4nn//mX37u7hZ21z7c6KqBpvZHMRC8tJn5Ij2lNjq21eOX78rP3/0K
         Dk4WpCIv8JyXk0CEo8HsKdl6U+WRe8eE2YkKRYZPtTpagbOWqz/LPqLSJYEemM/Yestj
         O9MBg3oHPMY2KX29w8m9VkHipMS2byGy/QD6SSxDAdCk3m8LxwfjhiICXdVsaniFn1UK
         dQ2Nru0CR/KwIDsJKGHLeIkunZoV4qCUz46odEpp3Br5nYC67RSLDAAS1nt2SZ1HKfsZ
         zi7w==
X-Forwarded-Encrypted: i=1; AJvYcCVAy6UmuqA+8zl6MLOD1z4xvEJtAjpxW4rNfTHrfnqJFsYzFDGLWbQHe5KXOm+uKU6fDJeNLtRE/vkYHsX9@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzMu2bYkI8x/+77NSudYMIjxwIRCahwiedhOpGifccJN1J4V0
	8jDe/edGTjJlR8eAFscdZycxb8cimoKygaaobzdwVti9zeyt7GWkhfddwcRg3Y4wDkhPjoKsy+w
	ZIXRYkli4N104Y1UqNX1G5x6Kujgxw5qh/MZqVYD0SuOv8IkOB155
X-Gm-Gg: ASbGncvdIyrdMAxXWvcBDyyww6pVguXKoYh5YhvGVgk0h7cHYduQhK2GmZ4qLl2Rn1q
	a++hTVB8M6Cn+BZtrduvCAwzajPogXd9XIaFOg77gw7oVTWYWRejWoejt2wEaLJm0XUm64C2AHB
	6oe61V6b+s95EgbiGmGcocBd2gpMKV3l3GAfHZWad46vfm6QPWmVORwmV1O9uNaXQXQYKJHELd/
	YUgZ08=
X-Google-Smtp-Source: AGHT+IHQpbI8EfP56lsdQ7upknLdRczUpIad68ohDd+RyXmgnTMqsII7yK6Kd5DP/t9BtkAowd9rcI8Mod9ChuDrSAE=
X-Received: by 2002:a2e:bc15:0:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-33549fcf105mr6386421fa.35.1755775768541; Thu, 21 Aug 2025
 04:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:29:17 +0200
X-Gm-Features: Ac12FXyxvIa75EjP0r9nO3EJkEnBx3tdsuFNWsnV0Q0Q5_jZ7NS8Y38A1xB9ZIg
Message-ID: <CACRpkdZrDRH9figXST9G7QbJbwSJqg4E3eXmXQ-+2z=k2+jYjg@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, 
	"maintainer:ARM/Microchip Sparx5 SoC support" <UNGLinuxDriver@microchip.com>, Michal Simek <michal.simek@amd.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"moderated list:ARM/Microchip Sparx5 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:39=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:

> Replace devm_kzalloc() with devm_kcalloc() in drivers/pinctrl.  As noted
> in the kernel documentation [1], open-coded multiplication in allocator
> arguments is discouraged because it can lead to integer overflow.
>
> Use devm_kcalloc() to gain built-in overflow protection, making memory
> allocation safer when calculating allocation size compared to explicit
> multiplication.

All patches applied!

Yours,
Linus Walleij

