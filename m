Return-Path: <linux-arm-msm+bounces-83017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E728C7F676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A68CD342212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 08:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE8F2EC0A2;
	Mon, 24 Nov 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e/gOvjmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361E2EC0B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973509; cv=none; b=UoteyGQrpVhoRXFYxCPcR0wJi0A3kX75O248wsE2LNdGvVKKO2rISjO/k9X5Y1t2CvVOqz+cg8qaQCbOcQeYS6L3iipV+wHj2xNCyQ0qcDOtHSAPvNq+OXIgbQmrrYZ9NmxXtEB4MWXQb5k8OTljolVjeRsPruUPKimatmORftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973509; c=relaxed/simple;
	bh=A4ko1llTfnMpZKhwN6XAGIF19i93xfliAblBu+9SIoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zv4b/n+evRW+uQy/k9tXL7/MYM5NsAmoURCZU4AHmoeGjZ3NUZeNSXKSY/iO4bAPP9D5/nH++N1GVhqfpfaGXLRse6EhPor4/vJZUTqYbeOFjj/PM+cruvacTBwvohWKYCsW/h3bcDN4MHL9kyHYOOLqvJlUpR9GjT3eBlrYw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e/gOvjmc; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b96cbd875so28616391fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 00:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763973504; x=1764578304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ya6oXSuW5HKGVZ0GUoG6QlLfgFpzkuWfKoJsDP0RZ0=;
        b=e/gOvjmcirMdLpSd1+COw4etcwgdEoeXYLos3MvMPScXWOFLRmsdXgUx7gI0ZsCf91
         rAhmaRSMI5jE8cZtZOHgTeu3GMacAM4KK6q74Cjg0sNQWDA7iXgFpSq6+fEaH3i7KxOT
         k2bN9h/QdEjzJo6rUjX0OBNxVz8WiO8iVM2XK+kDO5wIUSqz87Y2t5Wd1/wJ4bUXq43M
         SKVMZEWZ4ZRZB1kWHs9GAqg5XxtYcJmGGBKzxNTtpvJpkeY9P5r1OIUP0IWA2Eul4m19
         /9ceC/0UklkJkf3jfd22VVh+OKHpz0PYc5GMY+nTRzaYgImtWEnOh9YZU59WBtQgkuvx
         h4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763973504; x=1764578304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ya6oXSuW5HKGVZ0GUoG6QlLfgFpzkuWfKoJsDP0RZ0=;
        b=uQtEcd827CHAI7Qt07oIcZvLdqjau0JOHA7eiy3MYoCHwhrDhWzoZM1cWMbfyBK82G
         yarnY47LnPObvJlIqhJNXN0BXVOdebOQg4bModPnqzMy3q36UJMcziEfi7+wFYcABlNv
         2SYUnd9lfJDEuAaRsbe64n7DxFYfXdg3RJpbqbZbiZ9LZkWLjRnMw2m/1M5eytoZ/ckA
         SEremIzcWmClcrlciqGuo+GyJoQW1rDi4XScySDOhrHp6sLqQZBR1i8GSDV+05ev2O2P
         0ZukF4MbBhkCsPRAJd+Tk+e35Wxm7LhweequRCzxttL9VeppDspMm37sJcNqtc6ASpKO
         XkXw==
X-Forwarded-Encrypted: i=1; AJvYcCWikq20WzGK/f5NEovVXNHXF4JzeDU/acv30wDo7BqLS50+yMbLFBrCuX9r7dQLFdFaTTOS05c2Bizdq4o4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HEpK0IGDt2/pvcUup/qste9FsbzZ2rQtaTcOHEKqbpMaPGWf
	L06+odBitspT7e4e8T01u/xbP7z3E4G/UjOJboC4Llpx61WOQqETvzv5llj7cj2eRO/sXdhJL0u
	21GCZP1NwT3FIEoM1vogqrsRJQPTn4/K1sBWhMHqypQ==
X-Gm-Gg: ASbGncvxx8Gakj5TmN8LengD9VVLiM+nlTGRkPn6gSE+Q9BWQzzXVhKAZ2lLq3Hi8u9
	n9KYS75mAGcvYnQWYrEyxuL8gvq8yVoTgUYyK5rgRCZoIv3ciSLNl0n6j1JI+DTRQ8EsfzM963k
	5ni5PehJ8sq4RqfHwlB2mi/BuLiitQ8IMJQgTb2wKyT2g81otUNPnaPPKDHeEMS2HErsB5b5B+W
	Lg7XfYWTJjaUDh4YPO7n8CU4pAxDEqsolRLp174ADeedOWu4gGi4/SV/PfdC8PXi9CeEQHAYciI
	/0DKyhq/BAnZMBmQLw67wZM6iPw=
X-Google-Smtp-Source: AGHT+IHddP45Iw1u4x5gRhDKYJif/xDaoPtzoUcfY5zo1vTJhPnOEF4e60BFJI6rchMqF8oMYnvc4vWnv0O61qtodtg=
X-Received: by 2002:a05:6512:110a:b0:594:253c:209f with SMTP id
 2adb3069b0e04-596a3edc91fmr3270301e87.39.1763973503967; Mon, 24 Nov 2025
 00:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
 <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
In-Reply-To: <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 24 Nov 2025 09:38:12 +0100
X-Gm-Features: AWmQ_bnn18M7d0OcQOnbJTJz4lGmLFoHp7b-dn-7mGA9R5vcmt5vBbCxue_57oU
Message-ID: <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Val Packett <val@packett.cool>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 2:03=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> > ---
> > This is targetting linux-next where the reset-gpio driver is now using
> > the auxiliary bus and software nodes rather than the platform bus and
> > GPIO machine lookup. The bug is the same in both cases but the fix woul=
d
> > be completely different.
> > ---
> > [..]
>
> Tried applying only this, as well as this +
> https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0f4=
b@linaro.org/
> + https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (on
> top of next-20251120) and the issue is still present.. am I missing
> something?
>

Can you try this branch?

  https://github.com/brgl/linux test/gpiolib-shared-reset-gpio-fix

I confirmed it works on my setup and fixes the problem with multiple
users of reset-gpio AND shared GPIOs enabled.

Bart

