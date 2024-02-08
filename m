Return-Path: <linux-arm-msm+bounces-10142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3684DA75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 08:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BAF1C22BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138AC692EE;
	Thu,  8 Feb 2024 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/sI9zqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F3A692FA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707375619; cv=none; b=A3+GKyBGiGo+wzuZ/LLAW43hYZPMaTlgN1PEjsdBZVnWnHIgA/JDf4NnUBkt/mfBYbaTlpq7Y1tBTUPhg/kzX0aZO8vJAJlIrarSTxL2TgN6IooZHXCLvo9cmM/R4HWL1IeCAd5kWDoxIPkmmXo26uHJhEA11Sdvq3yKGgsPxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707375619; c=relaxed/simple;
	bh=HdW46PmYFY/U2koHlqQYLlKz8MMgMac1hAcgaMNd+Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MANXnaTkR+nFc5NI6xnqzW/0DZC3Kz5sPj/55jJ6hDoJCD21nKdiJGGQLU5A/0Xz+ZgkSwWsNdip37vbgpMXTs+ux36/1mTcDij1tIzTeynE+LAe3LXoJu6Pp2AKUkY07YJuEZ1jRQhVoM4NFwmmkEa4QPQU1RS2gXp1qkR1JNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/sI9zqb; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5edfcba97e3so16188557b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 23:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707375607; x=1707980407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eByR5GQoGX+Bs//9xgHnZ7HhZOW4ltAO5NoiyDJIpLc=;
        b=i/sI9zqb9t2vJIwU7gvZ6cRZC+/v4IeSJ24h+IZy8LcHB+vL6AokZJZFjey+7ANh7u
         89pMGfbfEz4EoKBVGGwSARl4q8nj2QzbN2wqypVYEGlwQRmcXgy7Vw6lHkP8IAWFjK/+
         6fdslD1Emj5vJgMQ6ungQJTVVdnUAu1LhgD9opzUBYADKyF8fbkzqmuauBwsIwJdoQau
         846drm5ySY0a9k+To1ynmWO295o5OH11PskAUQBTHXJkCFx2NCcN/xm+8TpDO+jdAMsN
         aGWP4+zYhBcdlu504YXoFVTT6qydB+kxiQlVpAhUfnMizagVcSTLsUoe/xxg1RKf/QPZ
         2u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707375607; x=1707980407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eByR5GQoGX+Bs//9xgHnZ7HhZOW4ltAO5NoiyDJIpLc=;
        b=S7FQolwjW7K0zoGmEcWSBg7q3URmPvcJwL5dtBsieMHI4cnJcTNPmdxKp3fuHz6NKJ
         T3+laACbNac/L4gepN8HLTEeTs3LuuzLwXXcgmEaCbSo6CYnWIOOyJaHh/aay1XnyyYE
         kBMjFAAyFCuNOQRUJWyzCk1/6tp91X41QgaCwhzdm9OSE3r/wELvdfp/HsL7J3HJBk2M
         i+Rzufk3qFPv39C4uBiYpDPKskEY6C7Beb/8qXj4ShcLb4U3WcnbhkseWXmVkay/bTqN
         ycJ+/FNOtOtEwPDnLCwn3v7BRk5aFk4I1htD0NY2x2izCqqOsLSWRhomjttI+QETjfay
         pSBw==
X-Forwarded-Encrypted: i=1; AJvYcCW8vZwxhTpu5b+1bDYtCRwQSLUnNMxHhkP8SaHkdc2PDqlYnm4UVbHbZpFHdRJ9GVxe452S+LronbE2sCcThEWwb25UMl+Jw6hb5SS6Sg==
X-Gm-Message-State: AOJu0Yy+JWNv2mT8HGOrD19rp2VqkCMzF+E+6E2Nn31U8T+hRo7w77NH
	UpJxA8uvwbhatNfNXmTDZw2YA2e9J4SUBSaCuCJWBAOzsN5QaI83dj9Sy0AO4qkfrfva+TWm3AR
	LifXzZPjlBle59OAqpk318Rh/P5WWW6wrBeudgA==
X-Google-Smtp-Source: AGHT+IGm34qOlpbHetB6jIH/phC+hvmN9qPvqCv6koH3ApB3V3uhPCKOnQYCKQ/aKUMRl8jP02VpYUq/dGK1Myuht5E=
X-Received: by 2002:a0d:e504:0:b0:604:999a:3992 with SMTP id
 o4-20020a0de504000000b00604999a3992mr3591745ywe.35.1707375607622; Wed, 07 Feb
 2024 23:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-2-quic_tdas@quicinc.com>
In-Reply-To: <20240208062836.19767-2-quic_tdas@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 08:59:56 +0200
Message-ID: <CAA8EJpoF7ii59WuY0WaMkdbs3+GE8UFPmbxdvohfjUfwqC4c0Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll" property
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> When remoteproc is used to boot the LPASS the ADSP PLL should not be
> configured from the high level OS.

Why?

> Thus add support for property to
> avoid configuring the LPASS PLL.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> index deee5423d66e..358eb4a1cffd 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> @@ -49,6 +49,11 @@ properties:
>        peripheral loader.
>      type: boolean
>
> +  qcom,adsp-skip-pll:
> +    description:
> +      Indicates if the LPASS PLL configuration is to be skipped.
> +    type: boolean

This property describes OS behaviour rather than the hardware. Such
things are generally not acceptable.

> +
>  required:
>    - compatible
>    - reg
> --
> 2.17.1
>
>


-- 
With best wishes
Dmitry

