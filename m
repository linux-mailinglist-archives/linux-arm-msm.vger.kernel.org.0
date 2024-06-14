Return-Path: <linux-arm-msm+bounces-22725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F91908A1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C33A1F2128E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878411946CD;
	Fri, 14 Jun 2024 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQ52yifT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1519414A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361355; cv=none; b=bD6l2FVf5rHdgnitjv9H4Qf/kJ6mktV3J01Ee2Cn9ls0kICe1bP7GmCVvJ1wiAB+BB1Wm8Dw9ce+et5xAQynps9Cg+9mVerxMY9lSd0FLfcmHwWBE7MmeofAR9GUL6y4Ih29QXFKod7ssBiX7k4/jXG3fjPIuqddbo4hBmhJTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361355; c=relaxed/simple;
	bh=66n4QJTe2QoUaT86K35RhfAcMVqLfHGNaa6rF0sOxD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlxfHzVNsojvdNwMmlt6teWSEYOASVYAdrM0hSwHek5NJSDaAvFsJegDEZT7CtWFLqDzph9aaZ1wJb2vwniyS2V2B/l0NWJQprS6CgPczMVLdEYONGu6QE/tFLSUeW1NilZ6vfxeKtoMU5f8FzkMAAOBizvYvwd9f8FZvsCZj/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQ52yifT; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so19075291fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361352; x=1718966152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=WQ52yifTxs4M0BD6jZcwLFWbxKFFEWly8hPPkm3acLoYw/Qu0q3Lu9FMpsJbzSah0D
         4tuIy3+yq0vMMqu9JuKilaqSgt/P5i+zlCD/zf+goa4QIhA5Jqca0Nb+4zR0DPigOs1c
         tPT0GsX50m1P0RUqOBrXC5AIceo0q6fudjSofyRRUgkgfGxJU7d0xTFS4UFaXweBULde
         qhuQfF9ec0cq2efdmXBlUFuL8dFjGhBneESBkKQzFwQe2Zo3J+9vTei060rkpITPHUUO
         m5OH9k0Y5DwO/uo4ljBXp3zYG94RusPT2ezd562OaWmaQEsxBOZFOAXU5buF6pPiB+U3
         GWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361352; x=1718966152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
        b=RMsmsoal5eCBI9xoOeDySTRKU7yR+40cFDJotZLrYTxbzdeMzUUcn23pUciIswig4n
         Xc9E1hUUQ7bdVid7d2dTWNqTdIRrHp/hm2wtvGqgreI4rjlEQw+F3wZu4xw59K04/Cpv
         3mwq4XZ+Q42YH/UGEauyjAQnc580lgN0I6BsLjx+nBDglN9xoPBIhclTTmMzSw/mHNsa
         1r56WwPzSBPh5BJ3YexQyn9l1lxx2Od/3iO5g3OECb4tgq36tJpur0xsGPdhju1NVTh0
         xBfLDkpc9pnng369Ru6t9PVCe9CfDGSxbkOtmOtpZDgxc8NdRlT2dUVL0C0FigPfWud4
         ot7A==
X-Forwarded-Encrypted: i=1; AJvYcCXefki68mHK90KCjzqpuzLKpdqCPzWyPU9IZhr6wfDEoRuFRhisi9+6tcn/aWkKDXU5unaZZn5mVafe5qcatBXuO0WnoGeQPa2N+ONqZg==
X-Gm-Message-State: AOJu0YxJa38xSmZRQ25YYsfZnEjiGHgAtF3GbhqjG57EVbDX29/dEZCh
	kdBrMxur3QNK1zeuBBvSI73Kf5KTndOTENixO+xjH/mtWK34sILa4HmBoC0AyOY=
X-Google-Smtp-Source: AGHT+IEbw6LK2rPBbVuJQJBgxOhegr+TV/18ANijB4Rchh5JfiMQ1/qs7DuIZLwqd6QzWtrSJTx22Q==
X-Received: by 2002:a2e:8386:0:b0:2ea:e26d:c9ba with SMTP id 38308e7fff4ca-2ec0e5d0c09mr13495761fa.27.1718361351635;
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf438fsm4969921fa.24.2024.06.14.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
Message-ID: <eesj54re2itzlcr3ctntqjued5mqucbfxuoiy64344qkzt5be7@2643dlhd4kpl>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:10AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

