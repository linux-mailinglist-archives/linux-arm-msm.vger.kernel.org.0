Return-Path: <linux-arm-msm+bounces-30321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC638966C77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A0128512E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582191C2DB3;
	Fri, 30 Aug 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gc+D61Rz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7021C2338
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057120; cv=none; b=i1tL1SXS6Vp4AiREWZ3lvcEXtTyqzqqXQjPJtnY/sRnoVADcKbIljNhN02+/cgbpe22rTiwjgsKvnHWHy7rLJKRQlMKkpeRjYQcgqxNV9wJH9+AoVMNqHqQuD3HJznSxNPr7yE7FX7bFz5dEILqI9yTAo/Yv31PV+us6Wx0tvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057120; c=relaxed/simple;
	bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgLE+Jip0QdQTDPYqunxmW6X8Z8ofTXHLPTxY0zBsnOaT7HpyG9ThcnB4dps4npAQrhEKPB2sf423CfairoOOv42gr2WiXfc8hVHPPiB6NKZ+jElJA7qItfWAXD7UZd5kR2C9ivFzQlaqyvSCract8qi8JOF7MCug6po9YezDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gc+D61Rz; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6d3c10af2efso14171127b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057116; x=1725661916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=Gc+D61RzNtZ5UD2WMu3a46oO1gofA35+sNAnni7LFNu8GqdGZALzc5xTz4vwpEE3xN
         jFajIqn7bK/kw2SV8A+153BFlg/Ayu9LUWFN+34uDdqMLfPdh1ifZ6jrqCx56zwjyM/u
         U4uzZ62nYxwU6H7LG8i7Wy0c5nLnijKSibQacgS7r7jXfutr85ksjFHPOM5IfofgZ6sb
         4g4M49n6OTv4o0WvuSNWqBU5ljzsnvG+OwYu6YBVjxw66Gz4qsvIV6YJd9c2kdLx8RfP
         0xMoV9+emt9bbO/cJzTtlQRVCLh8tXJO4qU9KszLaW09abGRxS7zX69CN98COuiRaT3o
         8qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057116; x=1725661916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=KYlhTQvrixGhgtjOobb0IEpOxGy3CLKqNAL3qmNyT8fuPobv0Fjd7CAF0JzN5FYut2
         AnOSQ5PC82XOZo4KyTOd2MzeleBt+OYaLxJQXpWCW+bowKZn1LpI577c6CGzrOEopd7T
         b6hRqhZWYUW40B289iYVrIKnDP8D8cjl8ie3WBA7F0srK+mj1pgdCmDOpPfpqAGtPfPa
         VjCCoE26uhnnF5a6Z8wmOzDIxgrh1EINoPwmaJrTX64iwnb3RxQ0C7w3TBR7ivm+XcUA
         Mdw9VYCv6dUG1xdvoEhMW+Uu7Jq5QJLFXq5EKoe/MKyNijxLTrUyFYyhgEpwBGf1rtI1
         ZdUg==
X-Forwarded-Encrypted: i=1; AJvYcCUmBQHOLPVnxlDfY/XjTcPEBXaIroUaf/aRRgkw/1NO7XfvJZuSDdNFU9qU1+z7tu/MYqVkZm49jN853hZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Omp5wDWUd/jS9sL7MeJ2vwuRWt3qcFqWLyDXGBjwB52MFgD4
	ZVRvPj4WrSF7RCI053ORCh3exPCVyossiRyjnSwCRjKGZG4L6vaMYTS+Ca6IxCLwuLnKxvYF7DF
	0rLnhZa61hCU77bwDDLcLH/pha1AawYYekaCndg==
X-Google-Smtp-Source: AGHT+IFqP+CzrvoB2S61/4pRdTw0AxY6t4jTtKN7C5yPQXEGWe74JgnEezcm+LFW4t+C4VT7OfM7HAVzLldND7oy2+s=
X-Received: by 2002:a05:690c:4589:b0:6d4:f41d:de2f with SMTP id
 00721157ae682-6d4f42d2475mr13586507b3.39.1725057116454; Fri, 30 Aug 2024
 15:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:44 +0200
Message-ID: <CACRpkdamSDSPmTM9eEd=QAdZPM0Mb4mjh2+mQv7cx5TRT7MBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

