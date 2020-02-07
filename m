Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AD3155543
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 11:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgBGKEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 05:04:42 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40535 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbgBGKEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 05:04:41 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0A9556388;
        Fri,  7 Feb 2020 05:04:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 07 Feb 2020 05:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=GDvxeJxR5VebSathOGRHx5rbKH2
        GgrFsB0YklbsXwPM=; b=gy6L+PcV7v98X2wtE1csWSe9E19AcPm0aylIYFyjC+t
        q4MI9QnEnxqauhZNApKz2/L9jpggklkCy0qcI4KXhpcaTHh+4gx0H6RBahrUmZtE
        Jno1aEAwx8Zr6kuyyUBNOCex8MOoHEFwTLvzVQz2yvayKUgGwTYRauICLcX17l43
        Ev0KL0qBQrS4Cb3diZbbJvCqi6+utvdXoXqcaVJ3CX7+gC2olXW3z2zZQuxonk1V
        1HhnTkk4EGMAO8vR/RxswxN5j9isjfk37G5Wx0NFPWmdveAhVx8EoopqHqS+xTM1
        61KPRDy4/4JWapTy0omu2DopFsV3DEFnGPS4kz1P+Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GDvxeJ
        xR5VebSathOGRHx5rbKH2GgrFsB0YklbsXwPM=; b=VwdoFf6aYLM9fTeEEHUTu5
        Vs/LuaafMJijK8xO+2BwoCthZGHT168E+Jx9i6zncyuHrK/vD1ZMHjivLV5FJZQD
        y1NTO2UduvIJEGlA2mXQ+Dld5WTupy0wqqFGnax2+wOiDh1ZLJgHZt8dk4wz+iFJ
        bOnRChQcHIuCaxSvM0xc+qcpU+plEWHCQavwU125SAqytt20kqE98evUr0UJqAXM
        RAdQymp9KTjCTSkGScgze6EqilTtzt+MEPhcVycOHR6lzFrauGvKInsGO1Svv0SF
        4Stp8QiVKkW3n2Wu9GmmG6BdYep/JQDFPBjAiM53IlM0O0uzDb6SYjeHfIZWXOIQ
        ==
X-ME-Sender: <xms:NzY9XtZJWjRLUGo9YrFd0tZEFJWnBY3k1H3Wl36Rdgd3-6WW_digNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:NzY9Xgw08E4jTQAVvt9j7BeomZdr5M7qm-tdwaGSoaImKBNzGUX5pg>
    <xmx:NzY9XkaC1BBOGdBy--yzKmGMQ2z3m_jiwHcKqpIdRY2zouU8avc3OA>
    <xmx:NzY9XpxwQ2tnqRRjp7WmWnXClFsh6mUvAAgfOFcJy_sh3Rp9Ih6y_A>
    <xmx:ODY9XrLO5a7gDYUiAQRvcIpaUIIvl51frbs2fV6ov3VWeSHuFraMSw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BF2230600DC;
        Fri,  7 Feb 2020 05:04:39 -0500 (EST)
Date:   Fri, 7 Feb 2020 11:04:38 +0100
From:   Greg KH <greg@kroah.com>
To:     Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
Message-ID: <20200207100438.GA627905@kroah.com>
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 31, 2020 at 10:13:31AM +0530, Avaneesh Kumar Dwivedi wrote:
> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, charger enable/disable, pet
> EUD to indicate software is functional. Reusing the platform device kobj,
> sysfs entry 'enable' is created to enable or disable EUD.
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
>  drivers/soc/qcom/Kconfig                      |  12 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
>  4 files changed, 347 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
>  create mode 100644 drivers/soc/qcom/eud.c
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
> new file mode 100644
> index 0000000..d96ae05
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
> @@ -0,0 +1,5 @@
> +What:           /sys/bus/platform/drivers/msm-eud/enable
> +Date:           Jan 2020
> +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> +Description:    Enable/Disable use of eud device.

What are valid values to be used here?

> +Users:          User space debug application which intend to use EUD h/w block.
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e7..6b7c9d0 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -202,4 +202,16 @@ config QCOM_APR
>  	  application processor and QDSP6. APR is
>  	  used by audio driver to configure QDSP6
>  	  ASM, ADM and AFE modules.
> +
> +config QCOM_EUD
> +       tristate "QTI Embedded USB Debugger (EUD)"
> +       depends on ARCH_QCOM

Why not let everyone test build this?

> +       help
> +         The Embedded USB Debugger (EUD) driver is a driver for the
> +         control peripheral which waits on events like USB attach/detach
> +         and charger enable/disable. The control peripheral further helps
> +         support the USB-based debug and trace capabilities.
> +         This module enables support for Qualcomm Technologies, Inc.
> +         Embedded USB Debugger (EUD).
> +         If unsure, say N.
>  endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 9fb35c8..c15be68 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> +obj-$(CONFIG_QCOM_EUD) += eud.o
> diff --git a/drivers/soc/qcom/eud.c b/drivers/soc/qcom/eud.c
> new file mode 100644
> index 0000000..e6c3604
> --- /dev/null
> +++ b/drivers/soc/qcom/eud.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/extcon.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/delay.h>
> +#include <linux/sysfs.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>
> +#include <linux/workqueue.h>
> +#include <linux/power_supply.h>
> +
> +#define EUD_ENABLE_CMD 1
> +#define EUD_DISABLE_CMD 0

Don't need these.

> +
> +#define EUD_REG_INT1_EN_MASK	0x0024
> +#define EUD_REG_INT_STATUS_1	0x0044
> +#define EUD_REG_CTL_OUT_1	0x0074
> +#define EUD_REG_VBUS_INT_CLR	0x0080
> +#define EUD_REG_CHGR_INT_CLR	0x0084
> +#define EUD_REG_CSR_EUD_EN	0x1014
> +#define EUD_REG_SW_ATTACH_DET	0x1018
> +
> +#define EUD_INT_VBUS		BIT(2)
> +#define EUD_INT_CHGR		BIT(3)
> +#define EUD_INT_SAFE_MODE	BIT(4)
> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_CHGR|\
> +				EUD_INT_SAFE_MODE)
> +
> +struct eud_chip {
> +	struct device			*dev;
> +	int				eud_irq;
> +	unsigned int			extcon_id;
> +	unsigned int			int_status;
> +	bool				usb_attach;
> +	bool				chgr_enable;
> +	void __iomem			*eud_reg_base;
> +	struct extcon_dev		*extcon;
> +	int				enable;
> +	struct work_struct		eud_work;
> +};
> +
> +static const unsigned int eud_extcon_cable[] = {
> +	EXTCON_USB,
> +	EXTCON_CHG_USB_SDP,
> +	EXTCON_NONE,
> +};
> +
> +static int enable_eud(struct eud_chip *priv)
> +{
> +	int ret;
> +
> +	/* write into CSR to enable EUD */
> +	writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +	/* Enable vbus, chgr & safe mode warning interrupts */
> +	writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
> +
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +
> +	/*
> +	 * Set the default cable state to usb connect and charger
> +	 * enable
> +	 */
> +	ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
> +	if (ret)
> +		return ret;
> +	ret = extcon_set_state_sync(priv->extcon,
> +			EXTCON_CHG_USB_SDP, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void disable_eud(struct eud_chip *priv)
> +{
> +	/* write into CSR to disable EUD */
> +	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> +}
> +
> +static ssize_t enable_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, sizeof(int), "%d", chip->enable);
> +}
> +
> +static ssize_t enable_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct eud_chip *chip = dev_get_drvdata(dev);
> +	int enable = 0;
> +	int ret = 0;
> +
> +	if (sscanf(buf, "%du", &enable) != 1)
> +		return -EINVAL;

No, use the built-in kernel function to handle reading y/n/Y/N/0/1 from
sysfs files, do not try to roll your own.  As you have seen, you will
get it wrong :)



> +
> +	if (enable == EUD_ENABLE_CMD)
> +		ret = enable_eud(chip);
> +	else if (enable == EUD_DISABLE_CMD)
> +		disable_eud(chip);
> +	if (!ret)
> +		chip->enable = enable;
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(enable);
> +
> +static struct attribute *attrs[] = {
> +	&dev_attr_enable.attr,
> +	NULL
> +};
> +
> +static struct attribute_group attr_group = {
> +	.attrs = attrs,
> +};
> +
> +static const struct attribute_group *attr_groups[] = {
> +	&attr_group,
> +	NULL
> +};

ATTRIBUTE_GROUPS()?

> +
> +static void eud_event_notifier(struct work_struct *eud_work)
> +{
> +	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
> +					eud_work);
> +	int ret;
> +
> +	if (chip->int_status == EUD_INT_VBUS) {
> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->usb_attach);
> +		if (ret)
> +			return;
> +	} else if (chip->int_status == EUD_INT_CHGR) {
> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
> +					chip->chgr_enable);
> +		if (ret)
> +			return;
> +	}
> +}
> +
> +static void usb_attach_detach(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_USB;
> +	/* read ctl_out_1[4] to find USB attach or detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(4))
> +		chip->usb_attach = true;
> +	else
> +		chip->usb_attach = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear vbus_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
> +}
> +
> +static void chgr_enable_disable(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	chip->extcon_id = EXTCON_CHG_USB_SDP;
> +	/* read ctl_out_1[6] to find charger enable or disable event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
> +	if (reg & BIT(6))
> +		chip->chgr_enable = true;
> +	else
> +		chip->chgr_enable = false;
> +
> +	schedule_work(&chip->eud_work);
> +
> +	/* set and clear chgr_int_clr[0] to clear interrupt */
> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +	/* Ensure Register Writes Complete */
> +	wmb();
> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
> +}
> +
> +static void pet_eud(struct eud_chip *chip)
> +{
> +	u32 reg;
> +
> +	/* read sw_attach_det[0] to find attach/detach event */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +	if (reg & BIT(0)) {
> +		/* Detach & Attach pet for EUD */
> +		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +		/* Delay to make sure detach pet is done before attach pet */
> +		udelay(100);
> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +	} else {
> +		/* Attach pet for EUD */
> +		writel_relaxed(BIT(0), chip->eud_reg_base +
> +					EUD_REG_SW_ATTACH_DET);
> +		/* Ensure Register Writes Complete */
> +		wmb();
> +	}
> +}
> +
> +static irqreturn_t handle_eud_irq(int irq, void *data)
> +{
> +	struct eud_chip *chip = data;
> +	u32 reg;
> +
> +	/* read status register and find out which interrupt triggered */
> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
> +	switch (reg & EUD_INT_ALL) {
> +	case EUD_INT_VBUS:
> +		chip->int_status = EUD_INT_VBUS;
> +		usb_attach_detach(chip);
> +		break;
> +	case EUD_INT_CHGR:
> +		chip->int_status = EUD_INT_CHGR;
> +		chgr_enable_disable(chip);
> +		break;
> +	case EUD_INT_SAFE_MODE:
> +		pet_eud(chip);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static int msm_eud_probe(struct platform_device *pdev)
> +{
> +	struct eud_chip *chip;
> +	struct resource *res;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;

No reference counting???

thanks,

greg k-h
