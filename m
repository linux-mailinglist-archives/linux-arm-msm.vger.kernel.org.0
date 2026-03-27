Return-Path: <linux-arm-msm+bounces-100346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGqXIEiSxmkyMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:20:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A972345F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC706304B370
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85493BC681;
	Fri, 27 Mar 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV7GswrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3D3128A3;
	Fri, 27 Mar 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620886; cv=none; b=Qj2yxVtci8ximSprIXYBSKX9GUoQWWj1AkMCEo6Ew3QHmaT+WxoZDxJt7/Rzt4186UWrDyJVCuBWPYR4yteNgGbuyTA57cxN2wACojnA28ETE9APTtWS1MXR0blCdl6XEEQqBPm14wHD48EJl+zOG7rJyBtSIOQOjuOPR86nyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620886; c=relaxed/simple;
	bh=qPqhXIZEh2rXfAvjqpbkl201qZ8hQu6n4t47C0tLHGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBHJNaZVNyAo+MPQdhHHJd/B7A59o7ZhvjiG2Fr6YetiVvFxVOkL/XP93BvLCZlWhKDLVh2jYu3rmx1F+FEPp3EvIwgX3Zwm3BEKiug+Qb/62TtBv/NY9UAIa8oE5EZtDw9+ZUc1xmBznt9m40xf4FtmW9CJurdfAINhWcO4o4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dV7GswrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A1C2BC9E;
	Fri, 27 Mar 2026 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620886;
	bh=qPqhXIZEh2rXfAvjqpbkl201qZ8hQu6n4t47C0tLHGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dV7GswrKCep2a8/NuZfNSdQYjFPcjv5a6gK71sp1PUb/A70WKDQTupDeWUrmjO9l9
	 xao4SdEBEWbqIl8lHUVJhXMjJJHEg4Kh+cv3lI52/TwYgVBkmCsEk+pCLMMHeblSxG
	 K2fBf74e61ysAiSZbdzXOx6Ob4Z55TaTbfj8IbLfYRCXi6j7yKm+xJYyzZyICRvD2X
	 lzhr1DwsZaAB6kqKHBlSnYm35ukmqPRp4CG1JFLbeOYQ79fDvk6aAxpiuuYnp7SDj9
	 4Za5ms5/pjGEBMxVPRgXCuR5lY/dIxtv68mEcx4pyY91X6vM7iEAXnEKI85VJVLp21
	 3lahvR5qcugrg==
Date: Fri, 27 Mar 2026 15:14:38 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Message-ID: <acaQzmVhO50oAbbE@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100346-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lpieralisi@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0A972345F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
> PSCI supports different types of resets like COLD reset, ARCH WARM
> reset, vendor-specific resets. Currently there is no common driver that
> handles all supported psci resets at one place. Additionally, there is
> no common mechanism to issue the supported psci resets from userspace.
> 
> Add a PSCI reboot mode driver and define two types of PSCI resets in the
> driver as reboot-modes: predefined resets controlled by Linux
> reboot_mode and customizable resets defined by SoC vendors in their
> device tree under the psci:reboot-mode node.
> 
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
> 
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/Kconfig            |  10 +++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++

Add an entry into MAINTAINERS.POWER STATE COORDINATION INTERFACE for this
specific file because I'd like to keep an eye on it, if you don't mind.

Creating a MAINTAINER entry just for this seems overkill to me, it
does not look like it is done for other reboot mode drivers.

Thanks,
Lorenzo

>  3 files changed, 130 insertions(+)
> 
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>  
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on OF && ARM_PSCI_FW
> +	select REBOOT_MODE
> +	help
> +	  Say y here will enable PSCI reboot mode driver. This gets
> +          the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device/faux.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/psci.h>
> +#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/*
> + * Predefined reboot-modes are defined as per the values
> + * of enum reboot_mode defined in the kernel: reboot.c.
> + */
> +static struct mode_info psci_resets[] = {
> +	{ .mode = "warm", .magic = REBOOT_WARM},
> +	{ .mode = "soft", .magic = REBOOT_SOFT},
> +	{ .mode = "cold", .magic = REBOOT_COLD},
> +};
> +
> +static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
> +{
> +	INIT_LIST_HEAD(&reboot->predefined_modes);
> +	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
> +		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
> +		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
> +		INIT_LIST_HEAD(&psci_resets[i].list);
> +		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
> +	}
> +}
> +
> +/*
> + * arg1 is reset_type(Low 32 bit of magic).
> + * arg2 is cookie(High 32 bit of magic).
> + * If reset_type is 0, cookie will be used to decide the reset command.
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
> +	u32 cookie = REBOOT_MODE_ARG2(magic);
> +
> +	if (reset_type == 0) {
> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
> +			psci_set_reset_cmd(true, 0, 0);
> +		else
> +			psci_set_reset_cmd(false, 0, 0);
> +	} else {
> +		psci_set_reset_cmd(true, reset_type, cookie);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
> +{
> +	struct reboot_mode_driver *reboot;
> +	int ret;
> +
> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	psci_reboot_mode_set_predefined_modes(reboot);
> +	reboot->write = psci_reboot_mode_write;
> +	reboot->dev = &fdev->dev;
> +
> +	ret = devm_reboot_mode_register(&fdev->dev, reboot);
> +	if (ret) {
> +		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init psci_reboot_mode_init(void)
> +{
> +	struct device_node *psci_np;
> +	struct faux_device *fdev;
> +	struct device_node *np;
> +	int ret;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +	/*
> +	 * Look for reboot-mode in the psci node. Even if the reboot-mode
> +	 * node is not defined in psci, continue to register with the
> +	 * reboot-mode driver and let the dev.ofnode be set as NULL.
> +	 */
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +
> +	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
> +	if (!fdev) {
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	device_set_node(&fdev->dev, of_fwnode_handle(np));
> +	ret = psci_reboot_mode_register_device(fdev);
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +
> +error:
> +	of_node_put(np);
> +	if (fdev) {
> +		device_set_node(&fdev->dev, NULL);
> +		faux_device_destroy(fdev);
> +	}
> +
> +	return ret;
> +}
> +device_initcall(psci_reboot_mode_init);
> 
> -- 
> 2.34.1
> 

