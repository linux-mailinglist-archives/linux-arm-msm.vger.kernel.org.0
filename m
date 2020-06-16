Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BFF1FAEB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 12:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFPKze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 06:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgFPKzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 06:55:33 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C6FC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 03:55:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 35so2885632ple.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=P0rgsD9Ct3sLOZeZyHD1bcKF15pZ4X0Ei5Mx+pWd/mE=;
        b=cBsuKjhLkk1YAPB7IC/X7x2KOOKUVv74p6wbbgrNn2JTfuq18XCdwqJyCWw++F2IzP
         JuI0h9NIrPM+DIvEQvk3oL6QP06TuIZbGoca4/oVtHisrsbqt3wA7YbjQnZqPnw9b/F+
         WbPuH9UTZHbsPLWtIuJ4xuPU9Y6qNi0DhSKpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=P0rgsD9Ct3sLOZeZyHD1bcKF15pZ4X0Ei5Mx+pWd/mE=;
        b=A94PwBf8W9Z4Ewmp7/tsuHv2l45+K7efOXATc6pwzEJBENu/SCc6hTryW3tVmj948D
         BpIbIQa76k6yRNjY04+fZ+xP7BhBUlYu06XmGc0jnNQVqDb9gyb3/4P/Z8zjmdmvzdZM
         VjDWn7zEIbrIQMhahzYwDZPZ8lXV5CLyoHGLEaW5KxZ4Cs0t0ZnnWiG6Aeia1AubOWM4
         mfnJmARFlygQbnMCDQh6D1t9MoabwYGeEHIZKbhYohKNd2uaoN7E4jWgIAOPUQ7ZwjbX
         m4p8oVwu5+uMOdBxqmRl+CTfN7zGYcL0pivvREMGUjUf4sff4bUi6ojFNZgh/+ogiPyZ
         7byw==
X-Gm-Message-State: AOAM530xe6p5ZGSX9cSi9A7TGMG7cBNpIk8DWE+/wcSGVWSSTpWUQPK2
        oJ5tAR1i28Gn6t9+IgHgaDhraA==
X-Google-Smtp-Source: ABdhPJzuT0DcmntlVBwDdeDpH39DGEE13XccI71h8P1IxymNV+mNcmeovPxHUeQTw13PqWjyh0ScDw==
X-Received: by 2002:a17:90a:c5:: with SMTP id v5mr2281693pjd.226.1592304930604;
        Tue, 16 Jun 2020 03:55:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p30sm14059553pgn.58.2020.06.16.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 03:55:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d6db52a33ac787c0fe6134ca32c06007@codeaurora.org>
References: <20200609033818.9028-1-tanmay@codeaurora.org> <159175530931.242598.4696487926885071106@swboyd.mtv.corp.google.com> <d6db52a33ac787c0fe6134ca32c06007@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, sam@ravnborg.org,
        seanpaul@chromium.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Vara Reddy <varar@codeaurora.org>
To:     tanmay@codeaurora.org
Date:   Tue, 16 Jun 2020 03:55:28 -0700
Message-ID: <159230492894.62212.17830740055624171310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting tanmay@codeaurora.org (2020-06-11 13:07:09)
> On 2020-06-09 19:15, Stephen Boyd wrote:
> > Quoting Tanmay Shah (2020-06-08 20:38:18)
> >> diff --git=20
> >> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml=20
> >> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> >> new file mode 100644
> >> index 0000000..5fdb915
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> >=20
> > Typically the file name matches the compatible string. But the
> > compatible string is just qcom,dp-display. Maybe the compatible string
> > should be qcom,sc7180-dp? Notice that the SoC number comes first as is
> > preferred.
> >=20
> These bindings will be similar for upcoming SOC as well.
> So just for understanding, when we add new SOC do we create new file=20
> with same bidings
> with SOC number in new file name?
> Instead we can keep this file's name as qcom,dp-display.yaml (same as=20
> compatible const) and we can include SOC number in compatible enum ?
> some examples:
> https://patchwork.kernel.org/patch/11448357/
> https://patchwork.kernel.org/patch/11164619/

Yes that works too. It's really up to robh here.

> >=20
> >> @@ -0,0 +1,142 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Display Port Controller.
> >> +
> >> +maintainers:
> >> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> >> +  - Vara Reddy <varar@codeaurora.org>
> >> +  - Tanmay Shah <tanmay@codeaurora.org>
> >> +
> >> +description: |
> >> +  Device tree bindings for MSM Display Port which supports DP host=20
> >> controllers
> >> +  that are compatible with VESA Display Port interface specification.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: qcom,dp-display
> >> +
> >> +  cell-index:
> >> +    description: Specifies the controller instance.
> >> +
> >> +  reg:
> >> +    items:
> >> +      - description: DP controller registers
> >> +
> >> +  interrupts:
> >> +    description: The interrupt signal from the DP block.
> >> +
> >> +  clocks:
> >> +    description: List of clock specifiers for clocks needed by the=20
> >> device.
> >> +    items:
> >> +      - description: Display Port AUX clock
> >> +      - description: Display Port Link clock
> >> +      - description: Link interface clock between DP and PHY
> >> +      - description: Display Port Pixel clock
> >> +      - description: Root clock generator for pixel clock
> >> +
> >> +  clock-names:
> >> +    description: |
> >> +      Device clock names in the same order as mentioned in clocks=20
> >> property.
> >> +      The required clocks are mentioned below.
> >> +    items:
> >> +      - const: core_aux
> >> +      - const: ctrl_link
> >> +      - const: ctrl_link_iface
> >> +      - const: stream_pixel
> >> +      - const: pixel_rcg
> >=20
> > Why not just 'pixel'? And why is the root clk generator important? It
> > looks like this binding should be using the assigned clock parents
> > property instead so that it doesn't have to call clk_set_parent()
> > explicitly.
> >=20
> Are we talking about renaming stream_pixel to pixel only?
> We divide clocks in categories: core, control and stream clock.
> Similar terminology will be used in subsequent driver patches as well.
>=20
> We can remove pixel_rcg use assigned clock parents property and remove=20
> clk_set_parent
> from driver.

Cool. Using assigned clock parents is good.

>=20
> >> +  "#clock-cells":
> >> +    const: 1
> >> +
> >> +  vdda-1p2-supply:
> >> +    description: phandle to vdda 1.2V regulator node.
> >> +
> >> +  vdda-0p9-supply:
> >> +    description: phandle to vdda 0.9V regulator node.
> >> +
> >> +  data-lanes =3D <0 1>:
> >=20
> > Is this correct? We can have =3D <value> in the property name? Also fee=
ls
> > generic and possibly should come from the phy binding instead of from
> > the controller binding.
> >=20
> We are using this property in DP controller programming sequence such as =

> link training.
> So I think we can keep this here.
> You are right about <value>. <0 1> part should be in example only. It=20
> was passing through dt_binding_check though.
> Here it should be like:
> data-lanes:
> minItems:1
> maxItems:4

Ok.

>=20
> >> +    type: object
> >> +    description: Maximum number of lanes that can be used for Display=
=20
> >> port.
> >> +
> >> +  ports:
> >> +    description: |
> >> +       Contains display port controller endpoint subnode.
> >> +       remote-endpoint: |
> >> +         For port@0, set to phandle of the connected panel/bridge's
> >> +         input endpoint. For port@1, set to the DPU interface output.
> >> +         Documentation/devicetree/bindings/graph.txt and
> >> +        =20
> >> Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >> +patternProperties:
> >> +  "^aux-cfg([0-9])-settings$":
> >> +    type: object
> >> +    description: |
> >> +      Specifies the DP AUX configuration [0-9] settings.
> >> +      The first entry in this array corresponds to the register=20
> >> offset
> >> +      within DP AUX, while the remaining entries indicate the
> >> +      programmable values.
> >=20
> > I'd prefer this was removed from the binding and hardcoded in the=20
> > driver
> > until we can understand what the values are. If they're not
> > understandable then they most likely don't change and should be done in
> > the driver.
> >=20
> Typically customers tune these values by working with vendor. So for=20
> different boards it can be different. Even though it is hard for=20
> customers to do this themselves, these are still board specific and=20
> belong to dts. As requested earlier, we have added default values=20
> already and made these properties optional but, we would like to keep it =

> in bindings so we can have option to tune them as required.

If they're in the binding then they should make sense instead of just
being random values. So please move the defaults to the driver and
have human understandable DT properties to tune these settings. This has
been done for the qcom USB phy already (see things like
qcom,hstx-trim-value for example).

> >> +
> >> +required:
> >> +  - compatible
> >> +  - cell-index
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - vdda-1p2-supply
> >> +  - vdda-0p9-supply
> >> +  - data-lanes
> >> +  - ports
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> >> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> >> +    msm_dp: displayport-controller@ae90000{
> >> +        compatible =3D "qcom,dp-display";
> >> +        cell-index =3D <0>;
> >> +        reg =3D <0 0xae90000 0 0x1400>;
> >> +        reg-names =3D "dp_controller";
> >> +
> >> +        interrupt-parent =3D <&display_subsystem>;
> >> +        interrupts =3D <12 0>;
> >> +
> >> +        clocks =3D <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> >> +        clock-names =3D "core_aux",
> >> +                      "ctrl_link",
> >> +                      "ctrl_link_iface", "stream_pixel",
> >> +                      "pixel_rcg";
> >> +        #clock-cells =3D <1>;
> >> +
> >> +        vdda-1p2-supply =3D <&vreg_l3c_1p2>;
> >> +        vdda-0p9-supply =3D <&vreg_l4a_0p8>;
> >> +
> >> +        data-lanes =3D <0 1>;
> >> +
> >> +        ports {
> >> +            #address-cells =3D <1>;
> >> +            #size-cells =3D <0>;
> >> +
> >> +            port@0 {
> >> +                reg =3D <0>;
> >> +                dp_in: endpoint {
> >> +                    remote-endpoint =3D <&dpu_intf0_out>;
> >> +                };
> >> +            };
> >> +
> >> +            port@1 {
> >> +                reg =3D <1>;
> >> +                dp_out: endpoint {
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >=20
> > I believe there should be a '...' here.
> I think you mean signature is missing? If not could you please explain?

No I mean there should be a triple dot at the end.
