Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25912D8237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 23:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406983AbgLKWhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 17:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406970AbgLKWhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 17:37:21 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A35BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:36:41 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id l23so3099150pjg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 14:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=24YCUOquw0ve3MGiTluGZKpGPwqvPT7CLDdCgR3XMhA=;
        b=dDWJ9MgkAl5kyIjHQ1zxXFmEh+hiASNs0NSI25mHe6eFZWvlAYEAdRaAODfo1JACE7
         Odf3CXH7zjkM993YN1Ilzs9kUyoL1BByPjcLJEXWO7FkyhyK2eZTaWTZSFVEKXkoCP0F
         UMD7uKG5/Pa8HH2G3mKHKxAtuE+FZpBvfMLEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=24YCUOquw0ve3MGiTluGZKpGPwqvPT7CLDdCgR3XMhA=;
        b=F2YxezJ9bC6y4JCB1mt8CZoJJZncVqVmQNhCR3GfCfmwAomlX+C4k/WrmtaVcX+8k8
         fxoSeNvQdiEckwfhqczPtsX3SjhflspsyadSa1lEMH97wPq7HSxCahmYlYD/ulUD0kp4
         gdokQQWnc7zoCRq8LKubzYbmv4K5nDeRNdXVzse0wV3eOOVtzKRg2Hsc832k5XPFhwrp
         aeitS8wMtQod7Ul+i6hzEPtAHTZCFLExg2S477TXhFZ6B0vPdyp+qMc8TduR2PVmalRN
         pWeMe9uXe1mcJkyRki9dGiJmGaetbJCXsIEn2Mh3pQ+ZqQC7CID3l3r7EaJ2PV6lyRmt
         6rgQ==
X-Gm-Message-State: AOAM531VwnkKQ+q5iOZYX2VYddfNv2sVnSjBaRD4U1hCZyHqZbZTCasF
        t9c5n6nCYzcmcn2NEoM5WC2iYA==
X-Google-Smtp-Source: ABdhPJyBM6CoGVTZvq8zbmEEcVsl6BdhdPA95SqIaNaS/yHEPp7AS5fTW15sXJNMRKpOKpQuXVE7QQ==
X-Received: by 2002:a17:90a:e38c:: with SMTP id b12mr15275232pjz.177.1607726200624;
        Fri, 11 Dec 2020 14:36:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l190sm11685658pfl.205.2020.12.11.14.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:36:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1607670585-26438-2-git-send-email-mkrishn@codeaurora.org>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org> <1607670585-26438-2-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v9 2/2] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 11 Dec 2020 14:36:38 -0800
Message-ID: <160772619842.1580929.2107809673048637455@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2020-12-10 23:09:45)
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>=20
> Previous Change log:
> https://lkml.kernel.org/lkml/1597066683-6044-2-git-send-email-mkrishn@cod=
eaurora.org/

Why can't that be put in here instead of making me click the link?

> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> new file mode 100644
> index 0000000..bc80632
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)

Why two spaces between 'only and 'OR'?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MSM Display Port Controller.

Drop the full-stop?

> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> +  - Vara Reddy <varar@codeaurora.org>
> +  - Tanmay Shah <tanmay@codeaurora.org>
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

There should be a dp-phy too, so 'phy' and 'phy-names' property. I see a
'power-domains' property downstream, so please add that too. And also
'#sound-dai-cells".

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
> +        description: Input endpoint of the controller.
> +
> +      port@1:
> +        type: object
> +        description: Output endpoint of the controller.

This should have a required section too, and state that all the above
properties are required.

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +
> +    mdss: mdss {

Can drop the label. Also this node name is bad! Should be
'subsystem@<reg>' I guess? And then the reg can just be the first
address in a reg property that is remapped for the children nodes.

> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      interrupt-controller;
> +
> +      msm_dp: displayport-controller@ae90000 {

Can drop the label.

> +        compatible =3D "qcom,sc7180-dp";
> +        reg =3D <0 0xae90000 0 0x1400>;
> +        interrupt-parent =3D <&mdss>;
> +        interrupts =3D <12>;
> +        clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +        clock-names =3D "core_iface", "core_aux",
> +                      "ctrl_link",
> +                      "ctrl_link_iface", "stream_pixel";
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dp_in: endpoint {

Can drop the label.

> +                    remote-endpoint =3D <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dp_out: endpoint {

Can drop the label and show some remote-endpoint connection?

> +                };
> +            };
> +        };
> +      };
> +    };
> +...
