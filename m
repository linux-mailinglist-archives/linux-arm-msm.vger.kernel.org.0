Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB8A25260F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 06:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgHZEQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 00:16:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgHZEQc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 00:16:32 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48B9920707;
        Wed, 26 Aug 2020 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598415391;
        bh=9mwZBrs2Apei4nVXemBIp81fg2KqLJnfuW4TFPpznb0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CYIOC1oKVD8HwmrvQzY8jzONbJZQ/nz7DmztHCjJyBfo8PNv4YyBcSBTBTZ956P7I
         fgm4gH8D6QvQyUSRJw/A+dMQoJ966IeMM7B1xpnKwnsPlhgnpXFaTQF/f/tfEQZujb
         w8kKjDUpMgg5uUEjq5DatJM4UNgDjSWadiHB3l6Y=
Date:   Wed, 26 Aug 2020 06:16:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Josh Cartwright <joshc@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: convert spmi.txt to spmi.yaml
Message-ID: <20200826061150.3eb96ab3@coco.lan>
In-Reply-To: <20200819230812.GB2090217@bogus>
References: <94b055687143c9593cd4311f8bcda99a743a619f.1597850327.git.mchehab+huawei@kernel.org>
        <20200819230812.GB2090217@bogus>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Wed, 19 Aug 2020 17:08:12 -0600
Rob Herring <robh@kernel.org> escreveu:

> Need to also define 'reg' constraints as defined by the bus:
> 
> properties:
>   reg:
>     minItems: 1
>     maxItems: 2  #??? Not sure about this. Is it 1 SPMI_USID and 1 \
> SPMI_GSID entry at most?


Each child have just one user ID (SPMI_USID). The group ID (SPMI_GSID) is an 
optional feature. From what I know, only one group ID is allowed at most.
So, maxItems: 2 makes sense.


>     items:
>       items:
>         - minimum: 0
>           maximum: 0xf
>         - enum: [ 0, 1 ]

If I use both maxItems:2 and the above, the example produces the following
error:

	/devel/v4l/temp/Documentation/devicetree/bindings/spmi/spmi.example.dt.yaml: spmi@0: child@7:reg: Additional items are not allowed ([3, 1] was unexpected)

(full DT file enclosed)

This seems to be some bug at the parsing logic, which seems to be refusing
to accept both "items" and "maxItems".

-

That's said, looking at the code[1], only SPMI_USID is currently supported:

		err = of_property_read_u32_array(node, "reg", reg, 2);
		if (err) {
			dev_err(&ctrl->dev,
				"node %pOF err (%d) does not have 'reg' property\n",
				node, err);
			continue;
		}

		if (reg[1] != SPMI_USID) {
			dev_err(&ctrl->dev,
				"node %pOF contains unsupported 'reg' entry\n",
				node);
			continue;
		}

		if (reg[0] >= SPMI_MAX_SLAVE_ID) {
			dev_err(&ctrl->dev, "invalid usid on node %pOF\n", node);
			continue;
		}

So, for now, using SPMI_GSID will fail.

[1] drivers/spmi/spmi.c

So, I'm inclined to define reg property as:

    properties:
      reg:
        minItems: 1
        maxItems: 2
        items:
          - minimum: 0
            maximum: 0xf
          - enum: [ 0 ]
            description: |
              0 means user ID address. 1 is reserved for group ID address.

And drop the group ID from the example. I'll send such version as a
second version of this patch.

Thanks,
Mauro


# SPDX-License-Identifier: GPL-2.0
%YAML 1.2
---
$id: http://devicetree.org/schemas/spmi/spmi.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: System Power Management Interface (SPMI) Controller

maintainers:
  - Josh Cartwright <joshc@codeaurora.org>

description: |
  The System Power Management (SPMI) controller is a 2-wire bus defined
  by the MIPI Alliance for power management control to be used on SoC designs.

  SPMI controllers are modelled in device tree using a generic set of
  bindings defined here, plus any bus controller specific properties, if
  needed.

  Each SPMI controller has zero or more child nodes (up to 16 ones), each
  one representing an unique slave at the bus.

properties:
  $nodename:
    pattern: "spmi@.*"

  reg:
    maxItems: 1

  "#address-cells":
    const: 2

  "#size-cells":
    const: 0

patternProperties:
  ".*@([0-9]|1[0-5])$":
    description: up to 16 child PMIC nodes
    type: object

    properties:
      reg:
        minItems: 1
        maxItems: 2
        items:
          - minimum: 0
            maximum: 0xf
          - enum: [ 0, 1 ]

    required:
      - reg

required:
  - reg

examples:
  - |
    #include <dt-bindings/spmi/spmi.h>

    spmi@0 {
      reg = <0 0>;

      #address-cells = <2>;
      #size-cells = <0>;

      child@0 {
        reg = <0 SPMI_USID>;
      };

      child@7 {
        reg = <7 SPMI_USID>,
              <3 SPMI_GSID>;
      };
    };




