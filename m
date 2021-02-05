Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E4311898
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 03:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhBFCmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 21:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhBFCil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 21:38:41 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CA9C08ECA6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 14:34:47 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id b145so5279474pfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XDX1Uk6gHPmMaIAVv43TEENxArIFJ9A9Ns9WicOR0qk=;
        b=CyZM3eAqRT+nH732eFHue3xRm40RDjX1zYxBD8x6nHigQMuAmuIEACdAeAZwT8R5Zk
         AFJ+I+Hbwj1dxB4d5qp8eJrJf45r8z6Jf9X+SkEnpvpxIItD9kAENQv5/vZAK3gmnjOf
         cza01OCZubvaxOXT26R0CVIMMOSK1HhNTNc4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XDX1Uk6gHPmMaIAVv43TEENxArIFJ9A9Ns9WicOR0qk=;
        b=WA9dx+mRuNPnjSNcuVzgzhtwinLchcndUvQvQaJ8ZPpT58K+63BaHswBy4hmGSnqAt
         NCDGFSehuCAvaFsuhxMCI1TII+ysqT7cj7NJqQAwdMjQQtWiFj0W1Vw533wFcNOhD16p
         UaO9Ydu0gCwN56UlTVIEpnWXNl3PBBp1GA/s5e3ryZHZAeK087BfK8Cld2TQvBLRja2K
         gX+R4RV+u5VEYmmSFJ1kUMG3js9zyciujFY4Vbs6MaJ2MFo2EakvcOHNsH181wjSrray
         Z+z1LCaR4X50f5iMWAPNzCUNcRECGyDVWmSFl6fQfPY0GZObGZQ4CrMd6/J/DCyIEoAW
         ZEPQ==
X-Gm-Message-State: AOAM5309LzoCV+DF6Q2aQaYL2+w+EG/dml5HGx/KAMoGNFL2+zQxAQ3L
        7iFX+Yk0j6Jo6PDAgPx0tylrZA==
X-Google-Smtp-Source: ABdhPJyZgzV2qGFep0N0l/JwCMBlS86MuZlkjaO3/ziLJCQWBrLy8yBZXk/zIo4HLbzg+IkvZQLuUg==
X-Received: by 2002:a65:5903:: with SMTP id f3mr6735185pgu.28.1612564486743;
        Fri, 05 Feb 2021 14:34:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
        by smtp.gmail.com with ESMTPSA id c77sm10651355pfc.214.2021.02.05.14.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 14:34:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612420939-15502-2-git-send-email-mkrishn@codeaurora.org>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org> <1612420939-15502-2-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v10 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 05 Feb 2021 14:34:43 -0800
Message-ID: <161256448377.76967.104870400778698831@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-03 22:42:17)
> Add YAML schema for the device tree bindings for DSI
> controller.
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
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 233 +++++++++++++++=
++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------=
------
>  2 files changed, 233 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-con=
troller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> new file mode 100644
> index 0000000..9177d01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -0,0 +1,233 @@
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
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6

Drop maxItems? Or are some clks optional sometimes?

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
> +
> +  phy-names:
> +    const: dsi
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  qcom,mdss-mdp-transfer-time-us:
> +    description: |
> +      Specifies the DSI transfer time for command mode
> +      panels in microseconds. Driver uses this number to adjust
> +      the clock rate according to the expected transfer time.
> +      Increasing this value would slow down the mdp processing
> +      and can result in slower performance.
> +      Decreasing this value can speed up the mdp processing,
> +      but this can also impact power consumption.
> +      As a rule this time should not be higher than the time
> +      that would be expected with the processing at the
> +      DSI link rate since anyways this would be the maximum
> +      transfer time that could be achieved.
> +      If ping pong split is enabled, this time should not be higher
> +      than two times the DSI link rate time.
> +      This is an optional property.
> +    default: 14000

Why is this in DT vs. being tweaked from userspace? This was there
before but it isn't used anywhere in an upstream DTS file so please drop
it.

> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving a panel which needs
> +      2 DSI links.

Shouldn't this be apparent from the OF graph indicating two DSI
endpoints?

> +
> +  qcom,master-dsi:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving the master link of
> +      the 2-DSI panel.

When is this not the case? This property looks like some sort of
workaround for driver probe ordering. It was there before though so I
guess this is fine.

> +
> +  qcom,sync-dual-dsi:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving a 2-DSI panel whose
> +      2 links need receive command simultaneously.

Feels like it should be a property of the panel node?

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

The soc node can be left out.

> +
> +       mdss@ae00000 {

subsystem?

> +         #address-cells =3D <2>;
> +         #size-cells =3D <2>;
> +         reg =3D <0 0xae00000 0 0x1000>;
> +         interrupt-controller;
> +         #interrupt-cells =3D <1>;
> +
> +         dsi@ae94000 {
> +           compatible =3D "qcom,mdss-dsi-ctrl";
