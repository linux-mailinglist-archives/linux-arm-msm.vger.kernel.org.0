Return-Path: <linux-arm-msm+bounces-11159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA72855DF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1EE2B2F5D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C79518B1A;
	Thu, 15 Feb 2024 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="te1hOjk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58117BBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989148; cv=none; b=a5PKvOVRSuhVybhSYB7rurffQaE95tSGtoatXzYev0aSpqOMaeleOyq5me9a3so1GXUxY4rVU/ueCMR4ScjUPHIsLf+I4E1JUKxtcHCOHUz+3rlqQppo2mfdpf+PZaL0/mAacWk8WehvhAOKS6HcfJS39HvbILjy0wxOmNMfagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989148; c=relaxed/simple;
	bh=ovUyhUiMjBKTnx4DSiTfVdweq3UHIu1azJ/rG3mlzsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvBnBIrpxSj2K+9tAYHe+t6NFsTMhI+c7cZkZoelG72q9N+sLQjTlohTFmKbrkBer0ZGTKchSbikUNdUJpfbUcXh1SvM+otEccwP1H3xXWAx2q4AdxoAuUceyUEzEygrQqtxRZJ+jYsV6LQ7/OiPhgDisohOwhd0LSC/V0DEAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=te1hOjk9; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so562860276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989144; x=1708593944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
        b=te1hOjk9XbaUg0o+jvjaQb0DlHJh2hri0GdgTFcbE1PR1bAl8k5GFnANjnUflYHS6M
         l4wcXyA7Kvi97d3PFUnwOkiYLfONFwEwgh33i9AHB+dz0duApDOvblyL86Z+32Y/TLGd
         a06JQ726EjKwcKP31mI+8iqhNFocYW3YwRx1QZKwauRf32XHe90smEGAGZvMhWF2G0e2
         g+mStjP23DTNtYptuNz17TkVa3w60Sy1MFBDqw6zBbZFxKH/ORFR8lQzm3vyraIi6siP
         ZA9pPZGguq6QyxTMmOF9s9m0g9hApAYHXvKlpRuobpvY1DxMRlXOoTnUi//bl/ATeG2t
         UC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989144; x=1708593944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
        b=tzxzVzRVNJxkyk9Fobio8xJdW7XMERP52nhtOwv1kWZ0QJsQ3udwZzS5HNtzlOh6cn
         NVc1YkZoAlBD/EK+WFEVStHvHr+DjGqHV3yzXJqkg5mpbkzBtzt+s0tzgE9JwA9YnRqg
         NU4Xl0oX9CA4CymTNo6a7QfPu69SPQTV4xj1UbZCXpANJx/jnDzSy4SIjP5kIs/XbIz5
         C0ZdnxWeKyEBfOLbia1ImEFlEioIWfxCc3XbEHgr3HRm0nbW/jIl7AAAYr2q+ubA7A2p
         mhNu6Xc7fCCtTXgrW3e+AL7tP9OyfQY+1aURryrbam0doHrfxuycUIluxRUR/yz1KCo2
         5itQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjGsn22HAw8T4HKC5cT/IVD2izgVuAoxjO9BtZdZ98X1teMG4QKFShSuoJXKtVdaVN027XFEl4B5f1gdYkiAXAOFWa8L16okTjoipYFA==
X-Gm-Message-State: AOJu0YxeOdqjTucntVWhIKyuMqwBOYYJWhhRY2uTdfZAEUUbLTFBqxrM
	qE0Vs/ERzvj62xVKogBr9UuZZw5bGluU6UtjADqehOgeEpZbEHa7mLpGiARRVL5lqyzBB30+mcJ
	giICiOtHvkt9XDJqv2wceU8vvVH3Df4timJ7dMw==
X-Google-Smtp-Source: AGHT+IGK2EB5aTs8BfG4jSsckxgl2EOaTmuQv0ycjxUuZs5Mb4QsZ7LrFpeHU2Kn6y9+s5eezLpdwLHcymkVAR1BGTw=
X-Received: by 2002:a25:7447:0:b0:dcc:273e:1613 with SMTP id
 p68-20020a257447000000b00dcc273e1613mr1232044ybc.40.1707989144074; Thu, 15
 Feb 2024 01:25:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org> <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:25:33 +0200
Message-ID: <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document the GPU SMMU found on the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a4042ae24770..3ad5c850f3bf 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -93,6 +93,7 @@ properties:
>                - qcom,sm8350-smmu-500
>                - qcom,sm8450-smmu-500
>                - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-500
>            - const: arm,mmu-500
> @@ -508,7 +509,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: qcom,sm8550-smmu-500
> +          contains:
> +            enum:
> +              - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500

Doesn't this cause warnings for non-GPU SMMU on this platform?

>      then:
>        properties:
>          clock-names:
> @@ -544,7 +548,6 @@ allOf:
>                - qcom,sdx65-smmu-500
>                - qcom,sm6350-smmu-500
>                - qcom,sm6375-smmu-500
> -              - qcom,sm8650-smmu-500
>                - qcom,x1e80100-smmu-500
>      then:
>        properties:
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

