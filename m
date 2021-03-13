Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAED33A1D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 00:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhCMXI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 18:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhCMXIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 18:08:54 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1BFC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 15:08:53 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so12494436pjq.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DJB4nTvqOkD2IKJreZLi0xNx1PDWydQlEGcM1Bz8MlQ=;
        b=fLqylF++FUl0wTtyGvoGRKsw72Nu7iMwMqD6h+dqBVepPOIdlN1JGDmxihSa/faeR2
         nhld8PWXQ1YS8Wp1XWNEGUiOJ7KN5xw224IC7GB6g/JtN6vvNoZiUNismPEmAwZFbeMq
         CCIMCL/zFDFUN9cWAOvZCcQ6+SHDH5cG3Gm68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DJB4nTvqOkD2IKJreZLi0xNx1PDWydQlEGcM1Bz8MlQ=;
        b=DgFRXGe6BmFp23OhGsO6ZQ39fKGYq5E5dQGieZ+phwoWWVAsnQhtkq8XkmOHCjUn4X
         eaCbONq5Ukoy0nZw1muIEjfVWf4hAC/2zXJhUQeRUDXZ/pSecbeCMBMdC7f8clVCLypB
         vnGT3pKM1FErD4uBi88H4nqljIkcjj5F6MqJ2WEmrcXmgg/IHYiFfNdr4UMR5yUdgIC6
         byME/CsULTqgkxrxU1rffZc7Y9U8FAstFDPj4JpiRAOw1yd+W9FaJ/yMZKCcm7RzF26x
         jqyFpzYDMpUbYVN2RQTieMBPYcsvpvl6wKUrhJ4x7KPAFByRsoc0GOSZZ6f11Xf0bvQx
         BUGg==
X-Gm-Message-State: AOAM5309LbgZM7IlCMb8EX3XE454W7/U8/h+TKa9laQqKQVlyYrAldZ5
        r31J4av5ED8cgI9DEFnlmd46Gg==
X-Google-Smtp-Source: ABdhPJxYbxFeNmipRG6YABAM/S66f0kEw3ozjMgiUUXpI6JZyIIWg/9Wcmz4CrAnU9bO/ij+Zo+iLw==
X-Received: by 2002:a17:90b:a04:: with SMTP id gg4mr5635251pjb.51.1615676933283;
        Sat, 13 Mar 2021 15:08:53 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id g12sm6148613pjd.57.2021.03.13.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 15:08:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614950952-13351-3-git-send-email-mkrishn@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org> <1614950952-13351-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v13 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Sat, 13 Mar 2021 15:08:51 -0800
Message-ID: <161567693145.1478170.18190682094557030182@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-05 05:29:11)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..33e2a2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI 10nm PHY dt properties

"Qualcomm Display DSI 10nm PHY"

> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI 10nm PHY.

Drop description as it doesn't provide anything?

> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for dsi phy register set
> +      - description: Address offset and size for dsi phy lane register s=
et
> +      - description: Address offset and size for dsi pll register set

Please drop "Address offset and size for" from all of these.

> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vdds-supply:
> +    description: |
> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vdds-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible =3D "qcom,dsi-phy-10nm";
> +         reg =3D <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94a00 0x1e0>;
> +         reg-names =3D "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells =3D <1>;
> +         #phy-cells =3D <0>;
> +
> +         vdds-supply =3D <&vdda_mipi_dsi0_pll>;
> +         clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names =3D "iface", "ref";
> +     };
> +...
