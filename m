Return-Path: <linux-arm-msm+bounces-64636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE7B023E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 20:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 761E57AA909
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 18:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58062F3647;
	Fri, 11 Jul 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzeykREn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932292F4312
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259042; cv=none; b=Mgv7bt5coMVefgltEd3AtaHh6nc2q5pg4vFSA40GFgmEjs38viEvkr9rWZBEvIYYyAc6KeOlVnoriBrA+NHsHTyBYsWvYP4Phzv0+xegVB2iXmCX8ZKyjdn9FttO60AzmDZILw08cw0bKn9gvP8E/z/+QpguNvCzOAt9SeB+ICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259042; c=relaxed/simple;
	bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG07hdYw6vAePHKOcZ3Pc2BCxav9jq5nuuDsJPJdnI2PaoeDaI73krMJsT6Ky+9bNnDLz1XX2EuqYR4ouAkRTPmB2oG2/2k8LpoKTXkJrX3+ga/UEUCSjetYcrPdroAmMi29c5timfMDLQ0zoMTHjyLMPk8yKDfOtq3W8XyV/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzeykREn; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-711a3dda147so27243417b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259038; x=1752863838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=YzeykREnSDumnHnI69/YB7/HpOqUqffv9kuxZjKKZ7zHR/qUEZ4RdTCLBFluf6Ysfq
         Z8AJUhw/0M1fkETJe8jqQl4raHuI26UmI7Gb3xsX+DZYpa14Mu9/mhtt9is6U0bCvfXa
         ehtu4PAeRG4NuM6PsfXTaE+JMROz0csJLMzK4Kgo8Gyqz1gLrl5EX7iw4ndjx3yDUHMA
         Bt/9oLQEdQ8MQxbTonaCMGzyf0+hv2Owrhw99s1IR5VRvAHr19/cKZBLgMTwPCelNMbQ
         mBzqS0Lo1lhkPRflRJiancMNILRNukqXxLf4X2dKsKFpfXGl0O9+L1LWymVW7Qcr5+JQ
         /mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259038; x=1752863838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=cMm3sXzi3+N5hcJ7+qlKuMMLK9tLWQSt1Ii8abZOzKnKv/5GcgwiayDhO7aZMbYqEE
         gEVH/PbbZ/Q6inyH8KUWdttvcetr7wI/KixhjOdOzI+v0kA6BHjsNrYHeVluliiKxbDM
         UQj4Mmp/F5vKGMNclj5jTmYQ4z3wOjIvrTRR2hrmit2wWyu3RVlJM2CKgTWp3pIOhIzR
         EgZ4FpvZQIzi/M71h7RzmdCi1BwAsxWz8RzX2dNt82QLkoD60TlT3kJAyfvlD0P48vzn
         lUbUDx0YAj0yukclrtYBB6PXWyzEaRj7Hg4qW+NE4wWqjX+6RBLQOtWkUuXPrESXxVyx
         iipw==
X-Forwarded-Encrypted: i=1; AJvYcCX23jkZJeBUWYgJTvp1h67xvrUjeEuLqx8uOl86eNXeEzKhbZS3VV3lYfNcWrVI+gbg1sO3wudzAagJzmSo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzica5Gw3cyGNKkS9tua9LJ0l8hSi+pSZUL1pvAbmRy1duM+Wgz
	iQviBOEWBELeD3bOUy+ttbjnt1VlV1eB2fLmx8/KQ2ec+VmoeB6numPaWPfgZGw82DXNv270iIa
	/8888ATHhgABW5v5pDkmrb34Fr1a81jELxwHlrodLxFXHrU0pr7SJ
X-Gm-Gg: ASbGncuLz2ThAilpoQazt4gpw6U4M22aJKhkvkQvQG6T6oPs/IBDHgcG1jU3okWgEVW
	P7J6iiyP8dntjYB6DoWJfrQRjSeJBoaXon74cVNVN8nUkNcl33IgAfE7YtA+OmutLa8bcJJN+eR
	QbSqbqWtbQmbUBCx9rAoW0CAUARTzwcuMvhXcMXqZRrzzaptkfwcyIHAziyxCZxtj0XRZHdVzY/
	cP81og=
X-Google-Smtp-Source: AGHT+IHzkdQtsARg4tgkPF4WasK2Xo6Mfikt+zRNsUMsy8+DUZg6XHckhgK5mt593KfRZFbjIPg2gYdMMhURtB+dxr4=
X-Received: by 2002:a05:690c:f05:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-717d5d7aa0fmr72034937b3.12.1752259038573; Fri, 11 Jul 2025
 11:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org> <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:37:05 +0200
X-Gm-Features: Ac12FXzfU1xcaSYLqYAP3dXdgN5KjaQup50oBj2gBIW6fBcQFAAh4KjvNIaCjNI
Message-ID: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
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

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say I'm a big fan of this patch set and it seems only
this patch 8/12 has outstanding comments.

Do you think you can do a quick iteration of it or does it require
a lot of time?

I am tempted to simply apply patches 1-7 to make your life
easier past v6.17, should I do this?

Yours,
Linus Walleij

