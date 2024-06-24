Return-Path: <linux-arm-msm+bounces-23875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6B91423A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 07:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB620284B37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 05:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B8618AE4;
	Mon, 24 Jun 2024 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygb5B6Y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ABA17C60
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207601; cv=none; b=CBYCOVlWbVfGS46RPSgtwiF0e/JYIHKFmOyPnL7h/xxfYN924d0VoEZtjHg1yOV57ASB6ENIrECvAh2KDr2nJK5wI88k1T49wsZYN/Po8KkmRcayEakYa7Ss55j5UM5SE5j5FwTTfmFcliJqvNLl6sX9PD7Zci1euJHMjkgNPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207601; c=relaxed/simple;
	bh=sB79L96chHPnNm0NFvdeCIIlAOMEQ6KrbxWuMu/JXyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8BHW4hUMb6AsUXKpsX7FURw/3Hu4u45z3x5pz9rehYcx0ifsLd59TIdYjRG30k15Vh5hm+/2kX2NtAZGwJptYzx5vXmKzaaq8sebdZVzKDXTD/Y/2FtLpTUr09ngJKpi73Io9KFOfCXKpdAtj5WoK/mjePL3ziuSY4Yd/QlyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygb5B6Y2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so43194001fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207597; x=1719812397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2pTq14fJDQ5yGDwK5Gy7r+oFB9f/7Tfv11KtK9Jc7g=;
        b=ygb5B6Y2xGdwczHfGG0kw0C4UN6EsOQH7yKier2qAaW70biwhAk1lckHaUhSht4APV
         DeED0mbqvBdYu5JvVifHiHfWSd6u8Dh63szaRZRKVyalbE9W2EZ/ni+bHQXqhm1S0b8K
         WeZm83rQ2ZUp6yPASdz965sDY8aXC1K1V2O3VhuxKGNQXflzJ9juXdYaJ3rimm+5MOe9
         w3pyxFl5Y1YWU5mT/hk2xY33gMELI59O/wfgSmR5mc3Ml6BHPeA8M0DTvvmIT1FHNHzA
         Sv8I81L9r+rx0MRRGLQcUv+rOtzcnr37D4b0gOX2w0Fvo6IyjENpSh32PgEizwISSHIf
         6rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207597; x=1719812397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2pTq14fJDQ5yGDwK5Gy7r+oFB9f/7Tfv11KtK9Jc7g=;
        b=F1wqrn+epO7Vl+/iaoRjeIBkx+/zjATyHh0EYJHIPlIGGXjCakfCtUMbl98wHM3N4w
         TTyR252oONeZ3h3ulTeEEvNXvP7d1SAAuL+QRxXkHSyPlji1xKNrZquTFlrfolRQb16k
         GZ/RqVPtJ+X81u/Jqlipqm+iPdFu4Ktd9mFtlZXxm3IRlxxO9S8Hi45jdI9luDNACkPC
         oX8v7bJNkXeKRd85b6Hrzd8LC/P+YGfasqW+95Xkflo/515AWY6syqqKWnZGVgrRg9dS
         7AZiy54Aoq2OEb/+uJuol9hP8t7nreQJn+lLl87jFcLvlIpcqd663bja0nkBCo+G4gBg
         IzJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gUIuA/770VZuCPD8L/878NkKn9Bvhih7CAEzcSAp5qVPJwOI9RLqi5KXs8O/iLxTtg5e+PVe9osAZ3y8BEs7p0vbLQ+ZadnPq1nkPA==
X-Gm-Message-State: AOJu0Yy37sd8mBv9m4xMAIluZUNbZ5Du0wDlRP7aUr2LeSUL4u3AZO66
	n4hhayd46ShxtsnW2kZWtpMVhlR5rodfF7nPmN2ecar8CzAixAj6Q+UX0K9hwaI=
X-Google-Smtp-Source: AGHT+IFDXqAelN1o1aoynRbVBM3dlltX3PoMRNoTGMGeQsPIYe1hFOjXJgL2gSBMPpmrRfB9RgkUyA==
X-Received: by 2002:a2e:bc04:0:b0:2ec:5964:9c0d with SMTP id 38308e7fff4ca-2ec5964a0f6mr39924281fa.0.1719207597034;
        Sun, 23 Jun 2024 22:39:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d787ed2sm9038041fa.130.2024.06.23.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:39:56 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Enable CPR for IPQ9574
Message-ID: <5xgjszacvtnjftygwvtonb4npspaceutnvnnniebxntii4tmud@xag2c6j2svqa>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-1-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:47AM GMT, Varadarajan Narayanan wrote:
> This series tries to enable CPR on IPQ9574, that implements
> CPRv4. Since [1] is older, faced few minor issues. Those are
> addressed in [2].
> 
> dt_binding_check and dtbs_check passed.
> 
> Depends:
> 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> 	[2] https://github.com/quic-varada/cpr/commits/konrad/

Please include [2] into your patchset.

> 
> v2: Fix Signed-off-by order in 2 patches
>     Update constraints in qcom,cpr3.yaml
>     Add rbcpr_clk_src registration
>     Add Reviewed-by to one of the patches
>     Not adding Acked-by as the file has changed
> 
> Varadarajan Narayanan (7):
>   dt-bindings: power: rpmpd: Add IPQ9574 power domains
>   dt-bindings: soc: qcom: cpr3: Add bindings for IPQ9574
>   pmdomain: qcom: rpmpd: Add IPQ9574 power domains
>   dt-bindings: clock: Add CPR clock defines for IPQ9574
>   clk: qcom: gcc-ipq9574: Add CPR clock definition
>   soc: qcom: cpr3: Add IPQ9574 definitions
>   dts: arm64: qcom: ipq9574: Enable CPR
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |   1 +
>  .../bindings/soc/qcom/qcom,cpr3.yaml          |  35 +++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 269 ++++++++++++++++--
>  drivers/clk/qcom/gcc-ipq9574.c                |  39 +++
>  drivers/pmdomain/qcom/cpr3.c                  | 137 +++++++++
>  drivers/pmdomain/qcom/rpmpd.c                 |  19 ++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h  |   2 +
>  include/dt-bindings/power/qcom-rpmpd.h        |   3 +
>  8 files changed, 488 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

