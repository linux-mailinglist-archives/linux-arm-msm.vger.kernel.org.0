Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7092B2224
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfIMOgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 10:36:14 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46162 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730648AbfIMOgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 10:36:13 -0400
Received: by mail-oi1-f196.google.com with SMTP id v16so2774568oiv.13;
        Fri, 13 Sep 2019 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z79bT51s8X9t468gxQ2+1ZKqbdd8xzju/Fxq/NSNMTo=;
        b=Jm+J5GkgwMCuUZ1KSyzH9i7NijIXZIl3spYFI92qz9iRF2aAUuBCmp9XCLZEEv+g/3
         islda/JF+qAqnsOkpf//OLV2KrKKx6FzIiIKgI8uDRsF9UU/OdqDxPJ+wxumx17bbkuP
         r5EjQQGuIANZE1Z0wRr6AoLZ6Oeoytz1Z2bmvxZ/P8UHFYDS4uLAzTHiNfelxvg0tT7n
         PnKITcZBlqrN7zVp3Pac5x8heJQnsrGaacRcE3teqB9GcXSjGCAaPReIhspsRFIevp9m
         wr+ypXHC4huVsPpyCrlvrEgyOUnb8Z8qUUZj0o5Z4syhJ5JQjF7QWONCQBbrDLVgP5pQ
         btRg==
X-Gm-Message-State: APjAAAXQd14hnP1olhry1Qk8tEjwDTqKxNenFsIKhwVntaHEWzgUHqNH
        A1v4oW/4pccExM7c2sK1AQ==
X-Google-Smtp-Source: APXvYqys48uCX3cKqHL275Upcx6Znn3+mIOh8UgFx1fG2pm+46Ii25BVGfwriubeNdu+E5Hy4OkcZA==
X-Received: by 2002:aca:2402:: with SMTP id n2mr3696427oic.32.1568385373025;
        Fri, 13 Sep 2019 07:36:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm913643oie.4.2019.09.13.07.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:12 -0700 (PDT)
Message-ID: <5d7ba95c.1c69fb81.edf8e.6556@mx.google.com>
Date:   Fri, 13 Sep 2019 15:36:11 +0100
From:   Rob Herring <robh@kernel.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 2/2] dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported
 strings
References: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org>
 <1567774037-2344-3-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567774037-2344-3-git-send-email-ppvk@codeaurora.org>
X-Mutt-References: <1567774037-2344-3-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 06, 2019 at 06:17:17PM +0530, Pradeep P V K wrote:
> Add Bus bandwidth voting supported strings for qcom-sdhci controller.

What is bus bandwidth voting?

> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> ---
>  .../devicetree/bindings/mmc/sdhci-msm.txt          | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index da4edb1..8255d92 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -39,6 +39,25 @@ Required properties:
>  	"cal"	- reference clock for RCLK delay calibration (optional)
>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
>  
> +Optional Properties:
> +* Following bus parameters are required for bus bw voting:
> +- interconnects: Pairs of phandles and interconnect provider specifier
> +		 to denote the edge source and destination ports of
> +		 the interconnect path. Please refer to
> +		 Documentation/devicetree/bindings/interconnect/
> +		 for more details.
> +- interconnect-names: List of interconnect path name strings sorted in the same
> +		order as the interconnects property. Consumers drivers will use
> +		interconnect-names to match interconnect paths with interconnect
> +		specifiers. Please refer to Documentation/devicetree/bindings/
> +		interconnect/ for more details.

How many? What are the strings?

> +- qcom,msm-bus,name: string describing the bus path
> +- qcom,msm-bus,num-cases: number of configurations in which sdhc can operate in
> +- qcom,msm-bus,num-paths: number of paths to vote for
> +- qcom,msm-bus,vectors-KBps: Takes a tuple <ib ab>, <ib ab> (2 tuples for 2

ib and ab are what? Didn't we just add interconnect bindings for 
expressing bandwidth?

> +				num-paths) The number of these entries *must*
> +				be same as num-cases.

Are all these properties SDHCI specific or can we expect to get these 
for *all* the QCom blocks?

> +
>  Example:
>  
>  	sdhc_1: sdhci@f9824900 {
> @@ -56,6 +75,19 @@ Example:
>  
>  		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>  		clock-names = "core", "iface";
> +		interconnects = <&qnoc 50 &qnoc 512>,
> +				<&qnoc 1 &qnoc 544>;
> +		interconnect-names = "sdhc-ddr","cpu-sdhc";
> +		qcom,msm-bus,name = "sdhc1";
> +		qcom,msm-bus,num-cases = <3>;
> +		qcom,msm-bus,num-paths = <2>;
> +		qcom,msm-bus,vectors-KBps =
> +		/* No Vote */
> +		<0 0>, <0 0>,
> +		/* 50 MB/s */
> +		<130718 200000>, <133320 133320>,
> +		/* 200 MB/s */
> +		<1338562 4096000>, <1338562 4096000>;
>  	};
>  
>  	sdhc_2: sdhci@f98a4900 {
> -- 
> 1.9.1
> 

