Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0555703DED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 21:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244998AbjEOT4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 15:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244989AbjEOT4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 15:56:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2182E100EB;
        Mon, 15 May 2023 12:56:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9CBEF631F3;
        Mon, 15 May 2023 19:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99CDC4339B;
        Mon, 15 May 2023 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684180559;
        bh=INkfx3982UDfhbh2ERXdH+2k7xJotsdpjMphfR9pqUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ycqe2tn2RXiA4rL0/kWU/4KhewpOuYpAD92QeBNCdOuVcsupo5JxGjUEJHxfunykm
         LT2hNk/tanAvxfGGSAeo4BysVDbZ10TcinWqXkALy+dtCjsi51eNuKtq1wxQIL3Fib
         L+m12XxoIfXGXWula59KQVV/+sx6qfpk7HlBdTbjYTwEU0gY4Tc1fXuIcvUduGK2iU
         CC9xEhu8eCqCY8foYcAeLzMosyWE0X6zq0uff3QSmZUDM2ixW+a5OCQWfwwZYAwIXn
         TymM1mnncz0/sFP08foKcwh4Gufo1fFDTo6e8nNs7aQJXCpopdnWCg6zEBV9RZbnGA
         n9iLjKm1xaI4Q==
Date:   Mon, 15 May 2023 12:59:49 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 04/11] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add input and output ports
Message-ID: <20230515195949.yemdw4n2pquive2r@ripper>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515133643.3621656-5-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 15, 2023 at 02:36:36PM +0100, Bryan O'Donoghue wrote:
> Add a ports declaration which is optional containing two port@
> declarations.
> 
> port@0 to receive an orientation-switch message from the Type-C port or
> redriver
> 
> port@1 to subsequently transmit the orientation-switch on once the PHY has
> finished doing its orientation turn-around.
> 
> If ports is declared the input port port@0 is mandatory but the output
> port@1 is optional.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> index d307343388888..c370b9cd58c2e 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> @@ -65,6 +65,25 @@ properties:
>      description: Flag the port as possible handler of orientation switching
>      type: boolean
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings that model incoming orientation-switch and
> +      outgoing orientation-switch messages. An example of an incoming
> +      orientation-switch message might come form a Type-C connector or a USB
> +      redriver. An example of an output would be a DisplayPort controller.

Orientation switching is just one of the uses of this graph, and each
port is both input and output of different signals (orientation switch,
altmode switch, hot plug signals, signal path).


How about aligning this version of the QMP binding with the proposed
binding for 8280xp here:
https://lore.kernel.org/linux-arm-msm/20230515032743.400170-2-quic_bjorande@quicinc.com/

Perhaps we could put some of this in a separate yaml and include that?

Regards,
Bjorn

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Type-C mux orientation-switch input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PHY orientation-switch output.
> +
> +    required:
> +      - port@0
> +
>    resets:
>      items:
>        - description: reset of phy block.
> @@ -279,4 +298,23 @@ examples:
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
> +
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
