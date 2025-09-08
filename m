Return-Path: <linux-arm-msm+bounces-72560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B59B48D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DB8172AED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3A62FE588;
	Mon,  8 Sep 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRj0wY5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543022FC01A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333931; cv=none; b=kNZOHLlBs2QnMPmrACDvdPZXxWR1dTWFBP4mWwLHW1HA0XKv2qklaPGjzWhRdws/3a/reKK+m19RcwflU0evCiIJSEup29oclK8+Vkkc8M7+VOdAH4PoctkTrDLO71qiKEB/seJMenzxSCAaPCGVuyYQQ9M+nG8pnSw8dGvhLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333931; c=relaxed/simple;
	bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2Q7y2o8UoktYQ6ANpLAHu3La9jzlrb7nmyG/Be8aBMn8P5mTsmaWxE8bMkCIASZBFViN5NuYgXemEObsfurz9r7KRXb2i4buSIeW+2eqxajru9a+9AVWG7Gi6byqLmc98VN3iYfjFwyFx/PKcJyHd3VCuxVUCkKuA6rZ8pxJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRj0wY5v; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336b88c5362so39148661fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333926; x=1757938726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
        b=bRj0wY5vx42hNu/oUuC5Cm/9lcsT9/hRuPE9Oje20Z1pFGQkuaDKH+5HV2HRwmiw7T
         d4Mg6aqxBZv12/y0DQgz1/VdVODPH0Y6aRqiBtYtTIRswO+4rV88Ur4BY4B0G8j90i8Z
         U9omj4Unq5PQEoqFPMkDEfm/V5lqIV5e40nVgUeMPOkCAYF8/q3AwtIJ82pFlsojBeoO
         mgQ3f8sQifmQBTVHT+InmiABGE3jSjHwqASAei1EJdgXqpJ91hctA2wqUncnVTLPfAZb
         c2Dio9MRHOq3Kans/ajYODY0Uqg1zhjeRQa44EGSPFSv1bnPqhCzrilYn+WhYW/yop0J
         ++xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333926; x=1757938726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
        b=ji5MniXHHpC9GbEYV9Iezyh3wAijcAkh2CezV/QXlzS0aNhCgsZptarMklYuXfXbUI
         ZbZ+kCl1xdSCxQ+9dBbhXdatpq5WKsJ15FJ2VeJnPppPoS1t0MMz0TQoOtdM0JxmwgJk
         X/Zys/2r5Kl4LNTvRK+IxrH/PLyVq5kQbx9LUUlCPkgmrJzpTmlYtIDYHWfROC/cWH46
         58kQbJ3QlIvlg+oxWX0Y9ySaPAJbMC/7ycss9VlcGu5d//XEedKVctMt8RY+bXosmL9x
         MCthkVlby0XhWRv5JoPsFOy/rF/+kGyIbpJ6+ErFLvlkYEEoIIVQU8Od3t5gC5OEnUbO
         X/fg==
X-Forwarded-Encrypted: i=1; AJvYcCVSrdVPuovjbEla3XgPZGrDSTaIsnJuc6J0duNMnAOfN5SJ3SxaD6QehEVy3i67qLQlXV2tBY2AXFYsS438@vger.kernel.org
X-Gm-Message-State: AOJu0YzKd0wsD6QDiqk+aeulAeA02T/GtCXNsnExkrjNBO9vE9Q7V6CH
	oHU8P9avx+cin+VMNYJQhhr/8+q1J5iLVNrp1EwiOslPrBH3DDkJzjF2kqHCiDqyqbVrg11GpOy
	q1voyqthmI4zjvPC+Ez8SSenO6Qb63S2ZS+nI2nDKEw==
X-Gm-Gg: ASbGncvOkRUSaEpZRWQqFY+uDRigwPKI+2Kp2Yd2l7mvXFqEkyEFDwDZ5hAyivBb+Xg
	ESmMvSPAW+mqnsiHcCArLmUjiyCQ4jiJAPOrl5hiYYqS18qrnIot+06YuB12VF2MU9wwQeLl6sK
	8T2psVgf5DTryFLcSspxxrD3jICaisyoVQfZAcQBtw4dOF+uFxumhF0Odh/T47nZdm7VrCAk+ZO
	R0C//7A7gV1WrAieQ==
X-Google-Smtp-Source: AGHT+IHM/asPiTx9epOD6oTfJGUKN67uaWlwZQ78ImQd67LcYMxVaHUE3T7Mz8CkVcX10agc5tRhs6MCp4IvPGbhEmU=
X-Received: by 2002:a05:651c:20ce:10b0:336:80e3:b1aa with SMTP id
 38308e7fff4ca-33b57396e4emr16467561fa.40.1757333926321; Mon, 08 Sep 2025
 05:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:18:35 +0200
X-Gm-Features: Ac12FXw45K3T8l4lkY0i6QN88olXVHwaoVRfqMYPmh8yFo1l5iil-Ht1oK5lLbQ
Message-ID: <CACRpkdY2o7PB-1t5kwGFpWjDu4QfKG_gf0_pGA=V1=_KFCqqiA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add SDM660 LPASS LPI TLMM
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>, 
	Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 3:43=E2=80=AFPM Nickolay Goppen <setotau@mainlining.=
org> wrote:

> This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
> introduces pin_offset field for LPI pinctrl drivers to support
> SDM660's quirky pin_offsets taken from an array with
> predefined offsets from downstream [1].
>
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27=
-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>

This seems ready for merge if you fix the last few comments
and collect the ACKs/Reviewed-by, can you send a v6
addressing this?

Yours,
Linus Walleij

