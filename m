Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693285625CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 00:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbiF3WFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 18:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiF3WFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 18:05:44 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4949957210
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 15:05:41 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9C1D72054E;
        Fri,  1 Jul 2022 00:05:38 +0200 (CEST)
Date:   Fri, 1 Jul 2022 00:05:31 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Message-ID: <20220630220531.nk7ho42btnphmwks@SoMainline.org>
References: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
 <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-06-30 20:47:32, Krzysztof Kozlowski wrote:
> On 30/06/2022 06:23, Bryan O'Donoghue wrote:
> > dts validation is throwing an error for me on 8916 and 8939 with
> > extcon@1300. In this case we have usb_vbus but not usb_id.
> > 
> > Looking at the pm8941-misc driver we can have usb_id, usb_vbus or both at
> > the same time.
> 
> Implementation is not the best reason to change bindings. Implementation
> can change, bindings should not.
> 
> > 
> > Expand the definition with anyOf to capture the three different valid
> > modes.
> > 
> > Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > index 6a9c96f0352ac..1bc412a4ac5e6 100644
> > --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > @@ -27,10 +27,14 @@ properties:
> >  
> >    interrupt-names:
> >      minItems: 1
> > -    items:
> > -      - const: usb_id
> > -      - const: usb_vbus
> > -
> > +    anyOf:
> > +      - items:
> > +          - const: usb_id
> > +          - const: usb_vbus
> > +      - items:
> > +          - const: usb_id
> 
> I don't think you can have ID connected and VBUS disconnected, therefore
> is it even possible to have missing VBUS interrupt?

This is how I've been using it on the pmi8950 (apologies, patches not
yet upstream) because both interrupts are on a different block:

    pmi8950_usb_vbus: extcon-chgpth@1300 {
        compatible = "qcom,pm8941-misc";
        interrupts = <0x2 0x13 0x2 IRQ_TYPE_NONE>;
        interrupt-names = "usb_vbus";
    };

    pmi8950_usb_id: extcon-otg@1100 {
        compatible = "qcom,pm8941-misc";
        interrupts = <0x2 0x11 0x3 IRQ_TYPE_NONE>;
        interrupt-names = "usb_id";
    };

This also results in annoying errors (back in the day, found these on a
5.13 log but surely remember seeing it on 5.18 as well):

    [    1.377491] extcon-pm8941-misc 200f000.spmi:pmic@2:extcon_chgpth@1300: IRQ usb_id not found
    [    1.380399] extcon-pm8941-misc 200f000.spmi:pmic@2:extcon_otg@1100: IRQ usb_vbus not found

Now, given that the offset also seems to be encoded in the interrupt
definition, and it's been functioning without `reg` (required by the
dt-bindings but I see no register mapping in the driver, it reads
interrupt line level from the irqchip directly), it is perhaps possible
to throw them into one DT node without address altogether?  (untested)

    pmi8950_usb_extcon: extcon {
        compatible = "qcom,pm8941-misc";
        interrupts = <0x2 0x11 0x3 IRQ_TYPE_NONE>,
                     <0x2 0x13 0x2 IRQ_TYPE_NONE>;
        interrupt-names = "usb_id", "usb_vbus";
    };

- Marijn
