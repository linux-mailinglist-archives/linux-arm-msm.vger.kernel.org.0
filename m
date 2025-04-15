Return-Path: <linux-arm-msm+bounces-54457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0BA8AAE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC08517CDA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AE0256C69;
	Tue, 15 Apr 2025 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHuF3zzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB162749D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754999; cv=none; b=KmlXg7icU2+BBysoUrHN2d6xUURiKSMgwQsyqjWuWkFrJo41XlT2+Jh7wLAtWUrghJa2ODD8rg+fLKUpNcygOlNoYwpJ8QhQ+vZF1vsNvGNRINXo29ioH44JWXYwEm6CBsWl+5cYBSh8vgYOU7m9GRA4uWoJzIqg6X+Voo+S/RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754999; c=relaxed/simple;
	bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8TDXpXmycL1erv8yjhWh1P4p+WhNML+47kp8acL4zwL9spY0mH71sHe18+aB80BUeCBgp+i3woqMtrJevqlX1fWe6iv5OhTlgN0QfMq5FJ6moY5dp3/gjTIk+qTkoI91Zycu+MBet3I158iU3l4oCeNQumrC+tKOK6WyGrQ5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHuF3zzn; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c2d427194so55408681fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744754994; x=1745359794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=kHuF3zznt0wAgtDxx5rBMS6i9u+WxyY2mZY5WSg9Mcte2bHhpNuIOgH3osVmLNrXOx
         UFmgiZ8L39OVHPh9F9617j4luOSZ13mvIVUILSAepJ4ZilR+fQNt6BnM94/jFabz/122
         W/fW66NXrRUVs2T0J0Fg/4+w3lTFZDYAZU0Y4CivaNNIDaHOhR3YStXfw3zF2rq+6sRD
         J9NU81zWbhirXu9i9vCdJ/vU4BbJ1akUweooUxo64K5Av+p/QJmnGKScW9/R+llSnN7K
         u7+JJY3tVh21Ni8ncEnNonvSS8yLnIGmS9wJaoJymYsliHTCNjHLqm4VMX9k07l9aibq
         9Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754994; x=1745359794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=oJxIrdEsVsQX5vf+SJs7srNXFzabfK1WmJ1Va2E253osOHokXWhRluDDL5oGUalJSV
         hVNwi3xxOP7E8J+/pZTzaWCWcwMzkbifhzpzW0KQczmAa7R5VvdAeh0PiJEy61DnDRYw
         wpNHn2UVPDq84W+InfHtChY2vgUV6DywoPNu5Qdbkyfnc+kZkf0CJcnLai43bsw7lsLG
         fkPIw/xTM9CXYk812wNqyJ3rOa9OYWFCqGQLFsn4Eusrv8uepTZSzWVJ87ftKqcYcpPZ
         kDPcYqIBSeC/TuNqLeb0XSBsOgXhSYQpy4C0o+SwahC62WL13LqlGC5x77l3ikOwQh7A
         5yMw==
X-Forwarded-Encrypted: i=1; AJvYcCUiQdnE/gMJdMgbAy/Awvyi9WxO6LC1l/vmg6MC8xbUAgKbJufTtqYVpTgdqNQtxsHgoXqnO+aIUBDv51pN@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjjOkl1Gril5WDw2irk5yeOpO1YIOqakDf4f9xWgvGx3DDOPO
	CnEUIteGL0OJt2t966LlhL+rF+pe2LRJLm17D5WNt3IlMbr0YWxLojH1EVDFFiXgKy7qsvSiQi4
	t+LPymWiC/119LzvqLDPl2T3QHp+moN1ESDbJOruHiR4FoLfX
X-Gm-Gg: ASbGncsXTO0NoJgAP61TUMyYjryk0H2j3Aq6V601C+nx7VNKTeBZFtqnVVYjEDIA69z
	lGmGtcW4z8nIFaEe9Vk+cO6qEyoiV5jmZcqTUlUit0124Rs8MgXppF5NF/2vZePwogVUUp6DIYa
	2lU5fZ7soVykRMBlS/YnBxZm6oXTlO7j2Z
X-Google-Smtp-Source: AGHT+IGCYPQ+b5FRodJ8wxuEHegzDnmUa6Evm4QmQdnqKruHFaVQ55qUyUsMYu12ZNgCb46mTc3ah90RckpXK0EBciM=
X-Received: by 2002:a05:651c:1989:b0:30d:629c:4333 with SMTP id
 38308e7fff4ca-3107c36cd96mr1776621fa.34.1744754993762; Tue, 15 Apr 2025
 15:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:09:42 +0200
X-Gm-Features: ATxdqUHZ5uDLzgQCP5maQ9X1ZgCSKxId_N-06QIwPSuLwaXV3MxBAYqEvsqUNCU
Message-ID: <CACRpkdaY440anO7WX-em3b80RD_ZrRGcgTa8me+ys6sd=v0m1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:00=E2=80=AFAM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied.

Yours,
Linus Walleij

