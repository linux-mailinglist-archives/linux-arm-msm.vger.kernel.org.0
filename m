Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CD1231B41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 10:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgG2Idc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 04:33:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgG2Idb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 04:33:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDEA2206D4;
        Wed, 29 Jul 2020 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596011611;
        bh=hXngKPbjaOfSvlyMqi/E2TSVlhAuzFaWE/FU34fsZTc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eP+/jldWmt++lmAohi+HbHge/V/fnmWmV+msF8/Y1NLHR3VAMXGtRbU6Gw46TWqcD
         oCuvuj5brpjUh2RKSQTTqrhztOu+n1NrY3kx9yDHCj85I8zb48uBrj3WuJkI1Ke9//
         o+HTQfl4ZDGy/1l1A2vGCXfT9eOr1iv3BCj+9RKs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200729071340.7673-2-wcheng@codeaurora.org>
References: <20200729071340.7673-1-wcheng@codeaurora.org> <20200729071340.7673-2-wcheng@codeaurora.org>
Subject: Re: [PATCH v6 1/4] usb: typec: Add QCOM PMIC typec detection driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, robh+dt@kernel.org
Date:   Wed, 29 Jul 2020 01:33:29 -0700
Message-ID: <159601160976.1360974.10172804658083744292@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-07-29 00:13:37)
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 559dd06117e7..3e375f82849d 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -73,6 +73,18 @@ config TYPEC_TPS6598X
>           If you choose to build this driver as a dynamically linked modu=
le, the
>           module will be called tps6598x.ko.
> =20
> +config TYPEC_QCOM_PMIC
> +       tristate "Qualcomm PMIC USB Type-C driver"
> +       depends on ARCH_QCOM

Can you add || COMPILE_TEST here?

> +       help
> +         Driver for supporting role switch over the Qualcomm PMIC.  This=
 will
> +         handle the USB Type-C role and orientation detection reported b=
y the
> +         QCOM PMIC if the PMIC has the capability to handle USB Type-C
> +         detection.
> +
> +         It will also enable the VBUS output to connected devices when a
> +         DFP connection is made.
> +
>  source "drivers/usb/typec/mux/Kconfig"
> =20
>  source "drivers/usb/typec/altmodes/Kconfig"
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom=
-pmic-typec.c
> new file mode 100644
> index 000000000000..5ae3af03c638
> --- /dev/null
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/regmap.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>

Is this include used?

> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>

Is this include used?

> +#include <linux/usb/role.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define TYPEC_MISC_STATUS              0xb
> +#define CC_ATTACHED                    BIT(0)
> +#define CC_ORIENTATION                 BIT(1)
> +#define SNK_SRC_MODE                   BIT(6)
> +#define TYPEC_MODE_CFG                 0x44
> +#define TYPEC_DISABLE_CMD              BIT(0)
> +#define EN_SNK_ONLY                    BIT(1)
> +#define EN_SRC_ONLY                    BIT(2)
> +#define TYPEC_VCONN_CONTROL            0x46
> +#define VCONN_EN_SRC                   BIT(0)
> +#define VCONN_EN_VAL                   BIT(1)
> +#define TYPEC_EXIT_STATE_CFG           0x50
> +#define SEL_SRC_UPPER_REF              BIT(2)
> +#define TYPEC_INTR_EN_CFG_1            0x5e
> +#define TYPEC_INTR_EN_CFG_1_MASK       GENMASK(7, 0)
> +
> +struct qcom_pmic_typec {
> +       struct device           *dev;
> +       struct fwnode_handle    *fwnode;
> +       struct regmap           *regmap;
> +       u32                     base;
> +
> +       struct typec_capability *cap;
> +       struct typec_port       *port;
> +       struct usb_role_switch *role_sw;
> +
> +       struct regulator        *vbus_reg;
> +       bool                    vbus_enabled;
> +};
> +
> +static void qcom_pmic_typec_enable_vbus_regulator(struct qcom_pmic_typec
> +                                                       *qcom_usb, bool e=
nable)
> +{
> +       int ret =3D 0;

Please don't assign and then reassign before testing this variable.

> +
> +       if (enable =3D=3D qcom_usb->vbus_enabled)
> +               return;
> +
> +       if (!qcom_usb->vbus_reg) {
> +               qcom_usb->vbus_reg =3D devm_regulator_get(qcom_usb->dev,
> +                                                       "usb_vbus");
> +               if (IS_ERR(qcom_usb->vbus_reg)) {
> +                       qcom_usb->vbus_reg =3D NULL;
> +                       return;
> +               }
> +       }
> +
> +       if (enable) {
> +               ret =3D regulator_enable(qcom_usb->vbus_reg);
> +               if (ret)
> +                       return;
> +       } else {
> +               ret =3D regulator_disable(qcom_usb->vbus_reg);
> +               if (ret)
> +                       return;
> +       }
> +       qcom_usb->vbus_enabled =3D enable;
> +}
> +
> +static void qcom_pmic_typec_check_connection(struct qcom_pmic_typec *qco=
m_usb)
> +{
> +       enum typec_orientation orientation;
> +       enum usb_role role;
> +       unsigned int stat;
> +       bool enable_vbus;
> +
> +       regmap_read(qcom_usb->regmap, qcom_usb->base + TYPEC_MISC_STATUS,
> +                   &stat);
> +
> +       if (stat & CC_ATTACHED) {
> +               orientation =3D ((stat & CC_ORIENTATION) >> 1) ?

Do we really need to shift >> by 1? Seems useless for a test.

> +                               TYPEC_ORIENTATION_REVERSE :
> +                               TYPEC_ORIENTATION_NORMAL;
> +               typec_set_orientation(qcom_usb->port, orientation);
> +
> +               role =3D (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE=
_DEVICE;
> +               if (role =3D=3D USB_ROLE_HOST)
> +                       enable_vbus =3D true;
> +               else
> +                       enable_vbus =3D false;
> +       } else {
> +               role =3D USB_ROLE_NONE;
> +               enable_vbus =3D false;
> +       }
> +
> +       qcom_pmic_typec_enable_vbus_regulator(qcom_usb, enable_vbus);
> +       usb_role_switch_set_role(qcom_usb->role_sw, role);
> +}
> +
> +static irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
> +{
> +       struct qcom_pmic_typec *qcom_usb =3D _qcom_usb;
> +
> +       qcom_pmic_typec_check_connection(qcom_usb);
> +       return IRQ_HANDLED;
> +}
> +
> +static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_u=
sb)
> +{
> +       u8 mode =3D 0;
> +
> +       regmap_update_bits(qcom_usb->regmap,
> +                          qcom_usb->base + TYPEC_INTR_EN_CFG_1,
> +                          TYPEC_INTR_EN_CFG_1_MASK, 0);
> +
> +       if (qcom_usb->cap->type !=3D TYPEC_PORT_DRP)
> +               mode =3D (qcom_usb->cap->type =3D=3D TYPEC_PORT_SNK) ?
> +                                       EN_SNK_ONLY : EN_SRC_ONLY;
> +       regmap_update_bits(qcom_usb->regmap, qcom_usb->base + TYPEC_MODE_=
CFG,
> +                          EN_SNK_ONLY | EN_SRC_ONLY, mode);
> +
> +       regmap_update_bits(qcom_usb->regmap,
> +                          qcom_usb->base + TYPEC_VCONN_CONTROL,
> +                          VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
> +       regmap_update_bits(qcom_usb->regmap,
> +                          qcom_usb->base + TYPEC_EXIT_STATE_CFG,
> +                          SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
> +}
> +
> +static int qcom_pmic_typec_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct qcom_pmic_typec *qcom_usb;
> +       struct typec_capability *cap;
> +       const char *buf;
> +       int ret, irq, role;
> +       u32 reg;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "reg", &reg);
> +       if (ret < 0) {
> +               dev_err(dev, "missing base address");

Please add newlines at the end of printk messages.

> +               return ret;
> +       }
> +
> +       qcom_usb =3D devm_kzalloc(dev, sizeof(*qcom_usb), GFP_KERNEL);
> +       if (!qcom_usb)
> +               return -ENOMEM;
> +
> +       qcom_usb->dev =3D dev;
> +       qcom_usb->base =3D reg;
> +
> +       qcom_usb->regmap =3D dev_get_regmap(dev->parent, NULL);
> +       if (!qcom_usb->regmap) {
> +               dev_err(dev, "Failed to get regmap\n");
> +               return -EINVAL;
> +       }
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(dev, "Failed to get CC irq\n");

platform_get_irq() already prints an error message. Please remove this.

> +               return -EINVAL;
> +       }
> +
> +       ret =3D devm_request_threaded_irq(qcom_usb->dev, irq, NULL,
> +                                       qcom_pmic_typec_interrupt, IRQF_O=
NESHOT,
> +                                       "qcom-pmic-typec", qcom_usb);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Could not request IRQ\n");
> +               return ret;
> +       }
> +
> +       qcom_usb->fwnode =3D device_get_named_child_node(dev, "connector"=
);
> +       if (!qcom_usb->fwnode)
> +               return -EINVAL;
> +
> +       cap =3D devm_kzalloc(dev, sizeof(*cap), GFP_KERNEL);
> +       if (!cap) {
> +               ret =3D -ENOMEM;
> +               goto err_put_node;
> +       }
> +
> +       ret =3D fwnode_property_read_string(qcom_usb->fwnode, "power-role=
", &buf);
> +       if (!ret) {
> +               role =3D typec_find_port_power_role(buf);
> +               if (role < 0)
> +                       role =3D TYPEC_PORT_SNK;
> +       } else {
> +               role =3D TYPEC_PORT_SNK;
> +       }
> +       cap->type =3D role;
> +
> +       ret =3D fwnode_property_read_string(qcom_usb->fwnode, "data-role"=
, &buf);
> +       if (!ret) {
> +               role =3D typec_find_port_data_role(buf);
> +               if (role < 0)
> +                       role =3D TYPEC_PORT_UFP;
> +       } else {
> +               role =3D TYPEC_PORT_UFP;
> +       }
> +       cap->data =3D role;
> +
> +       cap->prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> +       cap->fwnode =3D qcom_usb->fwnode;
> +       qcom_usb->port =3D typec_register_port(dev, cap);
> +       if (IS_ERR(qcom_usb->port)) {
> +               ret =3D PTR_ERR(qcom_usb->port);
> +               dev_err(dev, "Failed to register type c port %d\n", ret);
> +               goto err_put_node;
> +       }
> +
> +       qcom_usb->cap =3D cap;
> +
> +       qcom_usb->role_sw =3D fwnode_usb_role_switch_get(qcom_usb->fwnode=
);
> +       if (IS_ERR(qcom_usb->role_sw)) {
> +               if (PTR_ERR(qcom_usb->role_sw) !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "failed to get role switch\n");
> +               ret =3D PTR_ERR(qcom_usb->role_sw);
> +               goto err_typec_port;
> +       }
> +
> +       platform_set_drvdata(pdev, qcom_usb);
> +       qcom_pmic_typec_typec_hw_init(qcom_usb);
> +       qcom_pmic_typec_check_connection(qcom_usb);
> +
> +       return 0;
> +
> +err_typec_port:
> +       typec_unregister_port(qcom_usb->port);
> +err_put_node:
> +       fwnode_handle_put(qcom_usb->fwnode);
> +
> +       return ret;
> +}
> +
> +static int qcom_pmic_typec_remove(struct platform_device *pdev)
> +{
> +       struct qcom_pmic_typec *qcom_usb =3D platform_get_drvdata(pdev);
> +
> +       usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
> +       qcom_pmic_typec_enable_vbus_regulator(qcom_usb, 0);
> +
> +       typec_unregister_port(qcom_usb->port);
> +       usb_role_switch_put(qcom_usb->role_sw);
> +       fwnode_handle_put(qcom_usb->fwnode);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id qcom_pmic_typec_table[] =3D {
> +       { .compatible =3D "qcom,pm8150b-usb-typec" },
> +       { },

Nitpick: Drop the comma here so nothing can come after without causing a
compile error.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
> +
> +static struct platform_driver qcom_pmic_typec =3D {
> +       .driver =3D {
> +               .name =3D "qcom,pmic-typec",
> +               .of_match_table =3D qcom_pmic_typec_table,
> +       },
> +       .probe =3D qcom_pmic_typec_probe,
> +       .remove =3D qcom_pmic_typec_remove,
> +};
> +

Another nitpick: Drop the newline and make module_platform_driver()
follow directly after the driver.

> +module_platform_driver(qcom_pmic_typec);
> +
> +MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
> +MODULE_LICENSE("GPL v2");
