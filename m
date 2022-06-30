Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A27B562422
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 22:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbiF3Uag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 16:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiF3Uag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 16:30:36 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4932D1EA;
        Thu, 30 Jun 2022 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656621031;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gdRmpcca4i4lwPdM656qdPHVyT+kvm6dYdfWzxLz8Ng=;
    b=o0WzeEza2AbtizdYqI8WdiNpNcD4Gium2//qCG6EqbmF+/Fw9y30Oak2hxiID6VxPs
    CxosbIVMp4mFt1382Zz9hxcUydFYzXW3llpK1928ufthOzTjVAPomDswSn9uzNerXr8z
    Vv7DZlm/7B0RHYgFgbFwLfKww1XAuL8wKswkTaAMF8U87KgYaVnUqdPje5bf+JF5HAq8
    vMD4gPbb3awx6l5jbOQaCOxl5PAmyXTIyYl+g14AhO+8NBdqp3TSlpHRKBZaXqk6jqka
    RzraMTvOTbboof5qbZJH1AdIgArCz4v2HHKzZ/dvQFfKrjp6otZQKTsj1WbNwvqJ4QTt
    ilnQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id yfdd30y5UKUV4xa
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 30 Jun 2022 22:30:31 +0200 (CEST)
Date:   Thu, 30 Jun 2022 22:30:29 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Message-ID: <Yr4H5Ti0kmQlja98@gerhold.net>
References: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
 <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 30, 2022 at 08:47:32PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2022 06:23, Bryan O'Donoghue wrote:
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
> 

The driver was originally made for pm8941, which uses exactly the
usb_id-only configuration (see arch/arm/boot/dts/qcom-pm8941.dtsi):

        usb_id: misc@900 {
                compatible = "qcom,pm8941-misc";
                reg = <0x900>;
                interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
                interrupt-names = "usb_id";
        };

The "usb_vbus" interrupt is basically already assigned to the charger
node ("usb-valid" in qcom,pm8941-charger), so I'm not sure if it's
possible to add it to the extcon node as well. The charger driver
provides a separate extcon device with the VBUS state so it's not much
of a problem in practice.

Thanks,
Stephan
