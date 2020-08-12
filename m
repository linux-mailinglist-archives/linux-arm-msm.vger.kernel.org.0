Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7932426E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 10:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgHLIn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 04:43:58 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2595 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726589AbgHLIn6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 04:43:58 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id CA310C936BEE5AAB9BF6;
        Wed, 12 Aug 2020 09:43:55 +0100 (IST)
Received: from localhost (10.227.96.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 12 Aug
 2020 09:43:55 +0100
Date:   Wed, 12 Aug 2020 09:43:53 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Rob Herring <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Mayulong <mayulong1@huawei.com>, <linuxarm@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/33] Add driver for HiSilicon SPMI PMIC for Hikey 970
Message-ID: <20200812094353.00006311@huawei.com>
In-Reply-To: <20200812094540.3ab13185@coco.lan>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <20200811175429.748a69b6@coco.lan>
        <20200811185111.00000648@Huawei.com>
        <20200812094540.3ab13185@coco.lan>
Organization: Huawei tech. R&D (UK)  Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.227.96.57]
X-ClientProxiedBy: lhreml728-chm.china.huawei.com (10.201.108.79) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Aug 2020 09:45:40 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

....

> 
> >   
> > >  	  menus in order to enable them.
> > >  	  We communicate with the Hi6421 via memory-mapped I/O.
> > >  
> > > +config MFD_HI6421_SPMI
> > > +	tristate "HiSilicon Hi6421v600 SPMI PMU/Codec IC"
> > > +	depends on OF
> > > +	select MFD_CORE
> > > +	select REGMAP_MMIO    
> > 
> > Nice thought, but it doesn't use it yet!  
> 
> What do you mean? Makefile should be using it:
> 
> 	$ git grep MFD_HI6421_SPMI
> 	drivers/mfd/Kconfig:config MFD_HI6421_SPMI
> 	drivers/mfd/Makefile:obj-$(CONFIG_MFD_HI6421_SPMI)      += hi6421-spmi-pmic.o

Just the REGMAP bit.  Driver doesn't seem to be using regmap.

> 
> 
> > > + *
> > > + */
> > > +
> > > +#include <linux/slab.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/module.h>
> > > +#include <linux/err.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_gpio.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/mfd/hi6421-spmi-pmic.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/spmi.h>
> > > +#ifndef NO_IRQ
> > > +#define NO_IRQ       0    
> > 
> > Drop  
> 
> Ok! I was in doubt about that, as there are a few other drivers with
> the same pattern:
> 
> 	drivers/ata/sata_dwc_460ex.c:#define NO_IRQ             0
> 	drivers/input/touchscreen/ucb1400_ts.c:#define NO_IRQ   0
> 	drivers/mmc/host/of_mmc_spi.c:#define NO_IRQ 0
> 	drivers/pcmcia/pd6729.c:#define NO_IRQ  ((unsigned int)(0))
> 	drivers/rtc/rtc-m48t59.c:#define NO_IRQ (-1)
> 
> Btw, this definition at the rtc driver sounds weird ;-)

History I guess.   IIRC, a long time back, 0 was a valid IRQ for some architectures.


> 
> > > +	/*SOC_PMIC_IRQ0_ADDR*/    
> > 
> > These superficially feel like things that would come from
> > the compatible, but maybe I'm missing something.  
> 
> My guess is that this is decided by the board manufacturer. I mean,
> from the schematics:
> 
> 	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf
> 
> This is a separate chipset, connected at the Kirin 970 SPMI bus. The SPMI bus
> allows up to 16 PMICs. So, I would assume that a chip designed to support
> SPMI would have the flexibility of using different IRQ lines, being
> programmable either via some firmware or via some wiring.
> 
> Without knowing more, IMO the best would be to keep those settings
> at DT.

Fair enough. Would be nice if they could be established from a bus ID of
some type and the compatible but if we don't have the info to be able to
do that I guess we will have to do it this way.



> >   
> > > +	ret = get_pmic_device_tree_data(np, pmic);
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "Error reading hisi pmic dts\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* TODO: get and enable clk request */
> > > +	spin_lock_init(&pmic->lock);
> > > +
> > > +	pmic->dev = dev;
> > > +
> > > +	pmic->gpio = of_get_gpio_flags(np, 0, &flags);    
> > 
> > Do we need flags for something?
> > 
> > Can we use the gpio/consumer.h interfaces for all this?
> > 
> > Though I'm not sure we need a gpio at all. Looks like we just
> > use it as an interrupt.  Get an interrupt directly instead.  
> 
> Yeah, from what I saw, the GPIOs supported right now by this driver
> are just for IRQs.

Guess they all need switching to just being interrupt lines then.

> 
> > > +	if (pmic->gpio < 0)
> > > +		return pmic->gpio;
> > > +
> > > +	if (!gpio_is_valid(pmic->gpio))
> > > +		return -EINVAL;
> > > +
> > > +	ret = gpio_request_one(pmic->gpio, GPIOF_IN, "pmic");
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to request gpio%d\n", pmic->gpio);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = request_threaded_irq(pmic->irq, hi6421_spmi_irq_handler, NULL,
> > > +				   IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
> > > +				   "pmic", pmic);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "could not claim pmic %d\n", ret);
> > > +		ret = -ENODEV;
> > > +		goto request_theaded_irq;
> > > +	}
> > > +
> > > +	dev_set_drvdata(&pdev->dev, pmic);
> > > +
> > > +	/*
> > > +	 * The logic below will rely that the pmic is already stored at
> > > +	 * drvdata.
> > > +	 */
> > > +	dev_dbg(&pdev->dev, "SPMI-PMIC: adding children for %pOF\n",
> > > +		pdev->dev.of_node);
> > > +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> > > +				   hi6421v600_devs, ARRAY_SIZE(hi6421v600_devs),
> > > +				   NULL, 0, NULL);    
> > 
> > This is mixing and matching managed an unmanaged. Should be one or the other
> > or we might be hiding some race conditions.  

I intended this as a more localized comment, though the following answers
another question I had.

request_threaded_irq is not using devm_ whilst the add devices is.
As a result we might have a path in which the irq goes away before
the device cleanup happens.   

> 
> Actually, it is just the opposite. It took me a lot of time to
> figure out a good solution that will prevent all race conditions at
> probe time.
> 
> See, the SPMI variant of HiSilicon 6421 requires the drivers to be
> probed on a very specific order:
> 
> - The SPMI controller should be loaded first, as it provides 
>   the low-level I/O access to the serial bus used to talk with the
>   PMICs. This bus is somewhat similar to the I2C bus.
> 
>   Once the controller is registered, the SPMI bus probes the PMIC
>   driver.
> 
> - Then, the MFD PMIC driver should be loaded. This adds support for
>   a high level set of I/O operations, which are used by the regulator
>   driver. Again, this approach is similar to the one taken by the
>   I2C Kernel drivers.
> 
> - Finally, the regulator drivers should come, as they rely on the
>   MFD I/O operations in order to talk with the SPMI bus.
> 
> The OOT driver probing was based on a some dirty hacks: it had an
> empty SPMI entry at the SoC, carrying on just the "compatible" line.
> 
> Then, another entry at DT with the real SPMI settings.
> 
> With such dirty hack, on Kernel 4.9, the PMIC driver were always 
> loading before the regulator ones, as the SPMI bus code were 
> serializing the probe there.
> 
> However, such settings were too fragile and broke after porting to
> upstream Kernels, because the regulator drivers were probed on
> a random order, typically before the MFD one (and sometimes even 
> before the SPMI controller driver). Adding EPROBE_DEFER didn't
> solve all the issues, and made a complex and hard to debug scenario.
> Also, regulators were probed on a random order, making harder to
> debug issues there.

There are no ordering guarantees IIRC in mfd children coming up even
in the normal path.  It might currently happen in a particular order
but relying on that seems fragile to me.

> 
> So, I ended using the same solution used by the already-existing
> drivers/mfd/hi6421-pmic-core.c driver[1].
> 
> [1] This variant of the 6421 chipset is a lot simpler, as it
>     doesn't use the SPMI bus.
> 
> With such approach, the probing is warranted to happen the
> way it is expected by the driver:
> 
> SPMI controller code starts:
> 	[    0.416862] spmi_controller fff24000.spmi: HISI SPMI probe
> 	[    0.422419] spmi spmi-0: allocated controller 0x(____ptrval____) id 0
> 	[    0.428929] spmi_controller fff24000.spmi: spmi_add_controller base addr=0xffff800012055000!
> 	[    0.437480] spmi spmi-0: adding child /spmi@fff24000/pmic@0
> 	[    0.443109] spmi spmi-0: read usid 00
> 	[    0.446821] spmi 2-00: device 2-00 registered
> 	[    0.451220] spmi spmi-0: spmi-2 registered: dev:(____ptrval____)
> 	[    0.457286] spmi_controller fff24000.spmi: spmi_add_controller initialized
> 
> The PMIC probe happens sometime after spmi_controller registers itself
> at the SPMI bus:
> 
> 	[    1.955838] [hi6421_spmi_pmic_probe]. pmic->irqs[0] = 43
> ...
> 	[    2.036298] [hi6421_spmi_pmic_probe]. pmic->irqs[15] = 58
> 
> After being ready to handle I/O requests, it starts probing the
> regulators:
> 
> 	[    2.057815] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo3@16
> 	[    2.199827] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo4@17
> 	[    2.336284] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo9@1C
> 	[    2.472675] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo15@21
> 	[    2.609402] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo16@22
> 	[    2.746378] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo17@23
> 	[    2.846707] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo33@32
> 	[    2.988646] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo34@33
> 
> As the current code serializes the regulator probing, it ensured that
> they'll happen at the right order, avoiding race conditions at
> probe time.

Why do we need the regulators to come up in a particular order?
That sounds suspicious as any relationships between different ones should be expressed
either in DT or in the order they are enabled in the drivers using them.

> 
> > 
> >   

> > > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > > index edb1c4f8b496..de8a78487bb9 100644
> > > --- a/drivers/regulator/Kconfig
> > > +++ b/drivers/regulator/Kconfig
> > > @@ -356,6 +356,14 @@ config REGULATOR_HI6421V530
> > >  	  provides 5 general purpose LDOs, and all of them come with support
> > >  	  to either ECO (idle) or sleep mode.
> > >  
> > > +config REGULATOR_HI6421V600
> > > +	tristate "HiSilicon Hi6421v600 PMIC voltage regulator support"
> > > +	depends on MFD_HI6421_PMIC && OF    
> > 
> > Can we do a COMPILE_TEST here?  
> 
> Neither REGULATOR_HI6421V600 nor MFD_HI6421_PMIC depends on ARM or
> ARM64, so they should build fine on any arch. So, I'm failing to see
> why adding COMPILE_TEST would make any difference.

cool. Good to get the extra build coverage.

> 
> > > +
> > > +#include <linux/slab.h>
> > > +#include <linux/device.h>
> > > +#include <linux/module.h>
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/driver.h>
> > > +#include <linux/regulator/machine.h>
> > > +#include <linux/regulator/of_regulator.h>
> > > +#include <linux/mfd/hi6421-spmi-pmic.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/time.h>
> > > +#include <linux/version.h>
> > > +#include <linux/seq_file.h>
> > > +#include <linux/uaccess.h>
> > > +#include <linux/spmi.h>
> > > +
> > > +#define rdev_dbg(rdev, fmt, arg...)	\
> > > +		 pr_debug("%s: %s: " fmt, (rdev)->desc->name, __func__, ##arg)    
> > 
> > Not worth defining in my view.  
> 
> That was my first approach: to drop any existing printk macro, replacing
> them by dev_dbg(). However, with dev_dbg(), the logs were like:
> 
> [    2.069301] platform ldo3: LDO doesn't support economy mode.
> [    2.074969] platform ldo3: voltage selector settings: reg: 0x51, mask: 0xf
> [    2.094593] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.105530] regulator.3: hi6421_spmi_regulator_enable: off_on_delay=20000 us, enable_reg=0x16, enable_mask=0x1
> [    2.153484] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.163409] ldo3: 1500 <--> 2000 mV at 1800 mV normal 
> [    2.181305] regulator.3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.191289] regulator.3: hi6421_spmi_regulator_probe_ldo: valid_modes_mask: 0x2, valid_ops_mask: 0x9
> 
> E. g. the messages printed by the regulator's core were using 
> (rdev)->desc->name on their printks, producing a nice debug
> (when enabled at core level), while dev_dbg() were using a different name.
> 
> In this specific case, one might assume that "regulator.3" is "ldo3",
> but this is by coincidence, as it actually matches the sysfs entries:
> 
> 	$ ls -l /sys/class/regulator/
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.0 -> ../../devices/platform/reg-dummy/regulator/regulator.0
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.1 -> ../../devices/platform/regulator-1v8/regulator/regulator.1
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.10 -> ../../devices/platform/spmi-0/2-00/ldo34/regulator/regulator.10
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.2 -> ../../devices/platform/wlan-en-1-8v/regulator/regulator.2
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.3 -> ../../devices/platform/spmi-0/2-00/ldo3/regulator/regulator.3
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.4 -> ../../devices/platform/spmi-0/2-00/ldo4/regulator/regulator.4
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.5 -> ../../devices/platform/spmi-0/2-00/ldo9/regulator/regulator.5
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.6 -> ../../devices/platform/spmi-0/2-00/ldo15/regulator/regulator.6
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.7 -> ../../devices/platform/spmi-0/2-00/ldo16/regulator/regulator.7
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.8 -> ../../devices/platform/spmi-0/2-00/ldo17/regulator/regulator.8
> 	lrwxrwxrwx 1 root root 0 ago 12 08:26 regulator.9 -> ../../devices/platform/spmi-0/2-00/ldo33/regulator/regulator.9
> 
> When playing with DT, the "regulator.[\d+]" namespace may change,
> making harder to debug stuff. So, basically, enabling just the logs
> at the regulator driver were requiring to double-check the sysfs 
> entries in order to see what "regulator.3" were actually meaning
> with a particular DT setting.
> 
> After adding the macro, the output is a lot easier to be understood:
> 
> [    2.069301] platform ldo3: LDO doesn't support economy mode.
> [    2.074969] platform ldo3: voltage selector settings: reg: 0x51, mask: 0xf
> [    2.094593] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.105530] ldo3: hi6421_spmi_regulator_enable: off_on_delay=20000 us, enable_reg=0x16, enable_mask=0x1
> [    2.153484] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.163409] ldo3: 1500 <--> 2000 mV at 1800 mV normal 
> [    2.181305] ldo3: hi6421_spmi_regulator_get_voltage_sel: vsel_reg=0x51, value=0x8, entry=0x8, voltage=1800 mV
> [    2.191289] ldo3: hi6421_spmi_regulator_probe_ldo: valid_modes_mask: 0x2, valid_ops_mask: 0x9
> 
> As the name which got printed is the one that actually makes sense
> for someone working with the driver, as it matches the DT entries
> and the hardware power supply lines.

Fair enough.  Guess this is one for Mark to ultimately decide.

> 
> > > +static int hi6421_spmi_regulator_set_voltage_sel(struct regulator_dev *rdev,
> > > +						 unsigned int selector)
> > > +{
> > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > > +	u32 reg_val;
> > > +
> > > +	/* unlikely to happen. sanity test done by regulator core */    
> > 
> > Unlikely or can't?
> >   
> > > +	if (unlikely(selector >= rdev->desc->n_voltages))
> > > +		return -EINVAL;  
> 
> Good question. I almost removed this check, but I didn't check the
> regulator code with enough care to be 100% sure. So, I opted to keep it
> here.

I'd drop the comment then :)  If someone else wants to figure it out
in future then they are welcome to.

> 
> > > +
> > > +	reg_val = selector << (ffs(rdev->desc->vsel_mask) - 1);
> > > +
> > > +	/* set voltage selector */
> > > +	rdev_dbg(rdev,
> > > +		 "vsel_reg=0x%x, mask=0x%x, value=0x%x, voltage=%d mV\n",
> > > +		 rdev->desc->vsel_reg, rdev->desc->vsel_mask, reg_val,
> > > +		 rdev->desc->ops->list_voltage(rdev, selector) / 1000);
> > > +
> > > +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->vsel_reg,
> > > +			     rdev->desc->vsel_mask, reg_val);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
> > > +{
> > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > > +	u32 reg_val;
> > > +	unsigned int mode;
> > > +
> > > +	reg_val = hi6421_spmi_pmic_read(pmic, rdev->desc->enable_reg);
> > > +
> > > +	if (reg_val & sreg->eco_mode_mask)
> > > +		mode = REGULATOR_MODE_IDLE;
> > > +	else
> > > +		mode = REGULATOR_MODE_NORMAL;
> > > +
> > > +	rdev_dbg(rdev,
> > > +		 "enable_reg=0x%x, eco_mode_mask=0x%x, reg_val=0x%x, %s mode\n",
> > > +		 rdev->desc->enable_reg, sreg->eco_mode_mask, reg_val,
> > > +		 mode == REGULATOR_MODE_IDLE ? "idle" : "normal");
> > > +
> > > +	return mode;
> > > +}
> > > +
> > > +static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
> > > +					  unsigned int mode)
> > > +{
> > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > > +	u32 val;
> > > +
> > > +	switch (mode) {
> > > +	case REGULATOR_MODE_NORMAL:
> > > +		val = 0;
> > > +		break;
> > > +	case REGULATOR_MODE_IDLE:
> > > +		val = sreg->eco_mode_mask << (ffs(sreg->eco_mode_mask) - 1);
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* set mode */
> > > +	rdev_dbg(rdev, "enable_reg=0x%x, eco_mode_mask=0x%x, value=0x%x\n",
> > > +		 rdev->desc->enable_reg, sreg->eco_mode_mask, val);
> > > +
> > > +	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
> > > +			     sreg->eco_mode_mask, val);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static unsigned int
> > > +hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
> > > +				       int input_uV, int output_uV,
> > > +				       int load_uA)
> > > +{
> > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > +
> > > +	if (load_uA || ((unsigned int)load_uA > sreg->eco_uA)) {
> > > +		rdev_dbg(rdev, "normal mode");    
> > 
> > Debug seems unnecessary to me, but maybe keep it if you want.  
> 
> I actually used this debug. There are some LDO lines which don't
> support eco mode. The original driver was hard to understand that.
> So, I ended by re-writing the part of the code which sets/uses it[1]:
> 
> +	/* hisi regulator supports two modes */
> +	constraint = &initdata->constraints;
> +
> +	constraint->valid_modes_mask = REGULATOR_MODE_NORMAL;
> +	if (sreg->eco_mode_mask) {
> +		constraint->valid_modes_mask |= REGULATOR_MODE_IDLE;
> +		constraint->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> +	}
> +
> 
> [1] https://lore.kernel.org/lkml/176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org/T/#m337e09adf04e4b8ce56af93ba37e3720b2a3002b
> 
> Those debug messages are useful to double-check if something bad is
> not happening with the modes/ops masks.

That's fine, but is it useful to have it upstream now you have debugged
those issues?  I'm not completely convinced it is and debug prints have
a habit of rotting just like comments.

> 
> 
> > > +	/* register regulator */
> > > +	rdev = regulator_register(rdesc, &config);
> > > +	if (IS_ERR(rdev)) {
> > > +		dev_err(dev, "failed to register %s\n",
> > > +			rdesc->name);
> > > +		ret = PTR_ERR(rdev);
> > > +		goto probe_end;
> > > +	}
> > > +
> > > +	rdev_dbg(rdev, "valid_modes_mask: 0x%x, valid_ops_mask: 0x%x\n",
> > > +		 constraint->valid_modes_mask, constraint->valid_ops_mask);
> > > +
> > > +	dev_set_drvdata(dev, rdev);    
> > I'd do separate error path.
> > 
> > 	return 0;
> >   
> > > +probe_end:
> > > +	if (ret)    
> > 
> > ret is set if separate error path.
> > I haven't figured out lifetime but can we not use devm for sreg?
> >   
> > > +		kfree(sreg);  
> 
> I guess we can. I'll check and change if ok.
> 
> > > +static int hi6421_spmi_regulator_remove(struct platform_device *pdev)
> > > +{
> > > +	struct regulator_dev *rdev = dev_get_drvdata(&pdev->dev);
> > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > +
> > > +	regulator_unregister(rdev);
> > > +
> > > +	/* TODO: should i worry about that? devm_kzalloc */    
> > 
> > Answer that TODO.  No unless something odd going on.  
> 
> Yeah, agreed. I'll cleanup useless comments on this driver.
> 
> >   
> > > +	if (rdev->desc->volt_table)
> > > +		devm_kfree(&pdev->dev, (unsigned int *)rdev->desc->volt_table);
> > > +
> > > +	kfree(sreg);    
> > 
> > This is a worrying mix of devm and not.  Never a good sign.
> > Lifetime of sreg seems strange.  
> 
> I guess we can just get rid of both, converting sreg to use devm alloc.
> 
> Btw, at least on Hikey 970 (which happens to be the only board using
> it so far), in practice this driver should never be removed, as, among 
> other things, it controls the power supply for storage (both SD and
> MMC).

Who needs storage? :)


...
> 
> > > +	ret = spmi_controller_add(ctrl);
> > > +	if (ret)
> > > +		goto err_add_controller;
> > > +
> > > +	dev_info(&pdev->dev, "spmi_add_controller initialized\n");    
> > 
> > Too noisy.  
> 
> That's helpful to check if drivers initialized at the right order.
> 
> I'll change it to dev_dbg().

More reasonable.


thanks,

Jonathan

