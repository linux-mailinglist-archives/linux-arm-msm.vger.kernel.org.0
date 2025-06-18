Return-Path: <linux-arm-msm+bounces-61716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BBADEAFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAE3B1666B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 11:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAB52BD593;
	Wed, 18 Jun 2025 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2inLkLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3C2820C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247873; cv=none; b=LRXA3IUDLLyG+FS+HLb4BlkIwVtHdxAVY1TSs1J1S7tRQve3xFJd8hjnAuZ2fIgg1XLCLaLAPg7GMpLfeJk8eRwaRhzLTh6lZi615feMSfiAZZ6h/7AKdCALot4sMP+tbI/F9jNfsbV0LzikI7Y6dCZaGAealGv5ZDYYzJgTUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247873; c=relaxed/simple;
	bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivxML+GcXgFwjeOxYEkGCAV1Mqp0xKyz/hyy5j1FK0NfqdxKQab45Y9cK/TE7YTfl7Eo7X5Pu0JPjzd3jdC3J6M3ms2+STtqva52xi3jXFaU9f4y5/uozC8qCgFp+Vznql8CqoSdUPoLoDHroN5AYAB5PGOIw1fpQg7JGA/H3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2inLkLS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b3b250621so54129581fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750247868; x=1750852668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=c2inLkLS7uGMLLdc1vIjANQFCN+KjvLGE0lzx15n5a/kdBh6e6fgOgAs6X82G8szrE
         ERff8kCPgF9bM67uZrv+RLnANOldReYE5+mQfj7YShoMIKwvkpu462a0TiGOIuF6f8e3
         fp06/R+ytLUpdJ5qmOI46Urdi08IHS6zpFSpVwOHO/D1pjmICqT8EdbIEXRc2Jz4zoue
         yDnLfAEMLWp/I6K57JSdJzcIeQO4R1YAPNRyKcumwkhGSEukZzB3Ysa4TY4AzEz+p/3t
         pHIxftSoZb95mqOo8xfgwhl28AYTftoblB7l9+8oorIetLY9mkKuKz2HNGf0mBQLaYM+
         Pz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247868; x=1750852668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXnEOwfbKTy01z7cobE4+Hk1SMKWVRbeCD9p5sV/Oz0=;
        b=ifAgiSHgGMlgROwxTEJMsB7MesUx9+r2QlX/mGbcROov7LvdkvZrWZ4D32c0bqZ+jX
         kDSCrCXraN3q5z8SrHrfTTQ4THIUns0LYyyon7J1w79Xsk2B0Sb9+7ldJtfn3Uu8G//q
         2SNBixYgl9jlI4OkMZJML61wR2Zubm6hOD0PXPoDj7em32okwVCjI/Ib7dcHY3pY4FbD
         gCpjus9ZvHHcQnmgyt1udgtSA5MC5PV6wfmrnbQcp0PpesHYOuyulvRaabJPeIPhuC24
         7DxAuPkNMqqijs3JeruGOnRUqe990yKnDfqgcJkzW32lZ0Wdflw4glzAsjUqk/P/RXAL
         zX5g==
X-Forwarded-Encrypted: i=1; AJvYcCWAbR6bafJdQGw9Pkf5loy2VphDHWBIP0U4fpkB39n/9XP+ueH3yPM1Ws7KqW1bJbqgo9D0LMT7Tg5l41Ve@vger.kernel.org
X-Gm-Message-State: AOJu0YygAy1eIH+X2ZcxVNg7iXrjSlToHMTUEPGH3m5fwCJlY2q39HY/
	O95st1NVpilODhZnYWzrl7awU/HvFqc2tD4+BEmy8ggZ8GdfWPzMyA8a3G5H46TMVVDwzijRLGM
	y7+eQel4kpNs2HA5Mn15VRie3WYZGKEc2sAuWmIbDKA==
X-Gm-Gg: ASbGnctCUVp5zMbiqICFK5IMC1taKws7rEyE99YItHr1cKIMwQkusbi+TNrdYnI3wKe
	PLoBfI/e63vTdG7/YL/EWNyFCChhE0ca9dPuZeyCqtdwFdW6NaHAKTY0cpNHU7ptxW5lRdoGWpy
	Uncn2EjMhgNqVXdRwetS6R1PEFdHwwv1Iw8tfXbztB4Y0=
X-Google-Smtp-Source: AGHT+IH7vnMyWvDeuT22AfjJ72jh8AlElSg/X6zhBdg5qjqst8eEHaOrlL3lefZJep/KKAH4d2AwxAgcyFjM7bagkmM=
X-Received: by 2002:a05:651c:b20:b0:32a:847c:a1c0 with SMTP id
 38308e7fff4ca-32b4a0c5893mr49570841fa.6.1750247868176; Wed, 18 Jun 2025
 04:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612091448.41546-1-brgl@bgdev.pl>
In-Reply-To: <20250612091448.41546-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:57:36 +0200
X-Gm-Features: AX0GCFtRDJgqMbmd8SADniLZIBDm0lbd_j7zrP-SEcNHH7wJbISn24C8wb9wJDI
Message-ID: <CACRpkdb9OkfBS49zjo38L_0zouz2SJmfJK3EaH+YZMPqXacODw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: msm: mark certain pins as invalid for interrupts
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:14=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> On some platforms, the UFS-reset pin has no interrupt logic in TLMM but
> is nevertheless registered as a GPIO in the kernel. This enables the
> user-space to trigger a BUG() in the pinctrl-msm driver by running, for
> example: `gpiomon -c 0 113` on RB2.
>
> The exact culprit is requesting pins whose intr_detection_width setting
> is not 1 or 2 for interrupts. This hits a BUG() in
> msm_gpio_irq_set_type(). Potentially crashing the kernel due to an
> invalid request from user-space is not optimal, so let's go through the
> pins and mark those that would fail the check as invalid for the irq chip
> as we should not even register them as available irqs.
>
> This function can be extended if we determine that there are more
> corner-cases like this.
>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

