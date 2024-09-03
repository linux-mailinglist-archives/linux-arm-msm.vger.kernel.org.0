Return-Path: <linux-arm-msm+bounces-30501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00355969881
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 250BF1C22EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E4C1A3058;
	Tue,  3 Sep 2024 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DD6JpYmg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191A19F429
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355010; cv=none; b=pnSnqrn97tmXe5jO+P5haqeMKoFEZ5HkaL/KL7nmF38DV04m9hmqrg5lLgrz+0IvSBBnu/inekgowlJmR361JTg9cgyL79Agfly2vNnWrMaQ03YDIBd482RECw9jxDoUHhuUJMcYKLcUJXhcxqs5Ifg9tTce2hSPGirfFJvHHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355010; c=relaxed/simple;
	bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNhiygDEQ93cuXAP2ak8AEUrPEY2//X4EMrExzElo1PXuW3KOkujDJ0OJAB1ivtCSp+UAwKzm9zuKoTUQ7X4pQBcBB5eB4z3r7SOwy2ug2qgidPyr/KXEG7fqAvK6vPeeOAgEtfWBDYDM16efrh2ZpXbKwzTlxlWpbdPJXp0wu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DD6JpYmg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f025b94e07so50337411fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725355007; x=1725959807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=DD6JpYmgWVf5+3cLE8tXNAjlNYEI5/g0/EHP/ck/Bn4ZzIRalA1RrwCkXoYZdIaCdG
         ipIA//pJKYA1F6wGFsIdeceFXwh+CZHxn5xhQdRjNu+wm0wJKNDYzgMjsVo4pcnAzLvr
         okxOuZ+7NKZFAffr5j8Q5RkubPYd+nmEznnR2oNmcdnbznU+ZdX1qc47vVO2wXWYNw4r
         ioL8BDMzkc0psvCljtoJfX+B1KxuuS6mdXDLmBDhSAChiWd8g3JQdsjr7LjIOq34069i
         JGFr3EfSWkPV+eOUw9M4RSy6IFnfxEckXVnR2njKS0cUGFNFyyMuls4GRPhJDpQizzRF
         EFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355007; x=1725959807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=EYpq9BX/0G2iRQ5+EAVmUg78AVuECH/u4XHUKhvclYtnlNVJrz9brAT1obir9sH66d
         j9srpji3oec3mQzZGzbNwSj235mUSWJwtFSSWjJRVNqHA61XdnLUgEWDhYTtaUMJrJIB
         iQe6pE67lE/AA/zvXzUN40HtFJElz/tBDyJr4i7xAMA2GxDFqMAJMh91Yn2dI2bHwjZM
         pXO0S8Gju75CNh6+IU0PKfVVhVa89BAaIqHJyTjTOo4tPzxr9gQHVv8X6oQjXKbrdGFI
         iDh4LGE4klQv7taQbdls75bxkc5oNK+wtGFnDL1xAhxGwJKnJLPex/a7pz6ldJ5WRn5B
         0JCA==
X-Forwarded-Encrypted: i=1; AJvYcCW814aDjXbKtnDn1y0qjSQXFLXBqEFeMO0eJVMCNM1pRa0NWfqkgA4PwVHigjvOXAB4119j8KuvbiDFB1ga@vger.kernel.org
X-Gm-Message-State: AOJu0YzSHm9YdhrsZKzQ8ajOdCbLV7REi9dffjqpHqRpu1ucLaaoQed6
	tAgDphgCvg5kSP1PjyCPiw2Xr+pykSCuZdcuuZsvu0Ii9x82jRpFrzPXofQ7UDipW16IrugG9va
	mJC8wfV5yFwT8aI+habWZxLJTIFvb/H0KdIadjA==
X-Google-Smtp-Source: AGHT+IF5iXmXm3uBNGtfu2k2W3mUA/wL6HSlGri8eJbZA0MDiPWsO5xxdT1fn59W0sd0nud+XYxGXlKqBmQA/C+s9Vc=
X-Received: by 2002:a2e:a9a1:0:b0:2f3:d008:a54e with SMTP id
 38308e7fff4ca-2f6104f2859mr113545281fa.36.1725355005999; Tue, 03 Sep 2024
 02:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
 <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
 <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com> <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
In-Reply-To: <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Sep 2024 11:16:34 +0200
Message-ID: <CACRpkdZosOeBhEo460Wr3r9gF+xg1wJGdhvX0xf2_PWLZ2hkYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 12:02=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> >>> I suppose it's best of Bartosz applies this to the GPIO tree with
> >>> the rest of the series?
> >>>
> >>> Yours,
> >>> Linus Walleij
> >>
> >> Ah, I picked up the GPIO changes separately. No problem, I'll pick
> >> this one up as well.
> >>
> >> Bart
> >
> > Nope, I cannot, this doesn't apply to the GPIO tree.
>
> Hm, probably there is something in pinctrl tree.
>
> @Linus, can you grab pinctrl bits?

OK I applied this patch 2/3 to the pinctrl tree!

Yours,
Linus Walleij

