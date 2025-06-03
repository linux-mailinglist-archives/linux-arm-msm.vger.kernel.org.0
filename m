Return-Path: <linux-arm-msm+bounces-60161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E04ACCA81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 17:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC083189774D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 15:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FAA23C515;
	Tue,  3 Jun 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x9DStk0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DA189F20;
	Tue,  3 Jun 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965605; cv=none; b=TuMLkYX38W6kiP1PwAAgJizIvWSCPolycKWFqFwmWkHEObEjiVy9KkbGlm+NTGDepCDxEQTgnmzE0kGyr9KZh8sul+eYkPN4jBRF5nFZavi9lVMD7qhj5ulIBmvrRjUnf6WJGkBIQ7eaPqEW03HuxKwgHaUTAvuvIVpqTKbHrEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965605; c=relaxed/simple;
	bh=cp2VIUY62IHryMPg853R/P/43LS/WSe2ueSH0nEjeGw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv2lgnz96M8HfaO6nRMxydzr/Y+7g3lgXobD62dPNNGrJ2dU8EyNbpc2llOEW2D7M/kjc0XvVvu/u940hHqdx3KhpBw962m6al8xPE1LgythprJ8eqmKo7Oik0+LRJV84wcHzfM7Sr6qrTFcyWHLMyrkXY4CvCesK66F6Lx1Uc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=x9DStk0B; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553FkCqT3554911;
	Tue, 3 Jun 2025 10:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748965572;
	bh=zFZ6YwHvgSl9V9Kq7xYCisv6g+dcYL2KAPMk93hOPSQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=x9DStk0B/Xr4bClFB1xeGxAnulnzCKY/VfdSQUMrAR1wRYGfZ+/x1Oxg3zd665GLX
	 vJJiVawJI2CJtPXonTu7obh4+Rcc6kSsWbMWiZU6QzUit7jkg5tUW/Lnh48mfE8Izw
	 hP2vUYebW5iTPRvd7EaWoQlPphzUnHNVwbMyv8NY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553FkCPo1411998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 10:46:12 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 10:46:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 10:46:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553FkC0i566876;
	Tue, 3 Jun 2025 10:46:12 -0500
Date: Tue, 3 Jun 2025 10:46:12 -0500
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
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Message-ID: <20250603154612.ksi2jq5dqhc4wkhu@despise>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:57-20250603, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
[...]

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> @@ -68,12 +68,12 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      secure_proxy: mailbox@32c00000 {
> -          compatible = "ti,am654-secure-proxy";
> -          #mbox-cells = <1>;
> -          reg-names = "target_data", "rt", "scfg";
> -          reg = <0x32c00000 0x100000>,
> -                <0x32400000 0x100000>,
> -                <0x32800000 0x100000>;
> -          interrupt-names = "rx_011";
> -          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +        compatible = "ti,am654-secure-proxy";
> +        #mbox-cells = <1>;
> +        reg-names = "target_data", "rt", "scfg";
> +        reg = <0x32c00000 0x100000>,
> +              <0x32400000 0x100000>,
> +              <0x32800000 0x100000>;
> +        interrupt-names = "rx_011";
> +        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>      };

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

