Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE859222DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 23:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgGPV3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 17:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgGPV3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 17:29:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D29C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 14:29:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q4so10085316lji.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BMW25MccEXBEQKiOayk0XDiCmm5Kg67PbQTIPz8CeXU=;
        b=Q8OcFTKPw8k3z2elh+O/yAez7MPSAXdHzUNs/Ks0fOM5yKcM8I5iUWNAkZLRO8jVYV
         Bi1IGEqK4hM3tKFXoVzNwDiXw03mVBOwFZM2ZpD5QMNN8oi/tuqzs/YmofsxLwHFSanG
         rFA5u6QvyEgmg05+RjOlgBWx164bWRFwGHueXaqHiIF8IiHGDhPO43BOuPYo2ekOAeaq
         /LFBPfI0ksHYRgg/bnshjk9SVN6q5y0JnVoHg60EqQdfLl6gRSehZshGGbiyLKJw2l8v
         fBy4ebyhe6m0NS1dY1pvmnrCSLCuqHrql7lR/IcHDRjiuLewIkuNRo4sQhYFvB/xfMWW
         L78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BMW25MccEXBEQKiOayk0XDiCmm5Kg67PbQTIPz8CeXU=;
        b=NttrlRO+49IWXi2CIiZckWfRGcs9BxPNT9RV02hmCQY1/jNewovQUuO0a1T60YgX1e
         6iAFBp1i9nx66K4knyGDivbCcDn8ImLUzSRjZryL1noBXmwawkRBNG9wsDoLVyJEGxB4
         3WInd+FLR7/pgT8dmddmMlfFlVsD7dWKJ1uM47yvFf6gnbaisFhmKg+VBvuStms1efFq
         gFVcF94lKCM7EYhE8PyWHzCGCMsy98QSzAP/XIdmREKy4JXzdd2EMBiFGU+rBos7Op1+
         B1FKA50CbCxPQ3y1BtW2v8cpEwJdYsrmpMigmsAAsjCbqaMevZbNaw8fHYCTpFJOFmse
         c91Q==
X-Gm-Message-State: AOAM530iCXwYBoW+ws55nM3gVVxFBEG7/kwUeOZlXU6gliG988yA6swu
        6bDNkh/K7Tg7YoH3b7ssUd6eWg==
X-Google-Smtp-Source: ABdhPJzVYp/5WHye4DJHuSaRnmWrbiRRSCijThWnACJvir4tMmyzsXCyvlLmpk/vX1xE+o8oq9JMeg==
X-Received: by 2002:a2e:8296:: with SMTP id y22mr3056440ljg.238.1594934945707;
        Thu, 16 Jul 2020 14:29:05 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id k12sm1287608lfe.68.2020.07.16.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:29:04 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 44c50bbc;
        Thu, 16 Jul 2020 21:29:03 +0000 (UTC)
Date:   Thu, 16 Jul 2020 23:29:03 +0200
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl
 bindings
Message-ID: <20200716212903.GA23234@PackardBell>
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
 <20200627192833.217531-2-bartosz.dudziak@snejp.pl>
 <20200715202413.GA755488@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715202413.GA755488@bogus>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 15, 2020 at 02:24:13PM -0600, Rob Herring wrote:
> On Sat, Jun 27, 2020 at 09:28:30PM +0200, Bartosz Dudziak wrote:
> > Add device tree binding Documentation details for Qualcomm msm8226
> > pinctrl driver.
> > 
> > - Bindings documentation was based on qcom,sm8250-pinctrl.yaml by
> >   Bjorn Andersson <bjorn.andersson@linaro.org> and then modified for
> >   msm8226 content
> > 
> > Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> > ---
> >  .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > new file mode 100644
> > index 0000000000..8d8dc15718
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8226-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. MSM8226 TLMM block
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description: |
> > +  This binding describes the Top Level Mode Multiplexer block found in the
> > +  MSM8226 platform.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,msm8226-pinctrl
> > +
> > +  reg:
> > +    description: Specifies the base address and size of the TLMM register space
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: Specifies the TLMM summary IRQ
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    description: Specifies the PIN numbers and Flags, as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    description: Specifying the pin number and flags, as defined in
> > +      include/dt-bindings/gpio/gpio.h
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    maxItems: 1
> > +
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '^.*$':
> > +    if:
> > +      type: object
> 
> For new bindings, do '-pins$' for the node name pattern so we don't have 
> to do this hack.
> 

I have changed the name pattern and sent a v2 patch.
