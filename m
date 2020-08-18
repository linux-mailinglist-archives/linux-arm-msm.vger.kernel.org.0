Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1381248192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 11:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgHRJN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 05:13:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgHRJN6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 05:13:58 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A928206B5;
        Tue, 18 Aug 2020 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597742036;
        bh=y6t/nDZtQAaatHx+Es3LX2J9jd8u3hy8rCEe/i31UrM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d9XRnInfBjaxiUhh7v2yUGiArHMESUlinwjmKn2kU17BwWrXAKw4S7MkRwRBP79bq
         V2QsdIEGETwIvLoocU2a+P6rMW02dIZASv/g/Bu/w+wEp+kZCA/Tb9ZMxkSFRbyAQL
         MwVlazcSkCfnsVmMpQu4YvuW+To1x1yhU4wltO8M=
Date:   Tue, 18 Aug 2020 11:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200818111351.7e3fc780@coco.lan>
In-Reply-To: <20200817201211.GA1437827@bogus>
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
        <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
        <20200817201211.GA1437827@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Mon, 17 Aug 2020 14:12:11 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Mon, Aug 17, 2020 at 09:11:02AM +0200, Mauro Carvalho Chehab wrote:
> > Add documentation for the properties needed by the HiSilicon
> > 6421v600 driver, and by the SPMI controller used to access
> > the chipset.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 ++++++++++++++++++
> >  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
> >  2 files changed, 236 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6=
421-spmi-pmic.yaml
> >  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hi=
si-spmi-controller.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spm=
i-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-p=
mic.yaml
> > new file mode 100644
> > index 000000000000..95494114554d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.=
yaml
> > @@ -0,0 +1,182 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HiSilicon 6421v600 SPMI PMIC
> > +
> > +maintainers:
> > +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > +
> > +description: |
> > +  HiSilicon 6421v600 uses a MIPI System Power Management (SPMI) bus in=
 order
> > +  to provide interrupts and power supply.
> > +
> > +  The GPIO and interrupt settings are represented as part of the top-l=
evel PMIC
> > +  node.
> > +
> > +  The SPMI controller part is provided by
> > +  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controlle=
r.yaml.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "pmic@[0-9a-f]"
> > +
> > +  compatible:
> > +    const: hisilicon,hi6421-spmi-pmic =20
>=20
> -spmi-pmic is redundant. Can the hi6421 be anything else?

There are other HiSilicom 6421 variants that don't use SPMI bus:

	Documentation/devicetree/bindings/mfd/hi6421.txt:       "hisilicon,hi6421-=
pmic";
	Documentation/devicetree/bindings/mfd/hi6421.txt:       "hisilicon,hi6421v=
530-pmic";

The DT file on Kernel 4.9 uses hi6421v600 (although the schematics
from 96boards name it as hi6421v610).

While I don't mind much,would prefer to keep "spmi" on its name, in order
to distinguish this one from the non-spmi variants.

Maybe we use this for compatible:

	hisilicon,hi6421v600-spmi

>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  spmi-channel:
> > +    description: number of the SPMI channel where the PMIC is connecte=
d =20
>=20
> This looks like a common (to SPMI), but it's not something defined in=20
> spmi.txt=20

This one is not part of the SPMI core. It is stored inside a private=20
structure inside at the HiSilicon spmi controller driver. It is stored=20
there as ctrl_dev->channel, and it is used to calculate the register offset
for readl():

	offset  =3D SPMI_APB_SPMI_STATUS_BASE_ADDR;
	offset +=3D SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * =
sid;
	do {
		status =3D readl(base + offset);
	...

The SPMI bus is somewhat similar to I2C: it is a 2-wire serial bus
with up to 16 devices connected to it.

Now, most modern I2C chipsets provide multiple independent I2C
channels, on different pins. Also, on some chipsets, certain
GPIO pins can be used either as GPIO or as I2C.

I strongly suspect that this is the case here: according with
the Hikey 970 schematics:

	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-do=
cs/files/hikey970-schematics.pdf

The pins used by SPMI clock/data can also be used as GPIO.

While I don't have access to the datasheets for Kirin 970 (or any other
chipsets on this board), for me, it sounds that different GPIO pins
are allowed to use SPMI. The "spmi-channel" property specifies
what pins will be used for SPMI, among the ones that are
compatible with MIPI SPMI specs.

> (which should ideally be converted to schema first).=20

I can try porting spmi schema to yaml on a separate patch,
and submit it independently of this series.

> Minimally,=20
> it needs a better explanation and determination if it should be common=20
> or is HiSilicon specific.

What about:

  spmi-channel:
    description: |
      number of the SPMI channel at the HiSilicon SoC that will
      be used for the MIPI SPMI controller.

>=20
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +  interrupt-controller:
> > +    description:
> > +      Identify that the PMIC is capable of behaving as an interrupt co=
ntroller. =20
>=20
> No need to redefine common properties if nothing specific to this device=
=20
> to say. Just:
>=20
> interrupt-controller: true

Ok.

>=20
> > +
> > +  gpios:
> > +    maxItems: 1
> > +
> > +  irq-num:
> > +    description: Interrupt request number
> > +
> > +  'irq-array':
> > +    description: Interrupt request array
> > +
> > +  'irq-mask-addr':
> > +    description: Address for the interrupt request mask
> > +
> > +  'irq-addr':
> > +    description: Address for the interrupt request =20
>=20
> What's all these non-standard interrupt properties?

After doing a deeper look at the code which handles IRQs on this PMIC,
I'm considering to get rid of two properties: irq-num and irq-array.

See, the code does this:

	/* During probe time */
	pmic->irqs =3D devm_kzalloc(dev, pmic->irqnum * sizeof(int), GFP_KERNEL);

	/* While handling IRQs */
	for (i =3D 0; i < pmic->irqarray; i++) {
		pending =3D hi6421_spmi_pmic_read(pmic, (i + pmic->irq_addr));
		pending &=3D 0xff;

		for_each_set_bit(offset, &pending, 8)
			generic_handle_irq(pmic->irqs[offset + i * 8]);

	}

Right now, Hikey 970 sets:

	irq-num =3D <16>;
	irq-array =3D <2>;
	irq-mask-addr =3D <0x202>;
	irq-addr =3D <0x212>;

=46rom the above code, it sounds to me that irq-array is the number of
bytes used for IRQ, while irq-num is the number of bits. E. g:

	irq_num =3D  irqarray * 8;

So, we can get rid of at least one of them.

Going further, the code provides an special treatment for some IRQs:

	#define HISI_IRQ_KEY_NUM		0
	#define HISI_IRQ_KEY_VALUE		0xc0
	#define HISI_IRQ_KEY_DOWN		7
	#define HISI_IRQ_KEY_UP			6

	for (i =3D 0; i < pmic->irqarray; i++) {
		pending =3D hi6421_spmi_pmic_read(pmic, (i + pmic->irq_addr));

	...
		/* solve powerkey order */
		if ((i =3D=3D HISI_IRQ_KEY_NUM) &&
		    ((pending & HISI_IRQ_KEY_VALUE) =3D=3D HISI_IRQ_KEY_VALUE)) {
			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
			pending &=3D (~HISI_IRQ_KEY_VALUE);
		}

As the values for HISI_IRQ_KEY_DOWN and HISI_IRQ_KEY_UP don't
depend on irqarray, it sounds to me that this is actually hardcoded=20
for irqarray =3D=3D 2.

So, I'll just get rid of those, replacing them by some defines inside
the code. If needed later, this patch can always be reverted.

> > +  'irq-mask-addr':
> > +    description: Address for the interrupt request mask
> > +
> > +  'irq-addr':
> > +    description: Address for the interrupt request =20

Those two seems more standard to me: irq-mask-addr is the address to
enable/disable IRQs, while irq-addr is where the pending IRQs are
stored.

What would be the standard way to specify them both?

> > +
> > +  regulators:
> > +    type: object =20
>=20
> additionalProperties: false
>=20
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^ldo@[0-9]+$': =20
>=20
> Unit-addresses are hex.
>
> Also, doesn't match the example.

True. This should be, instead:

	patternProperties:
          '^ldo[0-9]+@[0-9a-f]+$': =20

The name part of the property would better to stay in decimal,
as it makes a in order to match the public schematics:

	https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-do=
cs/files/hikey970-schematics.pdf

Using decimal values, the dmesg matches the schematics helps a lot when
dealing issues related to PM, as the names of the LDO lines will match
page 12 the schematics:

	ldo3: 1500 <--> 2000 mV at 1800 mV normal=20
	ldo4: 1725 <--> 1900 mV at 1800 mV normal idle=20
	ldo9: 1750 <--> 3300 mV at 2950 mV normal idle=20
	ldo15: 1800 <--> 3000 mV at 2950 mV normal idle=20
	ldo16: 1800 <--> 3000 mV at 2950 mV normal idle=20
	ldo17: 2500 <--> 3300 mV at 2500 mV normal idle=20
	ldo33: 2500 <--> 3300 mV at 2500 mV normal=20
	ldo34: 2600 <--> 3300 mV at 2600 mV normal=20
	ldo4: disabling
	ldo33: disabling

So, from above, looking at the datasheet, it is clear that
ldo33 - e. g. PCIe Switch VDD25 - is disabled.

>=20
> > +        type: object
> > +
> > +        $ref: "/schemas/regulator/regulator.yaml#"
> > +
> > +        properties:
> > +          reg:
> > +            description: Enable register.
> > + =20
>=20
> > +          '#address-cells':
> > +            const: 1
> > +
> > +          '#size-cells':
> > +            const: 0 =20
>=20
> No child nodes, you don't need these.

It is needed. However, this is at the second file of the DT.

See, as SPMI is actually a bus, the entire DT setting has 3
parts:
  - the SPMI controller;
  - the PMICs;
  - the regulators.

A complete example is:

	spmi: spmi@fff24000 {
		compatible =3D "hisilicon,spmi-controller";
		#address-cells =3D <2>;
		#size-cells =3D <0>;
		status =3D "ok";
		reg =3D <0x0 0xfff24000 0x0 0x1000>;
		spmi-channel =3D <2>;

		pmic: pmic@0 {
			compatible =3D "hisilicon,hi6421-spmi-pmic";
			slave_id =3D <0>;
			reg =3D <0 SPMI_USID>;

			#interrupt-cells =3D <2>;
			interrupt-controller;
			gpios =3D <&gpio28 0 0>;
			irq-mask-addr =3D <0x202>;
			irq-addr =3D <0x212>;

			regulators {
				#address-cells =3D <1>;
				#size-cells =3D <0>;

				ldo3: ldo3@16 {
					reg =3D <0x16>;
					vsel-reg =3D <0x51>;

					regulator-name =3D "ldo3";
					regulator-min-microvolt =3D <1500000>;
					regulator-max-microvolt =3D <2000000>;
					regulator-boot-on;

					enable-mask =3D <0x01>;

					voltage-table =3D <1500000>, <1550000>,
							<1600000>, <1650000>,
							<1700000>, <1725000>,
							<1750000>, <1775000>,
							<1800000>, <1825000>,
							<1850000>, <1875000>,
							<1900000>, <1925000>,
							<1950000>, <2000000>;
					off-on-delay-us =3D <20000>;
					startup-delay-us =3D <120>;
				};
				...
			};
		};
	};

The child nodes are at the regulator DT properties.

Well, I can drop those from here, adding them only at the regulator's
part, using "bus { ... };".

> > +
> > +          vsel-reg:
> > +            description: Voltage selector register. =20
>=20
> 'reg' can have multiple entries if you want.

Yes, I know. I was in doubt if I should either place vsel-reg on
a separate property or together with reg. I ended keeping it
in separate on the submitted patch series.

What makes more sense?

>=20
> > +
> > +          enable-mask:
> > +            description: Bitmask used to enable the regulator. =20
>=20
> But if there's a shared enable reg, then you shouldn't have duplicate=20
> addresses (same 'reg' value in multiple nodes).

At least for the LDOs supported on HiKey 970, values for
"reg" and "vsel-reg" are unique: each LDO has their own.

Right now, enable-mask is 0x01 for all LDOs at the Hikey 970
DTS. However, only 8 LDOs are currently present at the DTS. From
the schematics, it sounds that HiSilicon 6421v600 supports
at least 37 lines. I've no idea if enable-mask remains the same
for the other ones, nor if "reg" and "vsel-reg" won't be
unique in the general case.

> These perhaps should be driver data rather than in DT as it's all fixed=20
> for this chip. We don't try to parameterize everything in DT.

I considered that. However, I've no idea about the values and
ranges for the other 29 LDOs. So, without knowing better about
this silicon, I prefer to keep those at DT.

>=20
> > +
> > +          voltage-table:
> > +            description: Table with the selector items for the voltage=
 regulator.
> > +            minItems: 2
> > +            maxItems: 16 =20
>=20
> Needs a type $ref.

Ok. I'll add:

		$ref: /schemas/types.yaml#/definitions/uint32

> > +
> > +          off-on-delay-us:
> > +            description: Time required for changing state to enabled i=
n microseconds.
> > +
> > +          startup-delay-us:
> > +            description: Startup time in microseconds.
> > +
> > +          idle-mode-mask:
> > +            description: Bitmask used to put the regulator on idle mod=
e.
> > +
> > +          eco-microamp:
> > +            description: Maximum current while on idle mode.
> > +
> > +        required:
> > +          - reg
> > +          - vsel-reg
> > +          - enable-mask
> > +          - voltage-table
> > +          - off-on-delay-us
> > +          - startup-delay-us
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - regulators =20
>=20
> Add:
>=20
> additionalProperties: false

Ok.

>=20
> > +
> > +examples:
> > +  - |
> > +    /* pmic properties */
> > +
> > +    pmic: pmic@0 {
> > +      compatible =3D "hisilicon,hi6421-spmi-pmic";
> > +      slave_id =3D <0>; =20
>=20
> Not documented. I believe this is part of 'reg'.

Good point. I'll double-check this one, but I guess you're right.

>=20
> > +      reg =3D <0 0>;
> > +
> > +      #interrupt-cells =3D <2>;
> > +      interrupt-controller;
> > +      gpios =3D <&gpio28 0 0>;
> > +      irq-num =3D <16>;
> > +      irq-array =3D <2>;
> > +      irq-mask-addr =3D <0x202 2>;
> > +      irq-addr =3D <0x212 2>;
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      regulators {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +        ldo3: ldo3@16 {
> > +          reg =3D <0x16>;
> > +          vsel-reg =3D <0x51>;
> > +
> > +          regulator-name =3D "ldo3";
> > +          regulator-min-microvolt =3D <1500000>;
> > +          regulator-max-microvolt =3D <2000000>;
> > +          regulator-boot-on;
> > +
> > +          enable-mask =3D <0x01>;
> > +
> > +          voltage-table =3D <1500000>, <1550000>, <1600000>, <1650000>,
> > +                          <1700000>, <1725000>, <1750000>, <1775000>,
> > +                          <1800000>, <1825000>, <1850000>, <1875000>,
> > +                          <1900000>, <1925000>, <1950000>, <2000000>;
> > +          off-on-delay-us =3D <20000>;
> > +          startup-delay-us =3D <120>;
> > +        };
> > +
> > +        ldo4: ldo4@17 { /* 40 PIN */
> > +          reg =3D <0x17>;
> > +          vsel-reg =3D <0x52>;
> > +
> > +          regulator-name =3D "ldo4";
> > +          regulator-min-microvolt =3D <1725000>;
> > +          regulator-max-microvolt =3D <1900000>;
> > +          regulator-boot-on;
> > +
> > +          enable-mask =3D <0x01>;
> > +          idle-mode-mask =3D <0x10>;
> > +          eco-microamp =3D <10000>;
> > +
> > +          hi6421-vsel =3D <0x52 0x07>; =20
>=20
> Not documented.

This is a left-over. I dropped this one, in favor of "vsel-reg"
(plus a mask for the voltage-table size).

>=20
> > +          voltage-table =3D <1725000>, <1750000>, <1775000>, <1800000>,
> > +                          <1825000>, <1850000>, <1875000>, <1900000>;
> > +          off-on-delay-us =3D <20000>;
> > +          startup-delay-us =3D <120>;
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi=
-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-sp=
mi-controller.yaml
> > new file mode 100644
> > index 000000000000..5aeb2ae12024
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-contro=
ller.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HiSilicon SPMI controller
> > +
> > +maintainers:
> > +  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > +
> > +description: |
> > +  The HiSilicon SPMI controller is found on some Kirin-based designs.
> > +  It is a MIPI System Power Management (SPMI) controller.
> > +
> > +  The PMIC part is provided by
> > +  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yam=
l.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "spmi@[0-9a-f]"
> > +
> > +  compatible:
> > +    const: hisilicon,spmi-controller =20
>=20
> Needs an SoC specific compatible.

What about:
	hisilicon,kirin970-spmi-controller=20

>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  spmi-channel:
> > +    description: number of the SPMI channel where the PMIC is connected
> > +
> > +patternProperties:
> > +  "^pmic@[0-9a-f]$":
> > +    $ref: "/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#"
> > +
> > +examples:
> > +  - |
> > +    spmi: spmi@fff24000 {
> > +      compatible =3D "hisilicon,spmi-controller";
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <0>;
> > +      status =3D "ok";
> > +      reg =3D <0x0 0xfff24000 0x0 0x1000>;
> > +      spmi-channel =3D <2>; =20
>=20
> Does this go in the SPMI controller or child (pmic)?

Those belong to the SPMI controller. Maybe I did some mess trying to
split up DT in order to place the Kirin970 SPMI bus controller on
one file, and the HiSilicon 6421v600 on another one.

I ended needing to duplicate some things, as otherwise the DT checks fail.

Basically, the full DT is:

	spmi: spmi@fff24000 {
		/* Kirin 970 SPMI controller props */

		pmic: pmic@0 {
			/* HiSilicon 6421v600 PMIC props */

			regulators {
				ldo3: ldo3@16 {
					/* HiSilicon 6421v600 ldo3 regulator props */
				};
				ldo4: ldo3@17 {
					/* HiSilicon 6421v600 ldo4 regulator props */
				};
				...
				ldo34: ldo3@33 {
					/* HiSilicon 6421v600 ldo34 regulator props */
				};
			};
		};
	};

Thanks,
Mauro
