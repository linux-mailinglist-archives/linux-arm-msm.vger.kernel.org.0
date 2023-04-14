Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139556E1D0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 09:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDNHYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 03:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDNHYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 03:24:03 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503BF26BA;
        Fri, 14 Apr 2023 00:24:01 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 954A120377;
        Fri, 14 Apr 2023 09:23:57 +0200 (CEST)
Date:   Fri, 14 Apr 2023 09:23:55 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: Re: [PATCH v5 04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add ports as an optional
Message-ID: <srju7fn26r4yt5lah3jj5uucqwrh4gttlqghdywy6w56vqwd3h@zv7gqeykbd3k>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-13 12:34:28, Bryan O'Donoghue wrote:
> Add ports as an optional

"Add the following ports as optional ...:"

> 
> port@0 to receive an orientation-switch message from the Type-C port or
> redriver
> 
> port@1 to subsequently transmit the orientation-switch on once the PHY has
> finished doing its orientation turn-around.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> index d307343388888..9ef69ad12b74a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> @@ -65,6 +65,22 @@ properties:
>      description: Flag the port as possible handler of orientation switching
>      type: boolean
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings that model incoming orientation-switch and
> +      outgoing orientation-switch messages. An example of an incoming
> +      orientation-switch message might come form a Type-C connector or a USB

Nit: form -> from

> +      redriver. An example of an output would be a DisplayPort controller.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Type-C mux orientation-switch input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PHY orientation-siwtch output.
> +
>    resets:
>      items:
>        - description: reset of phy block.
> @@ -279,4 +295,22 @@ examples:
>              #clock-cells = <1>;
>              #phy-cells = <0>;
>          };
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                qmpphy_typec_mux_in: endpoint {
> +                    remote-endpoint = <&pmic_typec_mux_out>;
> +                };
> +            };

Nit: space?

- Marijn

> +            port@1 {
> +                reg = <1>;
> +                qmpphy_typec_mux_out: endpoint {
> +                    remote-endpoint = <&dp_typec_mux_in>;
> +                };
> +            };
> +        };
>      };
> -- 
> 2.39.2
> 
