Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0FF29DA23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390261AbgJ1XPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:15:00 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:30309 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389529AbgJ1XO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:14:59 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2020 00:08:36 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 28 Oct 2020 00:08:36 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 713D1199D; Wed, 28 Oct 2020 00:08:36 -0700 (PDT)
Date:   Wed, 28 Oct 2020 00:08:36 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [PATCH v3 1/2] bindings: pm8941-misc: Convert to YAML and add
 support for VBUS detection
Message-ID: <20201028070836.GA10441@codeaurora.org>
References: <cover.1603403020.git.gurus@codeaurora.org>
 <b63ffcc19639f69aaba1072c059ca79e4081e6ef.1603403020.git.gurus@codeaurora.org>
 <20201023161409.GB2790207@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023161409.GB2790207@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 11:14:09AM -0500, Rob Herring wrote:
> On Thu, Oct 22, 2020 at 02:47:43PM -0700, Guru Das Srinagesh wrote:
> > From: Anirudh Ghayal <aghayal@codeaurora.org>
> > 
> > Convert bindings to YAML. Also add compatible string that adds support
> > for reporting the VBUS status that can be detected via a dedicated PMIC
> > pin.
> 
> Converting to yaml and add Vbus support should be 2 patches.

Done.

> 
> Really, the main pm8941 needs to be converted and then this one 
> referenced by it.

Could you please explain a bit more on what this might look like?

> 

...

> > +
> > +description: |
> > +  Some Qualcomm PMICs have a "misc" module that can be used to detect when
> > +  the USB ID pin has been pulled low or high.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> 
> Don't need oneOf for a single entry.

Done.

> 
> > +          - enum:
> > +              - qcom,pm8941-misc
> > +              - qcom,pmd-vbus-det
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 2
> 
> Need 'minItems: 1' if 1 or 2 interrupts is valid.

Done.

> 
> > +
> > +  interrupt-names:
> > +    anyOf:
> > +      - items:
> 
> Don't need 'anyOf'

Done.

> 
> > +          - enum:
> > +              - usb_id
> > +              - usb_vbus
> 
> I think what you want here is:
> 
> minItems: 1
> items:
>   - const: usb_id
>   - const: usb_vbus
> 
> Meaning 'usb_id' is always present and 'usb_vbus' is optional 2nd 
> interrupt.

Done.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    pmic {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <4>;
> > +
> > +            usb_id: misc@900 {
> > +                    compatible = "qcom,pm8941-misc";
> > +                    reg = <0x900>;
> > +                    interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> > +                    interrupt-names = "usb_id";
> > +            };
> > +    };
> > +
> > +    usb-controller {
> > +           extcon = <&usb_id>;
> > +    };
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
