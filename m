Return-Path: <linux-arm-msm+bounces-81209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2EFC4D239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29AC3A28FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14FF34EF16;
	Tue, 11 Nov 2025 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsBzDYgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFCF34EF13
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857698; cv=none; b=IXDMGhh5LBCsIjlN6PC2nr5/5fnUEx+zIBOptGa24MHI3jp5Yg52ucrNMoXhk22fJHHjEUzBG4pAoth5vLOzE/A0Wsf1+Xo8i0OLAD4cndzntYuWJADotDnYmVizqspKQsamm/xVc4PH2wvfdGfnSu4fBErUR3IRVsnXTcOtr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857698; c=relaxed/simple;
	bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PY2c3UVXN4o71f9eLsBUxpRgM2dRpA8TEhr+KDBfkZqCuedCMFcg3PxRk5BUKc4QJgTLm1oxCJKtXZkkTGPJlK0cUh4Xg1lez34VTa4RCJFnKYxfm6TOnevwcmXCjPOGsex6DSu2Y7COPUycBVgzHyO1aBClscLoOtBK8Ym539s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsBzDYgd; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787f28f89faso18792327b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857695; x=1763462495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=BsBzDYgdLq5JYwIPqSNeLozEHIi9qdflkd/j+ui5ZkmusTeSLTraVh0m1pdGS7gOCV
         64pTgt6ji6t0/RlTTav+AJBDlWDXohuCpjSaYCqbZZMCQXwfYjDLgsAje2blEWsbDPza
         ZLkyEtyiLklNhaHYyqwFdzZrtH+Zp4Bbqerbkrwr7weYuMQmI1CQUNcfE9lrJSBzCuRy
         Sk6lKnxRtyVwNdW8vfFhBIVU71FHD+tbM4GY6sacppRZUjIG2NJuiwAkbcSiml8mD1ah
         eSJXv/ko8om9hSU1bk0k35hMHNajUUhmz8o8BDZozzGF1fXDgHO5xFoiTGcSjcqgd5Q4
         Lz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857695; x=1763462495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=TJNhGyVWKi0sdwNkynq55ZU/ZEOP9lA0++FXmwusec1GvjuB6I6b0grxnsCIpc/eRI
         pH51jmqUkHeEv2nC3awHF2/UmQk5h6CGTnjFbzofD7p5Kb21bWZR7rXfqSfP1cHefEC+
         HbnTH1BaOH/HGagFq8lAnpErUd3+lzTEFudhogx4BveFWOT5q0bfZnKlqIuZ21j7Nrni
         2VZX2EuAG9ZONzC//Q6V30gXJ9zW0i2KM3A1VimyCFDoRDV6IuRUzwmJZhDV24LsSRvn
         /M36NbEa17BVzE+BxmjtiGq0shoHK7sB+iaZCcDJmeiOC3f/NfWV+l4ErqXWOkJy59QH
         PwBw==
X-Forwarded-Encrypted: i=1; AJvYcCUuqgfIwsriUSHaX9uRspua8swI6u+jWgdfA29eXF6HaJXbgwA/neDoY5Xyifdn/r9yFzJUjXNJmRP/eUbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Iirp2VLZDX/qENAhN5natgCQEnOBFaQ+YlvmOw97uP5MyvjH
	YyeF5LdPYS/qgXs6tOA3Go5Cib0FlbyHXX7XdXCCPTUIrBlZMJz86w+CdlWRQzYn8kDKMzUij7o
	bD9V5ImEw9G5c/f/pNrZGnG/wYxAPM5wZj3FNVusJiA==
X-Gm-Gg: ASbGncsvTCs27Aj6H4amYjKLEOuj3cMCnSrCsrOKGksx2ns621vwmMM8h25efXYbjoF
	WbdRRgvGmhOo/112+MW4CnhvsaauiGpWAtIzl1r4/xD1Znjooj0Fxd5d4zHvOSjD8zKCq6BIIqe
	UrxfnFPYUh1ZgZtVi1eqi4HgvhgQz2BSzxnQ/EwiClwq8v1tkjq/g02hj0xKRhihrpL8SR3xbh8
	b7WugudLfkMwWReZqFerW7jbakluy9F+P92YitOSzT24NxGEt+Z8njxEq2/
X-Google-Smtp-Source: AGHT+IHoTEqTIMeK7JCIYihCqYCVhAe4gzTa4C+3j+k47suT30AzzIQmG9wEWL0FkhepDKD6CvXqSafZZ1SR1+atEmQ=
X-Received: by 2002:a05:690c:8687:10b0:787:cab5:79a1 with SMTP id
 00721157ae682-787d543ce2dmr101353817b3.32.1762857694963; Tue, 11 Nov 2025
 02:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:41:17 +0100
X-Gm-Features: AWmQ_bn0WFQEeQmuj7iPjvAHMQKL1gkynLIxqjiJlR4NSYtZ2qnuSvoaANZDav4
Message-ID: <CACRpkdZwO8mXvjwS7xgVvHmcpF+_pgKYsj3c3QRUcYWPdCt5ng@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
>
> This code can be compiled out on platforms which don't use shared GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The concept is sound and we have to begin somewhere, optimizations
for code reuse and cleanups can be done in-tree.

So:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

