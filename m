Return-Path: <linux-arm-msm+bounces-26086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033493064A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 18:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6F71F21AF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 16:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D3D13B280;
	Sat, 13 Jul 2024 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGY73Ynz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54051386D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720887151; cv=none; b=fgxdb++nMxnKvtGvAe/G9dgrUDKtJ/gxvNW9aWo/GDmYodU7L8ngQjBde65gAAzMDgrcr/VTWPPlII44yMmGk18D2ZNmsdFKic62pGhyvacpvtxITec1ZZ9ziUwQIn3LUFM1B9UIxixUecBbyuP122HUGiaE2cMu9NBvLbvGfHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720887151; c=relaxed/simple;
	bh=n4f0kbBWtSQQdrFUEOgyXErNn2QGVgtgKUa+M3mREDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E35yAxCwNuHqSM1Wcbi+Hl7788Jpk552AzGjrSxOv3PKFsPRnk6DGt4guJOQO2oKAavUg+roZ3wVfgxtvaI/PrVCQS/8lQv/cNQpYzA2v7cwwrij/3II8A/1QIfzQe6/J15J4m4e2N6nZ+EhU3L2V62BXo0z/K58DwtbCdZHjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VGY73Ynz; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso38710431fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720887148; x=1721491948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPU4EUA/HyzvYcLhA94gZrzAZTZ9p1xhBdpXeQosR5c=;
        b=VGY73YnziONf5wl/onKA1cdAHKleP7GQjBY8jEOYiqPweWeZWRMZWinlKkUTChNFkl
         4odgVwvuk+5cfhifV5/kKDOqJ5nMiDk9/r7xlKdLAt/rrBz8X94A9VFdvLfwsq4hlUH2
         J2Db7M4//yjW/kHX3Kijpv0T2Ot2HW8SqPxGrbbVHqr1xS8pjlGC+B4JbLOTsuCQHblW
         /MZil2eSBbHpb55JSt1PPXVhD2D2nz+QRaiJWbY2Q1YfWnTBZ+NvJWf5iuOKpqtO3c18
         xvqMipsswjDjvK8dFG27ukQKewpOXR4sXE8Vi7txosd7gjcbEK/8qNSAXgNTyM+IPjZG
         tcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720887148; x=1721491948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPU4EUA/HyzvYcLhA94gZrzAZTZ9p1xhBdpXeQosR5c=;
        b=ltOQxu2THSbz4yEwYWIDkgvFegO4fIvLOcJ1P372aNmlmzLlpXgPSDe8klPbyP92Em
         IVTy44wF91lco9rAQr6EGL75QYKGgaoHlRURegwuONq84X4muerrB+QuEW6JH3D9iH9g
         QdXxHcwWIR7p06jrCQET2vSvQ1GOh3g8vCBUHfh655iNItEvQRXi/V3RfY0ECLJFeYrE
         01q1hXBdxISt4X5eE9wyyl31G7JFkq3EHAQV2cpHunpJVOPjNsC5mxZ/01SLo0yY+ZAZ
         /RTn+4/VTXBhCVvntplO963di5ybaB67npthl2+vQjcZefMioMfETpTQTrYQQwhoZ5jD
         S4eg==
X-Forwarded-Encrypted: i=1; AJvYcCVKej4rZvM3GuV/MRQcXPJF3t8XjWrn7UcnjD7MLuVjICSBvSKq5TqcBAxSUBnr3WhND0YC9x8kcrxtO9AcUJEF2wc1rAljh2H3czmYsw==
X-Gm-Message-State: AOJu0YzsfzmaedlIYaZV4ik6xBcDj5+ujWhjZ9dcD9vJmOlJqPM+NOu7
	0JwhH7ugXUF5JtXUvaCSX8DBaep2G+PkmNZaqGtFk4VErMuOCf6/mcrtLhH4BKU=
X-Google-Smtp-Source: AGHT+IGpP3S10ZQuIO+TfFvNUUUAtqlPAilkg3Nl/n3bjRukjuOByZVXJ876HFixWSY4WOoxy5VMwQ==
X-Received: by 2002:a05:6512:1189:b0:52c:d8e9:5d8b with SMTP id 2adb3069b0e04-52eb999446emr9980958e87.25.1720887147957;
        Sat, 13 Jul 2024 09:12:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e17a4sm236217e87.19.2024.07.13.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 09:12:27 -0700 (PDT)
Date: Sat, 13 Jul 2024 19:12:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Adam =?utf-8?B?U8WCYWJvxYQ=?= <asaillen@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
Message-ID: <znzgr6hqbokis7zrouh2zbzvigdl4gnm5ewqoiph5eqdk4qcg6@zlw2b2bzbmgs>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
 <f377a55c-4a74-4555-926d-afb7dd813e00@kernel.org>
 <28e2dc758c8867693a183d758a9dad6a@trvn.ru>
 <932efd4bd08a2877ee1e7c7409ff1512@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <932efd4bd08a2877ee1e7c7409ff1512@trvn.ru>

On Sat, Jul 13, 2024 at 04:07:13PM GMT, Nikita Travkin wrote:
> Nikita Travkin писал(а) 13.07.2024 15:37:
> > Krzysztof Kozlowski писал(а) 13.07.2024 15:02:
> >> On 12/07/2024 18:04, Nikita Travkin wrote:
> >>> From: Adam Słaboń <asaillen@protonmail.com>
> >>>
> >>> This commit introduces multiple hardware variants of Lenovo Vibe K5.
> >>>
> >>> - A6020a40 (msm8929-wingtech-wt82918hd)
> >>> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
> >>> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
> >>>
> >>> These devices are added with support for many features, notably:
> >>>
> >>> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
> >>> - Accelerometer;
> >>> - Touchscreen;
> >>> - Sound and modem.
> >>>

> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> >>> new file mode 100644
> >>> index 000000000000..c3d1d1ace2f6
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> >>> @@ -0,0 +1,5 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +&opp_table {
> >>> +	/delete-node/ opp-550000000;
> >>> +};
> >>
> >> That's a very odd SoC DTSI.
> >>
> >> SoCs DTSIs are not meant to be included as complementary, but rather as
> >> full DTSI.
> >>
> >> IOW, this is very confusing code and will confuse everyone reading it.
> >>
> > 
> > I think Adam wanted to keep the common device dtsi based on msm8939.dtsi to
> > simplify things a bit. I was also a bit unsure if I should change how it's
> > done but decided to keep it as it was. I will rework the v2 so:
> > 
> > - msm8929.dtsi includes msm8939.dtsi
> > - devices .dts include needed soc.dtsi, then include the common.dtsi
> > - common.dtsi doesn't include any soc.dtsi
> > 
> 
> (...) except gah this makes things quite a bit more complicated since the
> device makes use of the "generic design" msm8939-pm8916.dtsi and duplicating
> that would be quite silly IMO...
> 
> I wonder if we can clarify things without making everything too complicated 
> by calling that dtsi "msm8929-opp.dtsi" and keeping it as extension for now,
> then if we find that msm8929 has more differences - we can unfold and refactor
> everything.
> 
> What do you think?

What about adding msm8929-pm8916.dtsi, which includes just the right
things? This might result in duplication with the existing files, but in
the end msm8939-pm8916 and msm8919-pm8916 are also very similar.

-- 
With best wishes
Dmitry

