Return-Path: <linux-arm-msm+bounces-28346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CB94F8E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 23:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66BFD1C21B11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 21:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6959E194083;
	Mon, 12 Aug 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjRHXr/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE779CD;
	Mon, 12 Aug 2024 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723497702; cv=none; b=nkaiHOmG0Av0sGzneIpSNPglHKCbM7XXFV8e+IZK4eu3rA7qSDMsi9d/BMTvvcxcXCP/7JncGC7pnXa8KjQspem1sjHoRo9fTY2o1bqMOKlT6ecMP5SwGbiNQY2NXO+Mcu75nCuX5eE7TMFw9Sjc4HYqt6G8UbM8YiuFiWmGCWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723497702; c=relaxed/simple;
	bh=LkeYSAIwCAF2MHHDFNf/b+2giJnhON8jEgoreJWpqd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJP0ZjfIDXMzs2uQrzaS6yJHauUWB5DA5WFtjBXI8FwKSl93oyt+fau+jtLluL7viFDtEUvUvEBMvgVnsL/pku04bssGvyb0Z6HzTakrIzZaGrrrxn07Q9yZ627k5gjRqcgwBBQEOsM17z9Kn9+uoobwQonuAwIKCFMz0g1Eo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjRHXr/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDBCC32782;
	Mon, 12 Aug 2024 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723497701;
	bh=LkeYSAIwCAF2MHHDFNf/b+2giJnhON8jEgoreJWpqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjRHXr/X4ykOc4FJhMv0lItS5J0wsAOYqB0+Kp3mqBWOMCtwIewPv1bxohNSKuVOX
	 hevDeWc9uuC+lix2LktHbUUnwt0LK6rkKs/E4CSH87ZX71vZCoOVyEIY+Q9zlqrFAK
	 J7o9QWNXK/6fUQiHKyuiJnhWIomq4XHWcDPPhPWfPdSNrgcvk4reRH3QFgYfh0vbIo
	 ZH9GyfcXJHr0WhE694FJFOtBJsSQfdGjf5pwlhQJm5FP6Qcc1a/QUtR/kbfeIZvaY9
	 m/1eg9q8BcmcC8OD+KrK+PLLwuiU407gLWMkGkSppWz8evsuNQ1QAf//cQWJrWDiT2
	 GqMPTvmbPH0Ew==
Date: Mon, 12 Aug 2024 15:21:39 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <20240812212139.GA1797954-robh@kernel.org>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>

On Sun, Aug 11, 2024 at 08:12:03PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> Even with these checks, there are no way to fully protect ourselves from
> the race conditions that occur if the DWC3 is unbound.
> 
> Missing from the upstream Qualcomm USB support is handling of role
> switching, in which the glue needs to be notified upon DRD mode changes.
> Several attempts has been made through the years to register callbacks
> etc, but they always fall short when it comes to handling of the core's
> probe deferral on resources etc.
> 
> Moving to a model where the DWC3 core is instantiated in a synchronous
> fashion avoids above described race conditions.
> 
> It is however not feasible to do so without also flattening the
> DeviceTree binding, as assumptions are made in the DWC3 core and
> frameworks used that the device's associated of_node will the that of
> the core. Furthermore, the DeviceTree binding is a direct
> representation of the Linux driver model, and doesn't necessarily
> describe "the USB IP-block".
> 
> The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
> operate the DWC3 within the one device context, in synchronous fashion.
> 
> To handle backwards compatibility, and to remove the two-device model,
> of_nodes of the old compatible are converted to the new one, early
> during probe.
> 
> This happens in the event that a DWC3 core child node is present, the
> content of the reg and interrupt properties of this node are merged into
> the shared properties, all remaining properties are copied and the core
> node is dropped. Effectively transitioning the node from qcom,dwc3 to
> qcom,snps-dwc3.

In the past we've done this old binding to new binding with an overlay 
embedded in the kernel. The overlay would just be the .dts change you've 
made (we should have a tool that takes 2 DTs and generates an overlay as 
the diff). I suppose it's a few platforms here, but then it is just data 
and easily deleted when no longer needed (I think the cases I'm 
remembering did just that because they are gone now. It was TI display 
and Renesas media stuff IIRC). 


> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 251 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 33de03f2d782..27b5013cd411 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/irq.h>
>  #include <linux/of_clk.h>
> @@ -13,6 +14,8 @@
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>
>  #include <linux/interconnect.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

Not a good sign when these are needed...

>  #include <linux/of_platform.h>

Probably don't need this one.

>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -22,6 +25,7 @@
>  #include <linux/usb/hcd.h>
>  #include <linux/usb.h>
>  #include "core.h"
> +#include "glue.h"
>  
>  /* USB QSCRATCH Hardware registers */
>  #define QSCRATCH_HS_PHY_CTRL			0x10
> @@ -72,7 +76,7 @@ struct dwc3_qcom_port {
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> -	struct platform_device	*dwc3;
> +	struct dwc3		*dwc;
>  	struct clk		**clks;
>  	int			num_clocks;
>  	struct reset_control	*resets;
> @@ -259,7 +263,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  		goto put_path_ddr;
>  	}
>  
> -	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
> +	max_speed = usb_get_maximum_speed(qcom->dwc->dev);
>  	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
>  		ret = icc_set_bw(qcom->icc_path_ddr,
>  				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> @@ -302,25 +306,16 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>  /* Only usable in contexts where the role can not change. */
>  static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>  {
> -	struct dwc3 *dwc;
> -
> -	/*
> -	 * FIXME: Fix this layering violation.
> -	 */
> -	dwc = platform_get_drvdata(qcom->dwc3);
> -
> -	/* Core driver may not have probed yet. */
> -	if (!dwc)
> -		return false;
> +	struct dwc3 *dwc = qcom->dwc;
>  
>  	return dwc->xhci;
>  }
>  
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>  {
> -	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  	struct usb_device *udev;
>  	struct usb_hcd __maybe_unused *hcd;
> +	struct dwc3 *dwc = qcom->dwc;
>  
>  	/*
>  	 * FIXME: Fix this layering violation.
> @@ -497,7 +492,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> -	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
> +	struct dwc3 *dwc = qcom->dwc;
>  
>  	/* If pm_suspended then let pm_resume take care of resuming h/w */
>  	if (qcom->pm_suspended)
> @@ -699,34 +694,198 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
> +static struct property *dwc3_qcom_legacy_prop_concat(const char *name,
> +						     const void *a, size_t a_len,
> +						     const void *b, size_t b_len)
>  {
> -	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> -	struct device		*dev = &pdev->dev;
> -	int			ret;
> +	size_t len = a_len + b_len;
>  
> -	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
> -	if (!dwc3_np) {
> -		dev_err(dev, "failed to find dwc3 core child\n");
> -		return -ENODEV;
> -	}
> +	struct property *prop __free(kfree) = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	char *prop_name __free(kfree) = kstrdup(name, GFP_KERNEL);
> +	void *value __free(kfree) = kzalloc(len, GFP_KERNEL);
> +	if (!prop || !prop_name || !value)
> +		return NULL;
>  
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> -	if (ret) {
> -		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> -		goto node_put;
> +	prop->name = no_free_ptr(prop_name);
> +	prop->value = no_free_ptr(value);
> +	prop->length = len;

We're trying to make struct property opaque or even internal to DT core. 
Exposing it leaks pointers and then we can't ever free things. This is 
not helping. The changeset API avoids mucking with struct property.

> +
> +	memcpy(prop->value, a, a_len);
> +	memcpy(prop->value + a_len, b, b_len);
> +
> +	return_ptr(prop);
> +}
> +
> +/* Replace reg property with base address from dwc3 node and fixed length */
> +static int dwc3_qcom_legacy_update_reg(struct device_node *qcom,
> +				       struct device_node *dwc3)
> +{
> +	int addr_cells;
> +	int size_cells;
> +	u64 dwc3_addr;
> +	int ret;
> +
> +	ret = of_property_read_reg(dwc3, 0, &dwc3_addr, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	addr_cells = of_n_addr_cells(qcom);
> +	size_cells = of_n_addr_cells(qcom);
> +
> +	__be32 *reg __free(kfree) = kcalloc(addr_cells + size_cells, sizeof(__be32), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	reg[addr_cells - 1] = cpu_to_be32(dwc3_addr);

Assuming dwc3_addr fits in 32-bit or that the upper 32-bits matches?

> +	reg[addr_cells + size_cells - 1] = cpu_to_be32(SDM845_QSCRATCH_BASE_OFFSET + SDM845_QSCRATCH_SIZE);
> +
> +	struct property *prop __free(kfree)  = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	char *name __free(kfree) = kstrdup("reg", GFP_KERNEL);
> +	if (!prop || !name)
> +		return -ENOMEM;
> +
> +	prop->name = no_free_ptr(name);
> +	prop->value = no_free_ptr(reg);
> +	prop->length = (addr_cells + size_cells) * sizeof(__be32);
> +
> +	return of_update_property(qcom, no_free_ptr(prop));
> +}
> +
> +/* Prepend dwc_usb3 interrupt to relevant interrupt properties */
> +static int dwc3_qcom_legacy_convert_interrupts(struct device_node *qcom,
> +					       struct property *dwc3_irq)
> +{
> +	const __be32 *interrupts;
> +	struct property *new;
> +	const void *names;
> +	int interrupts_len;
> +	int names_len;
> +	int ret;
> +
> +	if ((interrupts = of_get_property(qcom, "interrupts-extended", &interrupts_len)) != NULL) {
> +		struct device_node *parent __free(device_node) = of_irq_find_parent(qcom);
> +		if (!parent)
> +			return -EINVAL;
> +
> +		__be32 *value __free(kfree) = kzalloc(sizeof(__be32) + dwc3_irq->length, GFP_KERNEL);
> +		if (!value)
> +			return -ENOMEM;
> +		value[0] = cpu_to_be32(parent->phandle);
> +		memcpy(&value[1], dwc3_irq->value, dwc3_irq->length);
> +
> +		new = dwc3_qcom_legacy_prop_concat("interrupts-extended",
> +						   value, sizeof(__be32) + dwc3_irq->length,
> +						   interrupts, interrupts_len);
> +	} else if ((interrupts = of_get_property(qcom, "interrupts", &interrupts_len)) != NULL) {
> +		new = dwc3_qcom_legacy_prop_concat("interrupts",
> +						   dwc3_irq->value, dwc3_irq->length,
> +						   interrupts, interrupts_len);
> +	} else {
> +		return -EINVAL;
>  	}
>  
> -	qcom->dwc3 = of_find_device_by_node(dwc3_np);
> -	if (!qcom->dwc3) {
> -		ret = -ENODEV;
> -		dev_err(dev, "failed to get dwc3 platform device\n");
> -		of_platform_depopulate(dev);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	ret = of_update_property(qcom, new);
> +	if (ret < 0)
> +		return ret;
> +
> +	names = of_get_property(qcom, "interrupt-names", &names_len);
> +	if (!names)
> +		return -EINVAL;
> +
> +	new = dwc3_qcom_legacy_prop_concat("interrupt-names",
> +					   "dwc_usb3", strlen("dwc_usb3") + 1,
> +					   names, names_len);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	return of_update_property(qcom, new);
> +}
> +
> +/* Copy property to qcom node */
> +static int dwc3_qcom_legacy_migrate_prop(struct device_node *qcom,
> +					 struct property *prop)
> +{
> +	struct property *new __free(kfree) = kzalloc(sizeof(*new), GFP_KERNEL);
> +	char *name __free(kfree) = kstrdup(prop->name, GFP_KERNEL);
> +	void *value __free(kfree) = kmemdup(prop->value, prop->length, GFP_KERNEL);
> +
> +	if (!new || !name || !value)
> +		return -ENOMEM;
> +
> +	new->name = no_free_ptr(name);
> +	new->value = no_free_ptr(value);
> +	new->length = prop->length;
> +
> +	return of_update_property(qcom, no_free_ptr(new));
> +}
> +
> +/* Move a child node, with it's properties and children, from dwc3 to qcom node */
> +static int dwc3_qcom_legacy_migrate_child(struct device_node *qcom,
> +					  struct device_node *dwc3,
> +					  const char *name)
> +{
> +	struct device_node *child;
> +
> +	child = of_get_child_by_name(dwc3, name);
> +	if (!child)
> +		return 0;
> +
> +	of_detach_node(child);
> +	child->parent = qcom;
> +	of_attach_node(child);
> +	of_node_put(child);
> +
> +	return 0;
> +}
> +
> +/* Convert dev's DeviceTree representation from qcom,dwc3 to qcom,snps-dwc3 binding */
> +static int dwc3_qcom_convert_legacy_dt(struct device *dev)
> +{
> +	struct device_node *qcom = dev->of_node;
> +	struct device_node *dwc3;
> +	struct property *prop;
> +	int ret = 0;
> +
> +	dwc3 = of_get_compatible_child(qcom, "snps,dwc3");
> +	if (!dwc3)
> +		return 0;
> +
> +	/* We have a child node, but no support for dynamic OF */
> +	if (!IS_ENABLED(CONFIG_OF_DYNAMIC))
> +		return -EINVAL;
> +
> +	for_each_property_of_node(dwc3, prop) {
> +		if (!strcmp(prop->name, "compatible"))
> +			;
> +		else if (!strcmp(prop->name, "reg"))
> +			ret = dwc3_qcom_legacy_update_reg(qcom, dwc3);
> +		else if (!strcmp(prop->name, "interrupts"))
> +			ret = dwc3_qcom_legacy_convert_interrupts(qcom, prop);
> +		else
> +			ret = dwc3_qcom_legacy_migrate_prop(qcom, prop);
>  	}
>  
> -node_put:
> -	of_node_put(dwc3_np);
> +	if (ret < 0)
> +		goto err_node_put;
> +
> +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "port");
> +	if (ret)
> +		goto err_node_put;
> +
> +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "ports");
> +	if (ret)
> +		goto err_node_put;
> +
> +	of_detach_node(dwc3);
> +	of_node_put(dwc3);
>  
> +	return 0;
> +
> +err_node_put:
> +	of_node_put(dwc3);
>  	return ret;
>  }
>  
> @@ -735,16 +894,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct device_node	*np = pdev->dev.of_node;
>  	struct device		*dev = &pdev->dev;
>  	struct dwc3_qcom	*qcom;
> -	struct resource		*res;
> +	struct resource		res;
>  	int			ret, i;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
>  
> +	ret = dwc3_qcom_convert_legacy_dt(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to convert legacy OF node\n");
> +		return ret;
> +	}
> +
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, qcom);
>  	qcom->dev = &pdev->dev;
>  
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
> @@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto reset_assert;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ret = of_address_to_resource(np, 0, &res);

So we just leave the platform device resources stale? The right solution 
is probably to make platform_get_resource() work on demand. That's what 
we did for IRQ resources years ago (since those had irqchip driver 
dependencies).

Rob


