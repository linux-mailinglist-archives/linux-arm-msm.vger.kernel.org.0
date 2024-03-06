Return-Path: <linux-arm-msm+bounces-13424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2C872FFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411BF289A5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309B05CDDC;
	Wed,  6 Mar 2024 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+MMJNt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216A5CDCE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711624; cv=none; b=keHNHtio37LsA2pP9jv9HKfw1sbRRAPMVJBEKL4D3P/rozoWmVfDcCk2UJ9kYwe9x0y0luKIgSr3OnCGj470SrQqpGfk+PXDZ4Mdt+vsWHm95b3ikG6rt/NaN6Eme5XpsoXLeHHcXdEH+TaejDql0iaaa7jlQhiM54jjGXFCjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711624; c=relaxed/simple;
	bh=Q7V2ub+ZvIzWgSzfbKVCt5sHhhPpjoxwqImwtNQVj34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnH+LlSkLer9f4V23Qb8HFyt6+wTXWSpWh1SsK/r8KPUQRAguoY/6hhHkp4yL99YFyzq5StJBlx9YqGxpvsd9B0fE2CKO13tLtunEsMFURuxiyPGGE0SLZ1xX9Qfz1rrbTvZ9dh1dfp3jWryUkrSCE6VBd3JWSYznAKtaEjodaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+MMJNt4; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609408d4b31so65565067b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 23:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709711621; x=1710316421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9RgG0bW53WtPyeKTmMxUZKEXIejFsVdj+GP332BBpM=;
        b=o+MMJNt4sUq74dNgUH+7OoYl3PQxu7iiFGzJKDaB1n9dzqpDh9ZOxxoixQPK6cRyS9
         W8435b+cXrDkZ4oQG8ERAQqbA4++R3c0YClf0hBKn6WodtNN1P5oexSpUlihAhca80Z/
         tdZkLMCxMbnyUlZ68mMJVclAGlmuy+ByIrzoYQBhLpjDvUQR2YlLJh8QUOW8gkCs+XaY
         qseJGTrTbfDBPWdEcA4mEWpIgm6g5KtxlxI4Xonguj5QdfaKbFUyqomk3d/Ph9GuTsnG
         tpjEB+dQgCf2PKlrPZzYTKpB8LyuBWcGfbCSM3wQO5mxG7bgmWzN7y73nqGbk9wwcYaI
         b2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711621; x=1710316421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9RgG0bW53WtPyeKTmMxUZKEXIejFsVdj+GP332BBpM=;
        b=EHmiy5M1W9SF8JgHOMpcAWOhwjDNxY+0oI4vkozFGePwtJcONbAFE30O4scExb+6xB
         pO/kjMXKj3Ula23+Tpv4bvXpyDx0uPYCTg+rsOC5X2YE6JwQrlrgRoP/Xo/lO7rw2gTv
         qbVM/duyXMoI8ilFV/iQ35fINGvpo6S8g/bAxHosPCCOG9dqI8RgI5OMtAGepCNcr1R6
         Xq+I/vnA7Wm9dfQlD8fIsTXVDbLn4Ep6geQNPkNwgNWfIcybahNXkKSc+QzpJ0mjKSRQ
         UqSiDT/hVJfwPdp+d0NsZXCXFBrrs6jrV6EUjNkGO3NsbcA+RNyaG7gur4YXZ30pqCzC
         6OPw==
X-Forwarded-Encrypted: i=1; AJvYcCWQZnCnUIaWB3KNI/1tjlR6PBmcoyyxZOoWxTVF7QQxBk9iTjBCTZ0CqLpr9O8H02nPIA06xHBBbw/wgfys+QkK5hZAwEu2hCLMPRCSSQ==
X-Gm-Message-State: AOJu0Yw7VVCLGd6TER8xlPFxfSRypp4Cgk26InFVlwUKSRobMAL09m47
	zDRZEOLfCgRuf/KHWM69FIu/Itm3OV0aEYlkqEqewzf8MCaLNiWion8+4HdsoQ0XhSheUH1Qlqq
	h6UhqMpWkfIhfRblzujAQNTM+ALvcd/Gp2b1Khg==
X-Google-Smtp-Source: AGHT+IF9nDMagmvaiyarQtCcohh4J87A30ch7PH+aO5l7/Hr3xz3TIgauq6f8yk9Iirvl6ZRNXP9JghZCMVUV62iemY=
X-Received: by 2002:a25:c5cb:0:b0:dcc:4b44:336c with SMTP id
 v194-20020a25c5cb000000b00dcc4b44336cmr12104523ybe.53.1709711620805; Tue, 05
 Mar 2024 23:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-3-quic_tdas@quicinc.com>
 <CAA8EJpq2MpZitzspd9RksTY7WWKAaLwvb30x8ArBfed5Ee8buA@mail.gmail.com> <9aa21da0-ad93-41f7-8ac1-b496a049a32c@quicinc.com>
In-Reply-To: <9aa21da0-ad93-41f7-8ac1-b496a049a32c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 09:53:29 +0200
Message-ID: <CAA8EJppwEA=Y6ZSY9WO9f1X+Og3Dm8v799F35P2SK8jMp4gUGA@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: lpassaudiocc-sc7280: Add support to skip
 PLL configuration
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 08:56, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Thanks for your review Dmitry.
>
> On 2/8/2024 12:32 PM, Dmitry Baryshkov wrote:
> > On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
> >>
> >> The PLL configuration needs to be skipped when remoteproc brings the
> >> LPASS out of reset.
> >
> > Why?
> >
>
> On QCM6490 boards, the HLOS is not given access to program the PLL of
> Low Power Audio Subsystem. Also on these boards the per-requisite of a
> GDSC is not available. Thus we need to skip the PLL programming.
>
> I will update the commit text in my next series.

Please use SoC-specific compatible instead of adding extra properties.

>
> >>
> >> Also update the lpassaudio_cc_reset regmap name and max register to handle
> >> the regmap conflict warning between lpassaudio_cc_reset and lpassaudio_cc.
> >
> > Separate patch, please.
> >
>
> Yes, I will take care.
>
> >>
> >> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 14 ++++++++++----
> >>   1 file changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> index c43d0b1af7f7..2619a8ced9d5 100644
> >> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >> @@ -1,6 +1,7 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   #include <linux/clk-provider.h>
> >> @@ -766,11 +767,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>                  goto exit;
> >>          }
> >>
> >> -       clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
> >> +       if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {
> >> +               clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
> >>
> >> -       /* PLL settings */
> >> -       regmap_write(regmap, 0x4, 0x3b);
> >> -       regmap_write(regmap, 0x8, 0xff05);
> >> +               /* PLL settings */
> >> +               regmap_write(regmap, 0x4, 0x3b);
> >> +               regmap_write(regmap, 0x8, 0xff05);
> >> +       }
> >>
> >>          ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
> >>          if (ret) {
> >> @@ -778,6 +781,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>                  goto exit;
> >>          }
> >>
> >> +       lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> >> +       lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> >> +
> >>          ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
> >>          if (ret) {
> >>                  dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
> >> --
> >> 2.17.1
> >>
> >>
> >
> >
>
> --
> Thanks & Regards,
> Taniya Das.



-- 
With best wishes
Dmitry

