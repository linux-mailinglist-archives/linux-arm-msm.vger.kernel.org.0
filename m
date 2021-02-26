Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B709132678E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 20:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhBZTtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 14:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhBZTtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 14:49:19 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D255C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:48:39 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id l18so6722342pji.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=R9+krexzdctutm2g/SDSnmi5qwCo0tBvESfodfSYrBU=;
        b=JakAYr+ErFTG/QG3lQvnu885av4/vftIU97ITY208irIL6qFPl4LRGRMCGQ6bSIGnJ
         3cNHy2JNjuk7cfrb9FNC8mr5XkMrqj4cEETBK6utdPs0QaH8UZeU+6lfX3o5kSOA77n9
         1S9aqdDhh+ARfK++F+tCOom36HaUJogDPL9Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=R9+krexzdctutm2g/SDSnmi5qwCo0tBvESfodfSYrBU=;
        b=WpP2PxwfPOxh1CfJMFr7tC60bRgxkuMUD9mtO3eDTE+VNZnA2IX+pC2H6WWmpQFRHh
         Vcs6O54TqsvzOiCuG3ZRTrpUzC8nu7xRGU07aqy16Mx0S7Qh2QY1adJpyvol3T3joxIn
         qcwJUmfTIsUpyl14Yz3CAobzg00lE4xcau2V0TiB4TSPl8s/maEQ8GBHvIhkxM3zY7xt
         6o85yh0tLFPIDbOFDmuJ5TRubf3ov78Ak3TDZ8xkdDVz5oIlicKVofyp4apF4ijEDjP9
         zuW4uO4wdJuh+QlGloV3TiOOByqcILFsLA+u4/jcBYnhv+NsBOWz+kAONmL0b6/0u5aK
         D0zg==
X-Gm-Message-State: AOAM532/KfB6WhUq05FZ+A0jG3/sy6um4htx0spC8IVpMUnmB6yhdboc
        OFmQW9SkHdH8K2G1+JOFQraTdw==
X-Google-Smtp-Source: ABdhPJzhpj6HKbR6Oz0VWmOuwGTpvz5F5QlkepkGdC1sRJ7KtP1Wl9PTF2yMcBP7GMW3Tm5Jly05ng==
X-Received: by 2002:a17:90a:e616:: with SMTP id j22mr4996009pjy.190.1614368918464;
        Fri, 26 Feb 2021 11:48:38 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id o3sm9373289pgm.60.2021.02.26.11.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:48:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613127000-3015-2-git-send-email-mkrishn@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org> <1613127000-3015-2-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v12 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 26 Feb 2021 11:48:36 -0800
Message-ID: <161436891644.1254594.659429599773935055@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-12 02:49:58)
> Add YAML schema for the device tree bindings for DSI
>=20
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>=20
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
>=20
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
>=20
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 201 +++++++++++++++=
++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------=
------
>  2 files changed, 201 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-con=
troller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> new file mode 100644
> index 0000000..2e9269d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI controller.
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
> +    items:
> +      - description: Address offset and size for dsi register set
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
> +    minItems: 1

maxItems:1 ?

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
> +
> +  ports:
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode as defined in
> +      Documentation/devicetree/bindings/graph.txt and
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
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
> +                  See Documentation/devicetree/bindings/graph.txt for
> +                  device graph info.
> +
> +              data-lanes:
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
 DT bindings. See
> +                  Documentation/devicetree/bindings/media/video-interfac=
es.txt for
> +                  more info on the data-lanes property.
> +
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3

Is data-lanes not already covered by some more generic binding?

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
> +     soc {
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;

Please remove soc from the example

> +
> +       dsi@ae94000 {
> +           compatible =3D "qcom,mdss-dsi-ctrl";
> +           reg =3D <0 0x0ae94000 0 0x400>;
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
> +       };
> +     };
> +...
