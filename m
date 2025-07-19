Return-Path: <linux-arm-msm+bounces-65738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5EDB0B0CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 18:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 538A3563CC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 16:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E5E2236F4;
	Sat, 19 Jul 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LE2BqCM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A9220F29
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752940950; cv=none; b=AHzJdliXcEN66PvfqzBv3gHZEGzXBoNm+bQH3nyYxijihkyZujM0kXDqBgPtyCmbES7s5LgaVa4McUu7FMwqxwHvy7Ub7c+3CZtkyPtFhvuPZ+XPkW3KxKj1ZPZCJ/NqRuAPalBHTpLYp02lk5tIRxfNBcRjuFarDRVO4zubrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752940950; c=relaxed/simple;
	bh=omxcvlFB5WsNU7W/SPacQy7pFjeWx/NXXRV3R/gNeMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0+76bRVwAgqtQcnl//8hQZmgQNbCvBqAAojNKJXmf8vaYTEBZz+a3lFVPNbZvZGrQPRGQOg6uvUFn+epliJyBtv1yN2Iu9Jm3DlXa/Haoa6FkLMBfy0FfsCNWA0sASsZzJMyy5RQgGENbwx6aV0DW1o9uIRFzo509ee8OXuulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LE2BqCM5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b3316160so3197218e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752940947; x=1753545747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=LE2BqCM5hp9mS1GmvHga7NVq3laPX2EZtx69qWEeidhXmOCJyc+9rVO2IOpA3QoWfT
         QVnut84cqtlhsWWrBDZ3x3BAzj3XlUkhVxA7VHWMvaeLpm5IFdqME/G60u3gl0SiPBpH
         xPXWqwP4VpHqscqBsQ7I09Ed0w6/SOTXE2TpfyhJ3RBxnPJxNp9VBouWVBnTaT9JfPqi
         7o+IaR+DdrgP+K/Avh90KxJQPkLoufmSqYGTkFY3B2ko0SxMDxiKEeIelC7stOdPTN6L
         cm9E3HR0lmp+VXmp+Su6hDg9AfCfScwJHgQ9RPtpfi0m+YC/DSfKHnmntKDQcl70Hzs/
         Pyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940947; x=1753545747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=c1ip1iVzIz3sUbSXnAfT7JvU1guT0wLJdVV+qGjEZHTZS1edx9lBETJ4iw0yC0foHF
         Up/5xFqaRoQslk2oKbZGDeL2V+P8wEBPEoKhusVS8E6s7ijDlmxaBMPNnuBZhSCI9UGZ
         2lszeidLp+QTwBplIhMipXyS5UEWfQfohDXxlMoXi9tWdHc6nW8tXV8me0pIlP5dLwO2
         5tu97DWWJAdKT8XJODd3t8/oh4rHYOGgNAJ+i27yOaKArJU5KCK4v+n/Op+UnC5Ck/hM
         iwwYTXcIMbkDOTxNvAPMDFX0X8ebC5UGeeF6o4tSBWKJyyV3jdQci46BRXjrjEJeUIdn
         MQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAdTv+LaSwOBs2UHP6QYEvTVxymp0yppPqFjH9tmJNUklotXxGeDtZoexbruEgVr0HyhU4UdWuisV9dY9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YL6MGtRGm5RZCZjlk4sK3a2gNR2xPx0IFQl71XKKsAcoyC0W
	tLv1sLR6js5MwGvwPdcVsnHRgznKJ22TOigo05L8wJKgwaBT/kwRTy/jW0wUe1LHK6tVt8t7hSM
	2qoXrLt2kdPztr0FLxSsLNQCYsUz5HPXiz1uwBjvb2g==
X-Gm-Gg: ASbGncu5FgOtkHVOdvOKJKMqqp8oi8xQMk9fGt9pWqVigdQciuJNWr9wk5RdYycD3iR
	L9Wja88dGQiXjrQ/lLCPtRjqn3vnA7M+Bg0lhSYWsd9cVAgxvw8wpwCnjD3wiMEmgJ0LwfzTzDN
	ZSOkv3B+iegxNHpqeglX3276GXkb/kSd79yUJbyFgAQd34mbVsRB3mN0xGYQWuzMfGnfSzvhHsN
	2plazo=
X-Google-Smtp-Source: AGHT+IEoUxfZHhjopPDobqn7dOjOmBm5Yh2lx21AMKQLkwO7yH4BlU0K80uOKrtvDizTOqyz64KGrJ56htRl33CUOe0=
X-Received: by 2002:a05:6512:3406:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-55a23f6dd82mr3887668e87.42.1752940946812; Sat, 19 Jul 2025
 09:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 18:02:15 +0200
X-Gm-Features: Ac12FXztrlt_TII82ZBIkZmMLTzLg24otRAxfGOCzM7K4BljVaj3bGcukozw-cQ
Message-ID: <CACRpkdZN3qAJdvDkzvr0_=7grNHWFQ6M+_b=BvREq+PyosBmiA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Bartosz Golaszewski (12):
>       pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
>       pinctrl: provide pinmux_generic_add_pinfunction()
>       pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
>       pinctrl: airoha: use pinmux_generic_add_pinfunction()
>       pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
>       pinctrl: keembay: use pinmux_generic_add_pinfunction()
>       pinctrl: ingenic: use pinmux_generic_add_pinfunction()

Patches 1-7 applied!

Expect qcom to follow early in the next development cycle.

Yours,
Linus Walleij

