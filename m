Return-Path: <linux-arm-msm+bounces-31485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF5974FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816CD1C2273E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214AD186E2C;
	Wed, 11 Sep 2024 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zY0EqP5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BAF1741FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051440; cv=none; b=Rw0eHoqVw/3YaBRReb9VWMnllbN8FYi1dC79dbFUxkTkeJMOnEaz89wvfRx7BsPBssrampSeiVAJRcy7Coq5paJNshkj5TbChGLzRB2SQB0JsrkkvlouNiuZkWClZY2Xv+qNkq+whZtWyPQtnL60Zp/5dKKHzDnlYfhdV9GjUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051440; c=relaxed/simple;
	bh=h/LBrWSpUs8DPI9U1+af2i3m6dozVC63fYk7NBtw7Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faJMPo8jRTeh6SKzAz6K63/S+n/L86aDm78MgNPH+hf75+5HAeEBguzIS3j/+FUEl4J0e5xfETwZxJ5bvadmIaootXhlMJR0EhOZuaORHOo73aqTXgsV1J5VILYU1SgzUQgkMioibkraSX9YJrj49AKUDeL17XH02E9R5qRpsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zY0EqP5S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75f116d11so48702831fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726051435; x=1726656235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yEmg0mv3aZiw4epk0S/D8wOQJkCJdi8IprxOeJvP7ug=;
        b=zY0EqP5S6SX3+wBo+e/hQFGJWZlDvJAuXMh6/WVH4CvjO6w3nXiP8ElqFXsZ71XiKE
         d0NUCFbRCJZ6+JLRwwwuS3tszGBJWOfvA23YrtD/cFLOAgrImnbVzXR8fTE8GzuOHA7Q
         WsKBilNJpLU9KpdYez8v9JKWFhpFmoUXsoWafI8sh1MH59cK1PPglRD3btbafmK+Lyhv
         1inidNZ3Z2e71pz/H35eSewK3NBdbWpdvA8Hwknp3CO+LadYDv0A3XHck702SsWl90RF
         dvUEjnS2YjtmtpgKbUIF24arxeK6SL6SDk6d5emKJ64dJvehGi1Mq87PE9BjikljXN2g
         5+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051435; x=1726656235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEmg0mv3aZiw4epk0S/D8wOQJkCJdi8IprxOeJvP7ug=;
        b=Duknz0f0hmGsnoztE5cdf5uJRvq8nC12OIrrM878a1uadQC3+ZYP5NVhkLlbQxdDXC
         daM4nTkEjxWLRPlKts8tAi1f5I1ItIyHsEtfHTr+5l0SmHiIvzn/y4JN1jSzpW3A/y14
         2x6Eebz8egR23J46YQZekwl1y4t+0qTF6YOZ77389QwWn81VLUclB/Fx3+L2LCc6i+Ts
         sNK81x52AW/waeFvJQpmj1gK1DUqhG7OggQ9g9HbKuUC1ywTO9mTlpsTDKC4fEGE8lPm
         Li0Db0BcfyyiHM2rmLixBxHhYaf1YXuEm86TW/szTALO2nEWJRMhDaj0e+7jMCEFaLoV
         et9A==
X-Forwarded-Encrypted: i=1; AJvYcCWKlseJOiWes00EpMtjZl2mYBBH59oSaU6Wo1+A/Yr6+0urmwl3kCQbARcStSrD6kjLKeQ6ZonddJP5gm1L@vger.kernel.org
X-Gm-Message-State: AOJu0YzS6UpBIGevPRIoxNv3qx3ZNQtsyscWQNc3XfzEzdij7DmL/8XP
	Z+X0rzF1TLhE3QqM6X5UcMR3A5fR3PxywHFJzUyIzzAbD8d59hEBqRQ60Qi+wt4=
X-Google-Smtp-Source: AGHT+IHlGG8lUNXquAJHd6tZISj+TQ2YsszM2ZdBtl/KjJ9veSTZvzSOCuVd6OHtGTOCf+LGCgfwiw==
X-Received: by 2002:a05:651c:50b:b0:2f7:6129:5804 with SMTP id 38308e7fff4ca-2f761295a15mr75354701fa.15.1726051434260;
        Wed, 11 Sep 2024 03:43:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c07c5bcsm15188951fa.96.2024.09.11.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:43:53 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:43:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, quic_psodagud@quicinc.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4] dt-bindings: watchdog: qcom-wdt: document support on
 SA8255p
Message-ID: <j4yhwags7refg2qxc2ykkykxjv5sue3yghucsiykoyuvzmk4zj@zvh3fd6avmgi>
References: <20240910165926.2408630-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910165926.2408630-1-quic_nkela@quicinc.com>

On Tue, Sep 10, 2024 at 09:59:26AM GMT, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's KPSS watchdog.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v4:
>         - Added Reviewed-by tag

If this is the only change, there is no need to post it as a new
iteration.

> 
> Changes in v3:
>         - Removed the patch from original series[1]
> 
> Changes in v2:
>         - Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 47587971fb0b..932393f8c649 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,apss-wdt-msm8994
>                - qcom,apss-wdt-qcm2290
>                - qcom,apss-wdt-qcs404
> +              - qcom,apss-wdt-sa8255p
>                - qcom,apss-wdt-sa8775p
>                - qcom,apss-wdt-sc7180
>                - qcom,apss-wdt-sc7280
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

