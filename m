Return-Path: <linux-arm-msm+bounces-77002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6499BD2F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 928FF4F1396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328F428000A;
	Mon, 13 Oct 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuHyV48c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF1271456
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358604; cv=none; b=CzV+Nf2RxGSNY7UjgLu2lyycb8p6tsLZxdVkeA5pE40HCZX3zq980P13AIHfLS0QbPzCrsmkDGHIXRqze4dMPzDpmCcOWd4L2sghDowF7A1goDiHoGoGhOtbub1MTJhn40LG/2/wgxX0opcAI2WTf73/oqgsybnHV4GiOWaGYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358604; c=relaxed/simple;
	bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLbfOO3uSxhbvG4/cRIYXcJggq897xhnOLcWk1hEEtzdIXw1F/dxlu33HnadQHgVZ6A/ZGgt5W6n4Zv/aEIPFreSxnYD59/MUU4stKi11b1EirMPEeKfXq3UdX7vt05tDnHJY79kaDHKka1bii5xWr/VA6Kbj45OOBt2VIkKqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuHyV48c; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-362acd22c78so35298481fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760358600; x=1760963400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=WuHyV48cutS3BFuIeIUDZMPcLa6tMnyBbtcxK3rif3mfMAQ8/KPy23tjOczWdZwsOA
         pM7W7HYN7Is3DwRnSLIdWGYpbyL6yYwOoSTyHH4ty5cMcpkR4O3R1fFSfhY6ProapXL0
         c0YnntQczYeTnH6jS3oG4RUimeMHmcLW2HbYOmM9HXqNY5fSv+DmH12+vmzJ62E+/4uJ
         QPPGCDpNAZ2BHfBnyyqq4XppsF6skzr0cUoZzM2Nh0iQGnu0TVH5rhnO3S9kT9E+gKw/
         NExo/fyCqnnOezgrh+c0EREEKaZtYThXFgCuHGwnx6DciKiin7I7JfuFwJpXjUOGxFuU
         ZKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358600; x=1760963400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MOmeyqog4OM7BYJL2ULZOdWEH0/3arI6omm4yBQqNE=;
        b=wCsi6MfyXlQ4f6Kfi4Vl/OOdcAxLx1/POwvESnMD01pyTvSuT0Q4+LDqq0Z+ylyxKQ
         /s1rlNEJG2IZ99Hac+u9ou7hdcalH4zFgfMie2/tNiVB/plKa7UFQCV6lHAy7P1itfNl
         FNZq9A1Hc/R9qcbOyU0r4/gpoS/AERu+sCPwn/75YOGjWG5VdwT5qQl55oBVWDXH8fji
         bDa1+hU1bHbDPgufZRW6v5ZuPppmP5DqJGvGl/FcLUtZ2+jI5Zxpq3i71NvM44bKuIXQ
         qxYN8gZAHGuiwcouMqPgS4u+pHixiu4T3AbdwuXiML7MDZ5cX86FZFkpwp4quO4cw82G
         4fbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTj6m0IBkYGDlz19/LEHdxylZFHl1irHO9v9uRb62Q//VOD2xost4lLfNnK43VzY9usKxEkf3YZPz6BfaA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXlHQyUGXZzlQNq4Zvm7H51WgXAETnIo1OQMQ3XX7o7QOhswOz
	MC3HQ21NMvsOJ0BGUypoK7u+xHYQJc8612z/1ZvyFvXPTuMp+Ct/nYM/UdU34Yl5Q2iLlsL7EQL
	bSSZiCYbne97GX+hBWKv8iK/3TvqOg7Jo6gMm//7YJQ==
X-Gm-Gg: ASbGncutOIu6BLMjETdYleZWerQ9t0js4FZwLEQjqigsgM9hiE7J8VPfEK/5ZgC+AzT
	bwIqMeiXVU5EGWYMd78yOOyU77MH3Ze6VuJSh8FfVtreXQXCNVU3o6IiCoUIrsesaFdBy1N1Who
	4jpBHyXG3xDpzNd1hr3l3XYf0gXptQxifQz4tsFboncSSM1B5GZHUGJe7rzKx3rPi/CP9J0xChr
	m9g6h0Lgyy3lSzc0KYI+fNSZ4fgw0WRBauQRy2y
X-Google-Smtp-Source: AGHT+IHDziq/3pEjSE34Vb9xc10xnYDJuQK7aFT0KnwS0eJY8GRc+vGU1CYOsUeevL8U5VlYG6e//6jV5rAnbmRrIB8=
X-Received: by 2002:a2e:bd0d:0:b0:336:5d33:c394 with SMTP id
 38308e7fff4ca-37609ea5185mr56779601fa.33.1760358599989; Mon, 13 Oct 2025
 05:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org> <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:29:48 +0200
X-Gm-Features: AS18NWAyQHOstCpKlOfzZTMdQhypcq3gyuY9Qq5Lmp_pCYAjRMed25BVKMqEClM
Message-ID: <CACRpkdapDastXAED4YhKAXQ9byvMH6SHqt3zHHniGRJzuXhDRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 4:03=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:

> Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
> to be compatible with sm6115 LPASS pinctrl.
>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

This patch 1/4 applied to the pinctrl tree,
please funnel the rest through the SoC tree.

Yours,
Linus Walleij

