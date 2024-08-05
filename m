Return-Path: <linux-arm-msm+bounces-27900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27907947603
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 09:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D663828250A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 07:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3131494D6;
	Mon,  5 Aug 2024 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evBW52dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765A1494C4
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722842792; cv=none; b=g3J2ZMSZ2C0ZpxJZ1Qkzcfwcsy1ii32v18W1daOc3awSdPZKs33KDepgpwvIDcWAEtvmiJi2+8lVSEreDDxseKTKgWnVSW3IA2uXlHWSv8LULW+FV/7513w5lfsaB9u+onc0e+ijuzyMTW+2KO+7AldyssFl7IS9Zajkvgdq7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722842792; c=relaxed/simple;
	bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsL4BJ0aoCQ8LdEPXeh4uVNm7TvV3BFii8XDd8YTqSNCIWd50ukAasSQzmM4LKspdmOZUjsFLp/hO8B3mClr5gw8GV0mwZFCP6RTUB6J0gIXBijCB8MRbkAfpmh2jNW4DsKIG3IHFmNDD7IFk6I3anlx8DmjixL9hl14iW5oTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evBW52dh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f04c29588so16336894e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722842789; x=1723447589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
        b=evBW52dhhNSp0Yxh0DO5981X2N3BG+TdmgDW2pNoAklZblnQQ7KpAJEfmDglXka0vn
         8cCZ5k+MITJE0cyOSD26DLMZaQklHXPfr5BuZoTfqgN/OR0xZT38AA7/VYy4Xs1EJHCQ
         +4xMhYH+ykJ0Cs5jBsH5BZuUzbemQA90tiTukbHEP5psQIv4KQnhz4/aLZqI1H18kKqQ
         CHF6eMHXSlm6leMZf4Fs++geqdXcjPsQbVFJIXZ+xvI31l5enlWn7xOCZB5KaKl5nVyZ
         PETSOoy15N6qRj2xfKAm4vVu19Mngac70rSuKaF5F1klUPMxexJDtvAnfREJyhHgtTf8
         Ez8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842789; x=1723447589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO7Wk3TJ7iWuEM+gkEw6o+cg523KxLczIFJk+pJnpBM=;
        b=EJa2umAoAHWSQMnSkBmb6T8OvlvD0ytmUWAFIRKgkBJzBB16ueDcJ0+RdFJ+sB6Qqw
         gplu9o7cwBy51njG+v+tPQ/1aRknXWpvXJxfZAuo63i4QMwEcS1+ZIPldVGLxgrXQv4Y
         mGdefomg3vlQPux9HI12iMoQ7m/xvlLc6AOCc8Zn1xLwUDZwYHl/IqGz60pcjFCEWu88
         rRhftA21mnUXovqUzKQ/50nIJnOVPrPeIgkj/fhuFXlUPNI1lGm0cY2RwmOl/CNdbqPe
         S6hA5CAXdfZGFVz+pNenlr2nB/qhXXVhW2Zd2EYtOwlNWc8y3ZkDf5gc1wMGoPDxfvkh
         Ra2g==
X-Forwarded-Encrypted: i=1; AJvYcCXYbTbdmbAxXCoHXRjvs13/Mlnoxyi/MWymMEBITEgInBwrOEnTMbSfbGKlUAR4tXgyajKRv4aRJ7oeZPEhNXrOmvEVfdfqX2iLiM0DUQ==
X-Gm-Message-State: AOJu0Yz83KJAHx4NfxpPi+jk40IZ9xsxsx0FlEpB5abAWrZZq6R+uALd
	C8QspdAQOSTWt/WvpuHuUa0rBXTdUK92qTC75tKl+S6NRxvKDII0NidNlRJ2qs4f0B5R3W4n6K8
	RwUM7Kg/GSKTIbLNcWyPIQuBI9oI36fOqHnGX7Q==
X-Google-Smtp-Source: AGHT+IGf8NZlO/zg/jvFJewdvekiDbzVLImFMNrb8IC/njy2EYJ8sB8ApjMi473HW3YkMlMi/1SSiSzZnaLI5kFHYws=
X-Received: by 2002:a05:6512:220d:b0:52e:8141:1b2b with SMTP id
 2adb3069b0e04-530bb6c7fc0mr6727652e87.57.1722842788776; Mon, 05 Aug 2024
 00:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709162009.5166-1-rayyan.ansari@linaro.org>
In-Reply-To: <20240709162009.5166-1-rayyan.ansari@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:26:18 +0200
Message-ID: <CACRpkdbPPoFbytdUP1_x4Hfa7Ps23m=gHHAOKTjY-obDDhQ5yw@mail.gmail.com>
Subject: Re: [PATCH 0/4] dt-bindings: pinctrl: convert remaining qcom bindings
 to yaml
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:20=E2=80=AFPM Rayyan Ansari <rayyan.ansari@linaro.=
org> wrote:

> Hi,
> The following patches convert all remaining old text bindings for
> Qualcomm pinctrl to yaml, so device trees can be validated against the
> schema.

Patches applied!

Yours,
Linus Walleij

