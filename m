Return-Path: <linux-arm-msm+bounces-1274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829787F2379
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 03:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789601C21902
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 02:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3360A125B3;
	Tue, 21 Nov 2023 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo4VpbIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A375100;
	Mon, 20 Nov 2023 18:01:30 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d0ceba445so13691316d6.0;
        Mon, 20 Nov 2023 18:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700532089; x=1701136889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ud2wbnDHnTrARrEBLi1hXnjXYj97H/dIcLoVNVIK3P4=;
        b=Qo4VpbIxb5wlMARFUrDm6Jg5qG2tQBDi1AeAMq0w8eOGKIMYH6E1Wcff6BjZOqQCpc
         YvEoNoJc7F7PrQVWwhxVZrR8Zn0HHA6x7WPQp8orldqx37hMxJi7NTtDz8RXkU8N7dWx
         gJZxN51eclznOBT63M9t84MmZ2MvyTWhXfnU3WUgv0jWHE3rdqt2qLIYQW0LswU5D1yl
         xlyAeWL+7EqUF/7N+8w13MwBv4pWRnO4f4nsGuc0c+gDE8f1sc7mEbkgVV1U0Ub2HE0T
         5HqmanDWxbKAtmslEo44uD6o0sHDfUe+xRe/HRE++LQn8SpQe88heFm1Qr5mm21pm4+8
         n06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700532089; x=1701136889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud2wbnDHnTrARrEBLi1hXnjXYj97H/dIcLoVNVIK3P4=;
        b=Pm+Wl1RbEhQem8wpeYRqvmS+Ab9XLnU5GlKog2OdB7a14sc0nT+4xmWgwYfnP88WwW
         9Co5gIinZ2ZeWKSlwVGu0UOGwsLcXV6OxLUrque83PKtYBI+fUJUpUJfUTHpnp/rRs3N
         owCbRUkq61KcSSW5O75AXAHmaTMnNuyfoNrEjsTaG0buIJk2CJBIH3PMmLvPpGL551+b
         y10UcdxzE4IMnqwQ3IL7/LpIPdtYOrDqJGNFo6v6mbXgOrOIM41/mDtiQbjSwWLR9wEe
         XtuxQ6q+u9Ekjz9PjfCoarVzFfP81A/F10+cg9UmnXUVe4sctPLdAOIc5gwkcTBFPvy6
         eE1w==
X-Gm-Message-State: AOJu0YwqOz22mEMQlauggAwHjImx/HiEvV5r5uGlzTeFK8c2Le20DnKS
	zu+LmQ6rgTpLS5J2q0jxFVcp4COdfs+Xuw==
X-Google-Smtp-Source: AGHT+IG3r61SWPQbDOGF+sdTnp+vfRXsKvmLw2YQ3Rx/gPRU/Ji7LfmlJdQ1x8w81yw48pn4BL8QHA==
X-Received: by 2002:a05:6214:2b0e:b0:677:f341:c5a1 with SMTP id jx14-20020a0562142b0e00b00677f341c5a1mr10715687qvb.30.1700532089431;
        Mon, 20 Nov 2023 18:01:29 -0800 (PST)
Received: from localhost ([2607:fea8:529e:7800::80ec])
        by smtp.gmail.com with ESMTPSA id j16-20020a0cc350000000b0066cf2423c79sm3509228qvi.139.2023.11.20.18.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 18:01:28 -0800 (PST)
Date: Mon, 20 Nov 2023 21:01:27 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm670: fix USB wakeup interrupt
 types
Message-ID: <ZVwPd8OmjwMjtB3k@radian>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
 <20231120164331.8116-8-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120164331.8116-8-johan+linaro@kernel.org>

On Mon, Nov 20, 2023 at 05:43:27PM +0100, Johan Hovold wrote:
> The DP/DM wakeup interrupts are edge triggered and which edge to trigger
> on depends on use-case and whether a Low speed or Full/High speed device
> is connected.
>
> Fixes: 07c8ded6e373 ("arm64: dts: qcom: add sdm670 and pixel 3a device trees")
> Cc: stable@vger.kernel.org      # 6.2
> Cc: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Acked-by: Richard Acayan <mailingradian@gmail.com>

>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index ba2043d67370..c873560ae9d5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1297,8 +1297,8 @@ usb_1: usb@a6f8800 {
>  
>  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
> +				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
>  			interrupt-names = "hs_phy_irq", "ss_phy_irq",
>  					  "dm_hs_phy_irq", "dp_hs_phy_irq";
>  
> -- 
> 2.41.0
>

