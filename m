Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E871F4B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 04:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgFJC1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 22:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgFJC1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 22:27:38 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B42C05BD1E;
        Tue,  9 Jun 2020 19:27:38 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id i1so200681vkp.8;
        Tue, 09 Jun 2020 19:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EDTtj2l1wZcZ/QHNK02p6RkxP3ZRaOlmrMOFw0yr+3c=;
        b=vgGdrdMzw8/DKe/mLscBFmU3Pg+nYunf0kB14koDIkSCrgVhVrxMP1o34Jh2PzHqto
         Tu++r1MVWRH+z819eLvfYqu/cYHuRGLEF3CtC876m+DzQkoZk1YFW76gysGojz8jWUpz
         +A6AqUlksFbN+SyIfLyJYuFB9lG0Ilga8N9GkVxdJXXIaEMm6ZGF9yRDcEA1NQjC7S9h
         O4DkMT/wSuoEW8MdoDyhSCM68n9rEK/jqoF9T3F/TyMNerLvOOiuywTElPBxKF7b9gA9
         YCwgDneJcYM3BY6BNtkl6AIIYL+9OF831NWGpyDlFOAGtm8FL3RMTTk1eYyQBt68UHv1
         yl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EDTtj2l1wZcZ/QHNK02p6RkxP3ZRaOlmrMOFw0yr+3c=;
        b=LYZF+SV6ki0cl5hdmmq0YxfNq01BaCvW6yFc7ZxlDvzCv6uGwzZUk8vLNx4ExTef9o
         BLkFgmLDoYbl+q1Yjt8hQK07NimlHfjcGAuj6HAjPoZjpTmMpRGkFyoPYLZVjUs7wTZV
         KgQ2YDtnn31Tx7lag1pAG198TqOVOmlHvc55eiOqDKRySTR/p+5tQNdNlqpCdT/w7B9O
         ltTPUvsKGm0hW8i0XBNzIC01NQlQ33746DXQ9hZeR43q0k8tettPh3b3JZu9V4BqTy/t
         qcf7PvXkoVwTeniIShi5xDn/wdJotFR/1FUX+yfXB+NpyEGQhprw3fPu1npPVjnVNoJA
         +S6g==
X-Gm-Message-State: AOAM532BHR+S2DQhpkfCeYb9yHd3FMsIc9yBn23fd0VqMaP+uVZhdW1F
        eD/0/x5NdqWz3BueYmDNM9ZD4e6LzGdB41mjmmw=
X-Google-Smtp-Source: ABdhPJyP6SsF96GKJJEYQW4eIe2HP7qxRKag6LHCYoRsy18tc1RRW5BaX5oa/J23phDjhkpDoZhoYOBNf+13X0MEK54=
X-Received: by 2002:a1f:bf13:: with SMTP id p19mr745671vkf.69.1591756056515;
 Tue, 09 Jun 2020 19:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200609205851.30113-1-wcheng@codeaurora.org> <20200609205851.30113-2-wcheng@codeaurora.org>
In-Reply-To: <20200609205851.30113-2-wcheng@codeaurora.org>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Wed, 10 Jun 2020 10:27:25 +0800
Message-ID: <CAKgpwJWp9St4B1xuT5qAns1_NFPjd+2_gozv=0j-g7J42dbCPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>, bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
Wesley Cheng <wcheng@codeaurora.org> =E4=BA=8E2020=E5=B9=B46=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:00=E5=86=99=E9=81=93=EF=BC=9A
>
> The QCOM SPMI typec driver handles the role and orientation detection, an=
d
> notifies client drivers using the USB role switch framework.   It registe=
rs
> as a typec port, so orientation can be communicated using the typec switc=
h
> APIs.  The driver also registers the VBUS output regulator, so client
> drivers can enable the VBUS source when acting as a source/host.
>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/typec/Kconfig           |  11 ++
>  drivers/usb/typec/Makefile          |   1 +
>  drivers/usb/typec/qcom-pmic-typec.c | 278 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 290 insertions(+)
>  create mode 100644 drivers/usb/typec/qcom-pmic-typec.c
>
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 559dd06..8de2520 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -73,6 +73,17 @@ config TYPEC_TPS6598X
>           If you choose to build this driver as a dynamically linked modu=
le, the
>           module will be called tps6598x.ko.
>
> +config TYPEC_QCOM_PMIC
> +       tristate "Qualcomm PMIC USB typec driver"
> +       depends on ARCH_QCOM
> +       help
> +         Driver for supporting role switch over the Qualcomm PMIC.  This=
 will
> +         handle the type C role and orientation detection reported by th=
e QCOM
> +         PMIC if the PMIC has the capability to handle type C detection.
> +
> +         It will also enable the VBUS output to connected devices when a
> +         DFP connection is made.
> +
>  source "drivers/usb/typec/mux/Kconfig"
>
>  source "drivers/usb/typec/altmodes/Kconfig"
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 7753a5c3..cceffd9 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_TYPEC_TCPM)        +=3D tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)       +=3D ucsi/
>  obj-$(CONFIG_TYPEC_HD3SS3220)  +=3D hd3ss3220.o
>  obj-$(CONFIG_TYPEC_TPS6598X)   +=3D tps6598x.o
> +obj-$(CONFIG_TYPEC_QCOM_PMIC)  +=3D qcom-pmic-typec.o
>  obj-$(CONFIG_TYPEC)            +=3D mux/
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom=
-pmic-typec.c
> new file mode 100644
> index 0000000..ce6319c
> --- /dev/null
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -0,0 +1,278 @@
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
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <linux/usb/role.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/workqueue.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +
> +#define DCDC_BASE                      0x1100
> +#define CMD_OTG                                (DCDC_BASE + 0x40)
> +#define OTG_EN                         BIT(0)
> +#define OTG_CFG                                (DCDC_BASE + 0x53)
> +#define OTG_EN_SRC_CFG                 BIT(1)
> +
> +#define USB_BASE                       0x1300
> +#define TYPE_C_CFG_REG                 (USB_BASE + 0x58)
> +#define BC12_START_ON_CC               BIT(7)
> +
> +#define TYPEC_BASE                     0x1500
> +#define TYPEC_MISC_STATUS              (TYPEC_BASE + 0xb)
> +#define CC_ATTACHED                    BIT(0)
> +#define CC_ORIENTATION                 BIT(1)
> +#define SNK_SRC_MODE                   BIT(6)
> +#define TYPEC_MODE_CFG                 (TYPEC_BASE + 0x44)
> +#define TYPEC_DISABLE_CMD              BIT(0)
> +#define EN_SNK_ONLY                    BIT(1)
> +#define EN_SRC_ONLY                    BIT(2)
> +#define EN_TRY_SNK                     BIT(4)
> +#define TYPEC_VCONN_CONTROL            (TYPEC_BASE + 0x46)
> +#define VCONN_EN_SRC                   BIT(0)
> +#define VCONN_EN_VAL                   BIT(1)
> +#define TYPEC_EXIT_STATE_CFG           (TYPEC_BASE + 0x50)
> +#define SEL_SRC_UPPER_REF              BIT(2)
> +#define TYPEC_INTR_EN_CFG_1            (TYPEC_BASE + 0x5e)
> +#define TYPEC_INTR_EN_CFG_1_MASK       GENMASK(0, 7)
> +
> +struct qcom_pmic_typec {
> +       struct device           *dev;
> +       struct fwnode_handle    *fwnode;
> +       struct regmap           *regmap;
> +       struct work_struct      bh_work;
> +
> +       struct typec_capability *cap;
> +       struct typec_port       *port;
> +       struct usb_role_switch *role_sw;
> +
> +       struct regulator_desc usb_vbus_rdesc;
> +       struct regulator_dev *usb_vbus_reg;
> +};
> +
> +static int qcom_pmic_typec_vbus_enable(struct qcom_pmic_typec *qcom_usb)
> +{
> +       int rc;
> +
> +       rc =3D regmap_update_bits(qcom_usb->regmap, CMD_OTG, OTG_EN, OTG_=
EN);
> +       if (rc)
> +               dev_err(qcom_usb->dev, "failed to update OTG_CTL\n");
> +
> +       return rc;
> +}
> +
> +static int qcom_pmic_typec_vbus_disable(struct qcom_pmic_typec *qcom_usb=
)
> +{
> +       int rc;
> +
> +       rc =3D regmap_update_bits(qcom_usb->regmap, CMD_OTG, OTG_EN, 0);
> +       if (rc)
> +               dev_err(qcom_usb->dev, "failed to update OTG_CTL\n");
> +
> +       return rc;
> +}
> +
> +void qcom_pmic_typec_bh_work(struct work_struct *w)
> +{
> +       struct qcom_pmic_typec *qcom_usb =3D container_of(w,
> +                                                       struct qcom_pmic_=
typec,
> +                                                       bh_work);
> +       enum typec_orientation orientation;
> +       enum usb_role role;
> +       unsigned int stat;
> +
> +       regmap_read(qcom_usb->regmap, TYPEC_MISC_STATUS, &stat);
> +
> +       if (stat & CC_ATTACHED) {
> +               orientation =3D ((stat & CC_ORIENTATION) >> 1) ?
> +                               TYPEC_ORIENTATION_REVERSE :
> +                               TYPEC_ORIENTATION_NORMAL;
> +               typec_set_orientation(qcom_usb->port, orientation);
> +
> +               role =3D (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE=
_DEVICE;
> +               if (role =3D=3D USB_ROLE_HOST)
> +                       qcom_pmic_typec_vbus_enable(qcom_usb);
> +               else
> +                       qcom_pmic_typec_vbus_disable(qcom_usb);
> +
> +               usb_role_switch_set_role(qcom_usb->role_sw, role);
> +       } else {
> +               usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE=
);
> +               qcom_pmic_typec_vbus_disable(qcom_usb);
> +       }
> +}
> +
> +irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
> +{
> +       struct qcom_pmic_typec *qcom_usb =3D _qcom_usb;
> +
> +       queue_work(system_power_efficient_wq, &qcom_usb->bh_work);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_u=
sb)
> +{
> +       u8 mode;
> +
> +       regmap_update_bits(qcom_usb->regmap, TYPE_C_CFG_REG, BC12_START_O=
N_CC,
> +                          0);
> +       regmap_update_bits(qcom_usb->regmap, TYPEC_INTR_EN_CFG_1,
> +                          TYPEC_INTR_EN_CFG_1_MASK, 0);
> +
> +       if (qcom_usb->cap->type !=3D TYPEC_PORT_DRP)
> +               mode =3D (qcom_usb->cap->type =3D=3D TYPEC_PORT_SNK) ?
> +                                       EN_SNK_ONLY : EN_SRC_ONLY;
> +       else
> +               mode =3D EN_TRY_SNK;
> +       regmap_update_bits(qcom_usb->regmap, TYPEC_MODE_CFG,
> +                          EN_SNK_ONLY | EN_TRY_SNK | EN_SRC_ONLY, mode);
> +
> +       regmap_update_bits(qcom_usb->regmap, TYPEC_VCONN_CONTROL,
> +                          VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
> +       regmap_update_bits(qcom_usb->regmap, TYPEC_VCONN_CONTROL,
> +                          VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
> +       regmap_update_bits(qcom_usb->regmap, TYPEC_EXIT_STATE_CFG,
> +                          SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
> +       regmap_update_bits(qcom_usb->regmap, OTG_CFG, OTG_EN_SRC_CFG,
> +                          OTG_EN_SRC_CFG);
> +}
> +
> +static int qcom_pmic_typec_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct qcom_pmic_typec *qcom_usb;
> +       struct typec_capability *cap;
> +       const char *buf;
> +       int ret, irq, role;
> +
> +       qcom_usb =3D kzalloc(sizeof(*qcom_usb), GFP_KERNEL);

devm_kzalloc().

> +       if (!qcom_usb)
> +               return -ENOMEM;
> +
> +       qcom_usb->dev =3D dev;
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
> +               return -EINVAL;
> +       }
> +
> +       ret =3D devm_request_irq(qcom_usb->dev, irq, qcom_pmic_typec_inte=
rrupt,
> +                              IRQF_SHARED, "qcom-pmic-typec", qcom_usb);
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
> +       cap =3D kzalloc(sizeof(*cap), GFP_KERNEL);

devm_kzalloc().

> +       if (!cap) {
> +               ret =3D -ENOMEM;
> +               goto err_put_node;
> +       }
> +
> +       ret =3D fwnode_property_read_string(qcom_usb->fwnode, "power-role=
", &buf);
> +       if (!ret)
> +               role =3D typec_find_port_power_role(buf);

if (role < 0)

> +       else
> +               role =3D TYPEC_PORT_SNK;
> +       cap->type =3D role;
> +
> +       ret =3D fwnode_property_read_string(qcom_usb->fwnode, "data-role"=
, &buf);
> +       if (!ret)
> +               role =3D typec_find_port_data_role(buf);

if (role < 0)

> +       else
> +               role =3D TYPEC_PORT_UFP;
> +       cap->data =3D role;
> +
> +       cap->prefer_role =3D -1;

TYPEC_NO_PREFERRED_ROLE

> +       cap->fwnode =3D qcom_usb->fwnode;
> +       qcom_usb->port =3D typec_register_port(dev, cap);
> +       if (IS_ERR(qcom_usb->port)) {
> +               dev_err(dev, "Failed to register type c port %d\n",
> +                       IS_ERR(qcom_usb->port));
> +               ret =3D PTR_ERR(qcom_usb->port);

dev_err(dev, , ret)?

Li Jun
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
> +       INIT_WORK(&qcom_usb->bh_work, qcom_pmic_typec_bh_work);
> +       platform_set_drvdata(pdev, qcom_usb);
> +       qcom_pmic_typec_typec_hw_init(qcom_usb);
> +
> +       queue_work(system_power_efficient_wq, &qcom_usb->bh_work);
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
> +       cancel_work_sync(&qcom_usb->bh_work);
> +       usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
> +       qcom_pmic_typec_vbus_disable(qcom_usb);
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
> +module_platform_driver(qcom_pmic_typec);
> +
> +MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
> +MODULE_LICENSE("GPL v2");
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
> a Linux Foundation Collaborative Project
>
