Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C57349345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 14:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCYNsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 09:48:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhCYNrv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 09:47:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7088161A0F;
        Thu, 25 Mar 2021 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616680070;
        bh=rbWgT8Nk/uYvrxfv2Q3Zxu0QvvEsgpltMM38kZY5nns=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Is+XHdO3sb4UPUtdEOQelQf7JpDhKMGXlHz/+nMBUDGKMwzJxakfmypUKmWBwdELr
         T8Uq990sjxW1hH+jU0jdKZacd8O6y5GqXd3aV88ddiNZCA7h9KTdcfYXKntMSIF8ej
         FRBlOhM96UbHf+Hixl05+0W3kg+UTEQ+fodZquDanUac9xPXv+QoIwusCS6+5HszGy
         9afklPQ6RhWF9fDktc6UwD4SU8TUI1WjKwY027QShsN2zqLWUru6idkVOG0hBL0jFD
         SuwsI6hjhy3+XzIvyki3xHbXYym5jcxClyCRQOCblq763YB/7SwR4BcFRKQKM1eUlJ
         U0Z9/e17lkaFA==
Date:   Thu, 25 Mar 2021 14:47:43 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mayulong <mayulong1@huawei.com>, Stephen Boyd <sboyd@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/21] spmi: hisi-spmi-controller: move driver from
 staging
Message-ID: <20210325144743.2d740a06@coco.lan>
In-Reply-To: <20210205221947.GA3848249@robh.at.kernel.org>
References: <cover.1611072387.git.mchehab+huawei@kernel.org>
        <b74098493891d0e7386c3cdb4e466aed9450b1d9.1611072387.git.mchehab+huawei@kernel.org>
        <20210205221947.GA3848249@robh.at.kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Fri, 5 Feb 2021 16:19:47 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Tue, Jan 19, 2021 at 05:10:43PM +0100, Mauro Carvalho Chehab wrote:
> > The Hisilicon 6421v600 SPMI driver is ready for mainstream.
> > 
> > So, move it from staging.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  75 ++++
> >  MAINTAINERS                                   |   7 +
> >  drivers/spmi/Kconfig                          |   9 +
> >  drivers/spmi/Makefile                         |   1 +
> >  drivers/spmi/hisi-spmi-controller.c           | 358 ++++++++++++++++++
> >  drivers/staging/hikey9xx/Kconfig              |  11 -
> >  drivers/staging/hikey9xx/Makefile             |   1 -
> >  .../staging/hikey9xx/hisi-spmi-controller.c   | 358 ------------------
> >  .../hisilicon,hisi-spmi-controller.yaml       |  75 ----
> >  9 files changed, 450 insertions(+), 445 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> >  create mode 100644 drivers/spmi/hisi-spmi-controller.c
> >  delete mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
> >  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > new file mode 100644
> > index 000000000000..21f68a9c2df1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HiSilicon SPMI controller
> > +
> > +maintainers:
> > +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > +
> > +description: |
> > +  The HiSilicon SPMI BUS controller is found on some Kirin-based designs.
> > +  It is a MIPI System Power Management (SPMI) controller.
> > +
> > +  The PMIC part is provided by
> > +  drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "spmi@[0-9a-f]"
> > +
> > +  compatible:
> > +    const: hisilicon,kirin970-spmi-controller  
> 
> '-controller' is kind of redundant.

Ok. Will drop it.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +  
> 
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 0  
> 
> These 2 are covered by spmi.yaml

Ok.

> 
> > +
> > +  spmi-channel:
> > +    description: |
> > +      number of the Kirin 970 SPMI channel where the SPMI devices are connected.  
> 
> Common to SPMI? If not, needs a vendor prefix.

That's an interesting question. My understanding is that this is not
vendor-specific, but maybe Stephen can give us more details.

The spmi.h header calls it "nr", and documents it at include/linux/spmi.h
as:

	/**
	 * struct spmi_controller - interface to the SPMI master controller
	 * @dev:	Driver model representation of the device.
	 * @nr:		board-specific number identifier for this controller/bus
	 * @cmd:	sends a non-data command sequence on the SPMI bus.
	 * @read_cmd:	sends a register read command sequence on the SPMI bus.
	 * @write_cmd:	sends a register write command sequence on the SPMI bus.
	 */

There, it says that this is "board-specific number identifier".

Yet, as the SPMI is a serial bus with up to 4 masters (controller), I 
suspect that the idea is to associate it with the master ID.

This is used on boards with multiple SoCs. See, for instance, slide 5 of:

	https://www.mipi.org/sites/default/files/Bangalore-Qualcomm-SPMI-1.0-Multi-master-Verification.pdf

However, it is hard to know for sure, as no drivers use it, except by
Hikey 970 controller:

	$ grep "\b\->nr\b" $(git grep -l spmi.h)
	drivers/spmi/spmi.c:	ida_simple_remove(&ctrl_ida, ctrl->nr);
	drivers/spmi/spmi.c:	dev_set_name(&sdev->dev, "%d-%02x", ctrl->nr, sdev->usid);
	drivers/spmi/spmi.c:	ctrl->nr = id;
	drivers/spmi/spmi.c:		ctrl->nr, &ctrl->dev);
	drivers/staging/hikey9xx/hisi-spmi-controller.c:	ctrl->nr = spmi_controller->channel;

> 
> Type? Range of values?

The SPMI core defines it as "unsigned int". So, I would use:

	    $ref: /schemas/types.yaml#/definitions/uint32

as a type. 

At the driver, this is used to calculate the channel offset with:

	static int spmi_write_cmd(...) {
		u32 chnl_ofst = SPMI_CHANNEL_OFFSET * spmi_controller->channel;
...
		writel((u32 __force)cpu_to_be32(data),
		       spmi_controller->base + chnl_ofst +
		       SPMI_APB_SPMI_WDATA0_BASE_ADDR +
		       SPMI_PER_DATAREG_BYTE * i);
...
	}

As on both spmi.h and the Hikey 970 SPMI controller defines it as uint32, 
it doesn't seem to be a good idea to put a range of values, specially 
since we don't have the datasheets for this SoC.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spmi-channel  
> 
> > +  - "#address-cells"
> > +  - "#size-cells"  
> 
> Covered by spmi.yaml.
> 
> > +
> > +patternProperties:
> > +  "^pmic@[0-9a-f]$":  
> 
> Presumably you could have something besides a PMIC.

Hmm... SPMI means MIPI System Power Management Interface.
The MIPI says that [1]:

	"The MIPI System Power Management Interface is a two-wire serial
	 interface that uses CMOS I/Os for the physical layer. The interface
	 connects the integrated power controller of a system-on-chip (SoC)
	 processor system with one or more power management IC voltage
	 regulation systems."

[1] https://www.mipi.org/specifications/system-power-management-interface

OK, as this is a serial bus, I guess one could abuse the interface
and add non-PMIC devices on it. Also, some future version of SPMI
might extend it to non-PMIC devices, but, IMO, if we ever add a 
non-PMIC device, another patternProperties would be needed in order
to describe the other device types that could be connected to the PM bus.

> 
> > +    description: |
> > +      PMIC properties, which are specific to the used SPMI PMIC device(s).
> > +      When used in combination with HiSilicon 6421v600, the properties
> > +      are documented at
> > +      drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml.
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    bus {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      spmi: spmi@fff24000 {
> > +        compatible = "hisilicon,kirin970-spmi-controller";
> > +        #address-cells = <2>;
> > +        #size-cells = <0>;
> > +        status = "ok";  
> 
> Drop status.

Ok.

> 
> > +        reg = <0x0 0xfff24000 0x0 0x1000>;
> > +        spmi-channel = <2>;
> > +
> > +        pmic@0 {
> > +          reg = <0 0>;
> > +          /* pmic properties */
> > +        };
> > +      };
> > +    };


Thanks,
Mauro
