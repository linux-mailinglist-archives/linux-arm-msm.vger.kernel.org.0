Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B046E1D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 09:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjDNH1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 03:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNH1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 03:27:34 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576514C33
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 00:27:33 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2BB73204C0;
        Fri, 14 Apr 2023 09:27:31 +0200 (CEST)
Date:   Fri, 14 Apr 2023 09:27:29 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH v5 05/14] dt-bindings: usb: Add Qualcomm PMIC Type-C YAML
 schema
Message-ID: <um7eohfp32snyyjwex2kasuvwu42z4nisly2beqbfn5opw6fnp@hzuuerl3pcsg>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-6-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413113438.1577658-6-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-13 12:34:29, Bryan O'Donoghue wrote:
> Add a YAML binding for the Type-C silicon interface inside Qualcomm's
> pm8150b hardware block.
> 
> The Type-C driver operates with a pdphy driver inside of a high level
> single TCPM device.
> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 0000000000000..6d0f5d00305cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB Type-C block
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Type-C block
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-typec
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +  reg:
> +    description: Type-C port and pdphy SPMI register base offsets
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    items:
> +      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
> +      - description: VCONN Powered Detection
> +      - description: CC state change
> +      - description: VCONN over-current condition
> +      - description: VBUS state change
> +      - description: Attach Deteach notification

Deteach -> Detach

> +      - description: Legacy cable detect
> +      - description: Try.Src Try.Snk state change
> +      - description: Sig TX - transmitted reset signal
> +      - description: Sig RX - received reset signal
> +      - description: TX completion
> +      - description: RX completion
> +      - description: TX fail
> +      - description: TX discgard
> +      - description: RX discgard

discgard (2x) -> discard

> +      - description: Fast Role Swap event

None of these descriptions follow a similar pattern and are very hard to
read and understand.  Can you rewrite them?  For starters, think about
using the same wording and capitalization.

> +
> +  interrupt-names:
> +    items:
> +      - const: or-rid-detect-change
> +      - const: vpd-detect
> +      - const: cc-state-change
> +      - const: vconn-oc
> +      - const: vbus-change
> +      - const: attach-detach
> +      - const: legacy-cable-detect
> +      - const: try-snk-src-detect
> +      - const: sig-tx
> +      - const: sig-rx
> +      - const: msg-tx
> +      - const: msg-rx
> +      - const: msg-tx-failed
> +      - const: msg-tx-discarded
> +      - const: msg-rx-discarded
> +      - const: fr-swap
> +
> +  vdd-vbus-supply:
> +    description: VBUS power supply.
> +
> +  vdd-pdphy-supply:
> +    description: VDD regulator supply to the PDPHY.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Contains a port which produces data-role switching messages.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - vdd-vbus-supply
> +  - vdd-pdphy-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/usb/pd.h>
> +
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8150b_typec: typec@1500 {
> +            compatible = "qcom,pm8150b-typec";
> +            reg = <0x1500>,
> +                  <0x1700>;
> +
> +            interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "or-rid-detect-change",
> +                              "vpd-detect",
> +                              "cc-state-change",
> +                              "vconn-oc",
> +                              "vbus-change",
> +                              "attach-detach",
> +                              "legacy-cable-detect",
> +                              "try-snk-src-detect",
> +                              "sig-tx",
> +                              "sig-rx",
> +                              "msg-tx",
> +                              "msg-rx",
> +                              "msg-tx-failed",
> +                              "msg-tx-discarded",
> +                              "msg-rx-discarded",
> +                              "fr-swap";
> +
> +            vdd-vbus-supply = <&pm8150b_vbus>;
> +            vdd-pdphy-supply = <&vreg_l2a_3p1>;
> +            connector {
> +                compatible = "usb-c-connector";
> +
> +                power-role = "source";
> +                data-role = "dual";
> +                self-powered;
> +
> +                source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
> +                               PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        pm8150b_typec_mux_out: endpoint {
> +                            remote-endpoint = <&qmpphy_typec_mux_in>;
> +                        };
> +                    };

Also a newline?

- Marijn

> +                    port@1 {
> +                        reg = <1>;
> +                        pm8150b_typec_role_switch_out: endpoint {
> +                            remote-endpoint = <&dwc3_role_switch_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.39.2
> 
