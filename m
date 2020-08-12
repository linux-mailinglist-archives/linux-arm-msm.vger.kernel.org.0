Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E908242642
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 09:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgHLHpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 03:45:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbgHLHpu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 03:45:50 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE547205CB;
        Wed, 12 Aug 2020 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597218346;
        bh=/pbbaVArdrp8jhK7PtXdwSs4QWyFyTtMi5OlG1XVtgc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qa/uxfQB7flwKzj4LKJejWgE7gWlh42TMDrQzBXjnLgwsarQEEjDtdMV7/VbyXhTY
         47ocvL27mk26DKjRpOj6Ttn1+/TxntPTcsuzGSMUaGYxMLUQKtKfvsXFiGmmSf8nIH
         TifjAFbv4o1BpVME7zDHi8cyg+7p0gGVckRywow0=
Date:   Wed, 12 Aug 2020 09:45:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Rob Herring <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Mayulong <mayulong1@huawei.com>, <linuxarm@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/33] Add driver for HiSilicon SPMI PMIC for Hikey 970
Message-ID: <20200812094540.3ab13185@coco.lan>
In-Reply-To: <20200811185111.00000648@Huawei.com>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <20200811175429.748a69b6@coco.lan>
        <20200811185111.00000648@Huawei.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Tue, 11 Aug 2020 18:51:11 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Tue, 11 Aug 2020 17:54:29 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Tue, 11 Aug 2020 17:41:26 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >   
> > > The Hikey 970 board uses a different PMIC than the one found on Hikey 960.
> > > 
> > > This PMIC uses a SPMI board.
> > > 
> > > This patch series backport the OOT drivers from the Linaro's official
> > > tree for this board:
> > > 
> > > 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> > > 	
> > > Porting them to upstream, cleaning up coding style issues, solving
> > > driver probing order and adding DT documentation.
> > > 
> > > I opted to not fold all patches into a single one, in order to:
> > > 
> > > - Preserve the authorship of the original authors;
> > > - Keep a history of changes.
> > > 
> > > As this could be harder for people to review, I'll be replying to patch 00/32
> > > with all patches folded. This should help reviewers to see the current
> > > code after the entire series is applied.    
> > 
> > As promised, it follows the diff from this entire patch series.
> > 
> > Feel free to review either on the top of this e-mail or on the
> > individual patches.
> >   
> 
> Whilst I agree entirely with Mark about the need to turn this into a clean series,
> I was bored at the end of the day so here is a drive by review..

Thanks for the review!

> I've not looked at anything that really needed any thought as it is too hot for
> thinking.

8-)

> > diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > new file mode 100644
> > index 000000000000..33dcbaeb474e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml

...

> > +        $ref: "/schemas/regulator/regulator.yaml#"
> > +
> > +        properties:
> > +          reg:
> > +            description: Enable register.
> > +
> > +          vsel-reg:
> > +            description: Voltage selector register.
> > +
> > +          enable-mask:
> > +            description: Bitmask used to enable the regulator.
> > +
> > +#          voltage-table:
> > +#            description: Table with the selector items for the voltage regulator.
> > +#            minItems: 2
> > +#            maxItems: 16  
> 
> Guess this needs fixing up.

Ah, yeah. Thanks for noticing. I had some troubles with dtbs_check, so
I ended commenting out some things for testing purposes. I'll remove the
comments and check if this was already solved with the current schema.

> > @@ -39,7 +40,7 @@ memory@0 {
> >  		reg = <0x0 0x0 0x0 0x0>;
> >  	};
> >  
> > -	sd_1v8: regulator-1v8 {
> > +	fixed_1v8: regulator-1v8 {  
> 
> Rename relevant?

I guess I can do the rename to a different patch - or maybe even better - drop
this regulator on this series and re-add with a different name on
some other patch.

The thing is that this regulator is currently used by the SDIO device
drivers. That's the reason why it starts with "sd_". 

However, at the real hardware, there are 3 different regulator outputs 
for SDIO related stuff. Such change is inside this patchset.

However, there is the need of a 1v8 fixed power line used on another 
upcoming driver. I guess I was too lazy to keep the DT info here ;-)

> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index a37d7d171382..04c249649532 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -493,10 +493,25 @@ config MFD_HI6421_PMIC
> >  	  Add support for HiSilicon Hi6421 PMIC. Hi6421 includes multi-
> >  	  functions, such as regulators, RTC, codec, Coulomb counter, etc.
> >  	  This driver includes core APIs _only_. You have to select
> > -	  individul components like voltage regulators under corresponding
> > +	  individual components like voltage regulators under corresponding  
> 
> Don't fix other drivers.

This is actually on an independent patch:

	https://lore.kernel.org/lkml/176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org/T/#m1864011fa82154c6aa27fd4b2e9fce396bb3cd33

I guess I'll just submit this specific one outside this series.

> 
> >  	  menus in order to enable them.
> >  	  We communicate with the Hi6421 via memory-mapped I/O.
> >  
> > +config MFD_HI6421_SPMI
> > +	tristate "HiSilicon Hi6421v600 SPMI PMU/Codec IC"
> > +	depends on OF
> > +	select MFD_CORE
> > +	select REGMAP_MMIO  
> 
> Nice thought, but it doesn't use it yet!

What do you mean? Makefile should be using it:

	$ git grep MFD_HI6421_SPMI
	drivers/mfd/Kconfig:config MFD_HI6421_SPMI
	drivers/mfd/Makefile:obj-$(CONFIG_MFD_HI6421_SPMI)      += hi6421-spmi-pmic.o


> > + *
> > + */
> > +
> > +#include <linux/slab.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/mfd/hi6421-spmi-pmic.h>
> > +#include <linux/irq.h>
> > +#include <linux/spmi.h>
> > +#ifndef NO_IRQ
> > +#define NO_IRQ       0  
> 
> Drop

Ok! I was in doubt about that, as there are a few other drivers with
the same pattern:

	drivers/ata/sata_dwc_460ex.c:#define NO_IRQ             0
	drivers/input/touchscreen/ucb1400_ts.c:#define NO_IRQ   0
	drivers/mmc/host/of_mmc_spi.c:#define NO_IRQ 0
	drivers/pcmcia/pd6729.c:#define NO_IRQ  ((unsigned int)(0))
	drivers/rtc/rtc-m48t59.c:#define NO_IRQ (-1)

Btw, this definition at the rtc driver sounds weird ;-)
 
> > +
> > +/*
> > + * The PMIC register is only 8-bit.
> > + * Hisilicon SoC use hardware to map PMIC register into SoC mapping.
> > + * At here, we are accessing SoC register with 32-bit.  

> Can we return the 8 bits in an int and hence also return error codes?
> > + */
> > +u32 hi6421_spmi_pmic_read(struct hi6421_spmi_pmic *pmic, int reg)

I'll change the driver to use "int" and return proper error codes on errors.

> > +
> > +static int get_pmic_device_tree_data(struct device_node *np,
> > +				     struct hi6421_spmi_pmic *pmic)
> > +{
> > +	int ret = 0;  
> 
> always set.
> 
> > +
> > +	/*get pmic irq num*/  
> Comments are mostly fiarly obvious.

Yep. I'll drop the obvious ones.

> Also if there is one, why use an array read?
> > +	ret = of_property_read_u32_array(np, "irq-num",
> > +					 &pmic->irqnum, 1);


Good point. I'll fix it.


> > +	/*SOC_PMIC_IRQ0_ADDR*/  
> 
> These superficially feel like things that would come from
> the compatible, but maybe I'm missing something.

My guess is that this is decided by the board manufacturer. I mean,
from the schematics:

	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf

This is a separate chipset, connected at the Kirin 970 SPMI bus. The SPMI bus
allows up to 16 PMICs. So, I would assume that a chip designed to support
SPMI would have the flexibility of using different IRQ lines, being
programmable either via some firmware or via some wiring.

Without knowing more, IMO the best would be to keep those settings
at DT.

> 
> > +	ret = of_property_read_u32_array(np, "irq-addr",
> > +					 (int *)&pmic->irq_addr, 2);  
> 
> Unsurprisingly this takes a u32 * not a int *

I'll remove the casting. Btw, I guess I'll even replace it by
a single number instead of an array, as the second value
is already at the "irq-array" DT property:

			irq-num = <16>;
			irq-array = <2>;
			irq-mask-addr = <0x202 2>;
			irq-addr = <0x212 2>;

The arrays for irq-mask-addr and irq-addr are:

	struct hi6421_spmi_irq_mask_info {
		int start_addr;
		int array;
	};

	struct hi6421_spmi_irq_info {
		int start_addr;
		int array;
	};

At the code, sometimes it uses irq_mask->array, while on others it
use irqarray, apparently for the same goal. So, it sounds safe to get
rid of the duplication there. I'll place this on a separate patch,
as I might have been missing something.

> 
> > +	if (ret) {f_prop
> > +		pr_err("no irq-addr property set\n");
> > +		ret = -ENODEV;
> > +		return ret;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void hi6421_spmi_pmic_irq_prc(struct hi6421_spmi_pmic *pmic)
> > +{
> > +	int i;
> > +
> > +	for (i = 0 ; i < pmic->irq_mask_addr.array; i++)
> > +		hi6421_spmi_pmic_write(pmic, pmic->irq_mask_addr.start_addr + i,
> > +				       HISI_MASK_STATE);
> > +
> > +	for (i = 0 ; i < pmic->irq_addr.array; i++) {
> > +		unsigned int pending = hi6421_spmi_pmic_read(pmic, pmic->irq_addr.start_addr + i);
> > +
> > +		pr_debug("PMU IRQ address value:irq[0x%x] = 0x%x\n",
> > +			 pmic->irq_addr.start_addr + i, pending);
> > +		hi6421_spmi_pmic_write(pmic, pmic->irq_addr.start_addr + i,
> > +				       HISI_MASK_STATE);
> > +	}
> > +}
> > +
> > +static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct hi6421_spmi_pmic *pmic = NULL;
> > +	enum of_gpio_flags flags;
> > +	int ret = 0;
> > +	int i;
> > +	unsigned int virq;
> > +
> > +	pmic = devm_kzalloc(dev, sizeof(*pmic), GFP_KERNEL);
> > +	if (!pmic)
> > +		return -ENOMEM;
> > +
> > +	/*TODO: get pmic dts info*/  
> 
> Seems to be done?

Sounds some obsolete comment. I'll drop it.

> 
> > +	ret = get_pmic_device_tree_data(np, pmic);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Error reading hisi pmic dts\n");
> > +		return ret;
> > +	}
> > +
> > +	/* TODO: get and enable clk request */
> > +	spin_lock_init(&pmic->lock);
> > +
> > +	pmic->dev = dev;
> > +
> > +	pmic->gpio = of_get_gpio_flags(np, 0, &flags);  
> 
> Do we need flags for something?
> 
> Can we use the gpio/consumer.h interfaces for all this?
> 
> Though I'm not sure we need a gpio at all. Looks like we just
> use it as an interrupt.  Get an interrupt directly instead.

Yeah, from what I saw, the GPIOs supported right now by this driver
are just for IRQs.

> > +	if (pmic->gpio < 0)
> > +		return pmic->gpio;
> > +
> > +	if (!gpio_is_valid(pmic->gpio))
> > +		return -EINVAL;
> > +
> > +	ret = gpio_request_one(pmic->gpio, GPIOF_IN, "pmic");
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to request gpio%d\n", pmic->gpio);
> > +		return ret;
> > +	}
> > +
> > +	pmic->irq = gpio_to_irq(pmic->gpio);
> > +
> > +	/* mask && clear IRQ status */
> > +	hi6421_spmi_pmic_irq_prc(pmic);
> > +
> > +	pmic->irqs = devm_kzalloc(dev, pmic->irqnum * sizeof(int), GFP_KERNEL);
> > +	if (!pmic->irqs)
> > +		goto irq_malloc;
> > +
> > +	pmic->domain = irq_domain_add_simple(np, pmic->irqnum, 0,
> > +					     &hi6421_spmi_domain_ops, pmic);
> > +	if (!pmic->domain) {
> > +		dev_err(dev, "failed irq domain add simple!\n");
> > +		ret = -ENODEV;
> > +		goto irq_domain;
> > +	}
> > +
> > +	for (i = 0; i < pmic->irqnum; i++) {
> > +		virq = irq_create_mapping(pmic->domain, i);
> > +		if (virq == NO_IRQ) {
> > +			pr_debug("Failed mapping hwirq\n");
> > +			ret = -ENOSPC;
> > +			goto irq_create_mapping;
> > +		}
> > +		pmic->irqs[i] = virq;
> > +		pr_info("[%s]. pmic->irqs[%d] = %d\n", __func__, i, pmic->irqs[i]);  
> 
> Noise

Yep. Will drop or convert into dev_dbg().

> 
> > +	}
> > +
> > +	ret = request_threaded_irq(pmic->irq, hi6421_spmi_irq_handler, NULL,
> > +				   IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
> > +				   "pmic", pmic);
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not claim pmic %d\n", ret);
> > +		ret = -ENODEV;
> > +		goto request_theaded_irq;
> > +	}
> > +
> > +	dev_set_drvdata(&pdev->dev, pmic);
> > +
> > +	/*
> > +	 * The logic below will rely that the pmic is already stored at
> > +	 * drvdata.
> > +	 */
> > +	dev_dbg(&pdev->dev, "SPMI-PMIC: adding children for %pOF\n",
> > +		pdev->dev.of_node);
> > +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> > +				   hi6421v600_devs, ARRAY_SIZE(hi6421v600_devs),
> > +				   NULL, 0, NULL);  
> 
> This is mixing and matching managed an unmanaged. Should be one or the other
> or we might be hiding some race conditions.

Actually, it is just the opposite. It took me a lot of time to
figure out a good solution that will prevent all race conditions at
probe time.

See, the SPMI variant of HiSilicon 6421 requires the drivers to be
probed on a very specific order:

- The SPMI controller should be loaded first, as it provides 
  the low-level I/O access to the serial bus used to talk with the
  PMICs. This bus is somewhat similar to the I2C bus.

  Once the controller is registered, the SPMI bus probes the PMIC
  driver.

- Then, the MFD PMIC driver should be loaded. This adds support for
  a high level set of I/O operations, which are used by the regulator
  driver. Again, this approach is similar to the one taken by the
  I2C Kernel drivers.

- Finally, the regulator drivers should come, as they rely on the
  MFD I/O operations in order to talk with the SPMI bus.

The OOT driver probing was based on a some dirty hacks: it had an
empty SPMI entry at the SoC, carrying on just the "compatible" line.

Then, another entry at DT with the real SPMI settings.

With such dirty hack, on Kernel 4.9, the PMIC driver were always 
loading before the regulator ones, as the SPMI bus code were 
serializing the probe there.

However, such settings were too fragile and broke after porting to
upstream Kernels, because the regulator drivers were probed on
a random order, typically before the MFD one (and sometimes even 
before the SPMI controller driver). Adding EPROBE_DEFER didn't
solve all the issues, and made a complex and hard to debug scenario.
Also, regulators were probed on a random order, making harder to
debug issues there.

So, I ended using the same solution used by the already-existing
drivers/mfd/hi6421-pmic-core.c driver[1].

[1] This variant of the 6421 chipset is a lot simpler, as it
    doesn't use the SPMI bus.

With such approach, the probing is warranted to happen the
way it is expected by the driver:

SPMI controller code starts:
	[    0.416862] spmi_controller fff24000.spmi: HISI SPMI probe
	[    0.422419] spmi spmi-0: allocated controller 0x(____ptrval____) id 0
	[    0.428929] spmi_controller fff24000.spmi: spmi_add_controller base addr=0xffff800012055000!
	[    0.437480] spmi spmi-0: adding child /spmi@fff24000/pmic@0
	[    0.443109] spmi spmi-0: read usid 00
	[    0.446821] spmi 2-00: device 2-00 registered
	[    0.451220] spmi spmi-0: spmi-2 registered: dev:(____ptrval____)
	[    0.457286] spmi_controller fff24000.spmi: spmi_add_controller initialized

The PMIC probe happens sometime after spmi_controller registers itself
at the SPMI bus:

	[    1.955838] [hi6421_spmi_pmic_probe]. pmic->irqs[0] = 43
...
	[    2.036298] [hi6421_spmi_pmic_probe]. pmic->irqs[15] = 58

After being ready to handle I/O requests, it starts probing the
regulators:

	[    2.057815] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo3@16
	[    2.199827] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo4@17
	[    2.336284] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo9@1C
	[    2.472675] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo15@21
	[    2.609402] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo16@22
	[    2.746378] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo17@23
	[    2.846707] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo33@32
	[    2.988646] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo34@33

As the current code serializes the regulator probing, it ensured that
they'll happen at the right order, avoiding race conditions at
probe time.

> 
> 
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to add child devices: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +
> > +request_theaded_irq:
> > +irq_create_mapping:
> > +irq_domain:
> > +irq_malloc:
> > +	gpio_free(pmic->gpio);
> > +	return ret;
> > +}
> > +
> > +static void hi6421_spmi_pmic_remove(struct spmi_device *pdev)
> > +{
> > +	struct hi6421_spmi_pmic *pmic = dev_get_drvdata(&pdev->dev);
> > +
> > +	free_irq(pmic->irq, pmic);
> > +	gpio_free(pmic->gpio);
> > +	devm_kfree(&pdev->dev, pmic);  
> 
> I hope that isn't needed!

Yeah, we can get rid of devm_kfree().

> 
> > +}
> > +
> > +static const struct of_device_id pmic_spmi_id_table[] = {
> > +	{ .compatible = "hisilicon,hi6421-spmi-pmic" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
> > +
> > +static struct spmi_driver hi6421_spmi_pmic_driver = {
> > +	.driver = {
> > +		.name	= "hi6421-spmi-pmic",
> > +		.of_match_table = pmic_spmi_id_table,
> > +	},
> > +	.probe	= hi6421_spmi_pmic_probe,
> > +	.remove	= hi6421_spmi_pmic_remove,
> > +};
> > +module_spmi_driver(hi6421_spmi_pmic_driver);
> > +
> > +MODULE_DESCRIPTION("HiSilicon Hi6421v600 SPMI PMIC driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index edb1c4f8b496..de8a78487bb9 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -356,6 +356,14 @@ config REGULATOR_HI6421V530
> >  	  provides 5 general purpose LDOs, and all of them come with support
> >  	  to either ECO (idle) or sleep mode.
> >  
> > +config REGULATOR_HI6421V600
> > +	tristate "HiSilicon Hi6421v600 PMIC voltage regulator support"
> > +	depends on MFD_HI6421_PMIC && OF  
> 
> Can we do a COMPILE_TEST here?

Neither REGULATOR_HI6421V600 nor MFD_HI6421_PMIC depends on ARM or
ARM64, so they should build fine on any arch. So, I'm failing to see
why adding COMPILE_TEST would make any difference.

> > +
> > +#include <linux/slab.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_address.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/machine.h>
> > +#include <linux/regulator/of_regulator.h>
> > +#include <linux/mfd/hi6421-spmi-pmic.h>
> > +#include <linux/delay.h>
> > +#include <linux/time.h>
> > +#include <linux/version.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/spmi.h>
> > +
> > +#define rdev_dbg(rdev, fmt, arg...)	\
> > +		 pr_debug("%s: %s: " fmt, (rdev)->desc->name, __func__, ##arg)  
> 
> Not worth defining in my view.

That was my first approach: to drop any existing printk macro, replacing
them by dev_dbg(). However, with dev_dbg(), the logs were like:

[    2.069301] platform ldo3: LDO doesn't support economy mode.
[    2.074969] platform ldo3: voltage selector settings: reg: 0x51, mask: 0xf
[    2.094593] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.105530] regulator.3: hi6421_spmi_regulator_enable: off_on_delay=20000 us, enable_reg=0x16, enable_mask=0x1
[    2.153484] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.163409] ldo3: 1500 <--> 2000 mV at 1800 mV normal 
[    2.181305] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.191289] regulator.3: hi6421_spmi_regulator_probe_ldo: valid_modes_mask: 0x2, valid_ops_mask: 0x9

E. g. the messages printed by the regulator's core were using 
(rdev)->desc->name on their printks, producing a nice debug
(when enabled at core level), while dev_dbg() were using a different name.

In this specific case, one might assume that "regulator.3" is "ldo3",
but this is by coincidence, as it actually matches the sysfs entries:

	$ ls -l /sys/class/regulator/
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.0 -> ../../devices/platform/reg-dummy/regulator/regulator.0
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.1 -> ../../devices/platform/regulator-1v8/regulator/regulator.1
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.10 -> ../../devices/platform/spmi-0/2-00/ldo34/regulator/regulator.10
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.2 -> ../../devices/platform/wlan-en-1-8v/regulator/regulator.2
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.3 -> ../../devices/platform/spmi-0/2-00/ldo3/regulator/regulator.3
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.4 -> ../../devices/platform/spmi-0/2-00/ldo4/regulator/regulator.4
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.5 -> ../../devices/platform/spmi-0/2-00/ldo9/regulator/regulator.5
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.6 -> ../../devices/platform/spmi-0/2-00/ldo15/regulator/regulator.6
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.7 -> ../../devices/platform/spmi-0/2-00/ldo16/regulator/regulator.7
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.8 -> ../../devices/platform/spmi-0/2-00/ldo17/regulator/regulator.8
	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.9 -> ../../devices/platform/spmi-0/2-00/ldo33/regulator/regulator.9

When playing with DT, the "regulator.[\d+]" namespace may change,
making harder to debug stuff. So, basically, enabling just the logs
at the regulator driver were requiring to double-check the sysfs 
entries in order to see what "regulator.3" were actually meaning
with a particular DT setting.

After adding the macro, the output is a lot easier to be understood:

[    2.069301] platform ldo3: LDO doesn't support economy mode.
[    2.074969] platform ldo3: voltage selector settings: reg: 0x51, mask: 0xf
[    2.094593] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.105530] ldo3: hi6421_spmi_regulator_enable: off_on_delay=20000 us, enable_reg=0x16, enable_mask=0x1
[    2.153484] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.163409] ldo3: 1500 <--> 2000 mV at 1800 mV normal 
[    2.181305] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
[    2.191289] ldo3: hi6421_spmi_regulator_probe_ldo: valid_modes_mask: 0x2, valid_ops_mask: 0x9

As the name which got printed is the one that actually makes sense
for someone working with the driver, as it matches the DT entries
and the hardware power supply lines.

> > +static int hi6421_spmi_regulator_set_voltage_sel(struct regulator_dev *rdev,
> > +						 unsigned int selector)
> > +{
> > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > +	u32 reg_val;
> > +
> > +	/* unlikely to happen. sanity test done by regulator core */  
> 
> Unlikely or can't?
> 
> > +	if (unlikely(selector >= rdev->desc->n_voltages))
> > +		return -EINVAL;

Good question. I almost removed this check, but I didn't check the
regulator code with enough care to be 100% sure. So, I opted to keep it
here.

> > +
> > +	reg_val = selector << (ffs(rdev->desc->vsel_mask) - 1);
> > +
> > +	/* set voltage selector */
> > +	rdev_dbg(rdev,
> > +		 "vsel_reg=0x%x, mask=0x%x, value=0x%x, voltage=%d mV\n",
> > +		 rdev->desc->vsel_reg, rdev->desc->vsel_mask, reg_val,
> > +		 rdev->desc->ops->list_voltage(rdev, selector) / 1000);
> > +
> > +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->vsel_reg,
> > +			     rdev->desc->vsel_mask, reg_val);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
> > +{
> > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > +	u32 reg_val;
> > +	unsigned int mode;
> > +
> > +	reg_val = hi6421_spmi_pmic_read(pmic, rdev->desc->enable_reg);
> > +
> > +	if (reg_val & sreg->eco_mode_mask)
> > +		mode = REGULATOR_MODE_IDLE;
> > +	else
> > +		mode = REGULATOR_MODE_NORMAL;
> > +
> > +	rdev_dbg(rdev,
> > +		 "enable_reg=0x%x, eco_mode_mask=0x%x, reg_val=0x%x, %s mode\n",
> > +		 rdev->desc->enable_reg, sreg->eco_mode_mask, reg_val,
> > +		 mode == REGULATOR_MODE_IDLE ? "idle" : "normal");
> > +
> > +	return mode;
> > +}
> > +
> > +static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
> > +					  unsigned int mode)
> > +{
> > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > +	u32 val;
> > +
> > +	switch (mode) {
> > +	case REGULATOR_MODE_NORMAL:
> > +		val = 0;
> > +		break;
> > +	case REGULATOR_MODE_IDLE:
> > +		val = sreg->eco_mode_mask << (ffs(sreg->eco_mode_mask) - 1);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* set mode */
> > +	rdev_dbg(rdev, "enable_reg=0x%x, eco_mode_mask=0x%x, value=0x%x\n",
> > +		 rdev->desc->enable_reg, sreg->eco_mode_mask, val);
> > +
> > +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
> > +			     sreg->eco_mode_mask, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int
> > +hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
> > +				       int input_uV, int output_uV,
> > +				       int load_uA)
> > +{
> > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > +
> > +	if (load_uA || ((unsigned int)load_uA > sreg->eco_uA)) {
> > +		rdev_dbg(rdev, "normal mode");  
> 
> Debug seems unnecessary to me, but maybe keep it if you want.

I actually used this debug. There are some LDO lines which don't
support eco mode. The original driver was hard to understand that.
So, I ended by re-writing the part of the code which sets/uses it[1]:

+	/* hisi regulator supports two modes */
+	constraint = &initdata->constraints;
+
+	constraint->valid_modes_mask = REGULATOR_MODE_NORMAL;
+	if (sreg->eco_mode_mask) {
+		constraint->valid_modes_mask |= REGULATOR_MODE_IDLE;
+		constraint->valid_ops_mask |= REGULATOR_CHANGE_MODE;
+	}
+

[1] https://lore.kernel.org/lkml/176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org/T/#m337e09adf04e4b8ce56af93ba37e3720b2a3002b

Those debug messages are useful to double-check if something bad is
not happening with the modes/ops masks.


> > +	/* register regulator */
> > +	rdev = regulator_register(rdesc, &config);
> > +	if (IS_ERR(rdev)) {
> > +		dev_err(dev, "failed to register %s\n",
> > +			rdesc->name);
> > +		ret = PTR_ERR(rdev);
> > +		goto probe_end;
> > +	}
> > +
> > +	rdev_dbg(rdev, "valid_modes_mask: 0x%x, valid_ops_mask: 0x%x\n",
> > +		 constraint->valid_modes_mask, constraint->valid_ops_mask);
> > +
> > +	dev_set_drvdata(dev, rdev);  
> I'd do separate error path.
> 
> 	return 0;
> 
> > +probe_end:
> > +	if (ret)  
> 
> ret is set if separate error path.
> I haven't figured out lifetime but can we not use devm for sreg?
> 
> > +		kfree(sreg);

I guess we can. I'll check and change if ok.

> > +static int hi6421_spmi_regulator_remove(struct platform_device *pdev)
> > +{
> > +	struct regulator_dev *rdev = dev_get_drvdata(&pdev->dev);
> > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > +
> > +	regulator_unregister(rdev);
> > +
> > +	/* TODO: should i worry about that? devm_kzalloc */  
> 
> Answer that TODO.  No unless something odd going on.

Yeah, agreed. I'll cleanup useless comments on this driver.

> 
> > +	if (rdev->desc->volt_table)
> > +		devm_kfree(&pdev->dev, (unsigned int *)rdev->desc->volt_table);
> > +
> > +	kfree(sreg);  
> 
> This is a worrying mix of devm and not.  Never a good sign.
> Lifetime of sreg seems strange.

I guess we can just get rid of both, converting sreg to use devm alloc.

Btw, at least on Hikey 970 (which happens to be the only board using
it so far), in practice this driver should never be removed, as, among 
other things, it controls the power supply for storage (both SD and
MMC).


> > diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> > index a53bad541f1a..b44e2ab6bf81 100644
> > --- a/drivers/spmi/Kconfig
> > +++ b/drivers/spmi/Kconfig
> > @@ -25,4 +25,13 @@ config SPMI_MSM_PMIC_ARB
> >  	  This is required for communicating with Qualcomm PMICs and
> >  	  other devices that have the SPMI interface.
> >  
> > +config SPMI_HISI3670
> > +	tristate "Hisilicon 3670 SPMI Controller"
> > +	select IRQ_DOMAIN_HIERARCHY
> > +	depends on HAS_IOMEM  
> 
> I have a vague recollection some magic was done to mean we don't need that
> any more (stubs for the few cases where it doesn't exist).
> Could have remembered wrong though.

Yeah, I also have a vage remind about HAS_IOMEM and stubs at the headers
(or some other config option similar to it), but not really sure.

There is just another SPMI driver. So, I ended playing safe here by
duplicating select/depends on from the previous entry. Btw,
there are several other places with the same pattern.

> > +	/* Start the transaction */
> > +	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
> > +
> > +	rc = spmi_controller_wait_for_done(&ctrl->dev, spmi_controller,
> > +					   spmi_controller->base, sid, addr);
> > +	spin_unlock_irqrestore(&spmi_controller->lock, flags);
> > +
> > +	if (rc)
> > +		dev_err(&ctrl->dev, "spmi write wait timeout op:0x%x sid:%d addr:0x%x bc:%ld\n",
> > +			opc, sid, addr, bc);
> > +	else
> > +		dev_dbg(&ctrl->dev, "%s: id:%d addr:0x%x, wrote value: %*ph\n",
> > +			__func__, sid, addr, (int)bc, __buf);  
> 
> I'd drop the debug.  Adds a lot of code for limited benefit.

Yeah, I guess this can now be dropped. That was required while
fixing some endianness issues at the past code.

> > +	ret = spmi_controller_add(ctrl);
> > +	if (ret)
> > +		goto err_add_controller;
> > +
> > +	dev_info(&pdev->dev, "spmi_add_controller initialized\n");  
> 
> Too noisy.

That's helpful to check if drivers initialized at the right order.

I'll change it to dev_dbg().

> 
> > +	return 0;
> > +
> > +err_add_controller:
> > +	dev_err(&pdev->dev, "spmi_add_controller failed!\n");  
> 
> Seems too noisy to me given information provided is minimal.

I'll add the error code to the message.

> > diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> > index c16b60f645a4..253340e10dab 100644
> > --- a/drivers/spmi/spmi.c
> > +++ b/drivers/spmi/spmi.c  
> 
> All the changes in here look to be cleanup.  Drop it from this series
> as it just adds noise.

Yeah, makes sense. Will submit it on a separate patch.

> > @@ -545,13 +548,10 @@ static int spmi_ctrl_remove_device(struct device *dev, void *data)
> >   */
> >  void spmi_controller_remove(struct spmi_controller *ctrl)
> >  {
> > -	int dummy;
> > -
> >  	if (!ctrl)
> >  		return;
> >  
> > -	dummy = device_for_each_child(&ctrl->dev, NULL,
> > -				      spmi_ctrl_remove_device);
> > +	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
> >  	device_del(&ctrl->dev);
> >  }
> >  EXPORT_SYMBOL_GPL(spmi_controller_remove);  

This one is on a separate patch already. Will submit in separate.

Thanks,
Mauro
