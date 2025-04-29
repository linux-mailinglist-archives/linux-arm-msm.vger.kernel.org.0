Return-Path: <linux-arm-msm+bounces-56054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A07AA05C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDE01B6288A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ADE29AB11;
	Tue, 29 Apr 2025 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fk24WV+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3D27B505
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915297; cv=none; b=i6/ulp86ozkRHyEmkGhGGmtNcT9ok4dDsLVbR+/oA3PsLTMWudGWmk+J9fvvHW2pDUwmvRaXubm6rsAqLj9e2XWSHQGJ4pdIjxgVF99Fg+2h0YFAxOOXHkpD0DgEdbFVgX+OGfc8tHu/V2E+szUj/Mt54x8wpXrTjlm0oqyRVcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915297; c=relaxed/simple;
	bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aunNAgE3I8QiU/jGYAUJCDGoXLBeRU+NMVjnYNA0yqiZAa3t7VpIFDxg6OFsynWeUB1pAFZWPHCsgWV5oTBPcIy+d4QYyDb4aK/K+vjXjwRvD/5a56k/22LSV6dNje5HwdB6RoqHyGqLwUJVqkluNnZCuSMw6DeCrjQ+9TAXw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fk24WV+J; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30effbfaf61so65446581fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915293; x=1746520093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=fk24WV+J6KW10tWbbqU2BsRFu5BGpNaxjtT2QXApK39EK5FBDTijtCTmVG7hB/qgqY
         BX3g3bZc8DMJyrZjnE17T/gKusSSV39cIs/GDhS0rDmtL26hEihhQymCrC3VmwZUGHuI
         eww7HHTRPf7d6VFB599wkPndRZBUr+3zWjRcv5oRSITZqt5oe0GrxgoDmULu3tP6mbVY
         hh/UQjNR1FNmAT3hUltrjI/ONXuMqE6/Opyy59bYMbV5hs1FiI0t1D0yjrqeKEoCeQSK
         c1Fl1EoQ5ET00+enQycOTs0TCCVLCGo2cPJfGkqeZcL8o7Mmyp6hQ5rfPFxW8EUMhveG
         p+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=e34WD0YJJZB3Pwsp73y8RfPBM1ojcnRKlWhrl9GxeiCi50pvOjPmzll1HdZMSaPf7u
         sCgLKmRf1o+QLWUpUqcbyETRE7cnS3iKxGDcabltAsRNQkPT3/jZNsParnu6u4e/Iwrv
         q4b0Ceq6VijWHM9iKiKx/f58IPwtJxszkImTJzNGZk3xNYLF5kyaYt8a3ecGoUjOgJeN
         kqRnFMc7vEcAeBqrGM9xYhYHIokZ4KsM5YgxlPuhX3q0zxbbFvSO+n+f6/aG9Dmg198C
         Pzb/1ZcFDFKSc5vJ9T0NvSKHHlDCe2jb6V9B4dYtABOrbIYThJkJCzOQ8rFJvppOHs1E
         37Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUykBuLvMygJ++4oy6Mw/UBRlFsSXVjR+TgdL85oYSMsjnfnB6IoYF6Ny/d7CyvaaNoBYg2Re1hVrVKH5S9@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9FwD+OTBq0Mf9MUaq2Sl0Uhv03yG52ctbbU4itDdFY6e17AQ
	ppF6pFT9vw+oHihGmZwyd12Kx9BOg/LDHOm1ps9RX249yvC7TN/2gUFq2Dp0G+spFN5fgKHIJVp
	SmjFnLGYA539n143VN3/YWjNn6aqcoJ2oORJdQA==
X-Gm-Gg: ASbGncvPvrqByfciaoYWh8IAjywcsaU4LFi9lipNhoyHzz81AFimh+dcHsng3DtyOsM
	inFj6NV4XUDxsbgKH38Ralol9zryd6eRcapXj9qNtSbYQlR/keFeyH4kb1c7bxsG8h2tL2Zd2D3
	EkE3IlwscJU55GndB1Z10KKA==
X-Google-Smtp-Source: AGHT+IH5LFe76433BEhCOsz93hsXmpw541f+gjc8j0FntokriJNT3ta3i7KCJ9pJ4v6e9KkWJAHiRLsRkg2/T2I0yMs=
X-Received: by 2002:a2e:a915:0:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-31d45e2fefdmr6111831fa.9.1745915293027; Tue, 29 Apr 2025
 01:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
In-Reply-To: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:28:01 +0200
X-Gm-Features: ATxdqUFs24UJ9rCBZu0rld2DCgQQfVXx4UwFsW9Kaw9n5MBKTnSUAjPVfLDjQgc
Message-ID: <CACRpkdbyZjfU3dh+3Cn+hDr6Pisf9iOQYuN=mAjrE=+OE0fs8A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Fix PINGROUP definition for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Melody Olvera <melody.olvera@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:02=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Patch applied for fixes.

Yours,
Linus Walleij

