Return-Path: <linux-arm-msm+bounces-22099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B2900D43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 22:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3CBA1C215E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 20:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA73154BE8;
	Fri,  7 Jun 2024 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLhmRyXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20307153BF6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717793640; cv=none; b=IgQhQBcijuFhZzznoqCDUGGnCofOqslEbeBvge3nguz4Pl89jw3P16Ah3uVceBOv8ddYMNU39MuR0lKqxWAxz7WOuUoRgpKgiYxHCrbI6rAW5NcB1FrJEpFzcwM7FncXLwC3KWUbpKtSruKZfJ6LxIunYF8Bqf9viQvkpfuT2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717793640; c=relaxed/simple;
	bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyePvVu1nOrjvAdL/IkKAmO2mbvFBortK7ozUJDVURARwMOQRVv7e12p5dMa67YoNYtl+vWAYkYlXwcsKfZp55T8qD/7k36K0QVsMqZDy9wEZJt91SlOD7lATzQqMOYzdA22k7ocxYruEyiIG58jdDmBwP0deS2fcDBzl2jQPbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLhmRyXN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso2915859e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717793633; x=1718398433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
        b=gLhmRyXNFICiRNwKRwlVTd3iWM7nI6D5b0XVxaN6gpaVl0nTk194vQY9+NTaXN+wOs
         pmnyw9gtY+Glq6/sg/tCVdxPFZ6Ldh8kE3t73SzemLROC8HeKD7d8+bKSzLQJEFr0QVb
         Vy5UTHpjNBzlC1A1GgZPwkRJsjllHN5FFs6cJF5T447c5y8cFRm8gQ71o+Y8+Sp6YCpI
         6n6KA/yqF9KuPOwKSzvmpnHbeoP6WudxUPfLsV8qIhLoJd/v/glSmmusglV7SHRVS7Un
         WttuuyAcrTfgvNi9qE7S8uYxutb2EYTzproqZ5vwG20szuhyJNAhOjhmmlrJneZgagWl
         qr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717793633; x=1718398433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6tMfLMEfPy9ylv7zqzbxmkBmy9bIJ2z7b+jtJTZiz8=;
        b=jhTczahDrT2JcxNz3bZllgpCqYELJL/qgLs3rsn38X9o588BO1UXi0WtVckB2ruhme
         r2tLF32z9/LdKaBgJlYQkqwmW9zv6SPCfcVg1itSiTSHcig3zRizRlrcLG5TtOoBT5v4
         ESx8AtuDtIZl2YBdayGNh4xJIXivYmVM2XJwrpa15pvmGXcGK6vxuY89c7L9VXTjGC11
         heuIF++nISJfEs970vgSsaQWjbkEiJJcF4Kc++3kgLcNzRzOy0BkJYaSxowJwIkKNO3y
         tfQLbevz0ts9TLvei1HcJG52dGKgcpZPmTvBKXehlATwMs4emmwWe4IpitZfir+kZ5Bn
         ILiw==
X-Forwarded-Encrypted: i=1; AJvYcCUHhvUgPPfGN+fsqk6L+T+PYN1WRae6Wwep0L65sEmqC98kngwHSOHkhDWNXuxnN/9JMsdYfiFF1PoOqOzwfbCpCOPf2IloHJvxKAobig==
X-Gm-Message-State: AOJu0YwcU2/7oW7UhcAqcH9P/EGUHkxNpITR8cTYnPx9fgg4BRTvd4cU
	OfgPaBjzfhLd8IB0Gftc6bytbp4MfIur2eH4nmNaP26Pd6USWxYzDrKzmo1+fDppGYh1mDX/aNO
	X2zaJmiI8fFXTQx9w5vVrDCHgQ/Zii5aNCjVByg==
X-Google-Smtp-Source: AGHT+IEvks17nJR8asjH8PhomcF1cey1wjkOU+SX7E9Lzp4zBUKn/Z+T817IqPLPi5qKBO3N5uckPU9YtHMMXQXgWSI=
X-Received: by 2002:ac2:5588:0:b0:523:a924:3268 with SMTP id
 2adb3069b0e04-52bb9f5d4afmr2200384e87.6.1717793633140; Fri, 07 Jun 2024
 13:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org> <20240529162958.18081-10-johan+linaro@kernel.org>
In-Reply-To: <20240529162958.18081-10-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:53:42 +0200
Message-ID: <CACRpkdasVHEgqDLs_CdAJ3YAQPA7k95TsT22ErcU7TwdaSTy6w@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 6:30=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:

> The binding for PM8008 is being reworked so that internal details like
> interrupts and register offsets are no longer described. This
> specifically also involves dropping the gpio child node and its
> compatible string which is no longer needed.
>
> Note that there are currently no users of the upstream binding and
> driver.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This patch applied to pinctrl fixes.

Yours,
Linus Walleij

