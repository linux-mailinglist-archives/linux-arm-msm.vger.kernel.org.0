Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AEA24284D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 12:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHLKic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 06:38:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgHLKi2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 06:38:28 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7713720838;
        Wed, 12 Aug 2020 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597228706;
        bh=g6m2gf+6OBWGn05WPGw6L9qsMIa6by+okI+mSWeQnNo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OZKhUZ1nNA7h16NoZvqKrSSMLoAEgHrDumMmmOAoE8cskcUXIGxGGF8/8f7q5bgBZ
         xRuVMbeZ5p4FU0cj0sH3T1QqA1qHLpxuCTU6sIDSQo1G9UdFf7wSKUmW8q/QsXDoYn
         dRvExUU7pzCJqAAIiy7ah4Bca9bihRA4tprKTgu0=
Date:   Wed, 12 Aug 2020 12:38:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
Message-ID: <20200812123820.61fcdcc0@coco.lan>
In-Reply-To: <20200812094353.00006311@huawei.com>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <20200811175429.748a69b6@coco.lan>
        <20200811185111.00000648@Huawei.com>
        <20200812094540.3ab13185@coco.lan>
        <20200812094353.00006311@huawei.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Wed, 12 Aug 2020 09:43:53 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> escreveu:

> On Wed, 12 Aug 2020 09:45:40 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > 
> > > This is mixing and matching managed an unmanaged. Should be one or the other
> > > or we might be hiding some race conditions.    
> 
> I intended this as a more localized comment, though the following answers
> another question I had.
> 
> request_threaded_irq is not using devm_ whilst the add devices is.
> As a result we might have a path in which the irq goes away before
> the device cleanup happens.   

Ah, good point! I'll address it.

> > Actually, it is just the opposite. It took me a lot of time to
> > figure out a good solution that will prevent all race conditions at
> > probe time.
> > 
> > See, the SPMI variant of HiSilicon 6421 requires the drivers to be
> > probed on a very specific order:
> > 
> > - The SPMI controller should be loaded first, as it provides 
> >   the low-level I/O access to the serial bus used to talk with the
> >   PMICs. This bus is somewhat similar to the I2C bus.
> > 
> >   Once the controller is registered, the SPMI bus probes the PMIC
> >   driver.
> > 
> > - Then, the MFD PMIC driver should be loaded. This adds support for
> >   a high level set of I/O operations, which are used by the regulator
> >   driver. Again, this approach is similar to the one taken by the
> >   I2C Kernel drivers.
> > 
> > - Finally, the regulator drivers should come, as they rely on the
> >   MFD I/O operations in order to talk with the SPMI bus.
> > 
> > The OOT driver probing was based on a some dirty hacks: it had an
> > empty SPMI entry at the SoC, carrying on just the "compatible" line.
> > 
> > Then, another entry at DT with the real SPMI settings.
> > 
> > With such dirty hack, on Kernel 4.9, the PMIC driver were always 
> > loading before the regulator ones, as the SPMI bus code were 
> > serializing the probe there.
> > 
> > However, such settings were too fragile and broke after porting to
> > upstream Kernels, because the regulator drivers were probed on
> > a random order, typically before the MFD one (and sometimes even 
> > before the SPMI controller driver). Adding EPROBE_DEFER didn't
> > solve all the issues, and made a complex and hard to debug scenario.
> > Also, regulators were probed on a random order, making harder to
> > debug issues there.  
> 
> There are no ordering guarantees IIRC in mfd children coming up even
> in the normal path.  It might currently happen in a particular order
> but relying on that seems fragile to me.

True, but in the case of SPMI controller and PMIC, there's no way
to support them to be initialized on a random order.

That's why the approach I took is serializing the probe.

> > 
> > So, I ended using the same solution used by the already-existing
> > drivers/mfd/hi6421-pmic-core.c driver[1].
> > 
> > [1] This variant of the 6421 chipset is a lot simpler, as it
> >     doesn't use the SPMI bus.
> > 
> > With such approach, the probing is warranted to happen the
> > way it is expected by the driver:
> > 
> > SPMI controller code starts:
> > 	[    0.416862] spmi_controller fff24000.spmi: HISI SPMI probe
> > 	[    0.422419] spmi spmi-0: allocated controller 0x(____ptrval____) id 0
> > 	[    0.428929] spmi_controller fff24000.spmi: spmi_add_controller base addr=0xffff800012055000!
> > 	[    0.437480] spmi spmi-0: adding child /spmi@fff24000/pmic@0
> > 	[    0.443109] spmi spmi-0: read usid 00
> > 	[    0.446821] spmi 2-00: device 2-00 registered
> > 	[    0.451220] spmi spmi-0: spmi-2 registered: dev:(____ptrval____)
> > 	[    0.457286] spmi_controller fff24000.spmi: spmi_add_controller initialized
> > 
> > The PMIC probe happens sometime after spmi_controller registers itself
> > at the SPMI bus:
> > 
> > 	[    1.955838] [hi6421_spmi_pmic_probe]. pmic->irqs[0] = 43
> > ...
> > 	[    2.036298] [hi6421_spmi_pmic_probe]. pmic->irqs[15] = 58
> > 
> > After being ready to handle I/O requests, it starts probing the
> > regulators:
> > 
> > 	[    2.057815] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo3@16
> > 	[    2.199827] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo4@17
> > 	[    2.336284] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo9@1C
> > 	[    2.472675] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo15@21
> > 	[    2.609402] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo16@22
> > 	[    2.746378] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo17@23
> > 	[    2.846707] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo33@32
> > 	[    2.988646] hi6421v600-regulator hi6421v600-regulator: adding child /spmi@fff24000/pmic@0/regulators/ldo34@33
> > 
> > As the current code serializes the regulator probing, it ensured that
> > they'll happen at the right order, avoiding race conditions at
> > probe time.  
> 
> Why do we need the regulators to come up in a particular order?
> That sounds suspicious as any relationships between different ones should be expressed
> either in DT or in the order they are enabled in the drivers using them.

There's no need for them to come up on a particular order.

What I meant to say is that the that the SPMI controller and MFD
should go first.

- 

Yet, incidentally, the current code also serializes the regulator
probe. I could have written the code on a different way that
would allow them to be probed in parallel, by moving a loop
from the regulator driver to the PMIC one. However, I don't see any 
advantage on doing that, as the regulator initialization code ends 
calling the SPMI serial bus, whose access is already serialized by 
a spinlock.

So, there's no performance gain by allowing them to be probed
in parallel, as most of the regulator's probing time is probably
waiting for the relatively slow I/O serial transfers to happen. 

Also, a nice a side effect of serializing the probe at the 
regulator driver is that the devices are ordered according
their LDO numbers, and the debug logs from probing time will
be altogether, helping to debug potential issues over there.

> > > > +static int hi6421_spmi_regulator_set_voltage_sel(struct regulator_dev *rdev,
> > > > +						 unsigned int selector)
> > > > +{
> > > > +	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
> > > > +	struct hi6421_spmi_pmic *pmic = sreg->pmic;
> > > > +	u32 reg_val;
> > > > +
> > > > +	/* unlikely to happen. sanity test done by regulator core */      
> > > 
> > > Unlikely or can't?
> > >     
> > > > +	if (unlikely(selector >= rdev->desc->n_voltages))
> > > > +		return -EINVAL;    
> > 
> > Good question. I almost removed this check, but I didn't check the
> > regulator code with enough care to be 100% sure. So, I opted to keep it
> > here.  
> 
> I'd drop the comment then :)  If someone else wants to figure it out
> in future then they are welcome to.

Ok.

> > > > +	if (load_uA || ((unsigned int)load_uA > sreg->eco_uA)) {
> > > > +		rdev_dbg(rdev, "normal mode");      
> > > 
> > > Debug seems unnecessary to me, but maybe keep it if you want.    
> > 
> > I actually used this debug. There are some LDO lines which don't
> > support eco mode. The original driver was hard to understand that.
> > So, I ended by re-writing the part of the code which sets/uses it[1]:
> > 
> > +	/* hisi regulator supports two modes */
> > +	constraint = &initdata->constraints;
> > +
> > +	constraint->valid_modes_mask = REGULATOR_MODE_NORMAL;
> > +	if (sreg->eco_mode_mask) {
> > +		constraint->valid_modes_mask |= REGULATOR_MODE_IDLE;
> > +		constraint->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> > +	}
> > +
> > 
> > [1] https://lore.kernel.org/lkml/176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org/T/#m337e09adf04e4b8ce56af93ba37e3720b2a3002b
> > 
> > Those debug messages are useful to double-check if something bad is
> > not happening with the modes/ops masks.  
> 
> That's fine, but is it useful to have it upstream now you have debugged
> those issues?  I'm not completely convinced it is and debug prints have
> a habit of rotting just like comments.

Good point. I'll do a review at the printks inside the driver anyway.

I'll try to cleanup some things that doesn't make much sense
after having the driver working properly.


Thanks,
Mauro
