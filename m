Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0652965C5DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 19:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjACSOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 13:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbjACSN5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 13:13:57 -0500
X-Greylist: delayed 965 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 Jan 2023 10:13:56 PST
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E542126E5
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=EwBUdzJnCB54BTqWse1nZK/N6bNLSBfDFML/k/6VIUE=;
        b=lw4USXznYFEFEaWwMu2cHNwgZVRZD54ExKDonRw6lTgJ4Sqj6g0jklkjVnAloz1WgHGhkIulGxVeR
         5EWh86q3u68/Pec8qPsv+VCtDIUcQxI78Br5HT1XOSuJ1RAnYQlniaqrzxyML1T0KkkF/uUo6grtyP
         26ZWoHJXz5OI/JQkLaEyR2bOUJQZIjoykP0A2Fs3H6OHWZ9ipfP5+IMnhgHixs/QPK+xCFT8im5aXv
         6AvJNVFQHT9SmIIrRLhKkCg3Kao+DuinggMN+uurr2J+rZmGpJ7ZZCX7xdWOc74Qo2VvSg8G2VUOnx
         ZeW1qkLdkjagll8kpaxxkisKbO6wCpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=EwBUdzJnCB54BTqWse1nZK/N6bNLSBfDFML/k/6VIUE=;
        b=2n7wzIrWTU2yMXsaFUcN1Ez8vycYmeYJXmTGtFyrzgGcWr6onAXIswMu7OHYOU6Hiy+Pzl+9BC9aY
         4yMf6cmDw==
X-HalOne-ID: 216ee96d-8b90-11ed-a170-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay6 (Halon) with ESMTPSA
        id 216ee96d-8b90-11ed-a170-cde5ad41a1dd;
        Tue, 03 Jan 2023 17:57:49 +0000 (UTC)
Date:   Tue, 3 Jan 2023 18:57:48 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Message-ID: <Y7RsnBkgnWbF3uMj@ravnborg.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-1-9b746b858378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-1-9b746b858378@linaro.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

On Tue, Jan 03, 2023 at 03:22:27PM +0100, Neil Armstrong wrote:
> Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/panel/visionox,vtdr6130.yaml  | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> new file mode 100644
> index 000000000000..49e2fd4b4e99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/visionox,vtdr6130.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox VTDR6130 AMOLED DSI Panel
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: visionox,vtdr6130
> +
> +  vddio-supply: true
> +  vci-supply: true
> +  vdd-supply: true
These 3 looks wrong to me, as the above are not documented in panel-common.
But maybe I miss something and this is OK?

	Sam

> +  port: true
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - vddio-supply
> +  - vci-supply
> +  - vdd-supply
> +  - reset-gpios
> +  - port
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    panel {
> +        compatible = "visionox,vtdr6130";
> +
> +        vddio-supply = <&vreg_l12b_1p8>;
> +        vci-supply = <&vreg_l13b_3p0>;
> +        vdd-supply = <&vreg_l11b_1p2>;
> +
> +        reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +        port {
> +            panel0_in: endpoint {
> +                remote-endpoint = <&dsi0_out>;
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
