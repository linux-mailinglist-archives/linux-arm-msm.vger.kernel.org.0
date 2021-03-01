Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD2D32923B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243264AbhCAUl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:41:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:51358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243312AbhCAUf2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:35:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8130464DEE;
        Mon,  1 Mar 2021 19:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614626322;
        bh=WFsiygCKhgPBzIoa0SWTLYwByt45GJ7S4AC/u7wXTOI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KybVmGcNNGC7hJl8mnnV6glIPV1Ml0PJrMSKWhBW0oMma0R1tYwdstnC95033q063
         fgzQmqRV9qd+Srf3gRj5Mr/hOfOSL06uIbg+Ug1HFnn0mDqrBjRmhh+bH1RsDlcioL
         fKgQOk6yq2v2E6aFlVbuM6mNauw0np6o2RzvNQVT08FBVid7jtDQ55qCZ1W31UFCQU
         im/MjKoKYAc0U5Ibrxurj2farDpMRL94RDB++56rcu3yWDqWTSvL4cAeYdbBZszKOv
         VBtctqHtmZEPzUpwLNnSy0yKb3y6xUYlQtdFg2DU51gsrm1weXhv9mXATebPzvezp+
         4MY2JI5Swv4yw==
Received: by mail-ed1-f52.google.com with SMTP id b7so8738303edz.8;
        Mon, 01 Mar 2021 11:18:42 -0800 (PST)
X-Gm-Message-State: AOAM533x3TznO5VwUxSkMmZyO6pt8vqQW/D+ejXr0UfVRNVtJz6VHOpj
        I792BHIi4SLPn0Vx+txl/mEIKo1FA+sUvo8fsg==
X-Google-Smtp-Source: ABdhPJxaoXrSslA9by7wtNG66nA1Oa26c4puAvuGc9SUr0dvUQJZc7e9ktFiMqt6E94gN+95xWTmKI8wWTkBZzFGlYo=
X-Received: by 2002:aa7:c991:: with SMTP id c17mr17933755edt.165.1614626320881;
 Mon, 01 Mar 2021 11:18:40 -0800 (PST)
MIME-Version: 1.0
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org> <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 1 Mar 2021 13:18:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLM9LLUb8r2ZEKfjKxG0tfxuKHchGhG3kVOUG35jgWGg@mail.gmail.com>
Message-ID: <CAL_JsqLLM9LLUb8r2ZEKfjKxG0tfxuKHchGhG3kVOUG35jgWGg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: regulator: Convert regulator bindings to
 YAML format
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 2:34 AM satya priya <skakit@codeaurora.org> wrote:
>
> Convert regulator bindings from .txt to .yaml format.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ---------------------
>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 147 +++++++++++++++++
>  2 files changed, 147 insertions(+), 180 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> deleted file mode 100644
> index ce1e043..0000000
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -Qualcomm Technologies, Inc. RPMh Regulators
> -
> -rpmh-regulator devices support PMIC regulator management via the Voltage
> -Regulator Manager (VRM) and Oscillator Buffer (XOB) RPMh accelerators.  The APPS
> -processor communicates with these hardware blocks via a Resource State
> -Coordinator (RSC) using command packets.  The VRM allows changing three
> -parameters for a given regulator: enable state, output voltage, and operating
> -mode.  The XOB allows changing only a single parameter for a given regulator:
> -its enable state.  Despite its name, the XOB is capable of controlling the
> -enable state of any PMIC peripheral.  It is used for clock buffers, low-voltage
> -switches, and LDO/SMPS regulators which have a fixed voltage and mode.
> -
> -=======================
> -Required Node Structure
> -=======================
> -
> -RPMh regulators must be described in two levels of device nodes.  The first
> -level describes the PMIC containing the regulators and must reside within an
> -RPMh device node.  The second level describes each regulator within the PMIC
> -which is to be used on the board.  Each of these regulators maps to a single
> -RPMh resource.
> -
> -The names used for regulator nodes must match those supported by a given PMIC.
> -Supported regulator node names:
> -       PM8005:         smps1 - smps4
> -       PM8009:         smps1 - smps2, ldo1 - ldo7
> -       PM8150:         smps1 - smps10, ldo1 - ldo18
> -       PM8150L:        smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> -       PM8350:         smps1 - smps12, ldo1 - ldo10,
> -       PM8350C:        smps1 - smps10, ldo1 - ldo13, bob
> -       PM8998:         smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> -       PMI8998:        bob
> -       PM6150:         smps1 - smps5, ldo1 - ldo19
> -       PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
> -       PMX55:          smps1 - smps7, ldo1 - ldo16
> -
> -========================
> -First Level Nodes - PMIC
> -========================
> -
> -- compatible
> -       Usage:      required
> -       Value type: <string>
> -       Definition: Must be one of below:
> -                   "qcom,pm8005-rpmh-regulators"
> -                   "qcom,pm8009-rpmh-regulators"
> -                   "qcom,pm8009-1-rpmh-regulators"
> -                   "qcom,pm8150-rpmh-regulators"
> -                   "qcom,pm8150l-rpmh-regulators"
> -                   "qcom,pm8350-rpmh-regulators"
> -                   "qcom,pm8350c-rpmh-regulators"
> -                   "qcom,pm8998-rpmh-regulators"
> -                   "qcom,pmc8180-rpmh-regulators"
> -                   "qcom,pmc8180c-rpmh-regulators"
> -                   "qcom,pmi8998-rpmh-regulators"
> -                   "qcom,pm6150-rpmh-regulators"
> -                   "qcom,pm6150l-rpmh-regulators"
> -                   "qcom,pmx55-rpmh-regulators"
> -
> -- qcom,pmic-id
> -       Usage:      required
> -       Value type: <string>
> -       Definition: RPMh resource name suffix used for the regulators found on
> -                   this PMIC.  Typical values: "a", "b", "c", "d", "e", "f".
> -
> -- vdd-s1-supply
> -- vdd-s2-supply
> -- vdd-s3-supply
> -- vdd-s4-supply
> -       Usage:      optional (PM8998 and PM8005 only)
> -       Value type: <phandle>
> -       Definition: phandle of the parent supply regulator of one or more of the
> -                   regulators for this PMIC.
> -
> -- vdd-s5-supply
> -- vdd-s6-supply
> -- vdd-s7-supply
> -- vdd-s8-supply
> -- vdd-s9-supply
> -- vdd-s10-supply
> -- vdd-s11-supply
> -- vdd-s12-supply
> -- vdd-s13-supply
> -- vdd-l1-l27-supply
> -- vdd-l2-l8-l17-supply
> -- vdd-l3-l11-supply
> -- vdd-l4-l5-supply
> -- vdd-l6-supply
> -- vdd-l7-l12-l14-l15-supply
> -- vdd-l9-supply
> -- vdd-l10-l23-l25-supply
> -- vdd-l13-l19-l21-supply
> -- vdd-l16-l28-supply
> -- vdd-l18-l22-supply
> -- vdd-l20-l24-supply
> -- vdd-l26-supply
> -- vin-lvs-1-2-supply
> -       Usage:      optional (PM8998 only)
> -       Value type: <phandle>
> -       Definition: phandle of the parent supply regulator of one or more of the
> -                   regulators for this PMIC.
> -
> -- vdd-bob-supply
> -       Usage:      optional (PMI8998 only)
> -       Value type: <phandle>
> -       Definition: BOB regulator parent supply phandle
> -
> -===============================
> -Second Level Nodes - Regulators
> -===============================
> -
> -- qcom,always-wait-for-ack
> -       Usage:      optional
> -       Value type: <empty>
> -       Definition: Boolean flag which indicates that the application processor
> -                   must wait for an ACK or a NACK from RPMh for every request
> -                   sent for this regulator including those which are for a
> -                   strictly lower power state.
> -
> -Other properties defined in Documentation/devicetree/bindings/regulator/regulator.txt
> -may also be used.  regulator-initial-mode and regulator-allowed-modes may be
> -specified for VRM regulators using mode values from
> -include/dt-bindings/regulator/qcom,rpmh-regulator.h.  regulator-allow-bypass
> -may be specified for BOB type regulators managed via VRM.
> -regulator-allow-set-load may be specified for LDO type regulators managed via
> -VRM.
> -
> -========
> -Examples
> -========
> -
> -#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> -
> -&apps_rsc {
> -       pm8998-rpmh-regulators {
> -               compatible = "qcom,pm8998-rpmh-regulators";
> -               qcom,pmic-id = "a";
> -
> -               vdd-l7-l12-l14-l15-supply = <&pm8998_s5>;
> -
> -               smps2 {
> -                       regulator-min-microvolt = <1100000>;
> -                       regulator-max-microvolt = <1100000>;
> -               };
> -
> -               pm8998_s5: smps5 {
> -                       regulator-min-microvolt = <1904000>;
> -                       regulator-max-microvolt = <2040000>;
> -               };
> -
> -               ldo7 {
> -                       regulator-min-microvolt = <1800000>;
> -                       regulator-max-microvolt = <1800000>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -                       regulator-allowed-modes =
> -                               <RPMH_REGULATOR_MODE_LPM
> -                                RPMH_REGULATOR_MODE_HPM>;
> -                       regulator-allow-set-load;
> -               };
> -
> -               lvs1 {
> -                       regulator-min-microvolt = <1800000>;
> -                       regulator-max-microvolt = <1800000>;
> -               };
> -       };
> -
> -       pmi8998-rpmh-regulators {
> -               compatible = "qcom,pmi8998-rpmh-regulators";
> -               qcom,pmic-id = "b";
> -
> -               bob {
> -                       regulator-min-microvolt = <3312000>;
> -                       regulator-max-microvolt = <3600000>;
> -                       regulator-allowed-modes =
> -                               <RPMH_REGULATOR_MODE_AUTO
> -                                RPMH_REGULATOR_MODE_HPM>;
> -                       regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> -               };
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> new file mode 100644
> index 0000000..c14baf8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. RPMh Regulators
> +
> +maintainers:
> +  - David Collins <collinsd@codeaurora.org>
> +
> +description:

I assume you want the formatting here maintained, so you need a '|' at the end.

> +    rpmh-regulator devices support PMIC regulator management via the Voltage
> +    Regulator Manager (VRM) and Oscillator Buffer (XOB) RPMh accelerators.  The APPS
> +    processor communicates with these hardware blocks via a Resource State
> +    Coordinator (RSC) using command packets.  The VRM allows changing three
> +    parameters for a given regulator, enable state, output voltage, and operating
> +    mode.  The XOB allows changing only a single parameter for a given regulator,
> +    its enable state.  Despite its name, the XOB is capable of controlling the
> +    enable state of any PMIC peripheral.  It is used for clock buffers, low-voltage
> +    switches, and LDO/SMPS regulators which have a fixed voltage and mode.
> +
> +    =======================
> +    Required Node Structure
> +    =======================
> +
> +    RPMh regulators must be described in two levels of device nodes.  The first
> +    level describes the PMIC containing the regulators and must reside within an
> +    RPMh device node.  The second level describes each regulator within the PMIC
> +    which is to be used on the board.  Each of these regulators maps to a single
> +    RPMh resource.
> +
> +    The names used for regulator nodes must match those supported by a given PMIC.
> +    Supported regulator node names are
> +      For PM8005, smps1 - smps4
> +      For PM8009, smps1 - smps2, ldo1 - ldo7
> +      For PM8150, smps1 - smps10, ldo1 - ldo18
> +      For PM8150L, smps1 - smps8, ldo1 - ldo11, bob, flash, rgb

flash and rgb aren't documented.

> +      For PM8350, smps1 - smps12, ldo1 - ldo10
> +      For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
> +      For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> +      For PMI8998, bob
> +      For PM6150, smps1 - smps5, ldo1 - ldo19
> +      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
> +      For PMX55, smps1 - smps7, ldo1 - ldo16
> +
> +properties:
> +    compatible:
> +        enum:
> +            - qcom,pm8005-rpmh-regulators
> +            - qcom,pm8009-rpmh-regulators
> +            - qcom,pm8009-1-rpmh-regulators
> +            - qcom,pm8150-rpmh-regulators
> +            - qcom,pm8150l-rpmh-regulators
> +            - qcom,pm8350-rpmh-regulators
> +            - qcom,pm8350c-rpmh-regulators
> +            - qcom,pm8998-rpmh-regulators
> +            - qcom,pmi8998-rpmh-regulators
> +            - qcom,pm6150-rpmh-regulators
> +            - qcom,pm6150l-rpmh-regulators
> +            - qcom,pmx55-rpmh-regulators
> +
> +    qcom,pmic-id:
> +        description: RPMh resource name suffix used for the regulators found on
> +                     this PMIC.  Typical values are "a", "b", "c", "d", "e", "f".

Sounds like constraints. Make the values a schema.

> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +    qcom,always-wait-for-ack:
> +        description: Boolean flag which indicates that the application processor
> +                     must wait for an ACK or a NACK from RPMh for every request
> +                     sent for this regulator including those which are for a
> +                     strictly lower power state.
> +        $ref: /schemas/types.yaml#/definitions/string

Boolean or string?

> +
> +patternProperties:
> +  ".*-supply$":

You can drop '.*'. That's already the case without '^'.

The supply names need to be defined.

> +    description: phandle of the parent supply regulator of one or more of the
> +                 regulators for this PMIC.
> +
> +  "^((smps|ldo|lvs)[0-9]*)$":

s/*/+/ as 1 digit is always required, right?

> +    type: object
> +    allOf:

Don't need allOf.

> +     - $ref: "regulator.yaml#"
> +    description: List of regulator parent supply phandles

This is a node, not a list of phandles.

> +
> +  "bob$":

'foobob' is okay as that would be allowed? If a fixed string, put
under 'properties'.

> +    type: object
> +    allOf:
> +     - $ref: "regulator.yaml#"
> +    description: BOB regulator parent supply phandle
> +
> +additionalProperties: false
> +
> +required:
> + - compatible
> + - qcom,pmic-id
> +
> +examples:
> +  - |
> +    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +    pm8998-rpmh-regulators {
> +        compatible = "qcom,pm8998-rpmh-regulators";
> +        qcom,pmic-id = "a";
> +
> +        vdd-l7-l12-l14-l15-supply = <&pm8998_s5>;
> +
> +        smps2 {
> +            regulator-min-microvolt = <1100000>;
> +            regulator-max-microvolt = <1100000>;
> +        };
> +
> +        pm8998_s5: smps5 {

Drop unused labels.

> +            regulator-min-microvolt = <1904000>;
> +            regulator-max-microvolt = <2040000>;
> +        };
> +
> +        ldo7 {
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +            regulator-allowed-modes =
> +                <RPMH_REGULATOR_MODE_LPM
> +                 RPMH_REGULATOR_MODE_HPM>;
> +            regulator-allow-set-load;
> +        };
> +
> +        lvs1 {
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +        };
> +    };
> +
> +    pmi8998-rpmh-regulators {
> +        compatible = "qcom,pmi8998-rpmh-regulators";
> +        qcom,pmic-id = "b";
> +
> +        bob {
> +            regulator-min-microvolt = <3312000>;
> +            regulator-max-microvolt = <3600000>;
> +            regulator-allowed-modes =
> +                <RPMH_REGULATOR_MODE_AUTO
> +                 RPMH_REGULATOR_MODE_HPM>;
> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +        };
> +    };
> +...
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
