Return-Path: <linux-arm-msm+bounces-104900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO9GL5Vp8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3D47F878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B319306253D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5E030DEB2;
	Tue, 28 Apr 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDjAfyK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA122D3733
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362970; cv=none; b=VSSd/2e+/5iFq61H3gOIKlduspz09GCsMkeTlliJ0NjXlAnbx/tXWQdWKtLoQkZFUg1ewH9mYRDkJBNu3i9x9i4eWniXVF6OOqW2Zkr6yobjb1WL2SLAsS6sV5wgFeiMzh6/8hSzlTOXdzE+rqDxq3hthrF249f1Jsh0J99W4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362970; c=relaxed/simple;
	bh=LFgv66F+0nt9E67NvK3C9RMmoN2dCCkDNLlwr0UUAys=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1Ux4Uhb20064nc5ywATbi8EjLHwi3/hxo9/kFGL8pzpRX//fgE/+vVZXqAPA0XcV6M6OIcfm7DtQ/SjDAMlLKygv0rUevPI4Nykp7ywT2EYhICLigZ8VYJRMfaqc8Jokm+fNbibGNi9uUAJIXslY7/eNSIDQIaBDwj9YaT0S5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDjAfyK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406A2C4AF0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362970;
	bh=LFgv66F+0nt9E67NvK3C9RMmoN2dCCkDNLlwr0UUAys=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FDjAfyK9X4SOWb9qosGFCnsMLAnw1GeTTWQOi535HnflthB4xSmC4jkyFjSMpanr0
	 AuYymZU9u+uyi6yxuYkRM+bYyn5eo+C09b4BmNLD40M5K1qyFgoH48EXvCucU2IqA1
	 ssIucaVEPqMKCkXaWR5wDM83IFxcP+dHmn26qL0zZG41aQYO0bhI0GVoXjxJoeSuQn
	 naMVGO+9kRPzDnJieG5YxapdDJ10Vb4b6Rj+e8be/pshBfU2MZyftF1aH8NKvXXQ71
	 S5K9ReJrsKRMXYR6P8I85MecWhE0pxQ7pBLn9IUnpM2kweAd8w0PkoL1u2XGh+vSoe
	 o2NiQUz2juVLg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so8427859e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:56:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oh4Z/dA0HBMAXkcodm+jsTXnipW6NsnUVC+mTQUfEl1kB7EEsnT7Wrgfh1B5rA16RipbanhwUWhYXPLz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NzzOjQu6MDtLexJ3DCHwgugmIPdk1iAND87QqhY0+0/HgWka
	nPOnUmhnGB0PIfQpZQIBDwFt6F+p2M+wqx37MWIRQx8mZL6tIgEHhX0UzeOvDYf8R4D78D1x4AN
	HinQ4BBKhZEkcFka6j5so68SKVhl3prcvVciltqwpoA==
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id
 2adb3069b0e04-5a7466234c2mr724146e87.21.1777362968553; Tue, 28 Apr 2026
 00:56:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:56:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:56:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:56:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
X-Gm-Features: AVHnY4JQrBCpBs44aK1VESiHmvoftBhqWQglXzFZW2sthd0LKcTnrxCZ5nyahlo
Message-ID: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Subject: Re: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 87D3D47F878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104900-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 19:34:47 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
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
>  MAINTAINERS                            |   1 +
>  drivers/power/reset/Kconfig            |  10 +++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 109 +++++++++++++++++++++++++++++++++
>  4 files changed, 121 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333b01fa00b8fbd15e6f31a6b9af47600411624e..8cebc2c7e161c8a226802a4102756b4ed6034395 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21240,6 +21240,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
>  F:	drivers/mfd/psci-mfd.c
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
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
> +	  the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..29f53d2f50da8e34e714adef9507d340bc4130e2
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/* Predefined modes use reset_type = 0 and cookie in magic[63:32]. */
> +#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
> +
> +struct psci_predefined_reset {
> +	const char *mode;
> +	u64 magic;
> +};
> +
> +static const struct psci_predefined_reset psci_resets[] = {
> +	{
> +		.mode = "psci-system-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
> +	},
> +	{
> +		.mode = "psci-system-reset2-arch-warm-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
> +	},
> +};
> +
> +static int psci_reboot_mode_add_predefined_mode(struct device *dev,
> +						struct reboot_mode_driver *reboot,
> +						const struct psci_predefined_reset *predef)
> +{
> +	struct mode_info *info;
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&info->list);
> +	info->mode = predef->mode;
> +	info->magic = predef->magic;
> +	list_add_tail(&info->list, &reboot->predefined_modes);
> +
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_set_predefined_modes(struct device *dev,
> +						 struct reboot_mode_driver *reboot)
> +{
> +	int ret;
> +
> +	INIT_LIST_HEAD(&reboot->predefined_modes);
> +
> +	/* Always register psci-system-reset. */
> +	ret = psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[0]);
> +	if (ret)
> +		return ret;
> +
> +	/* Register arch warm reset only if SYSTEM_RESET2 is supported. */
> +	if (!psci_has_system_reset2_support())
> +		return 0;
> +
> +	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);

Looking at this, I'd introduce a core reboot-mode helper for initializing the
predefined_modes field and adding an array of modes and use it here and earlier
in the series.

> +}
> +
> +/*
> + * Pass the encoded magic to psci_set_reset_cmd.
> + * magic is encoded as reset_type (low 32 bits) and cookie (high 32 bits).
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	psci_set_reset_cmd(magic);
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reboot_mode_driver *reboot;
> +	int ret;
> +
> +	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	ret = psci_reboot_mode_set_predefined_modes(dev, reboot);
> +	if (ret)
> +		return ret;
> +
> +	reboot->write = psci_reboot_mode_write;
> +	reboot->dev = dev;
> +
> +	return devm_reboot_mode_register(dev, reboot);
> +}
> +
> +static struct platform_driver psci_reboot_mode_driver = {
> +	.probe  = psci_reboot_mode_probe,
> +	.driver = {
> +		.name	= "psci-reboot-mode",
> +	},
> +};
> +
> +module_platform_driver(psci_reboot_mode_driver);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

Looks good otherwise!

Bart

