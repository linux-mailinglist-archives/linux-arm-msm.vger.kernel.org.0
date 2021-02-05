Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FFE3110B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 20:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhBERWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 12:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbhBERU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 12:20:29 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4CFC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 11:02:11 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id j12so4932735pfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 11:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bl40gkkFN/bA1kkwveFuplVIAUksJdcdWeCKd3VreAI=;
        b=SNm/i6+Z0Jef68rrwtv8SYMY+SpCHOCwvmR2uYCnQ8K8ENOx0yn1HQt6d+XHqIQoVG
         yVY7ZFZ9aoLlIJzR6w5Qsys21J1ycBET4eaK/BIdnvaYwV6Mos+/tBSKHg3cRIqUM8Rb
         X89i1YSDCDrSGVyi7w5vxpdxmZcOMJvjHW4Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bl40gkkFN/bA1kkwveFuplVIAUksJdcdWeCKd3VreAI=;
        b=WM15ZvBjD8zSL8yGLp/oze8uvUewNl3Lfl6zwKpCXKu6TyVNjv3C4SmLSIGwT9vBfp
         XIUF6EQTwTYc9+VMKCoXVrS7PJTzgrBLnMS1ys34/BKSsoAj4NeKaI+uxkaschcrBiKJ
         pXlw4t/nKnXTZeahma1JBff/D+brSYDGSdbLy771xXKY+NCTwEoNXGtR1tI9V5UNe0qs
         yPBiylyy5c/ikSkQVgsNpEk/TTEPj4VaIE1VSHaGjAGhPEUNodvsfAR+R8+QRLZNy6MT
         D2g14y7ocRPE0nVWfkyOSoZoMJ7sFsDN7xRjfgTZYDHhsWB6g5mdZT1Ruv9zFJhBF+l1
         wkWQ==
X-Gm-Message-State: AOAM530TTGXjNn0Q0lYmafk9zYHxAUdwyemsHReU5xy0TJ3ZRDG1Q8GD
        tzyt9mZNWRLN17mQevgCfEHgOA==
X-Google-Smtp-Source: ABdhPJyoZbz7T5q5NX0oOqwNPDv6bo3vMpc1rYtlHUIcjqA224hDwrfouIUXdRuu5Q+RyIoFrF3mVg==
X-Received: by 2002:a63:5f83:: with SMTP id t125mr5516383pgb.405.1612551730707;
        Fri, 05 Feb 2021 11:02:10 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
        by smtp.gmail.com with ESMTPSA id k9sm8782522pji.8.2021.02.05.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 11:02:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612420939-15502-4-git-send-email-mkrishn@codeaurora.org>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org> <1612420939-15502-4-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v10 4/4] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Vara Reddy <varar@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 05 Feb 2021 11:02:08 -0800
Message-ID: <161255172811.76967.16401619378965156134@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-03 22:42:19)
> Add bindings for Snapdragon DisplayPort controller driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>=20
[...]
>=20
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list

Where's that maintainer file update?

> ---
>  .../bindings/display/msm/dp-controller.yaml        | 157 +++++++++++++++=
++++++
>  .../bindings/display/msm/dpu-sc7180.yaml           |  10 ++
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-cont=
roller.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> new file mode 100644
> index 0000000..2b71c7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MSM Display Port Controller
> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>

This email is bouncing. Please remove Chandan.

> +  - Vara Reddy <varar@codeaurora.org>
> +  - Kuogee Hsieh <khsieh@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DisplayPort host controller for MSM targets
> +  that are compatible with VESA DisplayPort interface specification.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-dp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AHB clock to enable register access
> +      - description: Display Port AUX clock
> +      - description: Display Port Link clock
> +      - description: Link interface clock between DP and PHY
> +      - description: Display Port Pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core_aux
> +      - const: ctrl_link
> +      - const: ctrl_link_iface
> +      - const: stream_pixel
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dp
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ports:
> +    type: object
> +    description: |
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: Input endpoint of the controller
> +
> +      port@1:
> +        type: object
> +        description: Output endpoint of the controller
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    additionalProperties: false
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - "#sound-dai-cells"
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/power/qcom-aoss-qmp.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    mdss@ae00000 {

mdss is not a standard node name. Maybe 'subsystem'?

> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      reg =3D <0xae00000 0x1000>,   /* mdss */
> +            <0xae90000 0x1400>;   /* dp */

This second reg property shouldn't be here.

> +      reg-names =3D "mdss", "dp";
> +
> +      displayport-controller@ae90000 {
