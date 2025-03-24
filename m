Return-Path: <linux-arm-msm+bounces-52291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBFA6D618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F6B16CCE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B5A25D20A;
	Mon, 24 Mar 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udngQfln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ABF257453
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804634; cv=none; b=TPwNRxSURQo8r/OuekhOh02yoHP4BQIbTeoGq80po3YDsPlLGYKW3Wy79mxlO/Ed03EGmyef5A/jpBT2GHMAVokoUQ2AhcNNca9NspbzEWbPogy8Jxf3AmNw4M1m2cuhqLAFmY4NSnl49n3b7DIbIhm8GGyVcfl5XJa54cPBYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804634; c=relaxed/simple;
	bh=7bDgvrnoRlrYBwaB5QA15Z1GcjEcWdwDWBx4tg0YEzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+TAUtBXIVA04iwk2eseMgF6DBShkGlgyoWSY0uT+WtJrBz7mWEE7EZYIcNeyiY+Plb8l6bpaqK30WmnXfv2swqtZiaHBq66rplf5cOcWHBgGHDurNbvP7PeGa2OBkNNLVEGPnQowLB0OdUCAYV6efWDu6oN+DWY8YDC5bTY2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udngQfln; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4471372e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742804630; x=1743409430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nJur69nwLGZEuv7kca7NWGISubr7DxGJQXvrRC0WCI=;
        b=udngQflnq3v3uQZIyurnFBW7KcubxnMAVPPHIkibF9txFnqyz56ElM8TDSyqQ4gnpb
         e0yp1dw8BJ7lic/4ECxgBLDiGUkkbwWtl0qsFbC93JyrK6Aysrx1+3wjOYn7jJr9K5R8
         XbDsW0ZYLHFduLIYXJAEsm01WDST9p/13al71hF9hBRHgW0NctZ3Rh8kj8DQCnxj4LWr
         RgGFjuOfjJjmhCxE7wJscQSbyxLQ0mu6Cgxh24B+ZIz9DSpCIpDr3xp1b0KRc2uJGwnl
         aVM/nFUyU3yI5nmgpqMTsftHS6zpqsExhj9zH6yMEwCVHN/JLsK0i11aXIDu6leo0wZW
         EPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804630; x=1743409430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nJur69nwLGZEuv7kca7NWGISubr7DxGJQXvrRC0WCI=;
        b=cT41TMQs/7b3SwSJO6g3fXCO7SdBZWfsLqGLOpdT/1J5v6ZLZW5QWTYDj7uy5Futz2
         ewzjjJIiTDtE0xqOlw/tDPHSairbgZRiCVCXeLCZ5j8tSvBBCmOtxqijRp4UETU3rxq+
         /CbZIlnk0aF9LtqKlyv1iocdEOqUZH8Dn7JFAM21fPJRG7cWO3InxUTIJ6Ukg5AXPSFf
         L7EuthNknVRv+Q5h2V7qv2YJ7BiOGN2fWaNW21ypRKNHphn05vaORu+GCgcDgUi21cKp
         q609TN4LXhIHSDL8XIYrjIzEmHl77rrLf4YimXeMcnYx2/DYOAD4vX51RHjxr6YOnwZ4
         1AsA==
X-Forwarded-Encrypted: i=1; AJvYcCXbdjw7DFZ/W15s36LAjslQ8WK+0UWAz69A+6Tv+UBHxUcxYiL/gIzt7eStTUrfx/EKNqsKubmY0QGMJIFT@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYGlOhcoGZJl+bCWTvTTkN3IZLPLwjqkPB1kcmsv3eTOECx1Y
	4Qzpml2i4DEBjf+NZDYijgdg1TpWjaXbAmPYYm+/nPnGpxIw7Izvig266sbptw8w0YOOzPtccQE
	Bg8FAoyGNkmAWIyT5pWJwxCictArsJs0S8SIo1Q==
X-Gm-Gg: ASbGncsunIjGWLSWwTeupw62QortSnvOiL29YUW0goFUES0snmL3xKNKpKrenQYppvi
	Y1I4cIp7CGwEeNSik7KG4rVinjvbcu+8YpMLKSgi53ad8doqALV6N4luluQ6Czr+pSk2Kb9oLD2
	x9o1VE//H1d40VztoamL5e/d4=
X-Google-Smtp-Source: AGHT+IEUNuiXsK28DcHdqG1WX9IZVYS3HmbU7AeEJJZJAoK7D9V3OmcEGMH3wLfdWG71ykhftl48P90KIq2rWvBQudM=
X-Received: by 2002:a05:6512:a94:b0:545:93b:30bf with SMTP id
 2adb3069b0e04-54ad64f08e6mr4576213e87.41.1742804630434; Mon, 24 Mar 2025
 01:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
 <Z-ER6elHDYtIY0ap@hovoldconsulting.com> <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 09:23:39 +0100
X-Gm-Features: AQ5f1JqdI2uLqhfgx4QepLSst36sJW56R8LoYIG4KSFVVLp6D64VvNqLS9X6y5Y
Message-ID: <CACRpkdagFrz=5fRUfVuaZJRsBao4UrObNa7VknS_hmOAsWFO+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 9:09=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> ok, then the only suspecting point is
> wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_ASIS);
>
> I may need to use GPIOD_OUT_LOW to configure it
> to output as set raw set value as 1.

I think there may be a bug in gpiod_configure_flags() in gpiolib.c:

        /* Process flags */
        if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
                ret =3D gpiod_direction_output_nonotify(desc,
                                !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
        else
                ret =3D gpiod_direction_input_nonotify(desc);

Shouldn't this be:

        if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
                ret =3D gpiod_direction_output_nonotify(desc,
                                !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
        else if (dflags & GPIOD_FLAGS_BIT_DIR_SET)
                ret =3D gpiod_direction_input_nonotify(desc);

?

As it looks, the line will be set into input mode unless explicitly
requested as output...

However this means the patch also has another bug: you need
to either:

1. Specify GPIO_OUT_LOW when requesting it or
2. Explicitly call gpiod_direction_out() before setting the value.

Yours,
Linus Walleij

