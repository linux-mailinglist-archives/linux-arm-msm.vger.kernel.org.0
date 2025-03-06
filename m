Return-Path: <linux-arm-msm+bounces-50523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA355A54C63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E021703BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D2620E6E4;
	Thu,  6 Mar 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1N9mnaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3220E31B;
	Thu,  6 Mar 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268413; cv=none; b=adKplrLUPT8aXdXY22yb9kPBwnNZwA2gFqhOygyEU6HK1Xww5uC5WIzTvyR0yZH1gb5PIjoUI//Q95BOwmT11bYe5V/6W8ZMeMR5Pi9fSQSp5zPAnnk89qt5Oo/eTK5+HKTpAxyuVlDF2qDRSufkvrZeym1ju5gSv1FgEoNpaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268413; c=relaxed/simple;
	bh=2mSyakUOyo08l4OiCw4nRuD9nEYgVqyIBYFul/OR6iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=strt0AmEl98w4PxLNbFuGVpVKLe/Lle6OeIiDUHhFVZ9e27BUMee7h4Zh0/XN6PAUopUcw/uaN8bTUIpF7nrTAMGQB7Czyj9OjLGv93hcXiNianzxQSPFOeH3Wacm3JocCm3A4baKkptDPffahE8vKWFa4pmn7dtWgbwrlnGPkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1N9mnaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48144C4CEE8;
	Thu,  6 Mar 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741268413;
	bh=2mSyakUOyo08l4OiCw4nRuD9nEYgVqyIBYFul/OR6iM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1N9mnaP340A/wWlypAiLFCrdWOF0xMeWFyAlmpSuDtd3GP4DMVjl+sCZNm0Zi+7P
	 H7KhOV3UR4DCuASANAWLPrXGpm6QRYBoYHCJkS1m2IiGZNbQrLJR9YmLWrC+2gr81K
	 JoJy0KjiCoNkCIFMzp5maxBn7tfZdMV6HkU8uzBx4CbPyIrydyyOD9L2Wfq0027PSp
	 0DBNjjO/g9xSZI+hIP/o4RVKowA+vqskkJCh3TctS9VEC9693ffTajySV31CsSXzjd
	 0eOWc5w9UYNeNlqMtsPMNAKi7ZgJY/uFYXGjEl6GroQcPH9eBp5Cv82/QEVrrsGJQb
	 bibT+KI4vZ9zQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1406148a12.0;
        Thu, 06 Mar 2025 05:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwJ5nTaBnaAmYt6MHRZmiV4ihsiTgfcmVaMHsW6MT0+30kNScAZFV2EVEjpELMsIZxSovCLxRE9aAKpl7YBw==@vger.kernel.org, AJvYcCWcNN4HagEaamwBN/ZiqBr6i5s8PtXZMGTZziSN9lH01SQCvLsv7xoDRMpN+eDnWm1XA1nnMckxAqUJAJXlZT11iXw=@vger.kernel.org, AJvYcCX9+ZUj63DxOWkzl+etzWBKOnqs7bOiv5We+GD7rZXus7Nl6hXXP1JYWfi1AoCRnIpXy0GrNvvJK/Vg@vger.kernel.org, AJvYcCXK8Ev7NffaQ+uO4RJ2sW0BB7HvbJ2cV7eIRM6FdOlKEBDQDh64qxRHTa3JG67m+Nq0Kcc+K/lXWSPkzonF@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsS3UqxSmhpequgdhbf55I6vBesEDWfGELKtjbfxZXk7Jsjhj
	UUQg4HefauFOgmOa9TvPAUU9YYFMzjmFIExbWJ7vMXISxlpvnhIKh7eviGvHU9qv6ou00WKgn0+
	yWoerxhemxWDktjtzwodZeMykEg==
X-Google-Smtp-Source: AGHT+IGj+xYZZsPz4jo/iFpv6TDQ/flAGSh5fwxEf3UPQtG9b2FsLgBktltZesQa3BHxfQan3/3TV66VU1r+mDDfBHM=
X-Received: by 2002:a05:6402:5113:b0:5e4:d27a:d868 with SMTP id
 4fb4d7f45d1cf-5e5c1a6463bmr3852917a12.0.1741268411865; Thu, 06 Mar 2025
 05:40:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 07:39:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com>
X-Gm-Features: AQ5f1Jqm2v42Q6wtTkhP_amcTxbY2Gmov9aAKcbCh_hPzmOQ2Z0TQ2BFM2Dah1A
Message-ID: <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom:
 Enforce child props
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 2:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Samsung Exynos SROM peripheral properties were moved from the device
> schema to separate "peripheral-props" schema for child node, but the
> device schema does not reference the new one.
>
> Reference the peripheral-props schema so the child nodes will be
> properly validated from the device schema.
>
> Fixes: 67bf606fcf18 ("dt-bindings: memory-controllers: samsung,exynos4210=
-srom: Split out child node properties")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Fix for Rob's tree.
> ---
>  .../devicetree/bindings/memory-controllers/exynos-srom.yaml      | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-=
srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-sro=
m.yaml
> index 2267c5107d60..1578514ec58d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.ya=
ml
> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.ya=
ml
> @@ -38,6 +38,7 @@ properties:
>  patternProperties:
>    "^.*@[0-3],[a-f0-9]+$":
>      type: object
> +    $ref: mc-peripheral-props.yaml#

Why do we need this? Any child node should have a schema which needs
to include mc-peripheral-props.yaml if any properties from it can be
used.

Rob

