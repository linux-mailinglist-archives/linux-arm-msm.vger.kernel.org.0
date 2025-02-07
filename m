Return-Path: <linux-arm-msm+bounces-47164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58453A2C9A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B66247A6E58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D627F18FC72;
	Fri,  7 Feb 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pldazPaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413F19C578
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947511; cv=none; b=WLT+k0q5dY8zZoCTSgGI2X35aROHvIzQ332AQg5zc5OtCFLgBTRWmuUi28hTFdOh5cCixa5sO7R0ZXvFwhFNfq2r3AFdeSrhgdKklXCqFu01Ug70/QbUlMjgUeF1z0PVli5Fxcgzycecp0W4gQ7jf736nlENaAXQnIgH1OgbnWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947511; c=relaxed/simple;
	bh=UAyzLXl206Hka+nZ4mitYd2YFgx9SzlgPOsj3Cg2FRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R90XDPFxjcNWEfyE+03pU2YSjI7gu/gRqmwqponEF+QjsZbNjGbLO+8r9OgDwW3JJNw1P4PcKYg4DfwBI3YTicKDSokBWgqK1cM2kxky8lr/YRRxZJEOJuUA6sBiAg5DyTsHi/nHFzANIj1yN0Bks+hfJQPG0wkYRQJzn+Ukiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pldazPaA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f7031ea11cso22690337b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947509; x=1739552309; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
        b=pldazPaAMyB8lgcjEoooGdIFoK6DMROt6eFhQiCjuQKulCys/HT/OFnIvkIee2qdT7
         djAlhX+1eIpGDl9BX7onjSw09ZxJESTShdtM+jiosGPh1331VknIITKRMzLpSOX0fPgV
         XFQbO3V10XxEX111yDAYlHo7n4LXBJW81K4yYVQX0iNMxcnMV8ef0xUNWYs9JY5xTeIw
         q8im/W5ufTwqBBCk8tcUHLgaSV9Wl0OYYxnh8vg6dlaylwhG8kkai3JnEFwIh6+HicuH
         4tn7U2KwAIXDkpQ21ibaVp8+6idFPMW/ism7sAbIwj6XTAf2+GGLvHKilxuutTv6XEbw
         VBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947509; x=1739552309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
        b=GrqAJDqLqp6NS4UMf2T2et/DyPFkkzQa56CsneZgFuuxCAgK8Df80vEIgVuaGnF3Uc
         iARSfG8pMmgyTfbFN+RlubrHBle711uYG5R0y06XZaTdMOV/jkhG11N1XhsapBUYeTeA
         BZAEvP9kVc5vdd/NCDV4Y7nuah8jql1NKOiZYeqettr8YHo9VvAj77B4Zem1D/oVYtSS
         /sYI1j20pqWALfu3zzOwjusqLGy6/9NmGkfFmLn2GQSZXfZxMgiAO0axbxdmYyBIty/m
         RTF4lU+FPPpbNC1ml+IJqbWle991W+JD4zCHwUL6EUaYnKVwQJ3NeyJIU5OlBMYajq+3
         I8og==
X-Forwarded-Encrypted: i=1; AJvYcCX6RESkUCb92NEpIrQrd9i9uAK/5aEyEvMkh26Q/kdCXoR2Mcmvn9YNyMzkX7a6Jla1InoufbsiuMEmcBAc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1ryAnEz6CJJKUUQ65DXBDmHn2gaze8A7mbPWSwCgblG1pWYF
	owJkqRS/cqClDwLxel7cyDnygplMy0BTpSz4TFrCX+nGFFiIXplaKZ5dMOEw2x1fyyzBJAXo+np
	ll6Hovk/1WIbpLtWwNgDJH9KGJm5G+khssX2dzA==
X-Gm-Gg: ASbGnctCBVrvvpkkFwqm+J+VEy6QsGP10FZIS42teQNIxCLWEbbFzbAgYsbxjS1AdQF
	t3TrqOyV7Iyyr43BwOqTzcXrS3pVB8QdunEoZRihQmaGHvLavn9rqqmsS/C2L71VTsERAKgAyWQ
	==
X-Google-Smtp-Source: AGHT+IEu4Hyrf15nRFOfu+/0wIU/F0sEzYBhEg4wPUS8216Hy1mszoPNBAKnenIT6vKlzaVZSszBdgs4MWDyXS4Mfe8=
X-Received: by 2002:a05:690c:350f:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f9b28ceac3mr39041717b3.22.1738947508975; Fri, 07 Feb 2025
 08:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:58:21 +0200
X-Gm-Features: AWEUYZmBPR-J1PCz9MhgEjUk9CeBfh40TL1EHs1HVsEe3GRaQwWTHGmL1C1gm5Q
Message-ID: <CAA8EJpoLnHfOEH81U=fKuL1vOvZss8+zYRFstXp0JZLQy2OX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: qcom,sm8650-mdss: only document
 the mdp0-mem interconnect path
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
> mdp0-mem interconnect entry.

No, please add cpu-cfg interconnect instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -29,10 +29,10 @@ properties:
>      maxItems: 1
>
>    interconnects:
> -    maxItems: 2
> +    maxItems: 1
>
>    interconnect-names:
> -    maxItems: 2
> +    maxItems: 1
>
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

