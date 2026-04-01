Return-Path: <linux-arm-msm+bounces-101363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK/gBQ01zWlwawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:09:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 309AC37CB80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9220E30BD997
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACC2311957;
	Wed,  1 Apr 2026 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+EO+2uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EEF2FD1B3;
	Wed,  1 Apr 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054262; cv=none; b=PtMaL1ZjmDade6YaMnNFPM3KA4UNS2bgXQ44RE3wEfPrxz3x9TLWI6wSjjYZ/+1TQkgB/TOE1KKEIAwHECvCjL1byddfRA+1D9sjqskPFviMcRyS/uL61rdvKGh1VadPU7K8x61Nlx7ZtCJv8MRHpFQPiyzgdfelA7OCX2LGjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054262; c=relaxed/simple;
	bh=CxbPEO+4DAO+Jl4a/M7Wk4mQ6ScP+ITjFt/YJGyNw9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeKzi+KU/WA62NnF1/RJYlKl+5hdNWki5DJRjHNAVy3/DODWbzTxISeBupbNZnqHMi/cAwUhuX+fOYzORpRFmV1Tay9qrcydbUBoYmOmJhC57vxzQWqBFYwMwYUPvQNSrjQu1XE3coQadxQUIdpsCZvkl7dLX605zjdxZyZk0f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+EO+2uR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98A8C2BCAF;
	Wed,  1 Apr 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054261;
	bh=CxbPEO+4DAO+Jl4a/M7Wk4mQ6ScP+ITjFt/YJGyNw9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+EO+2uROruo+PFMmYimQMkP1+/PyUsudXzfHZAKiCRi6Jdd0Sv0VYOcU5FqrXIEa
	 Wh1b6S39TSJ4QlnbiPybrmtvbPMdgyjUgczWW/bdydo8au3peDrZEFKEb97SV5l8+A
	 65XqHfdqfley5hZJ80RUqPXUREGRKI3IZUMx8zYFOs2+kFuKnSBjzan76dBGKXFPPx
	 /qJtAvOsJ+nCj3ENG7tgQ7ijsG6IleIX0yWniHAZXzfwSoiyFIavsW9/ZQDefSBUqF
	 Xg7aLwzOeX7OX8i1jqYEkWBqidbr8tt4gomQhvugE4j1UHXDnMVXjs83B6DosGPDna
	 56FAwJZmiMa8Q==
Date: Wed, 1 Apr 2026 16:37:33 +0200
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
Message-ID: <ac0trUGsRBLPS+ux@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101363-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lpieralisi@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 309AC37CB80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
> 
> 
> On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
> > On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
> > > PSCI supports different types of resets like COLD reset, ARCH WARM
> > > reset, vendor-specific resets. Currently there is no common driver that
> > > handles all supported psci resets at one place. Additionally, there is
> > > no common mechanism to issue the supported psci resets from userspace.
> > > 
> > > Add a PSCI reboot mode driver and define two types of PSCI resets in the
> > > driver as reboot-modes: predefined resets controlled by Linux
> > > reboot_mode and customizable resets defined by SoC vendors in their
> > > device tree under the psci:reboot-mode node.
> > > 
> > > Register the driver with the reboot-mode framework to interface these
> > > resets to userspace. When userspace initiates a supported command, pass
> > > the reset arguments to the PSCI driver to enable command-based reset.
> > > 
> > > This change allows userspace to issue supported PSCI reset commands
> > > using the standard reboot system calls while enabling SoC vendors to
> > > define their specific resets for PSCI.
> > > 
> > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > ---
> > >   drivers/power/reset/Kconfig            |  10 +++
> > >   drivers/power/reset/Makefile           |   1 +
> > >   drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
> > >   3 files changed, 130 insertions(+)
> > > 
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
> > >   	  then the bootloader can read it and take different
> > >   	  action according to the mode.
> > > +config PSCI_REBOOT_MODE
> > > +	bool "PSCI reboot mode driver"
> > > +	depends on OF && ARM_PSCI_FW
> > > +	select REBOOT_MODE
> > > +	help
> > > +	  Say y here will enable PSCI reboot mode driver. This gets
> > > +          the PSCI reboot mode arguments and passes them to psci
> > > +	  driver. psci driver uses these arguments for issuing
> > > +	  device reset into different boot states.
> > > +
> > >   config POWER_MLXBF
> > >   	tristate "Mellanox BlueField power handling driver"
> > >   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> > > diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> > > index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
> > > --- a/drivers/power/reset/Makefile
> > > +++ b/drivers/power/reset/Makefile
> > > @@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
> > >   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
> > >   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
> > >   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> > > +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
> > >   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
> > > diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..86bef195228b0924704c2936b99f6801c14ff1b1
> > > --- /dev/null
> > > +++ b/drivers/power/reset/psci-reboot-mode.c
> > > @@ -0,0 +1,119 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +
> > > +#include <linux/device/faux.h>
> > > +#include <linux/device.h>
> > 
> > Nit: swap the two.
> 
> Ack. thanks.
> 
> 
> > > +#include <linux/err.h>
> > > +#include <linux/of.h>
> > > +#include <linux/psci.h>
> > > +#include <linux/reboot.h>
> > > +#include <linux/reboot-mode.h>
> > > +#include <linux/types.h>
> > > +
> > > +/*
> > > + * Predefined reboot-modes are defined as per the values
> > > + * of enum reboot_mode defined in the kernel: reboot.c.
> > > + */
> > > +static struct mode_info psci_resets[] = {
> > > +	{ .mode = "warm", .magic = REBOOT_WARM},
> > > +	{ .mode = "soft", .magic = REBOOT_SOFT},
> > > +	{ .mode = "cold", .magic = REBOOT_COLD},

These strings match the command userspace issue right ? I think that we
should make them match the corresponding PSCI reset types, the list above
maps command to reboot_mode values and those can belong to any reboot
mode driver to be honest they don't make much sense in a PSCI reboot
mode driver only.

It is a question for everyone here: would it make sense to make these
predefined resets a set of strings, eg:

psci-system-reset
psci-system-reset2-arch-warm-reset

and then vendor resets:

psci-system-reset2-vendor-reset

at least we know what a string maps to ?

We can export a function from the PSCI driver to detect whether PSCI
SYSTEM_RESET2 is supported, an equivalent of psci_has_osi_support() for
instance that we can call from this driver to detect its presence.

> > > +};
> > > +
> > > +static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
> > > +{
> > > +	INIT_LIST_HEAD(&reboot->predefined_modes);
> > > +	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
> > > +		/* Prepare the magic with arg1 as 0 and arg2 as per pre-defined mode */
> > > +		psci_resets[i].magic = REBOOT_MODE_MAGIC(0, psci_resets[i].magic);
> > 
> > This looks weird to me, why can't we just initialize the array with the values
> > directly ?
> 
> Ack. The idea was to avoid Typecasting. Will check on this.
> 
> > > +		INIT_LIST_HEAD(&psci_resets[i].list);
> > > +		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
> > > +	}
> > > +}
> > > +
> > > +/*
> > > + * arg1 is reset_type(Low 32 bit of magic).
> > > + * arg2 is cookie(High 32 bit of magic).
> > > + * If reset_type is 0, cookie will be used to decide the reset command.
> > > + */
> > > +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> > > +{
> > > +	u32 reset_type = REBOOT_MODE_ARG1(magic);
> > > +	u32 cookie = REBOOT_MODE_ARG2(magic);
> > > +
> > > +	if (reset_type == 0) {
> > > +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
> > > +			psci_set_reset_cmd(true, 0, 0);
> > > +		else
> > > +			psci_set_reset_cmd(false, 0, 0);
> > > +	} else {
> > > +		psci_set_reset_cmd(true, reset_type, cookie);
> > > +	}
> > 
> > I don't think that psci_set_reset_cmd() has the right interface (and this
> > nested if is too complicated for my taste). All we need to pass is reset-type
> > and cookie (and if the reset is one of the predefined ones, reset-type is 0
> > and cookie is the REBOOT_* cookie).
> > 
> > Then the PSCI firmware driver will take the action according to what
> > resets are available.
> > 
> > How does it sound ?
> 
> So we mean these checks will move to the psci driver? Sorry for re-iterating
> the question.

Given what I say above, I believe that something we can do is mapping the magic
to an enum like:

PSCI_SYSTEM_RESET
PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
PSCI_SYSTEM_RESET2_VENDOR_RESET

and can add a probe function into PSCI driver similar to psci_has_osi_support() but
to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
depending on its presence.

It is getting a bit hairy, agreed, but I am not sure there is cleaner ways
of pulling this off.

Lorenzo

> 
> > > +
> > > +	return NOTIFY_DONE;
> > > +}
> > > +
> > > +static int psci_reboot_mode_register_device(struct faux_device *fdev)
> > > +{
> > > +	struct reboot_mode_driver *reboot;
> > > +	int ret;
> > > +
> > > +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> > > +	if (!reboot)
> > > +		return -ENOMEM;
> > > +
> > > +	psci_reboot_mode_set_predefined_modes(reboot);
> > > +	reboot->write = psci_reboot_mode_write;
> > > +	reboot->dev = &fdev->dev;
> > > +
> > > +	ret = devm_reboot_mode_register(&fdev->dev, reboot);
> > > +	if (ret) {
> > > +		dev_err_probe(&fdev->dev, ret, "devm_reboot_mode_register failed %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __init psci_reboot_mode_init(void)
> > > +{
> > > +	struct device_node *psci_np;
> > > +	struct faux_device *fdev;
> > > +	struct device_node *np;
> > > +	int ret;
> > > +
> > > +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> > > +	if (!psci_np)
> > > +		return -ENODEV;
> > > +	/*
> > > +	 * Look for reboot-mode in the psci node. Even if the reboot-mode
> > > +	 * node is not defined in psci, continue to register with the
> > > +	 * reboot-mode driver and let the dev.ofnode be set as NULL.
> > > +	 */
> > > +	np = of_find_node_by_name(psci_np, "reboot-mode");
> > > +
> > > +	fdev = faux_device_create("psci-reboot-mode", NULL, NULL);
> > 
> > Same comment as Bartosz (have you picked up his work and working towards
> > a solution) ?
> Working on this via MFD. Some issue as again MFD framework does not allows a
> fwnode based driver registration. Will update.
> 
> thanks,
> Shivendra

