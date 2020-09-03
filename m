Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9000025CCA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 23:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgICVr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 17:47:57 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24071 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgICVr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 17:47:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599169674; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RPJY1KRWNoV4CWHFf7HFG5FpxKpkslJ0jD6CIdRASW8=; b=F7+3Jd/Q1u8cLdSrba8zvdOCyICxB8F2InTMClrlkGCLtN1okv2jG2tvHMTajf9tU3I4sH/h
 yLt8jXk4FnBWOP2fjViO1rcqf+FHKkzE6r9gex/L3s3iEMPuqM8TpnupAx+ShCCT9cmQHLkP
 2+tOrwLJhmp2JYEE4j5BTU0x26I=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f516451d7b4e2691391cb42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 21:46:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16F5DC43391; Thu,  3 Sep 2020 21:46:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.72.171] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F895C433C8;
        Thu,  3 Sep 2020 21:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0F895C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v8 1/4] usb: typec: Add QCOM PMIC typec detection driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-2-wcheng@codeaurora.org> <20200830185436.GB1947@uller>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <8b45ac9b-f071-75ad-451d-b6e847f25e06@codeaurora.org>
Date:   Thu, 3 Sep 2020 14:46:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200830185436.GB1947@uller>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/30/2020 11:54 AM, Bjorn Andersson wrote:
> On Wed 12 Aug 07:19 UTC 2020, Wesley Cheng wrote:
> 
>> The QCOM SPMI typec driver handles the role and orientation detection, and
>> notifies client drivers using the USB role switch framework.   It registers
>> as a typec port, so orientation can be communicated using the typec switch
>> APIs.  The driver also attains a handle to the VBUS output regulator, so it
>> can enable/disable the VBUS source when acting as a host/device.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>> ---
>>  drivers/usb/typec/Kconfig           |  12 ++
>>  drivers/usb/typec/Makefile          |   1 +
>>  drivers/usb/typec/qcom-pmic-typec.c | 271 ++++++++++++++++++++++++++++
>>  3 files changed, 284 insertions(+)
>>  create mode 100644 drivers/usb/typec/qcom-pmic-typec.c
>>
>> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
>> index 559dd06117e7..63789cf88fce 100644
>> --- a/drivers/usb/typec/Kconfig
>> +++ b/drivers/usb/typec/Kconfig
>> @@ -73,6 +73,18 @@ config TYPEC_TPS6598X
>>  	  If you choose to build this driver as a dynamically linked module, the
>>  	  module will be called tps6598x.ko.
>>  
>> +config TYPEC_QCOM_PMIC
>> +	tristate "Qualcomm PMIC USB Type-C driver"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	help
>> +	  Driver for supporting role switch over the Qualcomm PMIC.  This will
>> +	  handle the USB Type-C role and orientation detection reported by the
>> +	  QCOM PMIC if the PMIC has the capability to handle USB Type-C
>> +	  detection.
>> +
>> +	  It will also enable the VBUS output to connected devices when a
>> +	  DFP connection is made.
>> +
>>  source "drivers/usb/typec/mux/Kconfig"
>>  
>>  source "drivers/usb/typec/altmodes/Kconfig"
>> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
>> index 7753a5c3cd46..cceffd987643 100644
>> --- a/drivers/usb/typec/Makefile
>> +++ b/drivers/usb/typec/Makefile
>> @@ -6,4 +6,5 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
>>  obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
>>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
>> +obj-$(CONFIG_TYPEC_QCOM_PMIC)	+= qcom-pmic-typec.o
>>  obj-$(CONFIG_TYPEC)		+= mux/
>> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
>> new file mode 100644
>> index 000000000000..20b2b6502cb3
>> --- /dev/null
>> +++ b/drivers/usb/typec/qcom-pmic-typec.c
>> @@ -0,0 +1,271 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/regmap.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/usb/role.h>
>> +#include <linux/usb/typec_mux.h>
>> +#include <linux/regulator/consumer.h>
> 
> Please sort these alphabetically.
> 

Hi Bjorn,

Thanks for all the inputs.  Will make all the suggested changes.

Thanks
Wesley

>> +
>> +#define TYPEC_MISC_STATUS		0xb
>> +#define CC_ATTACHED			BIT(0)
>> +#define CC_ORIENTATION			BIT(1)
>> +#define SNK_SRC_MODE			BIT(6)
>> +#define TYPEC_MODE_CFG			0x44
>> +#define TYPEC_DISABLE_CMD		BIT(0)
>> +#define EN_SNK_ONLY			BIT(1)
>> +#define EN_SRC_ONLY			BIT(2)
>> +#define TYPEC_VCONN_CONTROL		0x46
>> +#define VCONN_EN_SRC			BIT(0)
>> +#define VCONN_EN_VAL			BIT(1)
>> +#define TYPEC_EXIT_STATE_CFG		0x50
>> +#define SEL_SRC_UPPER_REF		BIT(2)
>> +#define TYPEC_INTR_EN_CFG_1		0x5e
>> +#define TYPEC_INTR_EN_CFG_1_MASK	GENMASK(7, 0)
>> +
>> +struct qcom_pmic_typec {
>> +	struct device		*dev;
>> +	struct fwnode_handle	*fwnode;
>> +	struct regmap		*regmap;
>> +	u32			base;
>> +
>> +	struct typec_capability *cap;
>> +	struct typec_port	*port;
>> +	struct usb_role_switch *role_sw;
>> +
>> +	struct regulator	*vbus_reg;
>> +	bool			vbus_enabled;
>> +};
>> +
>> +static void qcom_pmic_typec_enable_vbus_regulator(struct qcom_pmic_typec
>> +							*qcom_usb, bool enable)
>> +{
>> +	int ret;
>> +
>> +	if (enable == qcom_usb->vbus_enabled)
>> +		return;
>> +
>> +	if (!qcom_usb->vbus_reg) {
> 
> I don't think this does what you intend it to.
> 
> You call this function during probe, which will attempt to look up the
> dcdc. In the subsequent patches you don't specify usb_vbus-supply, so
> this will successfully return a valid (dummy) regulator and we won't
> enter here again.
> 
> If on the other hand you specify usb_vbus-supply in the DT and this
> driver has not yet probed you will set vbus_reg to NULL and hence retry
> the next time, but you will continue to report the new role regardless.
> 
> So afaict, it's possible to be in host role with vbus disabled (or vice
> versa depending on boot state) until some event would cause this logic
> to trigger again. Which I assume would mean that the user would have to
> disconnect/reconnect the cable.
> 
> So, rather than acquiring usb_vbus lazily here I think you want to do
> this directly in probe and propagate any errors (such as -EPROBE_DEFER)
> to ensure that the DCDC is registered before evaluating check_connection().
> 
>> +		qcom_usb->vbus_reg = devm_regulator_get(qcom_usb->dev,
>> +							"usb_vbus");
>> +		if (IS_ERR(qcom_usb->vbus_reg)) {
>> +			qcom_usb->vbus_reg = NULL;
>> +			return;
>> +		}
>> +	}
>> +
>> +	if (enable) {
>> +		ret = regulator_enable(qcom_usb->vbus_reg);
>> +		if (ret)
>> +			return;
>> +	} else {
>> +		ret = regulator_disable(qcom_usb->vbus_reg);
>> +		if (ret)
>> +			return;
>> +	}
>> +	qcom_usb->vbus_enabled = enable;
>> +}
>> +
>> +static void qcom_pmic_typec_check_connection(struct qcom_pmic_typec *qcom_usb)
>> +{
>> +	enum typec_orientation orientation;
>> +	enum usb_role role;
>> +	unsigned int stat;
>> +	bool enable_vbus;
>> +
>> +	regmap_read(qcom_usb->regmap, qcom_usb->base + TYPEC_MISC_STATUS,
>> +		    &stat);
>> +
>> +	if (stat & CC_ATTACHED) {
>> +		orientation = (stat & CC_ORIENTATION) ?
>> +				TYPEC_ORIENTATION_REVERSE :
>> +				TYPEC_ORIENTATION_NORMAL;
>> +		typec_set_orientation(qcom_usb->port, orientation);
>> +
>> +		role = (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
>> +		if (role == USB_ROLE_HOST)
>> +			enable_vbus = true;
>> +		else
>> +			enable_vbus = false;
>> +	} else {
>> +		role = USB_ROLE_NONE;
>> +		enable_vbus = false;
>> +	}
>> +
>> +	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, enable_vbus);
>> +	usb_role_switch_set_role(qcom_usb->role_sw, role);
>> +}
>> +
>> +static irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
>> +{
>> +	struct qcom_pmic_typec *qcom_usb = _qcom_usb;
>> +
>> +	qcom_pmic_typec_check_connection(qcom_usb);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_usb)
>> +{
>> +	u8 mode = 0;
>> +
>> +	regmap_update_bits(qcom_usb->regmap,
>> +			   qcom_usb->base + TYPEC_INTR_EN_CFG_1,
>> +			   TYPEC_INTR_EN_CFG_1_MASK, 0);
>> +
>> +	if (qcom_usb->cap->type != TYPEC_PORT_DRP)
>> +		mode = (qcom_usb->cap->type == TYPEC_PORT_SNK) ?
> 
> Afaict cap->type can have the values DRP, SNK and SRC. So I think it
> would be cleaner just to do:
> 
> 	if (type == SRC)
> 		mode = EN_SRC_ONLY;
> 	else if (type == SNK)
> 		mode = EN_SNK_ONLY;
> 
> I also think you should pass "type" as a parameter to this function,
> rather than digging it out of qcom_usb->cap (which serves no other
> purpose).
> 
>> +					EN_SNK_ONLY : EN_SRC_ONLY;
>> +	regmap_update_bits(qcom_usb->regmap, qcom_usb->base + TYPEC_MODE_CFG,
>> +			   EN_SNK_ONLY | EN_SRC_ONLY, mode);
>> +
>> +	regmap_update_bits(qcom_usb->regmap,
>> +			   qcom_usb->base + TYPEC_VCONN_CONTROL,
>> +			   VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
>> +	regmap_update_bits(qcom_usb->regmap,
>> +			   qcom_usb->base + TYPEC_EXIT_STATE_CFG,
>> +			   SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
>> +}
>> +
>> +static int qcom_pmic_typec_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct qcom_pmic_typec *qcom_usb;
>> +	struct typec_capability *cap;
>> +	const char *buf;
>> +	int ret, irq, role;
>> +	u32 reg;
>> +
>> +	ret = device_property_read_u32(dev, "reg", &reg);
>> +	if (ret < 0) {
>> +		dev_err(dev, "missing base address\n");
>> +		return ret;
>> +	}
>> +
>> +	qcom_usb = devm_kzalloc(dev, sizeof(*qcom_usb), GFP_KERNEL);
>> +	if (!qcom_usb)
>> +		return -ENOMEM;
>> +
>> +	qcom_usb->dev = dev;
>> +	qcom_usb->base = reg;
>> +
>> +	qcom_usb->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!qcom_usb->regmap) {
>> +		dev_err(dev, "Failed to get regmap\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return -EINVAL;
>> +
>> +	ret = devm_request_threaded_irq(qcom_usb->dev, irq, NULL,
>> +					qcom_pmic_typec_interrupt, IRQF_ONESHOT,
>> +					"qcom-pmic-typec", qcom_usb);
> 
> qcom_usb->port and qcom_usb->role_sw are both dereferenced in the irq
> handler, but not created until later in this function. You need to
> reorder these to make sure the qcom_usb is fully initialized before you
> register the isr.
> 
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Could not request IRQ\n");
>> +		return ret;
>> +	}
>> +
>> +	qcom_usb->fwnode = device_get_named_child_node(dev, "connector");
> 
> I don't see that you need to carry fwnode (and a reference to it) past
> probe. So just keep it on the stack and release it after acquiring the
> two string and the role switcher.
> 
>> +	if (!qcom_usb->fwnode)
>> +		return -EINVAL;
>> +
>> +	cap = devm_kzalloc(dev, sizeof(*cap), GFP_KERNEL);
>> +	if (!cap) {
>> +		ret = -ENOMEM;
>> +		goto err_put_node;
>> +	}
>> +
>> +	ret = fwnode_property_read_string(qcom_usb->fwnode, "power-role", &buf);
>> +	if (!ret) {
>> +		role = typec_find_port_power_role(buf);
>> +		if (role < 0)
>> +			role = TYPEC_PORT_SNK;
>> +	} else {
>> +		role = TYPEC_PORT_SNK;
>> +	}
>> +	cap->type = role;
>> +
>> +	ret = fwnode_property_read_string(qcom_usb->fwnode, "data-role", &buf);
>> +	if (!ret) {
>> +		role = typec_find_port_data_role(buf);
>> +		if (role < 0)
>> +			role = TYPEC_PORT_UFP;
>> +	} else {
>> +		role = TYPEC_PORT_UFP;
>> +	}
>> +	cap->data = role;
>> +
>> +	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
>> +	cap->fwnode = qcom_usb->fwnode;
>> +	qcom_usb->port = typec_register_port(dev, cap);
> 
> cap is cloned in typec_register_port(), which implies that it doesn't
> have to live beyond this function call. So rather than allocating cap on
> the heap I think you should just carry it on the stack.
> 
>> +	if (IS_ERR(qcom_usb->port)) {
>> +		ret = PTR_ERR(qcom_usb->port);
>> +		dev_err(dev, "Failed to register type c port %d\n", ret);
>> +		goto err_put_node;
>> +	}
>> +
>> +	qcom_usb->cap = cap;
> 
> As stated above this seems to only serve the purpose of passing
> cap->type into hw_init() called below, so I don't think you should stash
> it in qcom_usb.
> 
> Regards,
> Bjorn
> 
>> +
>> +	qcom_usb->role_sw = fwnode_usb_role_switch_get(qcom_usb->fwnode);
>> +	if (IS_ERR(qcom_usb->role_sw)) {
>> +		if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to get role switch\n");
>> +		ret = PTR_ERR(qcom_usb->role_sw);
>> +		goto err_typec_port;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, qcom_usb);
>> +	qcom_pmic_typec_typec_hw_init(qcom_usb);
>> +	qcom_pmic_typec_check_connection(qcom_usb);
>> +
>> +	return 0;
>> +
>> +err_typec_port:
>> +	typec_unregister_port(qcom_usb->port);
>> +err_put_node:
>> +	fwnode_handle_put(qcom_usb->fwnode);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_pmic_typec_remove(struct platform_device *pdev)
>> +{
>> +	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
>> +
>> +	usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
>> +	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, 0);
>> +
>> +	typec_unregister_port(qcom_usb->port);
>> +	usb_role_switch_put(qcom_usb->role_sw);
>> +	fwnode_handle_put(qcom_usb->fwnode);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id qcom_pmic_typec_table[] = {
>> +	{ .compatible = "qcom,pm8150b-usb-typec" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
>> +
>> +static struct platform_driver qcom_pmic_typec = {
>> +	.driver = {
>> +		.name = "qcom,pmic-typec",
>> +		.of_match_table = qcom_pmic_typec_table,
>> +	},
>> +	.probe = qcom_pmic_typec_probe,
>> +	.remove = qcom_pmic_typec_remove,
>> +};
>> +module_platform_driver(qcom_pmic_typec);
>> +
>> +MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
