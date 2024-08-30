Return-Path: <linux-arm-msm+bounces-30179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 321949659CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652B11C22556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1DD16C695;
	Fri, 30 Aug 2024 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GnTfo3jM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ED915099A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005614; cv=none; b=MzPfCOnAqJA5BssSkZ/RfzSvcB5XDYQzlDEVHp8VaA9FsV8eSfw2DqLoPVCmBO+63LSa+HOwRN22EFSTFWmKgijpUoYlVsUOGeUiqW1VsS6iYqc/MkO4BRVg+o82yhNA+LhDgO+xVKL2SA6tg4IrUAOCi4lqRcp/j92LiHdmHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005614; c=relaxed/simple;
	bh=9lAJkqgaWF31Wo4W4580wuECtRVzMN8l2oXT5n9PbkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwiB3bORCvp2dAJVi0pFLF021z/AJ7WYPEd8ssNvXe2JWXa2XjR+C+tDzBoceGrN7t3/QkFe+XOhlfvfmCh5H6O23Av2nA7DznOoOdga+ReSWID/ymuTGJ5MYxpXDFEOifXPEVFoJOcRXxMX98vDsLjAYyS8BDFPumsz22Pdc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GnTfo3jM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f2868783so16396411fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005611; x=1725610411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Rd3vrhfsJ6l74liSsK8uI//rJ+lt5QFYUiOIWgOEvw=;
        b=GnTfo3jMU/SmEmvhgqJa/1KW0uVKTPR+FIXhvXq0Ms3qi2rgUboIyLRd+/PhK/2F/x
         VS3hLKP5fXov93AXJJChiWh8BjtkWA/53qTpnzFg/lp6FQUXoUcRXWE/qtMuROefBd0+
         blZ0AGDN4iXbpxGuGan1CLV0MDvpCmnOjnT8IZowrOpZLBdegBMtAcJ/0lLZqdP0kuvT
         v4wsGOOJJB76VzduOkfyNkMDiHVi+NurF/qRjvrspEVK74cB5YWhih64sUgE6ikeM6e2
         gC3LAnmBGk5tRbh4LCCb1WVX+C3wRUgJyNWKD1twaf/Ix1NUkdLvr92SX8TFZ0xx+kRn
         eVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005611; x=1725610411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Rd3vrhfsJ6l74liSsK8uI//rJ+lt5QFYUiOIWgOEvw=;
        b=XGHf/hv1uwRpmex5eCaFwnp9NaC+R310xvLzqgrh1k6xa6HJUa7w6rJ1H81Euk4OY8
         pkRY5T4Z2okM6P1P5UAW142R/xBAIlPv1zfgLukjLsw3nnlqXWTphjp2mv9g5b0YuyLd
         OiDrRkb8ZlnvMIWgr4kKZMGie2+jdAlO0EKa3tMsdc+HtUfTE7SRceYkz+oL7QKaurkO
         5W9bZh9ORYrpViQVCe6DkHFnQdgVG8XG/HNL+m7SeyLonDbMHXQtc7Iw/M9keh78DaX6
         L0bTLJhYjsOaEUZkEpFtVWRn4I3ihBgrIQpNwLPjEnOdMGuxAxuBY5auiMFYwwiCFR5G
         1TYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX16AcfRluzOUQJJmfLNmGe3l9sCIZZENbfo8bqpu1ira8cDO0lYKfgjSBzALJBK+ecawe5AcCpqqJ1AlqV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyipa7edpn8YtG0TqDhFijIqjFPetC/m0NbjWo4lNs/CEdKb+l2
	a3SqvPmXDMPiCq5mZNJAMU0gQNAVczuJ/YZTQXuceYDdqpOTlMHpJ/VimXsy3bU=
X-Google-Smtp-Source: AGHT+IHxc5+G0BndaGsL2vRM9TegLDOnMydgCuBJSqgNQZJbkJofQqj7sLvluos8dVwzgjwNY2Lk4Q==
X-Received: by 2002:a2e:bea1:0:b0:2f4:f279:36d3 with SMTP id 38308e7fff4ca-2f61e0258f3mr11052511fa.4.1725005610510;
        Fri, 30 Aug 2024 01:13:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171c70sm5280001fa.85.2024.08.30.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:13:30 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:13:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@mainlining.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex
 A55 and A78
Message-ID: <5gmsbbnuc7sbkpptomvpl6aarw5poutvjfav5rilgogb7727vi@nhtr5m24tkmt>
References: <20240818192905.120477-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818192905.120477-1-danila@jiaxyga.com>

On Sun, Aug 18, 2024 at 10:29:05PM GMT, Danila Tikhonov wrote:
> The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
> consisting of:
> - 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
> - 3x Kryo 670 Gold (Cortex-A78)
> - 4x Kryo 670 Silver (Cortex-A55)
> (The CPU cores in the SC7280 are simply called Kryo, but are
> nevertheless based on the same Cortex A78 and A55).
> 
> Use the correct compatibility.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 91cc5e74d8f5..ab024a3c3653 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -845,8 +845,13 @@ wlan_smp2p_in: wlan-wpss-to-ap {
>  		};
>  	};
>  
> -	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a78 {
> +		compatible = "arm,cortex-a78-pmu";
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

Shouldn't these two entries have GIC_CPU_MASK_RAW(), limiting interrupts
to the corresponding cores? I see that in [1] Rob used masks for older
SoCs, but skipped them for newer ones.

[1] https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/


>  	};
>  
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry

