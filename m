Return-Path: <linux-arm-msm+bounces-16224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E768968D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497A21F21483
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64116024A;
	Wed,  3 Apr 2024 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+Sz3Z10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213FF1401C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133446; cv=none; b=PzxjHVdH8ynaR3KCiXeQy3RMF95XWmzd8CQrp4hOdsFGMm24ARiGlYlg/4fuN7IGsFAYl313zXUQOwzgTvGrSeEPE3LJPToryG0QKy0CNTNQK8WsAbxwL+KmUl/INJFCI24r4OfnBI4CH77RbO4xEVZbbcZpa44xE7DamsySA/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133446; c=relaxed/simple;
	bh=TBdyRZzNzyL5kC8oKT4RbVxBszbvNv397Rm0oRIkgW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzULQ/QjWquFb5ODukHWHpqE5Zpq0m8UqurVg6e06aj+bgQz2L5iP6W9lYENlgZ2R0bZnGCcN5oW06RaVYkliNOG4b+coqW+rYndPx636l0CwmXoWmxbUomgoB3ywmYc8Fe4f4hZuxTl1pD1CayHblaeOCzUgVuonPQgxOx0hY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+Sz3Z10; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ddda842c399so4835824276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712133444; x=1712738244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Rq8PISR53JVvEAL1MAAbWn1Fc93g3sqIqfYM33gAAg=;
        b=D+Sz3Z10wkNQw0HmKRFdpE8ldjCUg9JMVaJebVUgVJXESNEMd4N22Ls7CQ7nTOzeEx
         4QKkOGDjB0YsKNaCMbsnCeeQzWz6rzFEa3Ajauc+O7+86jshxjhxPJohilW4GOk++YLL
         K96v8nk3trqf5K5LdYPpu8jE+vAWE1kVVl39mrPdXRTItcaZPQoCWyvkNRsdb6DHEM/G
         RdmejaN8cbWJQb4yuzOt8A52J6rrzy+C7FRAALIyzgNQKBZSq9/MwY9q+kY0hvYmA4EQ
         eflVyscZA+3rkr5xTm1+vzYfbZ79ToXobLMsXAMMfcOwMK+MAhH4wPFicWfc23hUhkhc
         Wv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133444; x=1712738244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Rq8PISR53JVvEAL1MAAbWn1Fc93g3sqIqfYM33gAAg=;
        b=Pd/DWcMBQ4dKL6Rqll+GLBb68ClBSJvLoZgmwd1iKv5tvBlAs3zuGD1gyPeG0w/Fpt
         BAEB1aaOHxHn+SJ2UeCEvEBcQDBqFQGty/pDmYw/XMTbjCNEBCBG2oCe/kZHTakZs9t9
         GYlCn3r1nTS6DS1XuC/tv3dB6rpP4ovp2G8r9BitJGaFa8fIVpKUQnoDDcX98IflzwII
         ZrWhSADOlbOPAraIH1q0bgR26uE9v+7j/mwCkLy03AsTt17m3sDzlAnudo+xIySacD7i
         R6RTk943cXVobcoxPER3BNqbxb8WiUeYZnRM9z3a78Vq8K28rS6PQ7xAUbI4FJb2I7Kh
         jLaA==
X-Forwarded-Encrypted: i=1; AJvYcCVnn0GyNoFrGiPxWIyFQojdACli7sV5Is3v7TPIRgPEjwWHXESwiiGvCkGq0EgRdsXmwojUkG00YissKFwsFFyYoOVjiY/Y7Oo9Hpm8Uw==
X-Gm-Message-State: AOJu0Yz/1tms338pRMrPk0YTmtQIoGKLhRuKmNP9F+Aq4KujUDFptufL
	T5gZK/j+1VDRxim7NL0CDIN/N64OODZ8a0eydNltgqs8wl3KN2QWGnOH2sdGeoJtT2nwKhddmPE
	wXnytUQiRNDAHl75hfvm8rxQOTle7Pjng868Bcg==
X-Google-Smtp-Source: AGHT+IF9SiNBCjyGzG1sm+gsym5mEzGbA92ME3d6lp2yQ01dxwfoUOmVN9IDEyOtGbrLshVcHZbKiN3Rf7H5in6ZgTE=
X-Received: by 2002:a25:664a:0:b0:dcd:128:ff3b with SMTP id
 z10-20020a25664a000000b00dcd0128ff3bmr13758420ybm.38.1712133444194; Wed, 03
 Apr 2024 01:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com>
 <20240330182817.3272224-2-quic_ajipan@quicinc.com> <d8c0ca00-7e14-454e-8a65-5dcf14ed7796@linaro.org>
 <e2f108d8-0b25-d799-fbe4-ab6256966982@quicinc.com> <da93a8ed-4fbb-488f-a1af-e701f7191fbd@linaro.org>
In-Reply-To: <da93a8ed-4fbb-488f-a1af-e701f7191fbd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 11:37:13 +0300
Message-ID: <CAA8EJppB7dYvzeA0M6A_cN14FkC6K8WpLVoeE8NvytGcYDq5Pw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for
 LUCID EVO PLL
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 09:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/04/2024 20:35, Ajit Pandey wrote:
> >
> >
> > On 3/31/2024 12:49 AM, Krzysztof Kozlowski wrote:
> >> On 30/03/2024 19:28, Ajit Pandey wrote:
> >>> In LUCID EVO PLL CAL_L_VAL and L_VAL bitfields are part of single
> >>> PLL_L_VAL register. Update for L_VAL bitfield values in PLL_L_VAL
> >>> register using regmap_write() API in __alpha_pll_trion_set_rate
> >>> callback will override LUCID EVO PLL initial configuration related
> >>> to PLL_CAL_L_VAL bit fields in PLL_L_VAL register.
> >>>
> >>> Observed random PLL lock failures during PLL enable due to such
> >>> override in PLL calibration value. Use regmap_update_bits() with
> >>> L_VAL bitfield mask instead of regmap_write() API to update only
> >>> PLL_L_VAL bitfields in __alpha_pll_trion_set_rate callback.
> >>>
> >>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")
> >>>
> >>
> >> No blank lines between tags.
> >>
> >> Add Cc-stable tag.
> >>
> > Sure, will update in next series
> >
> >> Please do not combine fixes with new features.
> >>  > Best regards,
> >> Krzysztof
> >>
> >
> > Actually this fix is required for correct scaling for few frequencies in
> > this patch series, hence combined them together and pushed this fix as
> > first patch in series so that they get mainlined together and feature
> > functionality will not get impacted.
>
> OK, that's fine but usual way is that such need is expressed in the
> cover letter, so maintainer will know what to do. What if this patch
> should go to fixes and rest normally to for-next? How do you expect
> maintainer to apply the patch? Entire thread and then manually move the
> commits? Why making it so complicated for the maintainers?

Huh? I think it's pretty normal to have fixes in front of the patch
series. Having it in the middle would be troublesome indeed. You are
the first person to complain.

--
With best wishes

Dmitry

