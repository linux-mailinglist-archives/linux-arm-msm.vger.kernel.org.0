Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7F940F78E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 14:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244130AbhIQMey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 08:34:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:34259 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244125AbhIQMex (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 08:34:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202947870"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="diff'?scan'208";a="202947870"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 05:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="diff'?scan'208";a="611263596"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 17 Sep 2021 05:33:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 17 Sep 2021 15:33:26 +0300
Date:   Fri, 17 Sep 2021 15:33:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YUSLFlwXr/8GmCZz@kuha.fi.intel.com>
References: <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
 <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
 <YSaizDpqNRZcBGIc@ripper>
 <87ilzsafu5.fsf@kernel.org>
 <YUH639jO4qf4Za/K@yoga>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7Vca4YRw49XGD39T"
Content-Disposition: inline
In-Reply-To: <YUH639jO4qf4Za/K@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--7Vca4YRw49XGD39T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 15, 2021 at 08:53:35AM -0500, Bjorn Andersson wrote:
> On Thu 26 Aug 01:15 CDT 2021, Felipe Balbi wrote:
> 
> > 
> > Hi,
> > 
> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> > > On Wed 25 Aug 10:59 PDT 2021, Bryan O'Donoghue wrote:
> > >
> > >> On 25/08/2021 16:53, Bjorn Andersson wrote:
> > >> > But in the case of Type-C altmode several of our boards have either an
> > >> > external gpio-based SBU-pin-swapper or some redriver on I2C with this
> > >> > functionality, so we need a way to tell both the PHY and this external
> > >> > contraption about the orientation.
> > >> 
> > >> Its a very similar problem to orientation switch
> > >> 
> > >> As an example
> > >> 
> > >> - redriver may need to fix up signal integrity for
> > >>   lane switching
> > >> 
> > >> - PHY needs to toggle lanes from one IP block to another
> > >> 
> > >
> > > Right, conceptually the problem is similar, but IMHO there's a big
> > > difference in that the redriver and PHY are two physically separate
> > > entities - on different buses. The dwc3 glue and core represent the same
> > > piece of hardware.
> > 
> > no they don't. The glue is a real piece of HW that adapts the "generic"
> > synopsys IP to a given SoC. OMAP, for example, was adapting Synopsys'
> > proprietary interface to the Sonics interconnect, while some others may
> > adapt it to AXI or PCI or whatever.
> > 
> > They are different HW blocks, the glue (in many cases) has its own IRQ,
> > its own address space, its own register file, and so on. Granted, the
> > glue also serves as an access port from CPU to the synopsys core, but
> > that's handled by `ranges' DT property.
> > 
> 
> So what you're saying is that the "Qualcomm glue" is the hardware, and
> the core is just the basis for that design?
> 
> Regardless, on the Qualcomm platforms we have need to inform both
> devices about role changes, how do we do this? (Without platform_data
> and preferably without having to duplicate the typec code in the glue
> and core and the two device nodes in DT)

That part can be handled by simply adding the notifiers to the USB
role switch class as said before [1], so I think the actual problem
here is that your glue layer depends on core that your glue creates
(or a resource that the core driver creates).

I think the dependency on dwc3 core, and what ever it creates, issue
you should be able to solve by using the component framework. I'll
attach you a patch showing how it should probable look like (not even
compile tested).

So the dwc3 core is the aggregate driver and the glue is the only
component in that example (that should be enough for your needs), but
it should not be any problem to later register also the child devices
(xHCI, USB role switch, etc.) as components if needed.

[1] https://lore.kernel.org/linux-usb/20191002231617.3670-3-john.stultz@linaro.org/

thanks,

-- 
heikki

--7Vca4YRw49XGD39T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dwc3.diff"

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0104a80b185e1..7cc49611af74f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -26,6 +26,7 @@
 #include <linux/acpi.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
+#include <linux/component.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -1521,11 +1522,32 @@ static void dwc3_check_params(struct dwc3 *dwc)
 	}
 }
 
+static int dwc3_aggregate_bind(struct device *dev)
+{
+	return component_bind_all(dev, NULL);
+}
+
+static void dwc3_aggregate_unbind(struct device *dev)
+{
+	component_unbind_all(dev, NULL);
+}
+
+static const struct component_master_ops dwc3_aggregate_ops = {
+	.bind = dwc3_aggregate_bind,
+	.unbind = dwc3_aggregate_unbind,
+};
+
+static int dwc3_compare(struct device *dev, void *data)
+{
+	return dev == data;
+}
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
 	struct resource		*res, dwc_res;
 	struct dwc3		*dwc;
+	struct component_match	*match = NULL;
 
 	int			ret;
 
@@ -1646,10 +1668,21 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err5;
 
+	/* Add component match entry for the glue. */
+	component_match_add(dwc->dev, &match, dwc3_compare, dwc->dev->parent);
+
+	/* Everything is ready now. Declare this driver as the aggregate. */
+	ret = component_master_add_with_match(dwc->dev, &dwc3_aggregate_ops, match);
+	if (ret)
+		goto err6;
+
 	pm_runtime_put(dev);
 
 	return 0;
 
+err6:
+	dwc3_core_exit_mode(dwc);
+
 err5:
 	dwc3_debugfs_exit(dwc);
 	dwc3_event_buffers_cleanup(dwc);
@@ -1696,6 +1729,8 @@ static int dwc3_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
+	component_master_del(dwc->dev, &dwc3_aggregate_ops);
+
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01028c5f..ffe585344d6a8 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -20,6 +20,8 @@
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/role.h>
+#include <linux/component.h>
 
 #include "core.h"
 
@@ -81,6 +83,7 @@ struct dwc3_qcom {
 	struct extcon_dev	*host_edev;
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
+	struct notifier_block	role_nb;
 
 	const struct dwc3_acpi_pdata *acpi_pdata;
 
@@ -717,6 +720,51 @@ dwc3_qcom_create_urs_usb_platdev(struct device *dev)
 	return acpi_create_platform_device(adev, NULL);
 }
 
+static int dwc3_qcom_role_notifier(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, role_nb);
+
+	/* Do what ever you need to do... */
+
+	return NOTIFY_DONE;
+}
+
+static int dwc3_qcom_bind(struct device *dev, struct device *dwc, void *data)
+{
+	struct usb_role_switch *sw = usb_role_switch_find_by_fwnode(dev_fwnode(dwc));
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+
+	/*
+	 * Time to finalize initilization.
+	 *
+	 * Our aggregate driver - dwc3 core - is guaranteed to be ready when
+	 * this is called. That means USB role switch "sw" is also now ready.
+	 */
+
+	/* Register role switch notifier */
+	qcom->role_nb.notifier_call = dwc3_qcom_role_notifier;
+	usb_role_switch_register_notifier(sw, qcom->role_nb);
+	usb_role_switch_put(sw);
+
+	return 0;
+}
+
+static void dwc3_qcom_unbind(struct device *dev, struct device *dwc, void *data)
+{
+	struct usb_role_switch *sw = usb_role_switch_find_by_fwnode(dev_fwnode(dwc));
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+
+	/* Unregister role switch notifier */
+	usb_role_switch_unregister_notifier(sw, qcom->role_nb);
+	usb_role_switch_put(sw);
+}
+
+static const struct component_ops dwc3_qcom_component_ops = {
+	.bind = dwc3_qcom_bind,
+	.unbind = dwc3_qcom_unbind,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -837,6 +885,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto interconnect_exit;
 
+	ret = component_add(dev, &dwc3_qcom_component_ops);
+	if (ret)
+		goto interconnect_exit;
+
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
 	pm_runtime_set_active(dev);
@@ -869,6 +921,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
+	component_del(dev, &dwc3_qcom_component_ops);
 	device_remove_software_node(&qcom->dwc3->dev);
 	of_platform_depopulate(dev);
 

--7Vca4YRw49XGD39T--
