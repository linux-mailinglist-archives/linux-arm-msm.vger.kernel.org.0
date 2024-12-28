Return-Path: <linux-arm-msm+bounces-43561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 750599FDC71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 23:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547633A1787
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2541990AE;
	Sat, 28 Dec 2024 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmdnptxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811D1482F5
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426526; cv=none; b=CIDqjkynAXcMyqnN50NUPeeiAQD5gAgkO/r6JJvFGSWzzK/RVT4HIbOEt/EN7C3Hb0gFK6UcaYBlLgaBFwOhQhY7oK3wBo1g/83QeSq99Q8t65awEvGFut8a2FlF3q3lkDbQRSnx1gx/iCr/f6irWYlRSphuE5Nm2nqy/pAcKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426526; c=relaxed/simple;
	bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFTXBP/3o5ledpxiB0H3L6d/2CBVtTwMFdyy9rVVPcqjTmX+Q4lM+Uyd0ALjRoLkiDMYYLfgpXMrwknI6sDHkb2qDphkGOoxyrHMXZNAhrGoG7POJZO/ATA9WwFXtFzJyqx3NjlzB0eZfRChGtYyGQLj1h/g8RcpHXHWz9J/cvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmdnptxK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a227b82so7822627e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426521; x=1736031321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=jmdnptxKkl79Plu61bNDKEEMlk/nTlELUMqzvaFPUB8R/4+9oxKPERsZQmGTYsGuT8
         1vUu739fLVz7Mr/w8UkBvMy0f6o/X08kUqwMTJ2t2AyZslb5tcNIPUwkLFx7uKw24CA+
         WfXOzAVZlxupAqc8I+rKVfrWg7/3IxDXfWVOHmHf/X+2vKcghnbVKheTWRVcfPn2RwgQ
         UV8E97tFta2OMrFHtfJbfGjHCLVD4nTyEpAX9yI267YsgOZedWcXAofISxUU8WTmujpX
         E4c2RARwbv2YrTIAdz2UnOdo4lRe0b3PLXtj0lOpqlN965JrDzs40otT42Za+OR6nx/a
         tQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426521; x=1736031321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=JnDJpGcqflcT2EIJCOkmEXJwqBH+rCIymAjO+RWYgcUj1bvcDunlrQNGNr/sNVCSYk
         WFvzVoZ2JDj35hdppzbnxWCI57MvAAaSedo8t4wXqudsXDg5nZlVIAn7WAs7xnGGvhPq
         N2817CKNNhHLGLFPgWUV44SEjlL8MQWupjzvadNVN/ZnyALVgKoN70pJ77TWysdblGM3
         6gk8yAysPmAQi9rSF17c0cvJ1TBnpQMjUYZgvtrFNFOhpOKiCnydb3HoYoKnqiXR1wQ0
         C/29A+p4N7AUA76weprwNCmgNW1LY95iaAC9vWRX0Sori3KtdhxV6JtAshp4sQTPugGT
         tTeA==
X-Forwarded-Encrypted: i=1; AJvYcCVXen7rPq43sklLHRxCUtJALajszfe1X5GdkDhf5WfoojTESbdNfP+8nAhDUV3QuHRPACFmN5hM2zMJMSfW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6otLLFvBF9O6CWCnnJZMxtjZRvTmGR1q8T/i0Llwnmg4LHbex
	xG6ElFVTsjlNd5x/NpGx9egO3F4iuNPm4RlEmgSJQZGsa9XAIzCPVIiha5qptlA+wgcz/9Xy/EP
	lIQ+JqQNVI0rle/G6mJMEJf/1XcVkwnSXFM3n1Q==
X-Gm-Gg: ASbGncs6zRucHvOLByA6tOQELRse8hJiZqPRUtAl8/z6tl8711J8b7IgMla9ee2qtbH
	2hupPhDGy41wB7Nr842qQQGnWT3CpHzVoCEl7
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: ab8500: Use resource managed API to simplify code
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 2:16=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This looks very nice provided the core code is merged.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

