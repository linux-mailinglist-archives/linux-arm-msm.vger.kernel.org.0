Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EF312520F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 20:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfLRTnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 14:43:33 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:34893 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLRTnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 14:43:33 -0500
Received: by mail-io1-f65.google.com with SMTP id v18so3256714iol.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 11:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ufzqu5SYStGRmDjFW6F6AuBJEpv9SjyFBEIc9hkxT84=;
        b=S11HT2eUHvh6PNlKlTpHPZHdyyA7ZFbOnQfOmMSkW3r4g+s3386CSdYkBDEjraYC+C
         01//sKB8p7le9qAzIs9k8Q+mey74hWohMpW14NcSlZngQodcuohASzfNofHRG7fxcVsN
         HKcYiNg5dlesgXTkt+vbVXbNfUzHUz1xM3QTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ufzqu5SYStGRmDjFW6F6AuBJEpv9SjyFBEIc9hkxT84=;
        b=SwHSFbhPGSOmUBZWI1pmzTlKmvtWJqik6FxwRkegNjGOww3+a1soz4ruAHcIQBqBWM
         gzCPk5k0dEyiTNhO7zX9+xvxVQw/8Zr3r/tdvPfCMjJ+/WGT1sTuKbmr95sCd9svU1Cc
         ldiwtkB4zi6bCuC2alHugKHuSUt8vwVQTztpHkOcxUvJ9zudCYTbIMga4dJLvTgktO3J
         8L2niJRT01QhYqpnONRT/gHjzqok+cyLnTr2g6PfY07laFQhwYrnmOlqGQanWwVH8QXe
         wZsF3UvYMcrotpsuHhVnuS5tz2nz5isJkheALuNY/W46TUHtUdny/zoym2onDxTQ+HLV
         J2FA==
X-Gm-Message-State: APjAAAWMLR1TOJ3YXC2L1sKJvoVCsjbCk5O1vLgMZQgju1zpnnOYAuQv
        wXOmgf1Jsv826g9YKYDzkAzPQ2Kz60w=
X-Google-Smtp-Source: APXvYqyBbQ4Qx9vhb5AwW94kWeff9l3INe8a7KS6WWCJI0emEGmtJ73UYAanUjsmyjNSfzyeb/e+nw==
X-Received: by 2002:a5e:da42:: with SMTP id o2mr2865205iop.125.1576698211517;
        Wed, 18 Dec 2019 11:43:31 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id 69sm961440ilc.23.2019.12.18.11.43.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:43:30 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id a6so2702846ili.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 11:43:30 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr3541709ilo.269.1576698209663;
 Wed, 18 Dec 2019 11:43:29 -0800 (PST)
MIME-Version: 1.0
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org> <1575520881-31458-3-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1575520881-31458-3-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 11:43:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UiPXYMsw=t7Sw7YaEFRxSfgzUXYZA3J1enV8zd+Pa9OA@mail.gmail.com>
Message-ID: <CAD=FV=UiPXYMsw=t7Sw7YaEFRxSfgzUXYZA3J1enV8zd+Pa9OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: qcom-qusb2: Convert QUSB2 phy
 bindings to yaml
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 4, 2019 at 8:43 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml

Hrm.  Probably should have given this same comment on the USB3 yaml
bindings too, but I think the file name should be:

qcom,qusb2-phy.yaml

Specifically I think that's what Rob H has been requesting elsewhere.



> new file mode 100644
> index 0000000..3ef94bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom-qusb2-phy.yaml#"

If you change the name to add the comma (as per above), don't forget
to update your ID.


> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QUSB2 phy controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description: |

nit: don't need the "|" unless carriage returns are important.


> +  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8996-qusb2-phy
> +      - qcom,msm8998-qusb2-phy
> +      - qcom,sdm845-qusb2-phy
> +
> +  reg:
> +    description:
> +        offset and length of the PHY register set.

No description, just maxItems: 1 I think.  This seemed to be what Rob
H suggested in USB3 bindings with regards to resets where the
description was just generic [1].


> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 3
> +    description:
> +        a list of phandles and clock-specifier pairs,
> +        one for each entry in clock-names.
> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb #phy config clock
> +      - const: ref #19.2 MHz ref clk
> +      - const: iface #phy interface clock (Optional)

Please take the same type of feedback you got for the USB3 bindings
with regards to clocks / clock-names.


> +  vdda-pll-supply:
> +     description:
> +       Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vdda-phy-dpdm-supply:
> +     description:
> +       Phandle to 3.1V regulator supply to Dp/Dm port signals.
> +
> +  resets:
> +    description:
> +       Phandle to reset to phy block.

No description, just maxItems: 1 I think [1].


> +  nvmem-cells:
> +    description:
> +        Phandle to nvmem cell that contains 'HS Tx trim'
> +        tuning parameter value for qusb2 phy.

Add maxItems: 1 ?


> +  qcom,tcsr-syscon:
> +    description:
> +        Phandle to TCSR syscon register region.
> +    $ref: /schemas/types.yaml#/definitions/cell
> +
> +  qcom,imp-res-offset-value:
> +    description:
> +        It is a 6 bit value that specifies offset to be
> +        added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
> +        tuning parameter that may vary for different boards of same SOC.
> +        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0
maximum: 63

...and, I think:
default: 0


> +  qcom,hstx-trim-value:
> +    description:
> +        It is a 4 bit value that specifies tuning for HSTX
> +        output current.
> +        Possible range is - 15mA to 24mA (stepsize of 600 uA).
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +        Default value is 22.2mA for sdm845.
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0
maximum: 15
default: 3


> +  qcom,preemphasis-level:
> +    description:
> +        It is a 2 bit value that specifies pre-emphasis level.
> +        Possible range is 0 to 15% (stepsize of 5%).
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +        Default value is 10% for sdm845.
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0
maximum: 3
default: 2


> +  qcom,preemphasis-width:
> +    description:
> +        It is a 1 bit value that specifies how long the HSTX
> +        pre-emphasis (specified using qcom,preemphasis-level) must be in
> +        effect. Duration could be half-bit of full-bit.
> +        See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +        Default value is full-bit width for sdm845.
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0
maximum: 1
default: 0


> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdda-pll-supply
> +  - vdda-phy-dpdm-supply
> +  - resets
> +
> +
> +examples:
> +  - |

#include <dt-bindings/clock/qcom,gcc-msm8996.h>


> +    hsusb_phy: phy@7411000 {
> +        compatible = "qcom,msm8996-qusb2-phy";
> +        reg = <0x7411000 0x180>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                <&gcc GCC_RX1_USB2_CLKREF_CLK>,

The comma at the end is a syntax error.

make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml

[1] https://lore.kernel.org/r/20191213212313.GA21092@bogus


-Doug
