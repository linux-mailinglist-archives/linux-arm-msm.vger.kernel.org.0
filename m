Return-Path: <linux-arm-msm+bounces-100812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FoeNr2Gymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:20:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8BF35CB85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838B6308C5C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8AF3D88F2;
	Mon, 30 Mar 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDAt8lEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319A3D812F;
	Mon, 30 Mar 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879913; cv=none; b=Vh3KXbDl+Y4qjqwCNokOI+AcaM3Y4vAmmXx+IvLGOPocAByyflhEAhdPe6W6Pbu9X0WvBnz3RxL0cqcWFQyEeNqg5YDVpApsJPwEZb8IXIKk4XlJIo+Aii3TJhvMV2j/XaF4HRGozoQ1UtThcUycZ8THGpgWsDUitXoMut4qUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879913; c=relaxed/simple;
	bh=DdQfCmhPcUWi4bQ8s7+gQ5IL7AJEcy9oRAld1arG6U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmHXnSt6YpZdPIleCe2YhDvkZNxJJRDxxtybh+ImIhEcjB5A97wtUgvSlBkU8TN5/3P3izgvh8ajHt6Lx8TRL0VDk6szj054Ks09E9RTVK11E6mA0rWgmNWJT7YzoYgiRSXcPRqk14jshMD9uOK8L+MW5SFV8RylKFCc5dfW6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDAt8lEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997D0C4CEF7;
	Mon, 30 Mar 2026 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879912;
	bh=DdQfCmhPcUWi4bQ8s7+gQ5IL7AJEcy9oRAld1arG6U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDAt8lEaKCHubTHv1LK8oz7CcnX9RLlllngxacLZev5a0CFanfUe3y98xd6scqxBU
	 XTlXvlgxIT49cowVEo5l9mL74sN5FH/EIjrIKa0CoTCchf/8zW2lieueu8JEguBX4c
	 +7hSHTUe72VqdkkDR/skJZUkMBKg+tm5HPbEhGiTUCFtUU7jPn54Kghn0Vwdea+Use
	 Qw+HHr5CQAPtA9gjsTcMvmrg6W/LfZiGXxCnccMG6zjCwEiqLypfs5362+zUGzB4ZT
	 7NjqQnQwzveOomZMgFzbobQl07CDimRdaAjUG4BWXl6isb1va+tNYneC3BQbdUmaM/
	 MvRMbJ2Xjb/bw==
Date: Mon, 30 Mar 2026 09:11:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <acqEc_urKggA5s62@baldur>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100812-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 2C8BF35CB85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 11:16:31AM +0530, Pavankumar Kondeti wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. Device registration is done in the QCOM SCM driver after
> checks to restrict the watchdog initialization to Qualcomm devices
> running under Gunyah.
> 
> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> hypervisor interface provided by the Gunyah hypervisor. The design
> involving QCOM SCM driver for registering the platform device has been
> devised to avoid adding non-hardware nodes to devicetree.
> 
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>

Guenter, there's no build-time dependency between the two patches. I'm
applying patch 1 through the qcom tree, please apply this patch through
the watchdog tree.

Regards,
Bjorn

> ---
>  MAINTAINERS                   |   1 +
>  drivers/watchdog/Kconfig      |  13 +++
>  drivers/watchdog/Makefile     |   1 +
>  drivers/watchdog/gunyah_wdt.c | 261 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 276 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77fdfcb55f06..842306623b1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3325,6 +3325,7 @@ F:	arch/arm64/boot/dts/qcom/
>  F:	drivers/bus/qcom*
>  F:	drivers/firmware/qcom/
>  F:	drivers/soc/qcom/
> +F:	drivers/watchdog/gunyah_wdt.c
>  F:	include/dt-bindings/arm/qcom,ids.h
>  F:	include/dt-bindings/firmware/qcom,scm.h
>  F:	include/dt-bindings/soc/qcom*
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5..5f1dfb6ac41b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2354,4 +2354,17 @@ config KEEMBAY_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called keembay_wdt.
>  
> +config GUNYAH_WATCHDOG
> +	tristate "Qualcomm Gunyah Watchdog"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on HAVE_ARM_SMCCC
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for watchdog timer provided by the
> +	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
> +	  to interact with Gunyah Watchdog.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gunyah_wdt.
> +
>  endif # WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index d2fb16b9f9ce..4d1547702ef0 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>  obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>  obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>  obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
> new file mode 100644
> index 000000000000..49dfef459e84
> --- /dev/null
> +++ b/drivers/watchdog/gunyah_wdt.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
> +
> +/* SMCCC function IDs for watchdog operations */
> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
> +#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
> +
> +/*
> + * Control values for GUNYAH_WDT_CONTROL.
> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
> + * then the watchdog is enabled and vice versa.
> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
> + * it's expected to be 1.
> + */
> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
> +#define WDT_CTRL_DISABLE BIT(1)
> +
> +enum gunyah_error {
> +	GUNYAH_ERROR_OK				= 0,
> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
> +	GUNYAH_ERROR_ARG_INVAL			= 1,
> +};
> +
> +/**
> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gunyah_error: Gunyah hypercall return value
> + */
> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
> +{
> +	switch (gunyah_error) {
> +	case GUNYAH_ERROR_OK:
> +		return 0;
> +	case GUNYAH_ERROR_UNIMPLEMENTED:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
> +			   unsigned long arg2)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(func_id, arg1, arg2, &res);
> +	return gunyah_error_remap(res.a0);
> +}
> +
> +static int gunyah_wdt_start(struct watchdog_device *wdd)
> +{
> +	unsigned int timeout_ms;
> +	struct device *dev = wdd->parent;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +	if (ret && watchdog_active(wdd)) {
> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	timeout_ms = wdd->timeout * 1000;
> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME, timeout_ms, timeout_ms);
> +	if (ret) {
> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
> +{
> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +}
> +
> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
> +{
> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
> +}
> +
> +static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
> +				  unsigned int timeout_sec)
> +{
> +	wdd->timeout = timeout_sec;
> +
> +	if (watchdog_active(wdd))
> +		return gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static int gunyah_wdt_get_time_since_last_ping(void)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (res.a0)
> +		return gunyah_error_remap(res.a0);
> +
> +	return res.a2 / 1000;
> +}
> +
> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	int seconds_since_last_ping;
> +
> +	seconds_since_last_ping = gunyah_wdt_get_time_since_last_ping();
> +	if (seconds_since_last_ping < 0 ||
> +	    seconds_since_last_ping > wdd->timeout)
> +		return 0;
> +
> +	return wdd->timeout - seconds_since_last_ping;
> +}
> +
> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
> +			      unsigned long action, void *data)
> +{
> +	/* Set timeout to 1ms and send a ping */
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1);
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
> +
> +	/* Wait to make sure reset occurs */
> +	mdelay(100);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info gunyah_wdt_info = {
> +	.identity = "Gunyah Watchdog",
> +	.options = WDIOF_SETTIMEOUT
> +		 | WDIOF_KEEPALIVEPING
> +		 | WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops gunyah_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = gunyah_wdt_start,
> +	.stop = gunyah_wdt_stop,
> +	.ping = gunyah_wdt_ping,
> +	.set_timeout = gunyah_wdt_set_timeout,
> +	.get_timeleft = gunyah_wdt_get_timeleft,
> +	.restart = gunyah_wdt_restart
> +};
> +
> +static int gunyah_wdt_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0);
> +	if (ret == -EOPNOTSUPP)
> +		return -ENODEV;
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "status check failed\n");
> +
> +	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	wdd->info = &gunyah_wdt_info;
> +	wdd->ops = &gunyah_wdt_ops;
> +	wdd->parent = dev;
> +
> +	/*
> +	 * Although Gunyah expects 16-bit unsigned int values as timeout values
> +	 * in milliseconds, values above 0x8000 are reserved. This limits the
> +	 * max timeout value to 32 seconds.
> +	 */
> +	wdd->max_timeout = 32; /* seconds */
> +	wdd->min_timeout = 1; /* seconds */
> +	wdd->timeout = wdd->max_timeout;
> +
> +	gunyah_wdt_stop(wdd);
> +	platform_set_drvdata(pdev, wdd);
> +	watchdog_set_restart_priority(wdd, 0);
> +
> +	return devm_watchdog_register_device(dev, wdd);
> +}
> +
> +static void gunyah_wdt_remove(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd = platform_get_drvdata(pdev);
> +
> +	gunyah_wdt_stop(wdd);
> +}
> +
> +static int gunyah_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int gunyah_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> +
> +/*
> + * Gunyah watchdog is a vendor-specific hypervisor interface provided by the
> + * Gunyah hypervisor. Using QCOM SCM driver to detect Gunyah watchdog SMCCC
> + * hypervisor service and register platform device when the service is available
> + * allows this driver to operate independently of the devicetree and avoids
> + * adding the non-hardware nodes to the devicetree.
> + */
> +static const struct platform_device_id gunyah_wdt_id[] = {
> +	{ .name = "gunyah-wdt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, gunyah_wdt_id);
> +
> +static struct platform_driver gunyah_wdt_driver = {
> +	.driver = {
> +		.name = "gunyah-wdt",
> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> +	},
> +	.id_table = gunyah_wdt_id,
> +	.probe = gunyah_wdt_probe,
> +	.remove = gunyah_wdt_remove,
> +};
> +
> +module_platform_driver(gunyah_wdt_driver);
> +
> +MODULE_DESCRIPTION("Gunyah Watchdog Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

