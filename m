Return-Path: <linux-arm-msm+bounces-60162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827EACCA89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 17:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333F03A2F07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 15:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DAB23BCFA;
	Tue,  3 Jun 2025 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FPVbgXwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57F182D2;
	Tue,  3 Jun 2025 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965781; cv=none; b=o34DdfadROPI/5E/TcN6d5U9VMw9bSiKDSyl83l1YBeAwdndhL+PxIH6D7+uGxR4dWyDRzfvbQPgDsy5i6/p7uN/jYLxkh6wtwRFpbGusF95adZT0dKx5Vrdc/342+W+mRDkIJ24TnjNQ0b/Pysy4zaPIsmibHESy7SnB40ma+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965781; c=relaxed/simple;
	bh=zRJhD7sF5YaVre9akGENc8NLed+Bjt5csNUjdKbF2tc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGtuBOw2zNLDOOws985Dr9bb5cOpNUnXf+9sjwcJ25qHEjSPunud1qy6rtsveeLcu11Vh3ruY3ToFPr//NoU1INX1zN3NjdSAn9lm48eW1FCVlMcb11/qs7+RSmQWPrZ1TwLweanLHspuRkaRitpp+RgGtulkvvmu5ksF6H+RtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FPVbgXwM; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553Fn5bq556677;
	Tue, 3 Jun 2025 10:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748965745;
	bh=Ar5D4zBSs/YUAUx/REy11enEaNMluqXtZe67Zl84UoY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FPVbgXwMAZE/ZsvtLocKXO3Y3kWf4ta5LsqRBF84wWrOSiq7MrQaGxAofMCJRvFag
	 q534Ov6HTadamlsWXy5sNeqsNM2W3mbasRZBdG90ky87j88oF60ugwyhXorSRgw568
	 YTexki4PRPNXAJAAw5YEFaaAC6IIdx3BF+R+Qp4E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553Fn4O53854379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 10:49:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 10:49:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 10:49:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553Fn4is569045;
	Tue, 3 Jun 2025 10:49:04 -0500
Date: Tue, 3 Jun 2025 10:49:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>,
        Janne Grunau
	<j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa
	<neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, Suman
 Anna <s-anna@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <asahi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Message-ID: <20250603154904.oa5lx5loywmzoqhr@varmint>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:57-20250603, Krzysztof Kozlowski wrote:
> Providers DTS examples should not contain consumer nodes, because they
> are completely redundant, obvious (defined in common schema) and add
> unnecessary bloat.  Drop consumer examples and unneeded node labels.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> index 1a2001e58880d2fc26954b26cff8ed53e7667f33..8504ceb64806bc7e25468597acdff99624571e9f 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> @@ -242,7 +242,7 @@ examples:
>    - |
>      /* OMAP4 */
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    mailbox: mailbox@4a0f4000 {
> +    mailbox@4a0f4000 {
>          compatible = "ti,omap4-mailbox";
>          reg = <0x4a0f4000 0x200>;
>          interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> @@ -260,13 +260,9 @@ examples:
>          };
>      };
>  
> -    dsp {
> -        mboxes = <&mailbox &mbox_dsp>;
> -    };
> -
>    - |
>      /* AM33xx */
> -    mailbox1: mailbox@480c8000 {
> +    mailbox@480c8000 {
>          compatible = "ti,omap4-mailbox";
>          reg = <0x480c8000 0x200>;
>          interrupts = <77>;
> @@ -283,7 +279,7 @@ examples:
>  
>    - |
>      /* AM65x */
> -    mailbox0_cluster0: mailbox@31f80000 {
> +    mailbox@31f80000 {
>          compatible = "ti,am654-mailbox";
>          reg = <0x31f80000 0x200>;
>          #mbox-cells = <1>;
> 

Reviewed-by: Nishanth Menon <nm@ti.com>

> -- 
> 2.45.2
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

