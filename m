Return-Path: <linux-arm-msm+bounces-78762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01BC0851D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 01:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36B314F3BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 23:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8A830DEC4;
	Fri, 24 Oct 2025 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6m6IVA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBFE303A09
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348780; cv=none; b=DAusU67f0K1OHHvobSs+YnVHd6cKOczuAif5HGNHYNUHNucqj6P/De6z3APRkYMs7y9ldqiMZMXGNWFaRj8iYq5/1gIlPgZBXlUnodJEQoh8U29AY2jOt5nVQjx/ZhLyUvsw92EzlbFIhGZKiJU0PC5mWKdfEUd5v5imf64oDwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348780; c=relaxed/simple;
	bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=U5wuuh88wX2fWKquSdzBWFU02wa9X+Ps+jVKFngfCeeo1Xy9D5Rrl8qaKixuZ50JbFWk+vvFWu003U7zLmPhQN9d4nYEv3U+B9SR3en1/g+Vakw0KJbwSgLI6gB7jpAuVKgc9RhvEKch6tj83q+LzOqiH41BPgDz7PFm6CY+pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6m6IVA8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47112a73785so16987665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761348776; x=1761953576; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=g6m6IVA87/GJJD3ajlCcB5mbco1inUtXBb29ngwEz+UlyLtfO7o1SDUOt7KRPkUN3d
         xseovnqYPPnyZtl6eiSZsomtkBdydtDl6uW9JG9AsU8LLCs4DJdnTNyieJzPf+XQbxUg
         eb8kLwiusjAqiJKvOMnr6hThcKURx7oTGYgUAYpVc7Ninf/LBC2ZqCeyQPSOg7NpVHqv
         WtoShpKH3T/x9ThuF/6zDujqgusvu0Iw9SPjHJdePP7qugd/Lz7+gYcWUeupYzvd3LdH
         0fBpwgsj6eskwRr+v5bW72PZPZbzw6Nfj+ZuaHecOcTfu/Mm6s4IeckmDqyeCCWpcQw9
         lt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348776; x=1761953576;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=k1YpE0jWLLIg+a9rdFiJebGbVRCWuEkJdkZZiKcC2m80GXDtRGc93Vp1JcEMQdJytY
         EvMleX6YWGsqCfN4mxsb4X9LiT687UIpxy0MsowajETn/E3OuU384Q/y2lbDOT3G/D/H
         amFgVcZLH7FhyDqGgJQnJJdN6aeoPlEh1W66woxgQQdu3zWIgXFz/l/iV3MUgcq5NY58
         8LyYdLnEI2ZklxaZgb4asQIY8bSh2qTswtRS8pGJtX935hVB2+sHA/CmbpayT3V78XU6
         XNrK41zIOr/FL2ACryvPv3aNZ2Bqq7VknC0/iz2zk8qUXvdfwoFSapCQGOxZrf95kFVA
         nFNA==
X-Forwarded-Encrypted: i=1; AJvYcCU//yQuhX6aIffWLXFjBgSsRAHPGzCkPfm6E7YYjTGv7HMCPsRDh/+Y77c1DRX5kcw+thTI+6VRA9Eaus7b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp2fARFaeoyeVWmzfcsyKEiByQP5L/U0CAe/aVvD0zkoo/wwZ
	LVPk1sscjdlTQr69ISatsh2SO6HTyZI2ZKc4qfOa20Zimp0PpXnNqPapw8F4VxNlq7o=
X-Gm-Gg: ASbGncv+FHYBAq5ogoWkY1qWX1QFnjhDlf1UAdmjVBtFhaZoRLRoPjonTnrWGYtmQME
	kfve3MqOQlh3EZpo1lJjp7ZWJ+jrR2jb2TOrxE4EhWAUkBMZGPbRy0KNqwZqOZqBBmOVQhSbsf8
	McnGtT8JIL1lKvQsqurBXxXWyerEYTDXslK7By6Qkj8FGZG632ZzY2AQsZxWwEZgPG7rSed1w4W
	jj5ahenf+JqDcomEU92xkC5zoHgEdzbvEipgPZ9lKMLZcUuOEpXVBH18kyCTsMUZoM+CFRwh0km
	A+IprBuQSGr9NGt7yKssPYAaIZ3XU4MBj/fodrqrjupUM+bnSTG4m5fjW54dXenyAdZO53U4ueC
	PEZKRIxa6foCu2L/kUzfB8lPqLX1fI4ah1Ln0drtPFX5Nt8WvqDxy0HmCy0M1VrzpeBedix/7+w
	TorSRqR8jkQMVCAZc=
X-Google-Smtp-Source: AGHT+IGpS+9bXxIYVkmYN3aYKTkh9rmryEYIUIEOWTNg7RqiVEj4YoqfyQVte/UCsJWhkp/A2ApwYQ==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-4711b25fd7cmr148300005e9.36.1761348775627;
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7969:1fa8:db69:6159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm6627875e9.1.2025.10.24.16.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 00:32:54 +0100
Message-Id: <DDQY14HJJS8U.30QSLJ4PCYJQ@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>

On Wed Oct 22, 2025 at 2:10 PM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I tested the whole series on db845 RB3 board, looks ok.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3


Thanks,
Alexey

