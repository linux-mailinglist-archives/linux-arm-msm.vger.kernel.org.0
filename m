Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39067626689
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 04:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiKLDMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 22:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiKLDMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 22:12:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399C863BB0;
        Fri, 11 Nov 2022 19:12:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C64D61D21;
        Sat, 12 Nov 2022 03:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B6EC433C1;
        Sat, 12 Nov 2022 03:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668222723;
        bh=MxwW5U7TdQxJ1Sydv6lxRBV2aA6sfnJ2ctEXlcKGnc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i9HtqE1xepwA4LnmB3EVAibEyFJL75n2Id6SUoDVRP8+pzWZiQUestCBjsi6iT01l
         +UDwk+M4/yDJhGLLCS+XPHhwwMX25lx6Ng4EWtW9WR2CLxVf0ooJrjxPM0D7EyyP9b
         6r9gDVM6i99PzW9jopj9Mgvg7mKNdrxrl6wo6mhDCZZehbSl+dcZlGEUTOHe3+AnJ8
         ctRWtDpnSO8e8QFw0CSoUvmQbbSWVNDpkVY5GFk4Vzyy/IVXL0EBLX4r1ZnwVFlY17
         HcNU8lKRdSoMHRVasSamnakdQrbIIXV3HzpASUQd/jl7bp21AhpsgxdR5NrFEu6tTu
         ihDSNoPSGKgCQ==
Date:   Fri, 11 Nov 2022 21:11:59 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop type from 'cpus' property
Message-ID: <20221112031159.cptoshbcfjdk7rs5@builder.lan>
References: <20221111212857.4104308-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111212857.4104308-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 11, 2022 at 03:28:56PM -0600, Rob Herring wrote:
> 'cpus' is a common property, and it is now defined in dtschema schemas,
> so drop the type references in the tree.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  .../devicetree/bindings/interrupt-controller/apple,aic.yaml | 1 -
>  Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml     | 3 ---
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml     | 2 +-
>  4 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> index e18107eafe7c..698588e9aa86 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> @@ -90,7 +90,6 @@ properties:
>              maximum: 5
>  
>            cpus:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
>              description:
>                Should be a list of phandles to CPU nodes (as described in
>                Documentation/devicetree/bindings/arm/cpus.yaml).
> diff --git a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> index c87821be158b..a740378ed592 100644
> --- a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> @@ -32,11 +32,8 @@ properties:
>        - description: nCLUSTERPMUIRQ interrupt
>  
>    cpus:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
>      maxItems: 12
> -    items:
> -      maxItems: 1
>      description: List of phandles for the CPUs connected to this DSU instance.
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> index f2cc89e7f4e4..2b4d802ef4b2 100644
> --- a/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> @@ -34,10 +34,8 @@ properties:
>      maxItems: 1
>  
>    cpus:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      minItems: 1
> -      maxItems: 4
> +    minItems: 1
> +    maxItems: 4
>      description: |
>        Array of phandles pointing to CPU cores, which should match the order of
>        CPU cores used by the WUPCR and PSTR registers in the Advanced Power
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> index e1587ddf7de3..92762efc2120 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> @@ -37,7 +37,7 @@ properties:
>    cpus:
>      description:
>        phandle of the first cpu in the LMh cluster
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>  
>    qcom,lmh-temp-arm-millicelsius:
>      description:
> -- 
> 2.35.1
> 
