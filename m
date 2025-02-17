Return-Path: <linux-arm-msm+bounces-48270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8775A38BC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B26716CADB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 18:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B013137C35;
	Mon, 17 Feb 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qa0ZFdQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36B23236E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818710; cv=none; b=YinSxTI7uaxc7mdwQekMHNVW4S7xImZIL2DoGceGfxPtoSfUO/F2UMiEigG+BIjL2hGlhzSykrfXJCJiy04tMNnqekKKJaeuED38vbdmnNIizAdpadMS12NP97+X8C8IKZDj91u2Rtp0EyxtvHuESOctfYmt5BmULLtq22QgJ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818710; c=relaxed/simple;
	bh=i9y/eEy23jfhgPUBAgQy5vBOmFfjjgXQoJXn7Jktotk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuJUGeOob5mM19R5Lcc+YT98IoUIinw4kBTqpaJYDHKaY8xIDG5Oa5dAfw9z2TB7P+T15lK1Rgoir7fDkskE9KAR61JlDd+9VDLbzuIUcRgYSkY8J6F9o+AC1XmklsuPfyePVHkCF0rnE4GYxHvIE6x16Y2OwO6D6ll9Qu2/GFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qa0ZFdQi; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-545fed4642aso1915614e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739818707; x=1740423507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
        b=qa0ZFdQi8GXJSHX2uTfkFOZZXXjIfrEhaJNm2GdAg0cCH/XZrccK5mkxsMkf2wwuJJ
         SbePkMfOy0p8RuZ0wWOR9Ghu06UAciI/ELvwDAPqaG2Ln/8r33vNg+mi1hVOpEl5aWFA
         x/rGjMXiq5O9OsBwLIJkyEV6FpNrEwGX/QwQfz+a5IdIPxUlmRa6sG/kjXKHimeFnrCk
         zMdAD4c3dFWEAHSphAj6cU/2i1rv/vtHVT7MYEn9W+HYLESrVaQT8wGsPj/It4WA/fBT
         cV7iK+ZIAUj+GifQbFoxQmPt1gSL/O+ZTzRfAd7x21qHlpsIdH9KDWFcA+RPWSO0WiDQ
         Yk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818707; x=1740423507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfEQeSw7ZYdARp3yhUKPkDoI2uTibzTnfRpNUooOXAI=;
        b=Tsr9i3W5LyJKdoJc3KwW291nJ1m1FfLRlFAQ91lF6nLRQht86hCyN9mrIyCIKLxWvU
         WNVpGimnhffVwlig9Zx9SOWdh0R0Q+sMenXNRt2NinF7julicMRe62IjgiVoLbftc9G1
         bUK5Z9GnCoGYmH0TXvz2hHHKlkTkkG0SbHObAE45ir0477CjxTdZ0Tgh6tSzUmSVRcZ/
         BVKANmH6YBPQoiZbXzFZGTeTYIuPQeM7kAh1MxgfTlOmMcntu1JjSxrT/++QxuLffOLg
         SysNeoy9N+lYBEy7aCqoG7ayx6en8r7DeXMMyqMKs1+/wP3KwydqZeWhghd3P0ircdFQ
         hcAw==
X-Forwarded-Encrypted: i=1; AJvYcCXcU7Ad9jOwelnc05+Mm4CJZyJesFLbvhRUnt5silrMDg+owpudFv4glSkxiVII+91LwcKpB5+YHmxsPWRx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RvHcLyPPIVsWTxMwUeH40Ln4ooZKnMSJllgOckN1by3Ao8mo
	Q1UEJQAYbgFPaqEVrLJVSTLtFpX/wcHF8+alfA3tENreK59HnDP+Zf00ExsILfc=
X-Gm-Gg: ASbGncuO9A27FXHxv3rRfyC16Hfj8p50tUPkYFGQEteVK5qcnmkrtkrbrkIGFHvzWUp
	3Wl14dG9Y+HKpRF1X3yc4aWZJLUTLFbdejPqTIXFsz9JuiUvAzFwEM/e28m+474Jaq7F6OXNpFj
	hj9teMHGOQjJya/gB2PoNty+CdmiWRFChUj4cc46JD7mpRTCzlXyMalKS/wDJJ3xYS0Icr+6efe
	OPEF3Yjvta8vtc+bhP97vArP3Mx52r5lQfGyXKJKQw+csedmEQVq9D6xyLxaLPPIvve2YEbZuW2
	gB478IaMDJbY0OgicK10KIHlTsVeAn+dTQB09Y780nCqd95tlRBza3V67PcqScgAXdD8sHc=
X-Google-Smtp-Source: AGHT+IEeMZ8fqELxvhpQNGcI5FA5HN3p7pDhUbzSFXQMFatRwo9m4DM5TDLR93eSFY/NJzp3zGXAHg==
X-Received: by 2002:a05:6512:ba6:b0:545:2c6a:ff6 with SMTP id 2adb3069b0e04-5452fe450c9mr4006392e87.16.1739818706708;
        Mon, 17 Feb 2025 10:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f9aac11sm1131324e87.231.2025.02.17.10.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:58:25 -0800 (PST)
Date: Mon, 17 Feb 2025 20:58:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> fully compatible with earlier SM8650 variant.

As that became a question for QCS8300, does SM8750 also support exactly
two MST streams?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -37,6 +37,10 @@ properties:
>                - qcom,sm8450-dp
>                - qcom,sm8550-dp
>            - const: qcom,sm8350-dp
> +      - items:
> +          - enum:
> +              - qcom,sm8750-dp
> +          - const: qcom,sm8650-dp
>  
>    reg:
>      minItems: 4
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

