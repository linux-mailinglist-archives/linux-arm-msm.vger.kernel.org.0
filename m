Return-Path: <linux-arm-msm+bounces-17664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D78A7F97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF971C21278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 09:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB2131BD6;
	Wed, 17 Apr 2024 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7ANKHQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD72131BD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346028; cv=none; b=QbKZyspD+I12K9p40cBPZQGGo+x6V8YDHKTv+sjGBtUutucc2QIakHHxNreWellZ102Hbbl9+sd+3UKf746cPFbeWoOn5k3hNLQdpc4fKw/3r1e3YrbYwm8Bg+EgewOxIVaAZLwt9UXZQ7MQ20zWQFGMuT+SSMKQs/ScyivfAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346028; c=relaxed/simple;
	bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7VQg7L1Gc96YdF6wogAEauNOXUv6/NAcezM83XwRGbb9FAJYSSNv6dFxI17abjsSmDwOwvXjTmy8sqJD4GFbflFPkIAsMp6gAOAsSN/tUhh0BscjiBWf2S3o23nzsadwZ7fFc2AQBZKM8X5iEQ9YWajCdQuiJmPZIOHTDn7M4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7ANKHQ6; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so5127511276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713346025; x=1713950825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
        b=X7ANKHQ6t1kIywRRD25rxMVggJ5d2i/P51AF1/qNiG2SMx10lDOCt/rLE9S/jpgGtP
         lsLOyjVlRDNM7zIelUtOA8HUPqwtbx66N+USXavTiMe78G29cVuB2EMOAcwInCNx7A10
         1KHNuJ8is2S2ARuXNkYrqAc9n1fuH9qSo4dZG4WtQ08phNSSkayBllK80VrZ/N/VTRlK
         m12YQjJMt0op7s0xIjCY8w5962NmVoueXraBmnCN/nRzqbztnkciCR5FvKlxBxkC9p7n
         8a5KvhOv+5ij2BaayoBnB6NcyqHvHX1nXjyvwX9ni/UVFFRGIeAnrsaliO1N7nVAF46M
         6jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713346025; x=1713950825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
        b=u+89c1SwDWPGv4wptT/2EU+X9nJGMMlYKzasQO1jmfs0oEhyl+GUwIBNfsBVXubY5E
         +NP5JnjJ00YKbZJhQbNAL02K4/8+G41nI1/U1ndHGP9VbFrr+5isEXsGFYfOcd4eBOV5
         TCsBz16oEexhyelLCtFVtVf+e96cQ7Eq1oCq9sejoLuwXfFBwmA4ZW2E1+qTO/BzxRbX
         h5jCaUiKE464dF0oySD1Kbbn8ZhGUPnmny089B0nZDnCc+ahgnIz+bO4UVsV8UHQY2qq
         YZbblOR3r/JY3ni1MV2i4bBvhW3k7YZbeNAs/grh6tYeRZqMOAZu+5iV9MgF+kq1ecH9
         xrzA==
X-Forwarded-Encrypted: i=1; AJvYcCVb81uuGmRe7FS+BY5qELW7pXoKno2w5UYPHfOto5zP77cT2eK0SCD6Zoxj76+RMO1mCrj//nShD9WnAMvDRLFmyop1HzJhLsMCRo9gQw==
X-Gm-Message-State: AOJu0YwxUDUUeOF/fbxx26RoFr0G7sXjRsl6MjWGfFNdEEZb5SxFeBTh
	VM9hqniFhzl6yv66MhMD2bJTIOJTBaZxzLE/qVku/3vhhDmrqcnFoKq8ZfOmqfsEYLp+8PfIB3B
	FdRjB3STg89xHzfU/CsF3PJpSOu2YGdjafuS3ug==
X-Google-Smtp-Source: AGHT+IFd6w46gF6cWcu610WNObxuSqT+OycBvkUkCVvHSq76OEyzFC1DzsPH3oOQFPiC1xVXQtj4MKgadM8M8hUGOW4=
X-Received: by 2002:a25:c58e:0:b0:dcf:2cfe:c82e with SMTP id
 v136-20020a25c58e000000b00dcf2cfec82emr14634228ybe.55.1713346025571; Wed, 17
 Apr 2024 02:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415141743.1983350-1-github.com@herrie.org>
In-Reply-To: <20240415141743.1983350-1-github.com@herrie.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 11:26:53 +0200
Message-ID: <CACRpkdb5f50z34FVsfCRkF8qG-EE3bDgf7m6NcLj1jjw1L2FOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom-ssbi: add support for PM8901
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 4:17=E2=80=AFPM Herman van Hazendonk
<github.com@herrie.org> wrote:

> The PM8901 is used alongside the APQ8060/MSM8660 on the APQ8060 Dragonboa=
rd
> and HP TouchPad. It works the same as all others, so just add the
> compatible string for this variant.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Patch applied, fixing subject.

Yours,
Linus Walleij

