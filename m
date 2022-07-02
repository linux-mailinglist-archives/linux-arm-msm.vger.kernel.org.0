Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BB8563F3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Jul 2022 11:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiGBJ3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 05:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBJ3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 05:29:15 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6730E13F0C;
        Sat,  2 Jul 2022 02:29:14 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A7FAE3F62F;
        Sat,  2 Jul 2022 11:29:11 +0200 (CEST)
Date:   Sat, 2 Jul 2022 11:29:07 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        stephan@gerhold.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Message-ID: <20220702092907.u7ref3k2mqi2ibvr@SoMainline.org>
References: <20220701100405.3586820-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701100405.3586820-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-07-01 11:04:05, Bryan O'Donoghue wrote:
> dts validation is throwing an error for me on 8916 and 8939 with
> extcon@1300. In that case we have usb_vbus but not usb_id.
> 
> It wasn't immediately obvious if there was a valid use-case for the
> existing code for usb_id in isolation, however discussing further, we
> concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
> combinations as an external IC may be responsible for usb_id or usb_vbus.
> 
> Expand the definition with anyOf to capture the three different valid
> modes.
> 
> Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Can you also switch platform_get_irq_byname() to
platform_get_irq_byname_optional(), to get rid of:

    [    1.377491] extcon-pm8941-misc 200f000.spmi:pmic@2:extcon_chgpth@1300: IRQ usb_id not found
    [    1.380399] extcon-pm8941-misc 200f000.spmi:pmic@2:extcon_otg@1100: IRQ usb_vbus not found

That'd compement this patch nicely.

- Marijn

> ---
>  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index 6a9c96f0352ac..1bc412a4ac5e6 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -27,10 +27,14 @@ properties:
>  
>    interrupt-names:
>      minItems: 1
> -    items:
> -      - const: usb_id
> -      - const: usb_vbus
> -
> +    anyOf:
> +      - items:
> +          - const: usb_id
> +          - const: usb_vbus
> +      - items:
> +          - const: usb_id
> +      - items:
> +          - const: usb_vbus
>  required:
>    - compatible
>    - reg
> -- 
> 2.36.1
> 
