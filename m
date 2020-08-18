Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C58248C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 19:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgHRRIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 13:08:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35601 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgHRRIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 13:08:00 -0400
Received: by mail-io1-f67.google.com with SMTP id s189so21943213iod.2;
        Tue, 18 Aug 2020 10:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A2xop2H9vTl/YZREW0gqMsCXR0nl3e4Uon7ExhLS194=;
        b=Z7Fha6I5K43GuEPPHh+jpYTCUkmib5GzGbiHqpSFNIXWRTQQveASAIhWgwp4dMWLp5
         jVIIKf9VPnyvXOebvfXOidZDh+Y5utj6ctznkZzIIaDxcPKsDYZQGKuuHSybXK20YNCs
         TRul5y60fpNNMrVJ/V8mqndSix2PA5c77wDBaZ1wMq3KRnkWGdR7XhvK152Y8MBYDs5u
         k3hjd06s3RxtdDrw92VJuHiu1tkaUusVMa/HEiN3Sm/Rqs1Afr6ZfLt/Sm/vOGtbFK00
         gqOdEQ7DNIRA0UUqI+1cXGUQGv5C8033Z2yD1HHT0QN8fsovp4OpCqF2qlmC4iiTMmmL
         jHZg==
X-Gm-Message-State: AOAM533rGokorfAzgbm1dpRra6w2Th5wnnUAFxdFjSKiSzY98XX+s6+2
        pP/h52JeAY0ncFRmybRh9A==
X-Google-Smtp-Source: ABdhPJyTNDRqmbKhIk69ihOZl64jZVWiRrthlBLpdMgM+vma2Yr+SeafDXVYASHtpyhcXDInGX4zeA==
X-Received: by 2002:a6b:e903:: with SMTP id u3mr17053625iof.37.1597770477720;
        Tue, 18 Aug 2020 10:07:57 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c90sm10040742ilf.30.2020.08.18.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 10:07:57 -0700 (PDT)
Received: (nullmailer pid 3628738 invoked by uid 1000);
        Tue, 18 Aug 2020 17:07:55 -0000
Date:   Tue, 18 Aug 2020 11:07:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200818170755.GA3603438@bogus>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
 <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
 <20200817201211.GA1437827@bogus>
 <20200818111351.7e3fc780@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818111351.7e3fc780@coco.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 18, 2020 at 11:13:51AM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 17 Aug 2020 14:12:11 -0600
> Rob Herring <robh@kernel.org> escreveu:
> 
> > On Mon, Aug 17, 2020 at 09:11:02AM +0200, Mauro Carvalho Chehab wrote:
> > > Add documentation for the properties needed by the HiSilicon
> > > 6421v600 driver, and by the SPMI controller used to access
> > > the chipset.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 ++++++++++++++++++
> > >  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
> > >  2 files changed, 236 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > > new file mode 100644
> > > index 000000000000..95494114554d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > > @@ -0,0 +1,182 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: HiSilicon 6421v600 SPMI PMIC
> > > +
> > > +maintainers:
> > > +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > +
> > > +description: |
> > > +  HiSilicon 6421v600 uses a MIPI System Power Management (SPMI) bus in order
> > > +  to provide interrupts and power supply.
> > > +
> > > +  The GPIO and interrupt settings are represented as part of the top-level PMIC
> > > +  node.
> > > +
> > > +  The SPMI controller part is provided by
> > > +  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml.
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "pmic@[0-9a-f]"
> > > +
> > > +  compatible:
> > > +    const: hisilicon,hi6421-spmi-pmic  
> > 
> > -spmi-pmic is redundant. Can the hi6421 be anything else?
> 
> There are other HiSilicom 6421 variants that don't use SPMI bus:
> 
> 	Documentation/devicetree/bindings/mfd/hi6421.txt:       "hisilicon,hi6421-pmic";
> 	Documentation/devicetree/bindings/mfd/hi6421.txt:       "hisilicon,hi6421v530-pmic";
> 
> The DT file on Kernel 4.9 uses hi6421v600 (although the schematics
> from 96boards name it as hi6421v610).
> 
> While I don't mind much,would prefer to keep "spmi" on its name, in order
> to distinguish this one from the non-spmi variants.

Fine, though since probing is bus specific it works fine if the same 
compatible is used with different buses. Devices with multiple bus 
options are pretty common.


> Maybe we use this for compatible:
> 
> 	hisilicon,hi6421v600-spmi

Okay.

> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  spmi-channel:
> > > +    description: number of the SPMI channel where the PMIC is connected  
> > 
> > This looks like a common (to SPMI), but it's not something defined in 
> > spmi.txt 
> 
> This one is not part of the SPMI core. It is stored inside a private 
> structure inside at the HiSilicon spmi controller driver. It is stored 
> there as ctrl_dev->channel, and it is used to calculate the register offset
> for readl():
> 
> 	offset  = SPMI_APB_SPMI_STATUS_BASE_ADDR;
> 	offset += SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * sid;
> 	do {
> 		status = readl(base + offset);
> 	...
> 
> The SPMI bus is somewhat similar to I2C: it is a 2-wire serial bus
> with up to 16 devices connected to it.
> 
> Now, most modern I2C chipsets provide multiple independent I2C
> channels, on different pins. Also, on some chipsets, certain
> GPIO pins can be used either as GPIO or as I2C.
> 
> I strongly suspect that this is the case here: according with
> the Hikey 970 schematics:
> 
> 	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf
> 
> The pins used by SPMI clock/data can also be used as GPIO.
> 
> While I don't have access to the datasheets for Kirin 970 (or any other
> chipsets on this board), for me, it sounds that different GPIO pins
> are allowed to use SPMI. The "spmi-channel" property specifies
> what pins will be used for SPMI, among the ones that are
> compatible with MIPI SPMI specs.

Based on this, I think it should be called 'hisilicon,spmi-channel' as 
it is vendor specific. 


> > (which should ideally be converted to schema first). 
> 
> I can try porting spmi schema to yaml on a separate patch,
> and submit it independently of this series.
> 
> > Minimally, 
> > it needs a better explanation and determination if it should be common 
> > or is HiSilicon specific.
> 
> What about:
> 
>   spmi-channel:
>     description: |
>       number of the SPMI channel at the HiSilicon SoC that will
>       be used for the MIPI SPMI controller.
> 
> > 
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 2
> > > +
> > > +  interrupt-controller:
> > > +    description:
> > > +      Identify that the PMIC is capable of behaving as an interrupt controller.  
> > 
> > No need to redefine common properties if nothing specific to this device 
> > to say. Just:
> > 
> > interrupt-controller: true
> 
> Ok.
> 
> > 
> > > +
> > > +  gpios:
> > > +    maxItems: 1
> > > +
> > > +  irq-num:
> > > +    description: Interrupt request number
> > > +
> > > +  'irq-array':
> > > +    description: Interrupt request array
> > > +
> > > +  'irq-mask-addr':
> > > +    description: Address for the interrupt request mask
> > > +
> > > +  'irq-addr':
> > > +    description: Address for the interrupt request  
> > 
> > What's all these non-standard interrupt properties?
> 
> After doing a deeper look at the code which handles IRQs on this PMIC,
> I'm considering to get rid of two properties: irq-num and irq-array.
> 
> See, the code does this:
> 
> 	/* During probe time */
> 	pmic->irqs = devm_kzalloc(dev, pmic->irqnum * sizeof(int), GFP_KERNEL);
> 
> 	/* While handling IRQs */
> 	for (i = 0; i < pmic->irqarray; i++) {
> 		pending = hi6421_spmi_pmic_read(pmic, (i + pmic->irq_addr));
> 		pending &= 0xff;
> 
> 		for_each_set_bit(offset, &pending, 8)
> 			generic_handle_irq(pmic->irqs[offset + i * 8]);
> 
> 	}
> 
> Right now, Hikey 970 sets:
> 
> 	irq-num = <16>;
> 	irq-array = <2>;
> 	irq-mask-addr = <0x202>;
> 	irq-addr = <0x212>;
> 
> From the above code, it sounds to me that irq-array is the number of
> bytes used for IRQ, while irq-num is the number of bits. E. g:
> 
> 	irq_num =  irqarray * 8;
> 
> So, we can get rid of at least one of them.
> 
> Going further, the code provides an special treatment for some IRQs:
> 
> 	#define HISI_IRQ_KEY_NUM		0
> 	#define HISI_IRQ_KEY_VALUE		0xc0
> 	#define HISI_IRQ_KEY_DOWN		7
> 	#define HISI_IRQ_KEY_UP			6
> 
> 	for (i = 0; i < pmic->irqarray; i++) {
> 		pending = hi6421_spmi_pmic_read(pmic, (i + pmic->irq_addr));
> 
> 	...
> 		/* solve powerkey order */
> 		if ((i == HISI_IRQ_KEY_NUM) &&
> 		    ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
> 			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
> 			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
> 			pending &= (~HISI_IRQ_KEY_VALUE);
> 		}
> 
> As the values for HISI_IRQ_KEY_DOWN and HISI_IRQ_KEY_UP don't
> depend on irqarray, it sounds to me that this is actually hardcoded 
> for irqarray == 2.
> 
> So, I'll just get rid of those, replacing them by some defines inside
> the code. If needed later, this patch can always be reverted.
> 
> > > +  'irq-mask-addr':
> > > +    description: Address for the interrupt request mask
> > > +
> > > +  'irq-addr':
> > > +    description: Address for the interrupt request  
> 
> Those two seems more standard to me: irq-mask-addr is the address to
> enable/disable IRQs, while irq-addr is where the pending IRQs are
> stored.
> 
> What would be the standard way to specify them both?
> 
> > > +
> > > +  regulators:
> > > +    type: object  
> > 
> > additionalProperties: false
> > 
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      '^ldo@[0-9]+$':  
> > 
> > Unit-addresses are hex.
> >
> > Also, doesn't match the example.
> 
> True. This should be, instead:
> 
> 	patternProperties:
>           '^ldo[0-9]+@[0-9a-f]+$':  
> 
> The name part of the property would better to stay in decimal,
> as it makes a in order to match the public schematics:
> 
> 	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf
> 
> Using decimal values, the dmesg matches the schematics helps a lot when
> dealing issues related to PM, as the names of the LDO lines will match
> page 12 the schematics:
> 
> 	ldo3: 1500 <--> 2000 mV at 1800 mV normal 
> 	ldo4: 1725 <--> 1900 mV at 1800 mV normal idle 
> 	ldo9: 1750 <--> 3300 mV at 2950 mV normal idle 
> 	ldo15: 1800 <--> 3000 mV at 2950 mV normal idle 
> 	ldo16: 1800 <--> 3000 mV at 2950 mV normal idle 
> 	ldo17: 2500 <--> 3300 mV at 2500 mV normal idle 
> 	ldo33: 2500 <--> 3300 mV at 2500 mV normal 
> 	ldo34: 2600 <--> 3300 mV at 2600 mV normal 
> 	ldo4: disabling
> 	ldo33: disabling
> 
> So, from above, looking at the datasheet, it is clear that
> ldo33 - e. g. PCIe Switch VDD25 - is disabled.

Makes sense.

> > > +        type: object
> > > +
> > > +        $ref: "/schemas/regulator/regulator.yaml#"
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Enable register.
> > > +  
> > 
> > > +          '#address-cells':
> > > +            const: 1
> > > +
> > > +          '#size-cells':
> > > +            const: 0  
> > 
> > No child nodes, you don't need these.
> 
> It is needed. However, this is at the second file of the DT.
> 
> See, as SPMI is actually a bus, the entire DT setting has 3
> parts:
>   - the SPMI controller;
>   - the PMICs;
>   - the regulators.
> 
> A complete example is:
> 
> 	spmi: spmi@fff24000 {
> 		compatible = "hisilicon,spmi-controller";
> 		#address-cells = <2>;
> 		#size-cells = <0>;
> 		status = "ok";
> 		reg = <0x0 0xfff24000 0x0 0x1000>;
> 		spmi-channel = <2>;
> 
> 		pmic: pmic@0 {
> 			compatible = "hisilicon,hi6421-spmi-pmic";
> 			slave_id = <0>;
> 			reg = <0 SPMI_USID>;
> 
> 			#interrupt-cells = <2>;
> 			interrupt-controller;
> 			gpios = <&gpio28 0 0>;
> 			irq-mask-addr = <0x202>;
> 			irq-addr = <0x212>;
> 
> 			regulators {
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 
> 				ldo3: ldo3@16 {
> 					reg = <0x16>;
> 					vsel-reg = <0x51>;
> 
> 					regulator-name = "ldo3";
> 					regulator-min-microvolt = <1500000>;
> 					regulator-max-microvolt = <2000000>;
> 					regulator-boot-on;
> 
> 					enable-mask = <0x01>;
> 
> 					voltage-table = <1500000>, <1550000>,
> 							<1600000>, <1650000>,
> 							<1700000>, <1725000>,
> 							<1750000>, <1775000>,
> 							<1800000>, <1825000>,
> 							<1850000>, <1875000>,
> 							<1900000>, <1925000>,
> 							<1950000>, <2000000>;
> 					off-on-delay-us = <20000>;
> 					startup-delay-us = <120>;
> 				};
> 				...
> 			};
> 		};
> 	};
> 
> The child nodes are at the regulator DT properties.
> 
> Well, I can drop those from here, adding them only at the regulator's
> part, using "bus { ... };".
> 
> > > +
> > > +          vsel-reg:
> > > +            description: Voltage selector register.  
> > 
> > 'reg' can have multiple entries if you want.
> 
> Yes, I know. I was in doubt if I should either place vsel-reg on
> a separate property or together with reg. I ended keeping it
> in separate on the submitted patch series.
> 
> What makes more sense?

Really, not putting it in DT. Like other things, it's fixed for the 
chip.


> > > +
> > > +          enable-mask:
> > > +            description: Bitmask used to enable the regulator.  
> > 
> > But if there's a shared enable reg, then you shouldn't have duplicate 
> > addresses (same 'reg' value in multiple nodes).
> 
> At least for the LDOs supported on HiKey 970, values for
> "reg" and "vsel-reg" are unique: each LDO has their own.
> 
> Right now, enable-mask is 0x01 for all LDOs at the Hikey 970
> DTS. However, only 8 LDOs are currently present at the DTS. From
> the schematics, it sounds that HiSilicon 6421v600 supports
> at least 37 lines. I've no idea if enable-mask remains the same
> for the other ones, nor if "reg" and "vsel-reg" won't be
> unique in the general case.
> 
> > These perhaps should be driver data rather than in DT as it's all fixed 
> > for this chip. We don't try to parameterize everything in DT.
> 
> I considered that. However, I've no idea about the values and
> ranges for the other 29 LDOs. So, without knowing better about
> this silicon, I prefer to keep those at DT.
> 
> > 
> > > +
> > > +          voltage-table:
> > > +            description: Table with the selector items for the voltage regulator.
> > > +            minItems: 2
> > > +            maxItems: 16  
> > 
> > Needs a type $ref.
> 
> Ok. I'll add:
> 
> 		$ref: /schemas/types.yaml#/definitions/uint32
> 
> > > +
> > > +          off-on-delay-us:
> > > +            description: Time required for changing state to enabled in microseconds.
> > > +
> > > +          startup-delay-us:
> > > +            description: Startup time in microseconds.
> > > +
> > > +          idle-mode-mask:
> > > +            description: Bitmask used to put the regulator on idle mode.
> > > +
> > > +          eco-microamp:
> > > +            description: Maximum current while on idle mode.
> > > +
> > > +        required:
> > > +          - reg
> > > +          - vsel-reg
> > > +          - enable-mask
> > > +          - voltage-table
> > > +          - off-on-delay-us
> > > +          - startup-delay-us
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - regulators  
> > 
> > Add:
> > 
> > additionalProperties: false
> 
> Ok.
> 
> > 
> > > +
> > > +examples:
> > > +  - |
> > > +    /* pmic properties */
> > > +
> > > +    pmic: pmic@0 {
> > > +      compatible = "hisilicon,hi6421-spmi-pmic";
> > > +      slave_id = <0>;  
> > 
> > Not documented. I believe this is part of 'reg'.
> 
> Good point. I'll double-check this one, but I guess you're right.
> 
> > 
> > > +      reg = <0 0>;
> > > +
> > > +      #interrupt-cells = <2>;
> > > +      interrupt-controller;
> > > +      gpios = <&gpio28 0 0>;
> > > +      irq-num = <16>;
> > > +      irq-array = <2>;
> > > +      irq-mask-addr = <0x202 2>;
> > > +      irq-addr = <0x212 2>;
> > > +
> > > +      #address-cells = <1>;
> > > +      #size-cells = <0>;
> > > +
> > > +      regulators {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +        ldo3: ldo3@16 {
> > > +          reg = <0x16>;
> > > +          vsel-reg = <0x51>;
> > > +
> > > +          regulator-name = "ldo3";
> > > +          regulator-min-microvolt = <1500000>;
> > > +          regulator-max-microvolt = <2000000>;
> > > +          regulator-boot-on;
> > > +
> > > +          enable-mask = <0x01>;
> > > +
> > > +          voltage-table = <1500000>, <1550000>, <1600000>, <1650000>,
> > > +                          <1700000>, <1725000>, <1750000>, <1775000>,
> > > +                          <1800000>, <1825000>, <1850000>, <1875000>,
> > > +                          <1900000>, <1925000>, <1950000>, <2000000>;
> > > +          off-on-delay-us = <20000>;
> > > +          startup-delay-us = <120>;
> > > +        };
> > > +
> > > +        ldo4: ldo4@17 { /* 40 PIN */
> > > +          reg = <0x17>;
> > > +          vsel-reg = <0x52>;
> > > +
> > > +          regulator-name = "ldo4";
> > > +          regulator-min-microvolt = <1725000>;
> > > +          regulator-max-microvolt = <1900000>;
> > > +          regulator-boot-on;
> > > +
> > > +          enable-mask = <0x01>;
> > > +          idle-mode-mask = <0x10>;
> > > +          eco-microamp = <10000>;
> > > +
> > > +          hi6421-vsel = <0x52 0x07>;  
> > 
> > Not documented.
> 
> This is a left-over. I dropped this one, in favor of "vsel-reg"
> (plus a mask for the voltage-table size).
> 
> > 
> > > +          voltage-table = <1725000>, <1750000>, <1775000>, <1800000>,
> > > +                          <1825000>, <1850000>, <1875000>, <1900000>;
> > > +          off-on-delay-us = <20000>;
> > > +          startup-delay-us = <120>;
> > > +        };
> > > +      };
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > > new file mode 100644
> > > index 000000000000..5aeb2ae12024
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: HiSilicon SPMI controller
> > > +
> > > +maintainers:
> > > +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > +
> > > +description: |
> > > +  The HiSilicon SPMI controller is found on some Kirin-based designs.
> > > +  It is a MIPI System Power Management (SPMI) controller.
> > > +
> > > +  The PMIC part is provided by
> > > +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "spmi@[0-9a-f]"
> > > +
> > > +  compatible:
> > > +    const: hisilicon,spmi-controller  
> > 
> > Needs an SoC specific compatible.
> 
> What about:
> 	hisilicon,kirin970-spmi-controller 

Is 'kirin970' really the SoC name? The older ones are all 'hi[0-9]+'.

> 
> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 2
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +  spmi-channel:
> > > +    description: number of the SPMI channel where the PMIC is connected
> > > +
> > > +patternProperties:
> > > +  "^pmic@[0-9a-f]$":
> > > +    $ref: "/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#"
> > > +
> > > +examples:
> > > +  - |
> > > +    spmi: spmi@fff24000 {
> > > +      compatible = "hisilicon,spmi-controller";
> > > +      #address-cells = <2>;
> > > +      #size-cells = <0>;
> > > +      status = "ok";
> > > +      reg = <0x0 0xfff24000 0x0 0x1000>;
> > > +      spmi-channel = <2>;  
> > 
> > Does this go in the SPMI controller or child (pmic)?
> 
> Those belong to the SPMI controller. Maybe I did some mess trying to
> split up DT in order to place the Kirin970 SPMI bus controller on
> one file, and the HiSilicon 6421v600 on another one.
> 
> I ended needing to duplicate some things, as otherwise the DT checks fail.
> 
> Basically, the full DT is:
> 
> 	spmi: spmi@fff24000 {
> 		/* Kirin 970 SPMI controller props */
> 
> 		pmic: pmic@0 {
> 			/* HiSilicon 6421v600 PMIC props */
> 
> 			regulators {
> 				ldo3: ldo3@16 {
> 					/* HiSilicon 6421v600 ldo3 regulator props */
> 				};
> 				ldo4: ldo3@17 {
> 					/* HiSilicon 6421v600 ldo4 regulator props */
> 				};
> 				...
> 				ldo34: ldo3@33 {
> 					/* HiSilicon 6421v600 ldo34 regulator props */
> 				};
> 			};
> 		};
> 	};
> 
> Thanks,
> Mauro
