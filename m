Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814A7349C89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 23:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhCYWsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 18:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhCYWsm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 18:48:42 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF5AC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:48:42 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so3331137pjh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OFlHHYmPA7G+puKyH4QpDiWTnKeP5nqEj0gvr2CybHQ=;
        b=F24JPULliNXvhBXqLNrP5TABa/1iwnOEHfVNNWPnkUcH8XmCCsWiywGzoFMAv0xhdd
         oFMIKnfRMopKX64w5T7/UP2Lnfbpwp342oVecTeMKNk23OgmHTQL5B8tl6YHdA1P5vpq
         pF1XHBA8YSwDvBEyAWA/fhIGHHUg5USCjZnfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OFlHHYmPA7G+puKyH4QpDiWTnKeP5nqEj0gvr2CybHQ=;
        b=L/llsyE7piWIpkt9HOpXd36PrlZkb0uXP1jqHQwlGuZ1qel0IVdJHL4zK9wpeIKkZB
         v8SR2PHC2FjwAmXb3gNtYetTFrQcrJR/1JlCHMxNkzM0uA3KUDHOv6Nz662L6qQS4oi0
         L0yzPAMwu859rnUc4qcEJYAHysBqfMKSuniGKL6530YstN9G3aQheKbdcBzdp2iK3oE4
         WT+bB01M88P/93LI5sknHiW9eNJhJHnfF9DOb3+vQpm3HQ2kmxoRfAkTCxsHJBWG4Nf1
         +lSYa+A9OP6KF76+EhBE/3abce6ziCgwTvEHJsCEyzPBH9sLBAzmFYL5wWMJbhzQi7mU
         AzRA==
X-Gm-Message-State: AOAM5320C6o06U2Fa10EAr3gaOIhpNjNm9LY083LZZSktmmwI1JogrgR
        58uIenVx7O3iGkYetDJxi5GtUw==
X-Google-Smtp-Source: ABdhPJzxmDgeEZr0rcJLSx/9ql8+97rdgJ7/OoUIdR6l4QvQnQMjilIPUbrcM8PeZFvaUMqdTFhjXQ==
X-Received: by 2002:a17:90a:20c:: with SMTP id c12mr10696530pjc.224.1616712521710;
        Thu, 25 Mar 2021 15:48:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id o20sm6493458pfu.154.2021.03.25.15.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:48:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616673661-20038-2-git-send-email-mkrishn@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-2-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v14 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Thu, 25 Mar 2021 15:48:39 -0700
Message-ID: <161671251936.3012082.3586424644481620700@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-25 05:00:59)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> new file mode 100644
> index 0000000..ee5e3b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI controller
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
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

Shouldn't these port objects have required property lists?

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
> +
> +    required:
> +      - port@0
> +      - port@1

And this should require #address-cells and #size-cells?

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

Maybe this should be additionalProperties: false instead so that we can
catch things missing from the example.

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
> +                                   remote-endpoint =3D <&sn65dsi86_in>;
> +                                   data-lanes =3D <0 1 2 3>;
> +                          };
> +                  };
> +           };
> +     };
> +...
