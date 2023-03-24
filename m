Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D80F6C7F70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 15:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjCXOCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 10:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbjCXOB6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 10:01:58 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A741C33D;
        Fri, 24 Mar 2023 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679666459; x=1711202459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UNIswqp/hiRdz1IdtfO1ox7oQ8yEEaV8sg9ndV70Or4=;
  b=kv0Co58tP20drFofHduT0jEpUmxJn2nKhzzXObOpP5KffEiCop4NpU11
   1p8QeGbhx0Lm6XSJvHrZwRfdig7yHHlFQMqdQTU8Dw/d9VsOUdwAQfxoy
   20cfHNwZjvZSSxB4T9Mv+3zdiKv8bIY/I3xhYXikcRYPRIgy5egnKpJbj
   Alp+wxngJa0sozjCFK6VS7jBq0XdjEqJoHfLDOVya/t1biGHHOlY1S64N
   nHWZCD9zfRL5+V5RVTKZf8kCikRV/YwHp0kiRxNJkHPFla0wr/44bzBCE
   bFRSFZb5mvDeUl8Ht4ThFjP3Q31bIF+b9T8L1lNWQqDeQvmwrYFtZID7V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338501881"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="338501881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 07:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826271802"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="826271802"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Mar 2023 07:00:39 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Mar 2023 16:00:38 +0200
Date:   Fri, 24 Mar 2023 16:00:38 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Message-ID: <ZB2tBkUY85yhzm67@kuha.fi.intel.com>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318121828.739424-13-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Sat, Mar 18, 2023 at 12:18:22PM +0000, Bryan O'Donoghue wrote:
> This commit adds a QCOM PMIC TCPM driver with an initial pm8150b
> block.
> 
> qcom_pmic_virt_tcpm.c : Responsible for registering with TCPM and
>                         arbitrates access to the Type-C and PDPHY hardware
>                         blocks in one place.
>                         This driver presents a virtual device to the Linux
>                         TCPM layer.
> 
> qcom_pmic_pdphy.c: Rsponsible for interfacing with the PDPHY hardware and
>                    processing power-delivery related calls from TCPM.
>                    This hardware binding can be extended to facilitate
>                    similar hardware in different PMICs.
> 
> qcom_pmic_typec.c: Responsible for notifying and processing Type-C
>                    related calls from TCPM.
>                    This hardware binding can be extended to facilitate
>                    similar hardware in different PMICs.

I'm sorry I never asked this before, but is that virtual device really
necessary? Couldn't you just merge that qcom_omic_virt_tcpm.c into
qcom_pmic_typec.c?

<snip>

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c
> new file mode 100644
> index 0000000000000..91544b4b59439
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_virt_tcpm.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, Linaro Ltd. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/usb/role.h>
> +#include <linux/usb/tcpm.h>
> +#include <linux/usb/typec_mux.h>
> +#include "qcom_pmic_pdphy.h"
> +#include "qcom_pmic_typec.h"
> +
> +struct pmic_virt_tcpm {
> +	struct device		*dev;
> +	struct pmic_typec	*pmic_typec;
> +	struct pmic_pdphy	*pmic_pdphy;
> +	struct tcpm_port	*tcpm_port;
> +	struct tcpc_dev		tcpc;
> +	bool			vbus_enabled;
> +	struct mutex		lock;		/* VBUS state serialization */
> +};
> +
> +#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_virt_tcpm, tcpc)
> +
> +static int qcom_pmic_virt_tcpm_get_vbus(struct tcpc_dev *tcpc)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +	int ret;
> +
> +	mutex_lock(&tcpm->lock);
> +	ret = tcpm->vbus_enabled || qcom_pmic_typec_get_vbus(tcpm->pmic_typec);
> +	mutex_unlock(&tcpm->lock);
> +
> +	return ret;
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_vbus(struct tcpc_dev *tcpc, bool on,
> +					bool sink)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +	int ret = 0;
> +
> +	mutex_lock(&tcpm->lock);
> +	if (tcpm->vbus_enabled == on)
> +		goto done;
> +
> +	ret = qcom_pmic_typec_set_vbus(tcpm->pmic_typec, on);
> +	if (ret)
> +		goto done;
> +
> +	tcpm->vbus_enabled = on;
> +	tcpm_vbus_change(tcpm->tcpm_port);
> +
> +done:
> +	dev_dbg(tcpm->dev, "set_vbus set: %d result %d\n", on, ret);
> +	mutex_unlock(&tcpm->lock);
> +
> +	return ret;
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_vconn(struct tcpc_dev *tcpc, bool on)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_typec_set_vconn(tcpm->pmic_typec, on);
> +}
> +
> +static int qcom_pmic_virt_tcpm_get_cc(struct tcpc_dev *tcpc,
> +				      enum typec_cc_status *cc1,
> +				      enum typec_cc_status *cc2)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_typec_get_cc(tcpm->pmic_typec, cc1, cc2);
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_cc(struct tcpc_dev *tcpc,
> +				      enum typec_cc_status cc)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_typec_set_cc(tcpm->pmic_typec, cc);
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_polarity(struct tcpc_dev *tcpc,
> +					    enum typec_cc_polarity pol)
> +{
> +	/* Polarity is set separately by phy-qcom-qmp.c */
> +	return 0;
> +}
> +
> +static int qcom_pmic_virt_tcpm_start_toggling(struct tcpc_dev *tcpc,
> +					      enum typec_port_type port_type,
> +					      enum typec_cc_status cc)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_typec_start_toggling(tcpm->pmic_typec, port_type, cc);
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_roles(struct tcpc_dev *tcpc, bool attached,
> +					 enum typec_role power_role,
> +					 enum typec_data_role data_role)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_pdphy_set_roles(tcpm->pmic_pdphy, data_role,
> +					 power_role);
> +}
> +
> +static int qcom_pmic_virt_tcpm_set_pd_rx(struct tcpc_dev *tcpc, bool on)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_pdphy_set_pd_rx(tcpm->pmic_pdphy, on);
> +}
> +
> +static int qcom_pmic_virt_tcpm_pd_transmit(struct tcpc_dev *tcpc,
> +					   enum tcpm_transmit_type type,
> +					   const struct pd_message *msg,
> +					   unsigned int negotiated_rev)
> +{
> +	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
> +
> +	return qcom_pmic_pdphy_pd_transmit(tcpm->pmic_pdphy, type, msg,
> +					   negotiated_rev);
> +}

So this driver is clearly the aggregate, and the typec device and the
pdphy device are the components. Have you considered the component
framework (drivers/base/component.c)?

I think you could use it to simplify these drivers a bit. You probable
would not need to expose all those functions in each driver separately
like you do now, and the above functions you would not need at all.
Instead you could just share (in this case) instance of your struct
pmic_virt_tcpm with the components when they are bind and just expect
them to fill the tcpm callbacks that they are responsible of.

You also would not need to rely on things like probe deferring,
because when the aggregate is bind you are guaranteed that all the
components in it are ready. There are probable some other benefits in
it as well.

This is not a must, but I think worth taking a look.

> +static struct platform_device
> +*qcom_pmic_virt_tcpm_get_pdev(struct device *dev, const char *property_name)
> +{
> +	struct device_node *np;
> +	struct platform_device *pdev;
> +	const __be32 *prop;
> +
> +	prop = of_get_property(dev->of_node, property_name, NULL);
> +	if (!prop) {
> +		dev_err(dev, "required '%s' property missing\n", property_name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	np = of_find_node_by_phandle(be32_to_cpup(prop));
> +	if (!np) {
> +		dev_err(dev, "could not find '%s' node\n", property_name);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +
> +	if (pdev)
> +		return pdev;
> +
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static int qcom_pmic_virt_tcpm_init(struct tcpc_dev *tcpc)
> +{
> +	return 0;
> +}
> +
> +static int qcom_pmic_virt_tcpm_probe(struct platform_device *pdev)
> +{
> +	struct pmic_virt_tcpm *tcpm;
> +	struct device *dev = &pdev->dev;
> +	struct platform_device *typec_pdev;
> +	struct platform_device *pdphy_pdev;
> +	int ret;
> +
> +	tcpm = devm_kzalloc(dev, sizeof(*tcpm), GFP_KERNEL);
> +	if (!tcpm)
> +		return -ENOMEM;
> +
> +	tcpm->dev = dev;
> +	tcpm->tcpc.init = qcom_pmic_virt_tcpm_init;
> +	tcpm->tcpc.get_vbus = qcom_pmic_virt_tcpm_get_vbus;
> +	tcpm->tcpc.set_vbus = qcom_pmic_virt_tcpm_set_vbus;
> +	tcpm->tcpc.set_cc = qcom_pmic_virt_tcpm_set_cc;
> +	tcpm->tcpc.get_cc = qcom_pmic_virt_tcpm_get_cc;
> +	tcpm->tcpc.set_polarity = qcom_pmic_virt_tcpm_set_polarity;
> +	tcpm->tcpc.set_vconn = qcom_pmic_virt_tcpm_set_vconn;
> +	tcpm->tcpc.start_toggling = qcom_pmic_virt_tcpm_start_toggling;
> +	tcpm->tcpc.set_pd_rx = qcom_pmic_virt_tcpm_set_pd_rx;
> +	tcpm->tcpc.set_roles = qcom_pmic_virt_tcpm_set_roles;
> +	tcpm->tcpc.pd_transmit = qcom_pmic_virt_tcpm_pd_transmit;
> +
> +	mutex_init(&tcpm->lock);
> +	platform_set_drvdata(pdev, tcpm);
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "Populating child devices fail\n");
> +		return ret;
> +	};
> +
> +	typec_pdev = qcom_pmic_virt_tcpm_get_pdev(dev, "qcom,pmic-typec");
> +	if (IS_ERR(typec_pdev)) {
> +		dev_err(dev, "Error linking typec endpoint\n");
> +		return PTR_ERR(typec_pdev);
> +	}
> +
> +	tcpm->pmic_typec = platform_get_drvdata(typec_pdev);
> +	if (!tcpm->pmic_typec) {
> +		ret = -EPROBE_DEFER;
> +		goto put_typec_pdev;
> +	}
> +
> +	pdphy_pdev = qcom_pmic_virt_tcpm_get_pdev(dev, "qcom,pmic-pdphy");
> +	if (IS_ERR(pdphy_pdev)) {
> +		dev_err(dev, "Error linking pdphy endpoint\n");
> +		ret = PTR_ERR(pdphy_pdev);
> +		goto put_typec_pdev;
> +	}
> +
> +	tcpm->pmic_pdphy = platform_get_drvdata(pdphy_pdev);
> +	if (!tcpm->pmic_pdphy) {
> +		ret = -EPROBE_DEFER;
> +		goto put_pdphy_dev;
> +	}
> +
> +	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> +	if (IS_ERR(tcpm->tcpc.fwnode))
> +		return PTR_ERR(tcpm->tcpc.fwnode);
> +
> +	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
> +	if (IS_ERR(tcpm->tcpm_port)) {
> +		ret = PTR_ERR(tcpm->tcpm_port);
> +		goto fwnode_remove;
> +	}
> +
> +	ret = qcom_pmic_pdphy_init(tcpm->pmic_pdphy, tcpm->tcpm_port);
> +	if (ret)
> +		goto fwnode_remove;
> +
> +	ret = qcom_pmic_typec_init(tcpm->pmic_typec, tcpm->tcpm_port);
> +	if (ret)
> +		goto fwnode_remove;
> +
> +	return 0;
> +
> +fwnode_remove:
> +	fwnode_remove_software_node(tcpm->tcpc.fwnode);
> +
> +put_pdphy_dev:
> +	put_device(&pdphy_pdev->dev);
> +
> +put_typec_pdev:
> +	put_device(&typec_pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int qcom_pmic_virt_tcpm_remove(struct platform_device *pdev)
> +{
> +	struct pmic_virt_tcpm *tcpm = platform_get_drvdata(pdev);
> +
> +	tcpm_unregister_port(tcpm->tcpm_port);
> +	fwnode_remove_software_node(tcpm->tcpc.fwnode);
> +	qcom_pmic_pdphy_put(tcpm->pmic_pdphy);
> +	qcom_pmic_typec_put(tcpm->pmic_typec);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_pmic_virt_tcpm_table[] = {
> +	{ .compatible = "qcom,pmic-virt-tcpm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_pmic_virt_tcpm_table);
> +
> +static struct platform_driver qcom_pmic_virt_tcpm_platform_driver = {
> +	.driver = {
> +		.name = "qcom,pmic-tcpm",
> +		.of_match_table = qcom_pmic_virt_tcpm_table,
> +	},
> +	.probe = qcom_pmic_virt_tcpm_probe,
> +	.remove = qcom_pmic_virt_tcpm_remove,
> +};
> +
> +static int __init qcom_pmic_virt_tcpm_module_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&qcom_pmic_typec_platform_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&qcom_pmic_pdphy_platform_driver);
> +	if (ret)
> +		goto unregister_typec;
> +
> +	ret = platform_driver_register(&qcom_pmic_virt_tcpm_platform_driver);
> +	if (ret)
> +		goto unregister_pdphy;
> +
> +	return 0;

Why not just register each driver in their own init function?

thanks,

-- 
heikki
