Return-Path: <linux-arm-msm+bounces-35821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 633249AFCD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 955151C2170F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB61D2B39;
	Fri, 25 Oct 2024 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhwjyihS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95761BA89B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845799; cv=none; b=OdaOU4FTWL07vuFJm/GaU0260dNp1sUXmcsLhrkmeXJGpWGiB8JwffHzKJrI3/HE69bk13ER+lZp607loUj6lrXOMtvjJfXf009nF0DsFMbAZnqR9Sc6cxBefcMqLeRk05mETxy6yow3UCcpcNTLnNHOlB6rW6RlYszUgu6F7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845799; c=relaxed/simple;
	bh=Is6fCU7r2O627z6txt09DGR3k7pJC1u2UpNlPdCrthw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrSkh3GPRleRirvxji2cNMMBnWC6R482HlySIDwU0d38f7899l19y1AJh92aWo2holj4P7zeDfabnBPd9t3Qlgq2DPy4yYRz1Gcqk0XIpatodktL4FDi4SIkh5TzhnQyDgMnTb1zIQAjmW0DkxHOGnPr2xWBnEoZLONpscGy6FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhwjyihS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso14387451fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729845796; x=1730450596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bnGk2OAtXC2qhYzxaIFFCqNFOv/GnSjD450ML+33Ug=;
        b=OhwjyihS7PDKATuISukhE/gTsFO0++MeLlAa4En2haUcxfoxt/FJjEfQcp6tpHsPRG
         7+brU8WGJT7nut5a0zitfFNknM3sUwmDLULfkYXkBA5wTlrelX9pgeTYrs7ToABHZH5M
         6dsfINdkySTMkU6LiMGov08QwJwNVo1a4Q72NnSZOw/H+qZbtFVcsv0YFlRc81cw4fgp
         31wf/OR48ES74u5wVKj/ls4itIHZioPXdsl7PAR2c/msYwhpGdN6YbiJlXGgvVn2xkiU
         QpccuriUEQGqLqEMrjr1fXK+sA8CuRjHlJgirow0Q8tzNWNyF1kHorx9ZPy4aRaE9ymp
         2Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845796; x=1730450596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bnGk2OAtXC2qhYzxaIFFCqNFOv/GnSjD450ML+33Ug=;
        b=gE8gO/PC8NEjyln2XmLzLH4RMVBMasTUl7iJLsCyjHXkSeJklaHmXbpE6EQcfn99fa
         mAaFfw/Bzyzb+rekhCI/ifUYkn/FD68qVD3greqRpyaG79yBwdml9y3C19TTTEbXWv8P
         FOvysZ918BDyaAttIqG9abv7aXEKuQhr3FWCbRHSJ7HivG87J3iBKMMyFS6+WE0cdm1J
         lWbMhtpLuwYj0601lDmjBX8Cd2SPdDOQCIQULObW1t2cOC6k0c458IvhNxySJWRTcekt
         JJObadKS/dh69REdL56PZGvpm4BltrGFVcW/reVSI3RBFPeiEeYJ8Zxy827HoUC86K5I
         x2dg==
X-Forwarded-Encrypted: i=1; AJvYcCV4fXWolQiRMCoXoq7Y+2RoIzYBfm12dycVRxCSu1Eht7Tri9nkl5+6y/46X/9CqgCNYGNFC6NQu6YGsp/9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxg8wDpv5REcgnHyRXYqpsSbEEy2MBYiGGIchfyzO389ayENYq
	r37zlWZQXwR2HZZ46jfxlbFPVsiZ3x7iKwTQh/2g1MevCa/rg3xvS2yIHrUiFYqP9NeCR91i3r5
	PMxlBBHCycrMt35uAje9VQqGrB4XcK8zaQGE1mA==
X-Google-Smtp-Source: AGHT+IFTV81QGcolch/8VXee4TeMVNEV9PtzSPTWGGsHdEXX8yJwrIRqHsjgTqxOKepxlFwseluy+FDPbbQYHwW5Z4c=
X-Received: by 2002:a2e:602:0:b0:2fb:4982:daea with SMTP id
 38308e7fff4ca-2fc9d5a992emr39283951fa.32.1729845795871; Fri, 25 Oct 2024
 01:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-3-quic_molvera@quicinc.com> <dnri3nqq2una3atjwl437ujzrl2txl2zdyb2ima5qeeudqotxn@5zdxizip6mhb>
 <d21b259a-1f04-4108-a201-254b44f07529@quicinc.com>
In-Reply-To: <d21b259a-1f04-4108-a201-254b44f07529@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 10:43:04 +0200
Message-ID: <CACRpkdZX1qrMDR-6LuUtc0nqLK3MwrUYQm9bsRZL376Qj6x8XQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sm8750 pinctrl driver
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 8:18=E2=80=AFPM Melody Olvera <quic_molvera@quicinc=
.com> wrote:
> On 10/22/2024 8:27 PM, Bjorn Andersson wrote:
> > On Mon, Oct 21, 2024 at 04:04:14PM GMT, Melody Olvera wrote:

> > [..]
> >> +static const int sm8750_reserved_gpios[] =3D {
> >> +    36, 37, 38, 39, 74, -1
> > Any particular reason why these are not gpio-reserved-ranges in
> > DeviceTree?
> >
>
> Not particularly; I wasn't sure whether or not to include in the initial
> dt patch.
> Will add.

Can we also write (as a comment in the device tree) *why* they
are reserved? Such as "used by BIOS/ACPI/secure world"?
Just a minor nit but it's very helpful for newcomers reading the
DTS.

Yours,
Linus Walleij

