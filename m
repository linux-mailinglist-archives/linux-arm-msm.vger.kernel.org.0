Return-Path: <linux-arm-msm+bounces-20626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9CE8D01E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F661C20DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C5715F32E;
	Mon, 27 May 2024 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOnIKTNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996915EFA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817160; cv=none; b=dgod3EMIt2sQxxkCWt9z5zryj2KsCZGE8qu7FK6eQ6e8h2Wgw+QVyJOf3dnV5PawN8DbWEdeYJ4rsp5wxxHQ82AEZAeRmCNhmt704MtPPm5lM2EIkqQLmtawXgjeXG4Lo/Uchc9Se8wTbFTxfbITRJ0BkSOgS0zrhx+7tNGt9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817160; c=relaxed/simple;
	bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8WubCJsTrdDh9L+Y4GaUqbroMn/x6hVayfgRNI+e7aW8stNAnL9nmbykJaZSyADz13AuEg1bGdJ3k2Xj8Vhu3flCrxSHFiTgnVkWqIRlA6T++ipTKeZAeJZ6bIX7kUDkHoyUK1RhslZ8wazBTq/SdoBDLdS3cu5bSD7+Vosi5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOnIKTNj; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df7719583d0so3422003276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817157; x=1717421957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
        b=KOnIKTNjBXSL4sXJB2DG3Utd4EPV6UXPpNtvQkN+GYrjgA3h5QiMDJMfYjK83v1m/P
         SVpf5HywWLSvSuh3Tjzf6x76F9B2byAmMwV4k65B9ZpcmU2s+GVvcFpHolxMhTdRPrX4
         RWotj1b+PSBs3P4uCGTtIexf2z2fNsC3R1ipvmObb/RsV/3dgMTCT+7wAM9ldthiWEPP
         r3GgbFrrnDJdRfJczwWHnVqcUxO5JGBG0BY9YcF3Nghcox1+PbsqENHOlSyoygI4cSPd
         aPBUHvcXQ1rYTPToxbu0sxN0ynq/tqwbFC9ErL/VJWPIGDUniUSHruAJR80+YWn7vnXS
         fu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817157; x=1717421957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0QJSfZ51BjlCjV1fzHNY8jwcshLWXrd/Y3XqvZCfeY=;
        b=qQ6boPr6nrlWyb5wrur28Swq477yiTMAgL4uSiNWp4FeCYUSRoSk7AiMB/sEy8IevR
         vXSQ2j10rqo8k3fCIbBYm9yj5ZdqgEhhu0H3kqY4O80L+eLtziwiFWnVS1WuZl0fRl4n
         PRh7tSY0T2G21mVNIJU123neBYVy3hD0fgDT70yjo4BVOLVwHMKQNg/KtwZtCz5iF6EU
         68GSIoRqj6Yn1pTatv+WnG+7VGH/CwF8/dI6A4Tyw5LzB9pd20uWcd1/k9FwT9365QXp
         dafsZcBFgr7CyZ9d5c7NXasf5mKROClv0gZObwXvsbQg+WlNyoEVcgP91MG3bIpvSU39
         Fcvg==
X-Forwarded-Encrypted: i=1; AJvYcCXAg9ylo3V6zuC5T5him4xqXGDVur29pdjbHaEVkCqIcDKTMegYkQdycTKlBxBTx2l/1bubCRFq22fjy6y4exYrVcH6SeKkZZRAvUAYdw==
X-Gm-Message-State: AOJu0YxtPGO5yvYFmPOPKEwRrP7+IInY0fXbtLOKNMGixeEvgeuEAn0g
	a1RWwOQFXXlWUI1Ik5cF9tjZ8RLcchHAznvNJpHpJIwPvzrgdBM7NPVSb8ZX/4AtIuTGiQTPG+H
	bPJy+HV3znFLyvmjGqhSVY9DzQQpdNOfcrj0KRw==
X-Google-Smtp-Source: AGHT+IFc+duNcD3dnl5PlfSWaeU543iVanFJg7u8zsI0JSvx+fv5ZxRzO7wGY0GpKjQer78ULichDeY/NaieOEgzTKI=
X-Received: by 2002:a25:b11c:0:b0:de5:1553:4351 with SMTP id
 3f1490d57ef6-df77218b217mr9183346276.15.1716817157481; Mon, 27 May 2024
 06:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-4-johan+linaro@kernel.org>
In-Reply-To: <20240506150830.23709-4-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:39:06 +0200
Message-ID: <CACRpkdZrTPyv_4LuN7VNhL7VFqoNzPq_WcooJLzELfmCBaF_jA@mail.gmail.com>
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:10=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> Request and deassert any (optional) reset gpio during probe in case it
> has been left asserted by the boot firmware.
>
> Note the reset line is not asserted to avoid reverting to the default
> I2C address in case the firmware has configured an alternate address.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

