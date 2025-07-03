Return-Path: <linux-arm-msm+bounces-63582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F9AF82E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC72B6E3CC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABD0230D14;
	Thu,  3 Jul 2025 21:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LH/PsIz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7E239E67
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579662; cv=none; b=f7TqRCRmrGxs5jGd2PUaswtlj+Kh1XGUvItKd/hljtFdXCahlqB4F+ednFH3HlZtFZ0qCDVFgyHROEmbZ95o8ZiKdHQJYkSC4bSWgCKb8MY89dZB8CET1m2X28FpZT2CuVeuPzd4JTQvMy8PFeukS0r9wOVbVDmnL5SyBCQMFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579662; c=relaxed/simple;
	bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGlPjPW4dPCl7z7WdW8jKpo200bmjO9qB+NAnxVAeB3elajDrJZ8QEgQqEOLI8L0/8f53VmAWdH+2fznVECv9unc6O7I3Rg9GYL53dXb7RCPMDwXNEFqetPbO2WAgYvLMMXl5Jt1HbM1vbj0pksm13kbRHGzXePIRRzta8aw2xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LH/PsIz4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b3316160so430035e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579659; x=1752184459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=LH/PsIz4Rdp3SZpO6iSO4RMi70OfPm1+90Unk2x8B5XbUjnIHXB7dpdjgq6tDRF+28
         nkqoaNOm3WVyYFejAqUT+gzgV+eO5EVsTAjxso65fqWpNSZEWs1bWFDm911HaBDkIJxX
         ZlnBwIR8Mg8d6qTxyA9v7yaLm2erhEbGpWbbO+ChWfUZ3V5QTtTqV5vr0vN3HlBA3ea6
         hjb2AtcKXgcrANkiWxyB+kiLcknGBofa4bJ82rJk8Bqg6wHOoS9pX3LijxfgEJtonbrO
         /Pbrmz9e+0+OpNtPdzLOTmXWDV6NYprGu1OKQVYcu4Fsj0iYooRzvTIQ3N35KPgtAeSh
         JR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579659; x=1752184459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=U6M1TqDvN94V8pZr8QnWwf+5hW8eWe8LpG9L+thk9ZwOJLJvuplu/CqMWlu7w7SymN
         7KrRTZVFaDepwaZb4mhT7qsxzup2O7GSuDBCwH5SaH2cDx23X8Se0IBY6FrBHX5TXe5m
         nSS5zD9DVal+vYIObRw8qlF5wgGvAUy+0oyh9K40alrrvwXkvhmJitmcxbS9R7CBW/xL
         +nc/gsEP7eIsOU4ewm6C/XN+sNzVvtA3F0+IliYHfgMzNCBrwCcwGc2WzzIzGLukuZdT
         plzzF++ADPqCHp2SLfBeBKZN+A8ryDp3Uxig9YezrX/8XcikERI0/3ZbwR5ynJ9dXZZ7
         FPXw==
X-Forwarded-Encrypted: i=1; AJvYcCWeaC5uD+XNV5ibqZrfVDbt3AUDR5e2dSb1Q/Mhi1cFwEBz4wpxTByEuabPJ5nPNQ2umenB8Sym9kZi9sbK@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkx7kn4zj7CdLGHVP5k7Hh/e/oKuu5u5uYDiiFO9l2/Fe/zo7
	iQ3xztI+uCl3yVIflerJ9FsQ4AxLRByh5dilUDi1oLwyGEt5CWAhcX7/ypNblKaDKJdurAyVl0Z
	OEQ5iPCGWWMy2Gv7Q622D/GHSAYJsYN1ynkYYUyh9Og==
X-Gm-Gg: ASbGncvb0DMpISfhNMlKgXKyyrwuxulnoYo2Pb6DM0WY8TVd/4EgFEhTwKAB8hgmG0k
	UFUMaZ19+ssYon6nKgcnGORPAuhhxuNpbxYgLvBrWctEyYpepgz6PRaNo1LEegoUwznVUezM5oA
	/uwonaDFpprh1XwBQdLyD0fzrHBDg0qUgLlbFpprWRkzw=
X-Google-Smtp-Source: AGHT+IFckUZv1qDN34YL9xP78RpLLOjoYJYZ+wKY65GHTkc4fwzbahypUbKLt2uekYZ4NWpbxz8d+9N/6fdIiPphiOQ=
X-Received: by 2002:a05:6512:252a:b0:553:d910:932b with SMTP id
 2adb3069b0e04-556de26ecdfmr19471e87.46.1751579658980; Thu, 03 Jul 2025
 14:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:54:08 +0200
X-Gm-Features: Ac12FXz8bSnZw_fU0LoXZXBdvuWYVqNdvL-IUi3U2zwuKMo-p81WILsJ1A0gEfI
Message-ID: <CACRpkdZ8oHJeHydLcMmtttJiKSGybX7vmhgPDEjD_4SDoxvCzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Document and add the pinctrl driver for the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm=
-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-pinctrl-v1-0-ebfa=
9e886594@fairphone.com

The patches look entirely reasonable to me, as long as the DT
people are on board with the compatibles I will apply the
patches.

Yours,
Linus Walleij

