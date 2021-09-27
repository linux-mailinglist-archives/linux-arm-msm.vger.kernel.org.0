Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0A2418F06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 08:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhI0GiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 02:38:00 -0400
Received: from ixit.cz ([94.230.151.217]:38070 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232821AbhI0GiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 02:38:00 -0400
Received: from [127.0.0.1] (78-80-24-171.customers.tmcz.cz [78.80.24.171])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 765E623B26;
        Mon, 27 Sep 2021 08:36:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1632724580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mVQa7y6++Ncqaub00RXEXc0vgHfGoqqTKn1XpdhJBdw=;
        b=OPznvd9nDBrSdNd+sdVbYRNZxRIIPjjKrDEVppwrqPcVwD+OBn7yvepKxrt1rcA5kuihYw
        azR5RZlEZQx0l3zK9sGefIqWc5a2L4pjrxSCpmqI5UFdGz9sXI0GYNcULrh6JHcoWcNKnh
        yEXgo6RBW9k75OENe7lFmw/BgWpRCuY=
Date:   Mon, 27 Sep 2021 06:36:17 +0000
From:   David Heidelberg <david@ixit.cz>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
CC:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_mfd=3A_qcom-pm8xxx=3A_switc?= =?US-ASCII?Q?h_away_from_using_chained_IRQ_handlers?=
In-Reply-To: <20210925234333.2430755-1-dmitry.baryshkov@linaro.org>
References: <20210925234333.2430755-1-dmitry.baryshkov@linaro.org>
Message-ID: <D8A85430-ACAB-432A-A3EC-0E2FD8C75E92@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: David Heidelberg <david@ixit=2Ecz> # on Nexus 7 (deb)


-------- P=C5=AFvodn=C3=AD zpr=C3=A1va --------
Odes=C3=ADlatel: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
Odesl=C3=A1no: 25=2E z=C3=A1=C5=99=C3=AD 2021 23:43:33 UTC
Komu: Andy Gross <agross@kernel=2Eorg>, Bjorn Andersson <bjorn=2Eandersson=
@linaro=2Eorg>, Lee Jones <lee=2Ejones@linaro=2Eorg>
Kopie: David Heidelberg <david@ixit=2Ecz>, linux-arm-msm@vger=2Ekernel=2Eo=
rg, Linus Walleij <linus=2Ewalleij@linaro=2Eorg>
P=C5=99edm=C4=9Bt: [PATCH v2] mfd: qcom-pm8xxx: switch away from using cha=
ined IRQ handlers

PM8xxx PMIC family uses GPIO as parent IRQ=2E Using it together with the
irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
(see 461c1a7d4733 ("gpiolib: override irq_enable/disable"))
as in this path the IRQ resources are not allocated (and thus the
corresponding GPIO is not marked as used for the IRQ=2E Use request_irq so
that the IRQ resources are proprely setup=2E

[ 0=2E803271] ------------[ cut here ]------------
[ 0=2E803338] WARNING: CPU: 3 PID: 1 at drivers/gpio/gpiolib=2Ec:3207 gpio=
chip_enable_irq+0xa4/0xa8
[ 0=2E803470] Modules linked in:
[ 0=2E803542] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5=2E14=2E0-rc6-nex=
t-20210820-postmarketos-qcom-apq8064+ #1
[ 0=2E803645] Hardware name: Generic DT based system
[ 0=2E803710] Backtrace:
[ 0=2E803777] [<c0e3493c>] (dump_backtrace) from [<c0e34d00>] (show_stack+=
0x20/0x24)
[ 0=2E803911] r7:00000c87 r6:c07062dc r5:60000093 r4:c11d0f54
[ 0=2E803980] [<c0e34ce0>] (show_stack) from [<c0e38314>] (dump_stack_lvl+=
0x48/0x54)
[ 0=2E804097] [<c0e382cc>] (dump_stack_lvl) from [<c0e38338>] (dump_stack+=
0x18/0x1c)
[ 0=2E804217] r5:00000009 r4:c11fe208
[ 0=2E804274] [<c0e38320>] (dump_stack) from [<c03219c8>] (__warn+0xfc/0x1=
14)
[ 0=2E804387] [<c03218cc>] (__warn) from [<c0e35334>] (warn_slowpath_fmt+0=
x74/0xd0)
[ 0=2E804509] r7:c07062dc r6:00000c87 r5:c11fe208 r4:00000000
[ 0=2E804577] [<c0e352c4>] (warn_slowpath_fmt) from [<c07062dc>] (gpiochip=
_enable_irq+0xa4/0xa8)
[ 0=2E804716] r8:c27b6200 r7:c27aec00 r6:c27aec18 r5:cf77a448 r4:c02225f0
[ 0=2E804789] [<c0706238>] (gpiochip_enable_irq) from [<c0706348>] (gpioch=
ip_irq_enable+0x28/0x38)
[ 0=2E804921] r5:cf77a448 r4:c27aec18
[ 0=2E804977] [<c0706320>] (gpiochip_irq_enable) from [<c03897a0>] (irq_en=
able+0x48/0x78)
[ 0=2E805111] r5:00000000 r4:c27aec00
[ 0=2E805167] [<c0389758>] (irq_enable) from [<c0389850>] (__irq_startup+0=
x80/0xbc)
[ 0=2E805286] r5:00000000 r4:c27aec00
[ 0=2E805343] [<c03897d0>] (__irq_startup) from [<c038996c>] (irq_startup+=
0xe0/0x18c)
[ 0=2E805468] r7:c27aec00 r6:00000001 r5:00000000 r4:c27aec00
[ 0=2E805535] [<c038988c>] (irq_startup) from [<c0389a54>] (irq_activate_a=
nd_startup+0x3c/0x74)
[ 0=2E805669] r7:c27aec00 r6:00000001 r5:c27aec00 r4:00000000
[ 0=2E805736] [<c0389a18>] (irq_activate_and_startup) from [<c0389b58>] (_=
_irq_do_set_handler+0xcc/0x1c0)
[ 0=2E805875] r7:c27aec00 r6:c0383710 r5:c08a16b0 r4:00000001
[ 0=2E805943] [<c0389a8c>] (__irq_do_set_handler) from [<c0389d80>] (irq_s=
et_chained_handler_and_data+0x60/0x98)
[ 0=2E806087] r7:c27b5c10 r6:c27aed40 r5:c08a16b0 r4:c27aec00
[ 0=2E806154] [<c0389d20>] (irq_set_chained_handler_and_data) from [<c08a1=
660>] (pm8xxx_probe+0x1fc/0x24c)
[ 0=2E806298] r6:0000003a r5:0000003a r4:c27b5c00
[ 0=2E806359] [<c08a1464>] (pm8xxx_probe) from [<c0871420>] (platform_prob=
e+0x6c/0xc8)
[ 0=2E806495] r10:c2507080 r9:e8bea2cc r8:c165e0e0 r7:c165e0e0 r6:c15f08f8=
 r5:c27b5c10
[ 0=2E806582] r4:00000000
[ 0=2E806632] [<c08713b4>] (platform_probe) from [<c086e280>] (really_prob=
e+0xe8/0x460)
[ 0=2E806769] r7:c165e0e0 r6:c15f08f8 r5:00000000 r4:c27b5c10
[ 0=2E806837] [<c086e198>] (really_probe) from [<c086e6a8>] (__driver_prob=
e_device+0xb0/0x22c)
[ 0=2E806975] r7:c27b5c10 r6:cf70fba4 r5:c15f08f8 r4:c27b5c10
[ 0=2E807042] [<c086e5f8>] (__driver_probe_device) from [<c086e868>] (driv=
er_probe_device+0x44/0xe0)
[ 0=2E807188] r9:e8bea2cc r8:00000000 r7:c27b5c10 r6:cf70fba4 r5:c16ae4b4 =
r4:c16ae4b0
[ 0=2E807271] [<c086e824>] (driver_probe_device) from [<c086ecd8>] (__devi=
ce_attach_driver+0xb4/0x12c)
[ 0=2E807421] r9:e8bea2cc r8:c15eec08 r7:c27b5c10 r6:cf70fba4 r5:c15f08f8 =
r4:00000001
[ 0=2E807506] [<c086ec24>] (__device_attach_driver) from [<c086c06c>] (bus=
_for_each_drv+0x94/0xe4)
[ 0=2E807651] r7:c16ae484 r6:c086ec24 r5:cf70fba4 r4:00000000
[ 0=2E807718] [<c086bfd8>] (bus_for_each_drv) from [<c086e0e0>] (__device_=
attach+0x104/0x19c)
[ 0=2E807852] r6:00000001 r5:c27b5c54 r4:c27b5c10
[ 0=2E807913] [<c086dfdc>] (__device_attach) from [<c086eef4>] (device_ini=
tial_probe+0x1c/0x20)
[ 0=2E808050] r6:c27b5c10 r5:c15ef1b0 r4:c27b5c10
[ 0=2E808111] [<c086eed8>] (device_initial_probe) from [<c086d00c>] (bus_p=
robe_device+0x94/0x9c)
[ 0=2E808240] [<c086cf78>] (bus_probe_device) from [<c086a60c>] (device_ad=
d+0x404/0x8f4)
[ 0=2E808370] r7:c16ae484 r6:c251ba10 r5:00000000 r4:c27b5c10
[ 0=2E808439] [<c086a208>] (device_add) from [<c0a82f50>] (of_device_add+0=
x44/0x4c)
[ 0=2E808581] r10:c144c854 r9:00000001 r8:e8bea314 r7:c251ba10 r6:00000000=
 r5:00000000
[ 0=2E808669] r4:c27b5c00
[ 0=2E808718] [<c0a82f0c>] (of_device_add) from [<c0a836cc>] (of_platform_=
device_create_pdata+0xa0/0xc8)
[ 0=2E808850] [<c0a8362c>] (of_platform_device_create_pdata) from [<c0a839=
08>] (of_platform_bus_create+0x1f0/0x514)
[ 0=2E809005] r9:00000001 r8:c251ba10 r7:00000000 r6:00000000 r5:00000000 =
r4:e8bea2b0
[ 0=2E809086] [<c0a83718>] (of_platform_bus_create) from [<c0a83e04>] (of_=
platform_populate+0x98/0x128)
[ 0=2E809233] r10:c144c854 r9:00000001 r8:c251ba10 r7:00000000 r6:00000000=
 r5:e8bea170
[ 0=2E809321] r4:e8bea2b0
[ 0=2E809371] [<c0a83d6c>] (of_platform_populate) from [<c0a83f20>] (devm_=
of_platform_populate+0x60/0xa8)
[ 0=2E809521] r9:0000011d r8:c165e0e0 r7:e8bea170 r6:c2c34f40 r5:c2cac140 =
r4:c251ba10
[ 0=2E809604] [<c0a83ec0>] (devm_of_platform_populate) from [<c08a212c>] (=
ssbi_probe+0x138/0x16c)
[ 0=2E809738] r6:c2c34f40 r5:c251ba10 r4:ff822700
[ 0=2E809800] [<c08a1ff4>] (ssbi_probe) from [<c0871420>] (platform_probe+=
0x6c/0xc8)
[ 0=2E809923] r7:c165e0e0 r6:c15f0a80 r5:c251ba10 r4:00000000
[ 0=2E809989] [<c08713b4>] (platform_probe) from [<c086e280>] (really_prob=
e+0xe8/0x460)
[ 0=2E810120] r7:c165e0e0 r6:c15f0a80 r5:00000000 r4:c251ba10
[ 0=2E810187] [<c086e198>] (really_probe) from [<c086e6a8>] (__driver_prob=
e_device+0xb0/0x22c)
[ 0=2E810325] r7:c251ba10 r6:c15f0a80 r5:c15f0a80 r4:c251ba10
[ 0=2E810393] [<c086e5f8>] (__driver_probe_device) from [<c086e868>] (driv=
er_probe_device+0x44/0xe0)
[ 0=2E810539] r9:0000011d r8:00000000 r7:c251ba10 r6:c15f0a80 r5:c16ae4b4 =
r4:c16ae4b0
[ 0=2E810623] [<c086e824>] (driver_probe_device) from [<c086ee2c>] (__driv=
er_attach+0xdc/0x188)
[ 0=2E810766] r9:0000011d r8:c144c834 r7:00000000 r6:c15f0a80 r5:c251ba10 =
r4:00000000
[ 0=2E810849] [<c086ed50>] (__driver_attach) from [<c086bf60>] (bus_for_ea=
ch_dev+0x88/0xd4)
[ 0=2E810985] r7:00000000 r6:c086ed50 r5:c15f0a80 r4:00000000
[ 0=2E811052] [<c086bed8>] (bus_for_each_dev) from [<c086dad4>] (driver_at=
tach+0x2c/0x30)
[ 0=2E811182] r6:c15ef1b0 r5:c2c34e80 r4:c15f0a80
[ 0=2E811243] [<c086daa8>] (driver_attach) from [<c086d2dc>] (bus_add_driv=
er+0x180/0x21c)
[ 0=2E811364] [<c086d15c>] (bus_add_driver) from [<c086fa6c>] (driver_regi=
ster+0x84/0x118)
[ 0=2E811492] r7:00000000 r6:ffffe000 r5:c1428210 r4:c15f0a80
[ 0=2E811558] [<c086f9e8>] (driver_register) from [<c0871174>] (__platform=
_driver_register+0x2c/0x34)
[ 0=2E811683] r5:c1428210 r4:c16524a0
[ 0=2E811739] [<c0871148>] (__platform_driver_register) from [<c1428234>] =
(ssbi_driver_init+0x24/0x28)
[ 0=2E811868] [<c1428210>] (ssbi_driver_init) from [<c0302394>] (do_one_in=
itcall+0x68/0x2c8)
[ 0=2E811990] [<c030232c>] (do_one_initcall) from [<c140147c>] (kernel_ini=
t_freeable+0x1dc/0x23c)
[ 0=2E812135] r7:cf7b0400 r6:c130339c r5:00000007 r4:c147f6a0
[ 0=2E812204] [<c14012a0>] (kernel_init_freeable) from [<c0e40e60>] (kerne=
l_init+0x20/0x138)
[ 0=2E812345] r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000=
 r5:c0e40e40
[ 0=2E812433] r4:00000000
[ 0=2E812483] [<c0e40e40>] (kernel_init) from [<c0300150>] (ret_from_fork+=
0x14/0x24)
[ 0=2E812596] Exception stack(0xcf70ffb0 to 0xcf70fff8)
[ 0=2E812684] ffa0: 00000000 00000000 00000000 00000000
[ 0=2E812809] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[ 0=2E812923] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 0=2E813008] r5:c0e40e40 r4:00000000
[ 0=2E813075] ---[ end trace ad2443eee078d094 ]---

Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
Reviewed-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
Reviewed-by: Linus Walleij <linus=2Ewalleij@linaro=2Eorg>
Tested-by: David Heidelberg <david@ixit=2Ecz>
---
Changes since v1:
 - Expanded commit message to include warning text and gpiolib details
 - No code changes

---
 drivers/mfd/qcom-pm8xxx=2Ec | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx=2Ec b/drivers/mfd/qcom-pm8xxx=2Ec
index ec18a04de355=2E=2E2f2734ba5273 100644
--- a/drivers/mfd/qcom-pm8xxx=2Ec
+++ b/drivers/mfd/qcom-pm8xxx=2Ec
@@ -65,7 +65,7 @@
 struct pm_irq_data {
 	int num_irqs;
 	struct irq_chip *irq_chip;
-	void (*irq_handler)(struct irq_desc *desc);
+	irq_handler_t irq_handler;
 };
=20
 struct pm_irq_chip {
@@ -169,19 +169,16 @@ static int pm8xxx_irq_master_handler(struct pm_irq_c=
hip *chip, int master)
 	return ret;
 }
=20
-static void pm8xxx_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8xxx_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip =3D irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip =3D irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip =3D data;
 	unsigned int root;
 	int	i, ret, masters =3D 0;
=20
-	chained_irq_enter(irq_chip, desc);
-
 	ret =3D regmap_read(chip->regmap, SSBI_REG_ADDR_IRQ_ROOT, &root);
 	if (ret) {
 		pr_err("Can't read root status ret=3D%d\n", ret);
-		return;
+		return IRQ_NONE;
 	}
=20
 	/* on pm8xxx series masters start from bit 1 of the root */
@@ -192,7 +189,7 @@ static void pm8xxx_irq_handler(struct irq_desc *desc)
 		if (masters & (1 << i))
 			pm8xxx_irq_master_handler(chip, i);
=20
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
=20
 static void pm8821_irq_block_handler(struct pm_irq_chip *chip,
@@ -230,19 +227,17 @@ static inline void pm8821_irq_master_handler(struct =
pm_irq_chip *chip,
 			pm8821_irq_block_handler(chip, master, block);
 }
=20
-static void pm8821_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8821_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip =3D irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip =3D irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip =3D data;
 	unsigned int master;
 	int ret;
=20
-	chained_irq_enter(irq_chip, desc);
 	ret =3D regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER0, &master);
 	if (ret) {
 		pr_err("Failed to read master 0 ret=3D%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
=20
 	/* bits 1 through 7 marks the first 7 blocks in master 0 */
@@ -251,19 +246,18 @@ static void pm8821_irq_handler(struct irq_desc *desc=
)
=20
 	/* bit 0 marks if master 1 contains any bits */
 	if (!(master & BIT(0)))
-		goto done;
+		return IRQ_NONE;
=20
 	ret =3D regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER1, &master);
 	if (ret) {
 		pr_err("Failed to read master 1 ret=3D%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
=20
 	pm8821_irq_master_handler(chip, 1, master);
=20
-done:
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
=20
 static void pm8xxx_irq_mask_ack(struct irq_data *d)
@@ -574,14 +568,15 @@ static int pm8xxx_probe(struct platform_device *pdev=
)
 	if (!chip->irqdomain)
 		return -ENODEV;
=20
-	irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
+	rc =3D devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name(=
&pdev->dev), chip);
+	if (rc)
+		return rc;
+
 	irq_set_irq_wake(irq, 1);
=20
 	rc =3D of_platform_populate(pdev->dev=2Eof_node, NULL, NULL, &pdev->dev)=
;
-	if (rc) {
-		irq_set_chained_handler_and_data(irq, NULL, NULL);
+	if (rc)
 		irq_domain_remove(chip->irqdomain);
-	}
=20
 	return rc;
 }
@@ -594,11 +589,9 @@ static int pm8xxx_remove_child(struct device *dev, vo=
id *unused)
=20
 static int pm8xxx_remove(struct platform_device *pdev)
 {
-	int irq =3D platform_get_irq(pdev, 0);
 	struct pm_irq_chip *chip =3D platform_get_drvdata(pdev);
=20
 	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
-	irq_set_chained_handler_and_data(irq, NULL, NULL);
 	irq_domain_remove(chip->irqdomain);
=20
 	return 0;
