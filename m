Return-Path: <linux-arm-msm+bounces-43562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F49FDC78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 23:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576743A141F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 22:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEE219885F;
	Sat, 28 Dec 2024 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQJx0q36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7016F288
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426560; cv=none; b=l3BMvo5B5tXcSpOWeilQDtXkZgTEGRWJLiB+dfPTG7m63c6nv/mlVpOtImnnq6NMOD+Q6RPPl1WZpGBrv4FmeaZI1cpKU7C8AumOVPaHNCTs3xsSu/PNhEH9WQGHy5X/wzlyzIjgaR8y/0Ht7/f/Kt3u/Grc5+HqhO+4dHuCoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426560; c=relaxed/simple;
	bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAaj7ITGKYFsvnAphTLaLGDGvlDslm1doaUpD7lBmevTn2kpjcic1S6C967kvW1PdbDVMzUIL1nUr11Ffzc6d5G3efFWx/g5rmhKVxJS0/UyUjcYKHPafCTzsp3kmNWQqcahdFtqHZwbKANPkSbvFppdGcExUcO4JPv7YZtJIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQJx0q36; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3a227b82so7822886e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 14:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426556; x=1736031356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=rQJx0q368x3w9zAL1TOJsbAVl/tJqWQthYrQHZ3dPmiw1tNxMbEAkaaw9Q2nOwcLFl
         +rNajV3RXS7Zw6K74cyOCL4XymdNlYbhBNIBjwFSxO2JmEcR6bfPwOB+Wkmy3bVgpmIf
         l+f7I0t0rIWU0irJFAMJWdGAYhbNvhIaKK0a8TAIYAcgPPW7uLwUFNavtto4r8H/Ykjs
         5YjKfAIPIwe3ZT+4CmWJlGttLYGDdT3jY8QNZNfDoI+xobA7wathITRBzbwl4YUt+Lpp
         0jI+mIPy4kPNIL7GKFItZyHm/8z/1KCxbWFMk73T/7KiwSRXsx+mEmbTL8Qw0DhuqbuX
         5Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426556; x=1736031356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=UeJ+DGWcjqNP1WoJtkW3JsaFs2KBbsTgwbA1oWW8NccTO2wSjPy/PYDbhDcJ62G970
         SGTQB8ZJl6pn50IWOfRBbg8ARwiGnF9tSJ8T0rCqMCrsCPhsnyZwIcScktYR/A34y7PP
         Y3YGMES6MhriiqMRkImMAk4M12mucTqC691HEfpYrxPQbn5DmtroehexFDPjipEl9xjr
         j6rlg5fSFkX6rmzL/K7eY9bZnbFo6nIz6F+HLV1QR0NYgecS4oG87WFsS5fWb0KBbW0C
         DBn4ocigAxBVuObFX5f7OS62GBuQpzsGOhE4JNe9uyGXBmmP1ykcF8qVTMtQTEYE6UQC
         DdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcpiOIpenYGHKlOaHqxH/kxM9oUsuzmkKyn7OLMQiEp7PvD1wdBoAQEPy2Aumtj+uff49XisQCyGscLh9x@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3ScHgDLoIoQbNHWGBqBC3XGgjFb+m0x8IbwFWOLB9czrD1sn
	SRd6FjE17/X0yMmr8OjVWn9wSmjJYBYaSpt1pZRqSo1Lj9IIWv/D5ZjUS7eWB4i4aoTw7rpo2M2
	95cpmwZeewyXUWnFsudmZOc2/tQc7RXaNBR6LOg==
X-Gm-Gg: ASbGncvx9xRYKM7ul6G/ymM9eRnh87UONM7u2aH1ak4Sx1ssriOXKY5n26I5XY/I4HN
	8XX/6vmMrcSHFqcFn0QXqm5iJyTtUIiveTf2u
X-Google-Smtp-Source: AGHT+IEOcI/QKkD3AUBydUx80A/BH8Zb+xNHEVzuo3JP6PjvydFsYRRsKbYFCgVkNWvtDpuRPklRSeHgUyviYhKsrpU=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr6848917e87.42.1735426556517; Sat, 28 Dec 2024
 14:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:45 +0100
Message-ID: <CACRpkdaTBSpk7wToj2TLS1Tgj2cshuSrYgEm4bj-WmFSVohYoQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: pl031: Use resource managed API to simplify code
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

