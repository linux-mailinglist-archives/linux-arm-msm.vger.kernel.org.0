Return-Path: <linux-arm-msm+bounces-108138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCn2NRXWCmqc8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32C5694C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 316DB30293F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DA33E3DA6;
	Mon, 18 May 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6hIgQrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C53CC333
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094741; cv=none; b=WEobZi/o05ppSUyI+ynJppzbt2GL46euhV0JYGx5MWJRZfsOJ2Dtkt3TnYBT9gFG/vfqyuju6emk0pE+ZIlCGBCYMh49Lwj/hhlsuEDys0p1lKT1U4rGpsPNg+7ALXAtK5rfaRLg/D18ZeubG+EmSE7UZEGrBVqMGsNppbIVuLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094741; c=relaxed/simple;
	bh=A7ICurGTIkPXELRTZbv6ysGJpJ9ImgP6X+QRSf+z+SU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ5DaBSGwf5UwsgPUgarK65hGmfrt14PcP2UNS8WucrFmWjOjHB6Iz1Kj51AVhR1/1udo05ejWny0tMFA72FvhmGSz3LKxO/jcXJX33XWxRi9Klz1Ie70k2kvVDPQdLK2CLd/ATmmsSCM6Dt8D3p5t681L6HfFjvRgcM1iCxK+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6hIgQrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC08C2BCF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094741;
	bh=A7ICurGTIkPXELRTZbv6ysGJpJ9ImgP6X+QRSf+z+SU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=C6hIgQrmWX7HsofUCN2mACBoBoypsCFwVD/HNXLq17VKZbU/Lmsc02I99/fS2Jhvb
	 vRR9CeKoJa5YzbozDCovMAC9qlfa/U6vwbiFJG9A0FOIJDa8KL9C53/vhrb8zScvO1
	 z1QbD0SQe6VWqmA6wSCooIxC3/sb+o2VjkvuP7MxFka5hcXsFl9YR/rh6oB3irWXK7
	 v9Q/aex7t+uK1ezMt5gOaytTO2aQxyLbjasfhoc3UuWwkhl19V+Pm8bjZ7jTEkxa0E
	 tulS84vUw1s/DyaITNoUpfjlYhfwH6b3Mwqdw4rnhHOeNcnIO4eLHdLEzkxZ9oe4GB
	 3CmygoGPk28bQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so3056281e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:59:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yRlUVFMXq61YN7LdkYLBlWuzBJD6QdUlNM28GhqFMoL6tNH4/sxro0ktxJzFNB/SuF76Zk5a8CmMwsQfY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kzr7ENDH5Kr5eIxEzwXXE8EnR4GcsKj/3Qgy7OG0tUb4b3qb
	pUxSXTzrYONmNQo+flqAg/syxShd3vefJVJAmPEmJpwEzJQKTVWekBUIYj6qXbpHoLe835JoDxE
	Vw8PwuK+9TTMjZVAul1TtvesHlSJO9QwfavMA55fe1A==
X-Received: by 2002:a05:6512:3c8c:b0:5a8:84a5:bffa with SMTP id
 2adb3069b0e04-5aa0e6191a0mr3999087e87.5.1779094739901; Mon, 18 May 2026
 01:58:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:58:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:58:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
Date: Mon, 18 May 2026 01:58:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
X-Gm-Features: AVHnY4JP-WgaYa7_12dnDtJw4NYyeBy8ntErqhFkjuYMsR9OM-caNZdJWXcWW34
Message-ID: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Subject: Re: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
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
X-Rspamd-Queue-Id: 3B32C5694C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108138-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 14 May 2026 16:25:48 +0200, Shivendra Pratap
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
>  MAINTAINERS                            |  1 +
>  drivers/power/reset/Kconfig            | 10 +++++
>  drivers/power/reset/Makefile           |  1 +
>  drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
>  4 files changed, 84 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21342,6 +21342,7 @@ S:	Maintained
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

Can you add COMPILE_TEST coverage here too please?

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
> index 0000000000000000000000000000000000000000..845b2a1816ce53451dea8dfc4bffffda0d3e9293
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +/*
> + * Predefined modes:
> + *   reset_type = 0
> + *   cookie stored in magic[63:32]
> + */
> +#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
> +
> +static const struct reboot_mode_entry psci_resets[] = {
> +	{
> +		.name  = "psci-system-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
> +	},
> +	{
> +		.name  = "psci-system-reset2-arch-warm-reset",
> +		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
> +	},
> +};
> +
> +/*
> + * magic is a pre-encoded value:
> + *   reset_type in low 32 bits
> + *   cookie in high 32 bits
> + */
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> +{
> +	psci_set_reset_cmd(magic);
> +	return 0;
> +}
> +
> +static int psci_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	struct reboot_mode_driver *reboot;
> +	size_t count;
> +	int ret;
> +
> +	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;
> +
> +	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
> +
> +	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
> +	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
> +	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
> +	if (ret)
> +		return ret;
> +
> +	return devm_reboot_mode_register(&pdev->dev, reboot);
> +}
> +
> +static struct platform_driver psci_reboot_mode_driver = {
> +	.probe  = psci_reboot_mode_probe,
> +	.driver = {
> +		.name	= "psci-reboot-mode",
> +	},
> +};
> +

You can drop the newline here.

> +module_platform_driver(psci_reboot_mode_driver);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

With that:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

