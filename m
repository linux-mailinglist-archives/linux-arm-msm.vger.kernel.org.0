Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F55B33A1B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 23:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhCMWkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 17:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbhCMWkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 17:40:02 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F302EC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 14:40:01 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id s21so6912164pjq.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 14:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9orrjK+nZo0zoTT5QVGst4fqvaAY3vYH2RjbTE7PZSE=;
        b=bY4Flt1Vwr0azjmFEIPeX0TGwxynkVJEI0tkEixm6/aBKSkkZGvctIllaQw0/Kj9dM
         yhIpucLH167N0hqo0iEw0X02crPBhj+pGfIP5l68fuYCRCelT7GrBB8KefoW2f7IUZA7
         rSGqgot8/sOKTflkuIXU8oDrI5fYA0brYy44I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9orrjK+nZo0zoTT5QVGst4fqvaAY3vYH2RjbTE7PZSE=;
        b=R1w0u8DiIOdMCHO48+aBKTxyiIe09uYBHAwCNrqJtjRfEQTD083QtTEe4rRzkQJ43G
         CleGYSQXKCkqWGN04CahG0q/yqvrAn6sYFHJve4Q4Wq43FRHRWl20qhe/nRQtLSIF4/n
         tIsae37LgDJ114rem1QVUGgP4m9AVOm6EEvmQZCAatrxc76sOccrSbv0FK4BYVNeSDVo
         TfZL6IP4+G/bWOjzTjM8yCNG794MZFKdzI/2RNsR0IWfNc1cVTA93eFGXCdL5mPJOhGq
         phyMFKV3ZBwOR7AJmcDaPRdE1W6nRCm5jn9+LAIil0CfxnyCrPZ1qeOB/OlCBe0zPMus
         rHcA==
X-Gm-Message-State: AOAM533Ozxu6s2grXl4fQD7qNQrnWXbU61V7NBgvPIXlmozJOHRwR9bN
        MQrgUxQhkkr/2lFvToExYAvbHA==
X-Google-Smtp-Source: ABdhPJwFvxXz3ZFNsO1erzvgfn3XC9rNR+NF9/vcU9eje4G8Z6GI85AXCXAkf801Q+sNGJuEuDiCLA==
X-Received: by 2002:a17:902:e54c:b029:e5:e7cf:d746 with SMTP id n12-20020a170902e54cb02900e5e7cfd746mr4878515plf.56.1615675201347;
        Sat, 13 Mar 2021 14:40:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id j3sm6508512pjf.36.2021.03.13.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 14:40:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614950952-13351-2-git-send-email-mkrishn@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org> <1614950952-13351-2-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v13 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Sat, 13 Mar 2021 14:39:59 -0800
Message-ID: <161567519933.1478170.8536263180813085792@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-05 05:29:10)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> new file mode 100644
> index 0000000..520723a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties

Maybe just 'Qualcomm Display DSI controller"

> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI controller.

Maybe drop this description as it doesn't provide anything more than the
title.

> +
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display byte clock
> +      - description: Display byte interface clock
> +      - description: Display pixel clock
> +      - description: Display escape clock
> +      - description: Display AHB clock
> +      - description: Display AXI clock
> +
> +  clock-names:
> +    items:
> +      - const: byte
> +      - const: byte_intf
> +      - const: pixel
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving a panel which needs
> +      2 DSI links.
> +
> +  qcom,master-dsi:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving the master link of
> +      the 2-DSI panel.

Can this be inferred from 'clock-master' from the dsi binding?

> +
> +  ports:
> +    $ref: "/schemas/graph.yaml#/properties/port"
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode.
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint:
> +                description: |
> +                  For port@0, set to phandle of the connected panel/brid=
ge's
> +                  input endpoint. For port@1, set to the MDP interface o=
utput.
> +
> +              data-lanes:
> +                $ref: "/schemas/media/video-interfaces.yaml#"
> +                description: |
> +                  This describes how the physical DSI data lanes are map=
ped
> +                  to the logical lanes on the given platform. The value =
contained in
> +                  index n describes what physical lane is mapped to the =
logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane =
position is fixed
> +                  and can't be changed. Hence, they aren't a part of the=
 DT bindings.
> +
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3

Can we have data-lanes in the example? I think we need required: for
these port nodes too so we know which properties are required for the
ports.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     dsi@ae94000 {
> +           compatible =3D "qcom,mdss-dsi-ctrl";
> +           reg =3D <0x0ae94000 0x400>;
> +           reg-names =3D "dsi_ctrl";
> +
> +           interrupt-parent =3D <&mdss>;
> +           interrupts =3D <4>;
> +
> +           clocks =3D <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +           clock-names =3D "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys =3D <&dsi0_phy>;
> +           phy-names =3D "dsi";
> +
> +           ports {
> +                  #address-cells =3D <1>;
> +                  #size-cells =3D <0>;
> +
> +                  port@0 {
> +                          reg =3D <0>;
> +                          dsi0_in: endpoint {
> +                                   remote-endpoint =3D <&dpu_intf1_out>;
> +                          };
> +                  };
> +
> +                  port@1 {
> +                          reg =3D <1>;
> +                          dsi0_out: endpoint {
> +                          };
> +                  };
> +           };
> +     };
> +...
