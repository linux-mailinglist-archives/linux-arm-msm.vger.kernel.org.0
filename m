Return-Path: <linux-arm-msm+bounces-10957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5685402A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 00:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152222858F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 23:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E660A627EC;
	Tue, 13 Feb 2024 23:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KGpsE4/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353363101
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707867301; cv=none; b=Ie50RWn2sB4D/r4DgJpH63J6oHz+684iWliocFFz9AHamKKZq/PGrSj1phmj5skw576lO3aBhfb8SmTIMpMJkuddMqbZxBkAfyh2ZYc70jR+YD6azRdyzc4mAdgzyjzKcF26JGmPcQmNs7UmNWY5TK11Evzp/X7d/3Ln0ddKvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707867301; c=relaxed/simple;
	bh=hZDX0moxKA2jr0nQXnCCS4aPrBUL93MmvQjXD7Vlbz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EW3u86dh67GzpfRBv5HP+Oz98loupMxzHpb803sakE6FsV0LE4deUV49WMl2yKxIp23hI9LV9l2cMjknBOjpjO2rTPWvFB8b00gG0t36byp5D/oBEiJoOEdn64joeUIUhJ5n2+ZR5uy77yl9MM0iWZ+NHfwryvq9aK3cmDGDX8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KGpsE4/B; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511972043c3so1837429e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707867296; x=1708472096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egLJA3w8XbBkzhBhvJeKiOGztHliZVh9q//fDQHtqjA=;
        b=KGpsE4/BmoCYjbKbEMowN53WLOz8RpVfUD72sLrgJCbV3zG4KcXyMXqHfJPputLBA/
         Lef87vsPZesLy0OVbDvZqAP7xvuFZwOt3YfgoLMPYTqdj3Qj5W2/CtTQqR3o97fA03e/
         Beecr97GMbieagyU1tssBl6ajX7IHl1Nkrcy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707867296; x=1708472096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egLJA3w8XbBkzhBhvJeKiOGztHliZVh9q//fDQHtqjA=;
        b=pP4gxGof1+nwaRti6BhpzUabAIfl6BdJgbShH0tf6j+4inqtQjGAF1JZdPea3i2/Im
         r44Shy7bg6mnV2ZU4aEDH+e8i+bkK9dpKN8dQdou+vP0qH7MgK3N33EeZTI/LT+UhjOq
         TU9E9zO+mvAr2LDsMZDc9e9tJwQ3Wm/WZNNTSum5zAtOBRZsMXi6nt4iA7lYluEJPrUE
         9ua4riLOcMAqB2V7UqlCrKG3PP50ld8SqVuFHtTyIF8JZAqt6vtkidf0OVU78rDbEXHy
         q9lYZf3elPz2KJqLFJ+fw2lcHSSnaMgzY0XWp6UtyxG8kVK5x6ePXh7oVS3ndnEzDHhf
         gusQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEv+rGDhPYhaCbnXv4+7ZX+H+G23dPcUIrl7GRhi55uJRi+yQ5V/O7hRTdhbRQm3t6nrL/ra+JYBZ0E0EafxlP2KnYJ0stjbXBZ4yp0w==
X-Gm-Message-State: AOJu0YxJnoMK7MUgk8leTGztJTZW5smgyLZilFg+KInlyQ7gdxP4hRyy
	DPnGIoTm6qOXOOi77oaGhThiH3h9DWQUxAQ9cdS9/6c68N374SOb1Km4MTjlbMswU4TWoyyX4oM
	kQNMH
X-Google-Smtp-Source: AGHT+IEXJlT7ULe8EBKfdXn/5sXTXgBiu/xHI190gLc0XA6Z5a4KZQ2GH6ZtxLXv6bdLVLpQTW+j1g==
X-Received: by 2002:ac2:4c05:0:b0:510:ee2c:e9c4 with SMTP id t5-20020ac24c05000000b00510ee2ce9c4mr765204lfq.17.1707867296013;
        Tue, 13 Feb 2024 15:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXFP5U9F13K1LDPa9Lyd5702GxtXi1SnoOaRvRTcq7qH0qbY5PzxHcGwyTXa7owH88J/ny9UTas0p2YRdG38vPjKJLwCdn96IsyGVXFA==
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a23-20020a1709066d5700b00a3d46a13279sm11163ejt.1.2024.02.13.15.34.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:34:55 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-410acf9e776so97275e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTaPHary1ZQw+KlBjcQ1cdYmH1FKkXKCyFhy8+uRqBRcq55Ur1C9oqbO7BtnJWWq2ccpry/XZX9g26rYRzPvSi/VsCWUbJ5ju2Hora6A==
X-Received: by 2002:a05:600c:a01a:b0:411:e72d:e5c9 with SMTP id
 jg26-20020a05600ca01a00b00411e72de5c9mr9514wmb.5.1707867294378; Tue, 13 Feb
 2024 15:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-22-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-22-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:34:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
Message-ID: <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi b/arc=
h/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
> new file mode 100644
> index 000000000000..bcf3df463f80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts framgent for clamshells

s/framgent/fragment


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi b/ar=
ch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
> new file mode 100644
> index 000000000000..ab0f30288871
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts framgent for detachables

s/framgent/fragment


> + * Copyright 2024 Google LLC.
> + */
> +

Tiny nit: should this file have a comment like "/* This file must be
included after sc7180-trogdor.dtsi */" like the clamshell file?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/ar=
m64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> index e9f213d27711..c3fd6760de7a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> @@ -5,8 +5,7 @@
>   * Copyright 2020 Google LLC.
>   */
>
> -/* This file must be included after sc7180-trogdor.dtsi */
> -#include <arm/cros-ec-keyboard.dtsi>
> +#include "sc7180-trogdor-clamshell.dtsi"

nit: Not that it was terribly consistent before, but in lazor you
remove the "This file must be included after sc7180-trogdor.dtsi"
because (I guess) it moved to the clamshell file. However, in other
dts files you don't remove it. pazquel has the exact same comment and
it's not removed. Pompom has a slight variant of the comment where it
explains the reason (to modify cros_ec) and it's not removed. Could
make it more consistent...


Everything above is either tiny typos or nits, so happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

