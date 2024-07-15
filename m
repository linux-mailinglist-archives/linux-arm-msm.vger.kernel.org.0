Return-Path: <linux-arm-msm+bounces-26151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2204931323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5D031C2168C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964EB1891D8;
	Mon, 15 Jul 2024 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u6+1WA6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D11891C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721043281; cv=none; b=IIgn217gEo1iwwts65GjVYiBmx/TcvzUUZE+v0OOUHxJ/rkoZypjixmdUaYMnNUecZZgmfP9/qtECmapUuiEhEU8TU3Khtl67B6LwP851m6K+WfcjMp7HCrL2otRBNnQ/eAukkiRdF2yHj5xrk9dZeZrjrGtXbMR+F0EIG0/TuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721043281; c=relaxed/simple;
	bh=E6mBSC8ElHiTZyKnY3hPc8mpcA+En3s7+2fII0D2J0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9qemmx9/giTXzftaL4jRjTRgDv+F5cp1afo9BwiJgGI/9zYWeNUmcpJRvpmcbOgxcemfbM9PwJQgBxNF3A878poX/Ei2psq4n9k/cDR/Tee92maZpNCZCrspmYnRZiGvKx6SDqEhQX22v4oW0ORujZdzqGF/t4mIPEk5SvWaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u6+1WA6i; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e03a581276eso3574419276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721043278; x=1721648078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hLF2QTwHcfWU+cCOWewnyPRM9tr8SbrtNYjr/V5uS+I=;
        b=u6+1WA6idJIb9iI4c+EngFq5BsEPoM6lTq2ifVNw//+Z6GZNwgxS236wamSqG0KTbD
         rE7kH3CFM9T9P81pg4uYSeOlDmnpH8+51D8BTfZIXxJJqRy7zL+nj+fWh219PG7GwmeW
         Fp3DruQVFqHCxsnIyJh8vdWZLfN4v51o7RMIhjxXMvltFq6T87TtTKoLirdK58gLHzBg
         KdKBm8eCpBx35EYPbOWKrtCwpAizUi5NruFLUkE4Wo8dgBGgNoe6AtnPuRjK4CTJYlny
         Q/BoxjKuo++KyN7O8nyDMI3GQuVG4p019g8Vr3dHlynUTObZnOvwLyZAU731wmitaoG7
         K+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721043278; x=1721648078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLF2QTwHcfWU+cCOWewnyPRM9tr8SbrtNYjr/V5uS+I=;
        b=xE6O/t189fsqOQ763R9m6uu/I+apubiSlClLK7Mte68Vk9i5mCgPssmbQrYZ4lNvWf
         iQm+lNHTkG8Ex/10t0p9V0EnvCxcvktbshkHXBMwVH0Oz0P7Y6aLubb7E0ArCVSE0hVd
         qEkHQi6FhZehA15JsGuZELXcv7Imx/VcvClzO8gYURq8KTsMTP6hXTEJrMcGNaCnFTAc
         xxkkhEibVR47YHqMnq1YFJBnv7BOVD9dXhd6jZf/zp/nkmCUYx8mvuqM94XVnemntdDX
         +wkoJNILe61KiftzOyAknk422+TwEuAFu0gszoSuvr7lHqgyL2UxmgqZ5ObOIIBQVOQf
         iRmA==
X-Forwarded-Encrypted: i=1; AJvYcCXPu4A6mlFpCSEeg1mSeYf98cmcWaRaC2fJ9Gf/q5xQyGczrdfHbJUXRIweZLK3cb0Gy995Rf3MwgXMNu7+1D+o1T0KKPN6CBoAKkRp3Q==
X-Gm-Message-State: AOJu0YzPtx5lVIFYMCAg7qWhoy2lU3MU4CV0rTxS5tx180wdx7H8hTIp
	9w+9EpBjaL3DOu3mx7LXcj2EWME3EJLheOe8vZJIecxspuLh/uT7ABpze8NIL2MBFWfcyoYIwAk
	BeCglt11bwJh/Q2SDCXByjizYi7CJv7mwqmzZtg==
X-Google-Smtp-Source: AGHT+IEOgknY00PdFF074Gq/NtklDAqCV92zohXf0HWlAfSqBXUpd0sF+ISF0QadFc7KrRiSoPziF6L8GOQGiXxwkCE=
X-Received: by 2002:a25:ce05:0:b0:e03:4607:10ff with SMTP id
 3f1490d57ef6-e041b11d3d3mr21076692276.42.1721043276900; Mon, 15 Jul 2024
 04:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708-topic-cpr3h-v15-0-5bc8b8936489@linaro.org>
 <20240708-topic-cpr3h-v15-1-5bc8b8936489@linaro.org> <cd1c3450-1905-4d71-bcdd-5f880d743820@kernel.org>
 <94b2842b-6093-4c4d-a099-3e0a3198b753@linaro.org> <d35f5c94-7a86-4eea-bb0a-3f2785a25465@kernel.org>
In-Reply-To: <d35f5c94-7a86-4eea-bb0a-3f2785a25465@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Jul 2024 13:34:01 +0200
Message-ID: <CAPDyKFqhmNqbZ9Xkg0tWHE5LavoNaGMyE3dKmAFtHdS5=x33NA@mail.gmail.com>
Subject: Re: [PATCH v15 01/10] MAINTAINERS: Include new Qualcomm CPR drivers
 in the file list
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 16:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 09/07/2024 11:49, Konrad Dybcio wrote:
> > On 9.07.2024 11:04 AM, Krzysztof Kozlowski wrote:
> >> On 08/07/2024 14:22, Konrad Dybcio wrote:
> >>> Expand the Qualcomm Core Power Reduction section to include the files
> >>> concerning CPR3+ support.
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> ---
> >>>  MAINTAINERS | 5 +++--
> >>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index dcb37b635f2c..f3e013a52c16 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -18687,14 +18687,15 @@ F:        Documentation/accel/qaic/
> >>>  F: drivers/accel/qaic/
> >>>  F: include/uapi/drm/qaic_accel.h
> >>>
> >>> -QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
> >>> +QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVERS
> >>>  M: Bjorn Andersson <andersson@kernel.org>
> >>>  M: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>  L: linux-pm@vger.kernel.org
> >>>  L: linux-arm-msm@vger.kernel.org
> >>>  S: Maintained
> >>>  F: Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml
> >>> -F: drivers/pmdomain/qcom/cpr.c
> >>> +F: Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
> >>
> >> Maybe combine these two into:
> >> Documentation/devicetree/bindings/power/avs/qcom,cpr*
> >
> > I think avs was proposed to be a subsystem/driver directory at some point
> > and (adaptive voltage source? something like that) and this is the only file
> > in that directory in bindings..
> >
> > Should we continue with this "class" of devices, or should I move qcom,cpr.yaml
> > to soc?
>
> Rather cpr3 should be moved to avs or some other power directory. "soc"
> is fallback, junkyard for things without clear domain.

In my opinion, I would suggest dropping the
"Documentation/devicetree/bindings/power/avs/" directory. We already
have similar bindings sprinkled across various directories, see below.
One less seems better to me.

Documentation/devicetree/bindings/arm/*
Documentation/devicetree/bindings/firmware/*
Documentation/devicetree/bindings/power/*
Documentation/devicetree/bindings/soc/*

Kind regards
Uffe

