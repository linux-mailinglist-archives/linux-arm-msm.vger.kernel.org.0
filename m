Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4258A3A5631
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jun 2021 06:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhFMEVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Jun 2021 00:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhFMEVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Jun 2021 00:21:06 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023BAC061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 21:18:56 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id h9so10583841oih.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 21:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rENYX8baibT1F6ebeTktR9VC4kuSvLpcFb0ZjhVaxhU=;
        b=PuDtHc0sQihfNzff23unpPBYWmOqQZCNL1NN04iGwg+xBDnN60VTAsFJS/pVRuypWr
         5Ez1Y0+EzPKCZtbLiXkAgIXbZfcaYE06PrMWoByTH9klNb38Xr1hX4/Kvgbn3p/M3tlw
         OLyCE/qKW2p/qBruupZpqZlu361OrK+KpPtT8ApIvgiH5t7Jefx9HjNtHIRzbvILeWiu
         eGWQ28WY8NRQtbxIm3WhYn6p9x1VuXYPntYG2SPH3PnzkhVkymychBKeaFGQCfknD1M3
         RvY7XNvW4000Qj+T0NLuSrUa04al+g7Zgwd1/RKfDtcoO5IXsrUouyQIJb20hxsPb/Ng
         LDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rENYX8baibT1F6ebeTktR9VC4kuSvLpcFb0ZjhVaxhU=;
        b=pHufy9LFHNS2sKbbOCbXuo0qEmw2jOy8MI489vr5MGSI5NHjZFsSfNRrCWOqFeDf9m
         7JW6e/wuoQz0FUHADfv5BbXdTZByGkrU+DzohTgsLJb/svkWgzdgPJFiIDjAGO3DHT8Z
         QwA8PbU1y1FoHLT49B2lgag+nm9vZlP2V0tAJ7Bihol3J9cIXY8XjmiUcExPmx2JJsGb
         7uosMe5Pk4x6GzsDSOgCS+TzbMDDtDmOyckIW1FXfn1EGXBtklVX+blMkHgtBMtHOSfD
         tziohcGquyfSgtlYwBrMrxnmaViZv8eut6Y7gWaL/gy/UZ2QNN7/CJ7OvggDQLpRWUrQ
         F5rA==
X-Gm-Message-State: AOAM533ahCUufhSI4pzDctm6V76LYu1zs0rGwKVgZJGsJ1/eq4BnaG1N
        tUp8sEm3+R1R3bNa8Wg+iHUCrw==
X-Google-Smtp-Source: ABdhPJwKy/WnhgiuARyk7OIDkUpgFqBS9kpf9d3v58WPuX5WQaQTRJ5A08aElcicaU7eM3f79Ynw8g==
X-Received: by 2002:aca:3102:: with SMTP id x2mr13928303oix.112.1623557935989;
        Sat, 12 Jun 2021 21:18:55 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w11sm2195627oov.19.2021.06.12.21.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 21:18:55 -0700 (PDT)
Date:   Sat, 12 Jun 2021 23:18:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: input: add Qualcomm QPNP haptics driver
Message-ID: <YMWHLb3aOjuSG5t9@yoga>
References: <20210612205405.1233588-1-caleb@connolly.tech>
 <20210612205405.1233588-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612205405.1233588-2-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 12 Jun 15:54 CDT 2021, Caleb Connolly wrote:

> Add bindings for pmi8998 qpnp haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,qpnp-haptics.yaml     | 123 ++++++++++++++++++
>  include/dt-bindings/input/qcom,qpnp-haptics.h |  31 +++++
>  2 files changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
>  create mode 100644 include/dt-bindings/input/qcom,qpnp-haptics.h
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
> new file mode 100644
> index 000000000000..81dd8d6321f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,qpnp-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc PMI8998 QPNP haptics
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +  QPNP (Qualcomm Technologies, Inc. Plug N Play) Haptics is a peripheral on some
> +  QTI PMICs. It supports linear resonant actuators commonly found in mobile devices.

Please avoid the Plug'n Play naming, just go with Qualcomm SPMI Haptics

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qpnp-haptics

qcom,spmi-haptics

But could we also have some pmic-specific compatibles in the binding?
Even though we might not need them in the driver today.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2

I don't think you need minItems, when you list the "items"

> +    items:
> +      - description: short circuit interrupt
> +      - description: play interrupt
> +
> +  interrupt-names:
> +    minItems: 2
> +    items:
> +      - const: short
> +      - const: play
> +
> +  qcom,actuator-type:
> +    description: |
> +      The type of actuator attached to the hardware.
> +      Allowed values are,
> +        0 - HAP_TYPE_LRA
> +        1 - HAP_TYPE_ERM
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0
> +
> +  qcom,wave-shape:
> +    description: |
> +      Selects the wave shape to use.
> +      Allowed values are,
> +        0 - HAP_WAVE_SINE
> +        1 - HAP_WAVE_SQUARE
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0
> +
> +  qcom,play-mode:
> +    description: |
> +      Selects the play mode to use.
> +      Allowed values are,
> +        0 - HAP_PLAY_DIRECT
> +        1 - HAP_PLAY_BUFFER
> +        2 - HAP_PLAY_AUDIO
> +        3 - HAP_PLAY_PWM
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 2
> +
> +  qcom,wave-play-rate-us:
> +    description: |
> +      Wave sample durection in microseconds, 1/f where f
> +      is the resonant frequency of the actuator.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 20475
> +
> +  qcom,brake-pattern:
> +    minItems: 4

It's also maxItems: 4, right?

> +    description: |
> +      The brake pattern are the strengths of the pattern
> +      used to brake the haptics. Allowed values are,
> +        0 - 0V
> +        1 - Vmax/4
> +        2 - Vmax/2
> +        3 - Vmax
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    default: [0x3, 0x3, 0x2, 0x1]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - qcom,wave-play-rate-us
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/qcom,qpnp-haptics.h>

Would be nice with a blank line here.

> +    pmi8998_lsid1: pmic@3 {
> +      compatible = "qcom,pmi8998", "qcom,spmi-pmic";
> +      reg = <0x3 SPMI_USID>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      qpnp_haptics: qcom,haptics@c000 {

No "qcom," in the node name please.

> +        compatible = "qcom,qpnp-haptics";
> +        reg = <0xc000 0x100>;

With #size-cells = <0> this means that you have 2 regs, but binding says
that you may only have one.

> +
> +        interrupts = <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +              <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;

I don't think the '<' on those two lines are lining up.

Regards,
Bjorn

> +        interrupt-names = "short", "play";
> +
> +        qcom,actuator-type = <HAP_TYPE_LRA>;
> +        qcom,wave-shape = <HAP_WAVE_SINE>;
> +        qcom,play-mode = <HAP_PLAY_BUFFER>;
> +        qcom,brake-pattern = <0x3 0x3 0x2 0x1>;
> +
> +        qcom,wave-play-rate-us = <4255>;
> +      };
> +    };
> diff --git a/include/dt-bindings/input/qcom,qpnp-haptics.h b/include/dt-bindings/input/qcom,qpnp-haptics.h
> new file mode 100644
> index 000000000000..bfbec041484c
> --- /dev/null
> +++ b/include/dt-bindings/input/qcom,qpnp-haptics.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This header provides constants for pmi8998 qpnp haptics options.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_
> +#define _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_
> +
> +// Actuator types
> +#define HAP_TYPE_LRA		0
> +#define HAP_TYPE_ERM		1
> +
> +// LRA Wave type
> +#define HAP_WAVE_SINE		0
> +#define HAP_WAVE_SQUARE		1
> +
> +// Play modes
> +#define HAP_PLAY_DIRECT		0
> +#define HAP_PLAY_BUFFER		1
> +#define HAP_PLAY_AUDIO		2
> +#define HAP_PLAY_PWM		3
> +
> +#define HAP_PLAY_MAX		HAP_PLAY_PWM
> +
> +#define HAP_AUTO_RES_NONE	0
> +#define HAP_AUTO_RES_ZXD	1
> +#define HAP_AUTO_RES_QWD	2
> +#define HAP_AUTO_RES_MAX_QWD	3
> +#define HAP_AUTO_RES_ZXD_EOP	4
> +
> +#endif /* _DT_BINDINGS_QCOM_PMIC_QPNP_HAPTICS_ */
> --
> 2.31.1
> 
> 
