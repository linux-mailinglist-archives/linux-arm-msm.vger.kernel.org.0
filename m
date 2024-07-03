Return-Path: <linux-arm-msm+bounces-25208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEAD92699C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 22:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0D71F26E30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 20:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C819005D;
	Wed,  3 Jul 2024 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Dybwe8UO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB518308A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 20:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720038729; cv=none; b=bPjqe9Qd3CNG2pmOzolIoNgv+RgUE9akMjU1/CxIoA5qHp3YV/BbINhoTeiFuwOud6SlATfpsNspB6If4pQoMpAWqvaEAMaROHSgwcHn/iJGeXZ0E9+FX2hhOCtHG26jW3XgUG9COSryqge1l8kNFpVhkL+2DgKfceCdbTBk5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720038729; c=relaxed/simple;
	bh=hbV5D9yoA5zETqVVoepyLfEbB6C+CmU0yRFOrj08wK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9bk+tZa70OKXGK4OPSL/2sqVJ3g49/ZrhntLJONFXZVLmHa3CcHJ8ZgpRxTDXGFpFdFCy/YZX4BAcZTCmEYTR2srC9FX+1rVGMuwRsn+nk5FxwQFwEMwQzgJ5KSkskHPa1xvb/iNkDKaJhN5pRrEOHbOStTt9ENPqmV8JVrkyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Dybwe8UO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-425814992aeso26759315e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 13:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720038725; x=1720643525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
        b=Dybwe8UOW8EfCnxlRJ2u31hzCFMdPyNrcQWDZgKNxQHcobn5zo1irS7+NFeYNXzQGO
         3nqCHK3x/X3BkEz7cLhZXD8Z81XZAuvbXlx5vFJu0dm/2tbg6s+38n/hcabxPQcszzQe
         /Eo20JqPbt+GEx2BM9Uk6InuRadBlHcS54cBU9pVyfiFpfZVOxvNXpDzBxI5an84vXuc
         3XzdllsgYqvcCxQcBlGoGfjcsGvj+SUVFuJi3A8c+QlTHBmWMpNMnME6xtIxFmr1vgUj
         0z1AmDSW2LKLlCwjr7xlITRjauig5l3UOsSiiZshS5ZDIMC+3st0h3oHdyA6GlsQzEpr
         PSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720038725; x=1720643525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
        b=KOEZVWAUOdpwA46LWStVXo8FxDeEyjpvT0alPZorB2dEj4TshYxgusyfpGrx0h1xcv
         Kl/DfZRX7x2nPMVSFxNfRK3nQUO9PrtfrtQv6eW1RPkktrk9w9g4yS324NPlrWURFVIs
         VEYmCGiRLgQ7tory3Upj6JlWtfWqKV9sXmZcoFHRiRB9eaK73VE+zmt2cKsOJghi3EG2
         lkRnvZ32mvuZ3G+z21NOJ3ivsFKYBVMgEv72wyaLj0BdjI9XqdDoUsA7Mo/LVkhFcoAX
         I4LHVdsxRPZztTBgodtW0Y+yEld9fbUAlUww0vPzxbuiSWvgVmBxteACP/qwlA+wThKU
         YiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUoXC69Mc1B1/2oW5oKnuWdvZtInEIRVeIEw1rhJ9jwy+rLLeI204wIOADY20XvyAkb479Cw37sY8SFNcZqEHW2RGQKqiM23Em+Twp6dw==
X-Gm-Message-State: AOJu0Yy4ze/J+PD53lVqrgquRXZgo9cM7vDj3WghffTY8wWDR+x3eAKK
	9SzpDeeLw5cA4OBObkRxIPM4VqmAsQMjSUbqAdvRod67pXebVOP42a/8FB9FpEM=
X-Google-Smtp-Source: AGHT+IEQBwm7OCqJ0C1+sLPedSZoAnvYatAaOS5AYpVWYgjgIYzIeidjLFDv/zxc1QKpmoxHnzRP3w==
X-Received: by 2002:a05:600c:4f52:b0:424:aa64:e9b3 with SMTP id 5b1f17b1804b1-4257a02b701mr80619975e9.29.1720038724401;
        Wed, 03 Jul 2024 13:32:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:10a5:e010:6751:db24:f67e:fa2e? ([2a05:6e02:10a5:e010:6751:db24:f67e:fa2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426487c1c66sm1528905e9.0.2024.07.03.13.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 13:32:03 -0700 (PDT)
Message-ID: <922ef023-4375-4a89-af1e-bd9bcf90f750@baylibre.com>
Date: Wed, 3 Jul 2024 22:31:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
Content-Language: en-US
From: Guillaume LA ROQUE <glaroque@baylibre.com>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/06/2024 à 11:46, Krzysztof Kozlowski a écrit :
> Device is a thermal sensor and all in-tree DTS provide
> '#thermal-sensor-cells', so reference the thermal-sensor.yaml to
> simplify it, bring the common definition of '#thermal-sensor-cells'
> property and require it.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 01fccdfc4178..e52fc40e215d 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -11,6 +11,8 @@ maintainers:
>   
>   description: Binding for Amlogic Thermal
>   
> +$ref: thermal-sensor.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -44,7 +46,7 @@ required:
>     - clocks
>     - amlogic,ao-secure
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |
>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>


