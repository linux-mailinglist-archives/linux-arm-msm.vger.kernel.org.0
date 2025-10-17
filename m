Return-Path: <linux-arm-msm+bounces-77781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA0BE8DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C7EC4EC273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A133570C3;
	Fri, 17 Oct 2025 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW6YrPiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35603570DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707867; cv=none; b=qjkdXHv+zaLwg7VuFl0o2jNHgrY5Q1gLKZl17ks9PNrFQAYJXfvK4FCyVxm+4IlkvgeOYK6kldphk0D7anKWz0j4l6FoxpvtSvjghkNI8jCSDJB9nNzqLTv497Ho2nrSGuEVlhjoHIdZcfUnDFlpeVNcSuPvl/dEx2B5ryvqqNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707867; c=relaxed/simple;
	bh=dE9/ua2G+yDuGUrL76DK4p0HBiiblfdcYkaY/cxGS8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgFsA5wPdQI0P29e2Iqw43WERSGs9YMOeXoXv9QO7QUGf3q94cTBuNd6ICNAC8z3yZljv9bFw0Bmo2LEjT4OqYVbE6wFkRQaAVnKNgqg/USGIL8gEBVJ6l42PFdGFEpAZlFWajHWQtQNalsuGDqzItqpiNd/p2W+mhKBh/qoyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW6YrPiI; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63d0692136bso2002750d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760707865; x=1761312665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1HM0d52xL5++z1kGRjypoT65pMC3vnmCE9M/Z2HtkI=;
        b=OW6YrPiI8mXZzqqXJt3uJxufH6bnjTxOMFucnUji6RStU8NHoxAzwjcPK4FYI3IRo5
         5N71rh6FfaHLxLTteOMJpfQgVfoeaFoLigIVCYbrk9+89wooLtXjjAZkmW+T1/7z9gdQ
         JvKztkTF3sC5FN0wTfryrXCpoc42XClvMn1LtsmvqBIRVoZn6YJOHXiQW+LBTQAd53qv
         V/gPoY/0L9+tAnXZ8icBL1DRZ//5Gl7R5tXKCHCVACKNQ0p3Hj4sl/42XanyKYsi+duZ
         SRgvMwSf8tazfXfIeGWAlh+khPbu2wjRKyZc5qyyGEtu6YdQQvF/9jEubkgbjDNJxYiB
         FzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707865; x=1761312665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1HM0d52xL5++z1kGRjypoT65pMC3vnmCE9M/Z2HtkI=;
        b=C1eW3PZJxUBOdPz4zBv9Bi2916KNVOIG3m13BPbDiAkwTkta8AeFCErliTHWQ2w4Lo
         4q+1g8kISOHUd3wqR8FqQKxLy5eAQVgs4s9z0VK43gBWDV3tjHirfBz3tnbzALMhFylo
         ymByjLsl+dJYbHLK7ai/opZJIe59NB1PlXJdU6I/FQZGwmb2Uhi+LML3lcT0yPfk6eee
         X291Lm/YGd4eXI1vwgQVETPkzHGipsWGgl2a/UEAydibeFRe9k+shJmm/ok9P37oroay
         FqVt9NPFcpqj0KVLEM9d0SSrLlCn/QSs4x/YN53TvXcFypNbnEBCGU7wua6ALfHno6Og
         bVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnQZCL0uqkLsan2j0S//QFuHf8DOUpD8G3PhKssV7cS3YgJlvGyesbSrzbikZgTSpetiUmBfEAg5Gwvvoq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdm4X6WAdLcCp4CGhtHE4eBdVoUz8V0IjPx02rJRVLzMagZlB
	kt0S5RLsLxjfVRJpde0aLN1zefIiplOissLickuvwKlwX7wK9ZV0JakMHq6DSwEsdevRc2eNENU
	nhtPoe/lFbwWwFyrsJAwLtxLp6HbIlwZn9l/E/ravxA==
X-Gm-Gg: ASbGncvOMJE6U9MNZLC/3/wbWkBiZlAAPZ10gVGX/KcZUfykWGnkmK+OI5iVM3YqR3o
	oLb5O3jzOTSWT+gyc/dI8NAvcnSw0aCZYiqsJBcSf7l/gTePl7EFMg6WJ3K8usg2P5AUmIuwz/7
	ACCGTdijtY8Gz75q05nlYx4Bn82pUAU4QqWXzT2oMQ0rbUR290suTAYEJ//Q88MtvaARC/iEyV2
	bsuKlLipH7RK8H84yXa6WQ8lwQSFHuIbtd+dubI07a3+k2APvKMf5yJDsDR9A==
X-Google-Smtp-Source: AGHT+IE/y08spNfC3C2r2brNPGUt04U9WD7A7XI9X/3WcTMgc7vwP8JOHw/hjXOaZRx6V9A4RKsRRr1cMaZ80YFieN4=
X-Received: by 2002:a53:acd8:0:10b0:633:ac51:9823 with SMTP id
 956f58d0204a3-63e160e3c31mr3275386d50.2.1760707864737; Fri, 17 Oct 2025
 06:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com> <20251007054445.4096630-2-sarthak.garg@oss.qualcomm.com>
In-Reply-To: <20251007054445.4096630-2-sarthak.garg@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Oct 2025 15:30:29 +0200
X-Gm-Features: AS18NWAnMhRpcm4So5FqnrddWjLlUpGh3rZ6MGn4VSylaqx5Qy76TzuXLh5A2eU
Message-ID: <CAPDyKFpaza_wXUhkD44Jxh5MUGribDy6d=Wf+NNRO=B_cUBm1A@mail.gmail.com>
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 07:45, Sarthak Garg <sarthak.garg@oss.qualcomm.com> wrote:
>
> Document the compatible string for the SDHCI controller on the
> sm8750 platform.
>
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 594bd174ff21..027011223368 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -70,6 +70,7 @@ properties:
>                - qcom,sm8450-sdhci
>                - qcom,sm8550-sdhci
>                - qcom,sm8650-sdhci
> +              - qcom,sm8750-sdhci
>                - qcom,x1e80100-sdhci
>            - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
>
> --
> 2.34.1
>

