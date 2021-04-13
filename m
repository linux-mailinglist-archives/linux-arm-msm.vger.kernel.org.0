Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A051D35D4FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 03:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244110AbhDMBwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 21:52:33 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7118 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241058AbhDMBwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 21:52:32 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Apr 2021 18:52:13 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 12 Apr 2021 18:52:13 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 418EF1B19; Mon, 12 Apr 2021 18:52:13 -0700 (PDT)
Date:   Mon, 12 Apr 2021 18:52:13 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: pm8008: Add bindings
Message-ID: <20210413015213.GA32212@codeaurora.org>
References: <cover.1618015804.git.gurus@codeaurora.org>
 <787cb004e6e7db766f68cb7ace9028c37085088a.1618015804.git.gurus@codeaurora.org>
 <20210412193748.GA53049@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412193748.GA53049@robh.at.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 12, 2021 at 02:37:48PM -0500, Rob Herring wrote:
> On Fri, Apr 09, 2021 at 05:55:01PM -0700, Guru Das Srinagesh wrote:
> > Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.
> > 
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 119 +++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> > new file mode 100644
> > index 0000000..0cafa98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> > @@ -0,0 +1,119 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/qcom,pm8008.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. PM8008 PMIC bindings
> > +
> > +maintainers:
> > +  - Guru Das Srinagesh <gurus@codeaurora.org>
> > +
> > +description: |
> > +  Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
> > +  all the necessary power management, housekeeping, and interface support
> > +  functions into a single IC.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pm8008
> > +
> > +  reg:
> > +    description:
> > +      I2C slave address.
> > +
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +    description: Parent interrupt.
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +    description: |
> > +      The first cell is the IRQ number, the second cell is the IRQ trigger
> > +      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
> > +
> > +  interrupt-controller: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^pinctrl@[0-9a-f]+$":
> 
> Doesn't look like a pin controller. 'gpio@...' instead.

Done.

> 
> > +    type: object
> 
>        additionalProperties: false

Done.

Thank you.
Guru Das.
