Return-Path: <linux-arm-msm+bounces-30874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53596D69B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FC71F26D3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 11:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B29C1991AC;
	Thu,  5 Sep 2024 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAYCwFX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F8194A4C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534096; cv=none; b=lGmG7R8yMiWuUpXvLL9OGvev5b34wN+ZYLaNxcaBk8KM/w4FOp31YP/WGg+OLqKyNPaYdLhQF+tOcoEIfPgdSc9IUnv3BOu3L2CZcM+cUJx7P326LYxFXsp4RpRMiOIPWqKCjWiN5PdJUUR/5grsX9LlWnF6lTwANJYYfFmBZSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534096; c=relaxed/simple;
	bh=JgHWmEdFW5z3HkM4HSGAm74ONvRDhRCNMRmZO+WBYyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za4z/ETsfra6W1GpN2iksAe+iZwlQTVY+SXVeM6mZAZxQDf6LMN+cnKD2B4xP37lfw/cGwkwvxaSLGRi2uTa0ni/MJXU8BBw+jefIZL9uAyG3fAQsV7u18L46hUpv6cwbvg8lZdWdyJKwSrlgNR+um8/mnnHB4JPae/SI1j3ILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAYCwFX+; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e1a8ae00f5eso781054276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725534094; x=1726138894; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6/VyCawGPR4Tyr2HItJUWfFrk+UdniGuvNz3Sm7eyQ=;
        b=dAYCwFX+/DSUOhAgLhmmySdh9gNU3MvLED0rUqGxLA4Ni3yyPAz3f88KGVfxEWRh3N
         avq/pDcTIqGCSca7zJ41gVRmRgEyIi78B92IWI9lqQTVzmguEMGDdEQtSBBEsekaRsfr
         FGsQ0dj0OT4YADtHKZa2SGQNCncFuiNQr1+PrLuQ3pGqkONsJ+UbUCaZApcdEcVRqag4
         c9iUjuY5gMkRrXhFJchAoANHrS9RZ/ohsl0lXdQP4WHJ3z3jRS+HRfpS7/hYkNrUbKPP
         IYHoo2fthGu7xPL9pDWx2gO0uM7cF03SGhs2rgGdvgDdJjG838zGVlzyv1mZ6rvvBBLD
         MXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534094; x=1726138894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6/VyCawGPR4Tyr2HItJUWfFrk+UdniGuvNz3Sm7eyQ=;
        b=vOWC0nxsti9lpm1Ybo74lTfG8Y+zHGAkVhnaqOy++3sDDUPs83iQLslw0BDotTNAOb
         D/8SFHwS06ph2lz832fyVZ8sl2jnGLeDYuvGEub7LX2h7KyGol7q+taMLndgpxkBosDP
         1ez2iqh2xPKoruhnYrI0H/35FCuhQNdQsUa8DLsOHmBHIIprDYzqd2svsD5dgRqqgnBB
         r9EH8s88MhheOb2xxb0wUOQVQ11nwapBNAfH8uOC30mVZBdGNrdBHDvVVskfPqXnrKfo
         chJRa89z4rw8SryA92R7i1gUfF9eIgrrdbuFWW0TRv6sh0ff7RT7O3oUk/IcR8h07ogL
         K9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CvoAGo17cFspecbhTYfa/sP80Ja3KPQk5Ro+BuaVeRyVHgZ3Nqi2+vtV4tD3qI2H1D2SjQyWIvfGQBif@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6N6ARYlEKO6O69kFtFbP+GWSi7Gxo3OMzZonkDMtU91sD+FS
	5zAXWnXhmpUJO/2/4wcDRmE90Fsd7+BCm7TMONUgoV7MXRGpDesPd28vGVWOL/pM8flQncocCoY
	HQ9UPQ2BWFQgEzQSJqMyilZFX8urO5OQXzpM61A==
X-Google-Smtp-Source: AGHT+IGjKTK3wpnOajjw2EZiT/LHB7MtbeSOSePCGgXYg1P1DVmGgHJiCauYYaxBabeuh5ndjKAzsRhaaMz4bajl7ps=
X-Received: by 2002:a05:6902:1683:b0:e1d:542:ba8f with SMTP id
 3f1490d57ef6-e1d0542bc31mr8719953276.6.1725534094123; Thu, 05 Sep 2024
 04:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708-topic-cpr3h-v15-0-5bc8b8936489@linaro.org>
In-Reply-To: <20240708-topic-cpr3h-v15-0-5bc8b8936489@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Sep 2024 13:00:58 +0200
Message-ID: <CAPDyKFpo+nr+jSVZoxVVhLwi_FZfwg3cPTGfQOpjOG5np_cMPQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/10] Add support for Core Power Reduction v3, v4 and Hardened
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 14:22, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Changes in v15:
> - Rebase (incl. genpd -> pmdomain rename)
> - Change the maintainer to myself
> - Drop tested-bys
> - Rewrite some commit messages
> - Temporarily drop CPR3 support (easy to add back, adds complexity and
>   requires more testing.. unnecessarily slowing down this already 3+
>   years old series)
> - Boring style changes (fix indentation etc.)
> - Sprinkle a lot of dev_err_probe to make failures meaningful at all
> - Fix some misleading comments
> - Rename the "cprh" power domain to "perf"
> - Allow and mark the CPR OPPs as shared
> - Include fixes equivalent to Varadarajan's (over at:
>   https://github.com/quic-varada/cpr/commit/f025f13a2e64b13c8e7866bedc3bfa73f2aaf162)

[...]

> AngeloGioacchino Del Regno (6):
>       dt-bindings: soc: qcom: cpr3: Add bindings for CPR3+ driver
>       soc: qcom: cpr: Move common functions to new file
>       soc: qcom: cpr-common: Add support for flat fuse adjustment
>       soc: qcom: cpr-common: Add threads support
>       soc: qcom: Add a driver for CPR3+
>       arm64: dts: qcom: msm8998: Configure CPRh
>
> Konrad Dybcio (4):
>       MAINTAINERS: Include new Qualcomm CPR drivers in the file list
>       dt-bindings: opp: v2-qcom-level: Document CPR3 open/closed loop volt adjustment
>       dt-bindings: opp: v2-qcom-level: Allow opp-shared
>       soc: qcom: cpr: Use u64 for frequency
>

I have done a quick review of this series and looked a bit more at
patch9. Nothing that I found really stands out, so overall this looks
okay to me. Anyway, allow me to have a closer look, in particular at
patch9 in the next submitted version too.

One nitpick though, please update the prefix to "pmdomain: qcom*", for
those patches that belong to the pmdomain subsystem.

>  .../devicetree/bindings/opp/opp-v2-qcom-level.yaml |   16 +
>  .../devicetree/bindings/soc/qcom/qcom,cpr3.yaml    |  286 +++
>  MAINTAINERS                                        |    5 +-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi              |  760 ++++++
>  drivers/pmdomain/qcom/Kconfig                      |   22 +
>  drivers/pmdomain/qcom/Makefile                     |    2 +
>  drivers/pmdomain/qcom/cpr-common.c                 |  362 +++
>  drivers/pmdomain/qcom/cpr-common.h                 |  109 +
>  drivers/pmdomain/qcom/cpr.c                        |  394 +--
>  drivers/pmdomain/qcom/cpr3.c                       | 2711 ++++++++++++++++++++
>  include/soc/qcom/cpr.h                             |   17 +
>  11 files changed, 4314 insertions(+), 370 deletions(-)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20230217-topic-cpr3h-de232bfb47ec
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>

Kind regards
Uffe

