Return-Path: <linux-arm-msm+bounces-114813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 61NJCKPRQWonuwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:00:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE66D5744
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:00:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GvjA8xZV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114813-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114813-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 805E63003BC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 01:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B272379EE8;
	Mon, 29 Jun 2026 01:59:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2123749FF;
	Mon, 29 Jun 2026 01:59:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782698395; cv=none; b=YdVxuOLomuyOI3gKOlRmYnP6FuPC4IBFHI57dB1DQZr2r6jASev+rsud8E7+ZbSQk3YjUxxh2ks1Wq4nObHGurBCIVRURlfyAmUogOaH1Wsen1XvZ07TGzE1WSObG+6ox7sP+pD6SHvLEUXeQ/h1F171/3Z3/Q3YX7HPqlq9KU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782698395; c=relaxed/simple;
	bh=fUTmaEVmNdNSuyIY1gYvqvyP6ctXnUfQBmnbhVpNyi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loVEopxcl72y7sCrhDzhhobdowh7Cx7WABoccvqdA/r52lJXNxKqRiqeOv8UcTXj4n/XYR0STZCO+v6k/5a6m+uwwwJwy9xgXSPF2dQZBzgErPNSlxwCL3K0aPOZKwi2J8Q9e4lVCm2d4mzsVe291fLAW4lmeuTb1K4kDyJKaMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvjA8xZV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F2F1F000E9;
	Mon, 29 Jun 2026 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782698393;
	bh=6WhoFyf49lYcxI/isV8lofhDX03wjkJMVpoYodnKkCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvjA8xZV1RRe3cvZ4SUDtnTXpc1eUD9o5U6F+fBWfGlu//65bR5ZJBy70SEgwsZqD
	 W65N69+dVirLV8U4+FBR7kLOELeQjGUdt0x+peE6swTmajf6g5Sj4oFzJIIoPZqrfU
	 MChHYMhfDByr2lXhaOJBZpbwikyE/15tgQX0FVvY94WrhuZyWQ7F1NtuhHDa7vSs9b
	 Yd2rtp301DYyKN4lv2jfqRQTbzBmixha+3URMXZ3yspje1eRM3sMD+7zaHP0+VFhlY
	 RcYsfc3Ufiz9wJoZJpAkYXcbgBXlR8a+63CKb5r+6vzkgY9YBtGsihyvei6djYhK/b
	 Qhuhbc4/A7DUg==
Date: Sun, 28 Jun 2026 20:59:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 09/12] pinctrl: qcom: Add support for WoA ACPI tables
 virtual TLMM pin numbers
Message-ID: <akHOI2Ki1L1pVEVy@baldur>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260623145225.143218-10-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623145225.143218-10-johannes.goede@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114813-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,baldur:mid,parse.data:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53AE66D5744

On Tue, Jun 23, 2026 at 04:52:22PM +0200, Hans de Goede wrote:
> The ACPI tabled on Windows on ARM laptops use TLMM pin numbers outside of
> the actual TLMM pin number range. These are a rather convoluted way to let
> the Windows Qualcomm GPIO driver now to use the PDC for some pins because
> these are wakeup sources.
> 
> This adds support for translating the magic Windows virtual GPIOs for these
> back to a regular TLMM GPIO so that ACPI described devices using these
> virtual GPIOs can work with Linux.
> 
> For now this code only tries to do this mapping when booting in DT-ACPI
> hybrid mode which is only used on some WoA devices so this should not
> impact any other use-cases.
> 
> The new functions use woa_acpi in their name to make clear that these
> are for dealing with the ACPI tables found on WoA devices, rather then
> ACPI tables found on other devices, like ARM system ready devices which
> also use ACPI.
> 
> Note that simply mapping these virtual GPIOs back to TLMM pin numbers can
> safely be done on Linux, because Linux always uses the PDC for GPIO IRQs
> where possible.
> 

This adds a fair amount of complexity to the driver, to support a model
that I am not convinced we want to retain - and that only works in the
hybrid case.

> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Makefile           |   4 +-
>  drivers/pinctrl/qcom/pinctrl-msm-acpi.c | 196 ++++++++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.c      |  47 +++++-
>  drivers/pinctrl/qcom/pinctrl-msm.h      |  35 +++++
>  4 files changed, 278 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm-acpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 84bda3ada874..9029d99190d2 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Qualcomm pin control drivers
> -obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm.o
> +obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm-core.o
> +pinctrl-msm-core-y		:= pinctrl-msm.o
> +pinctrl-msm-core-$(CONFIG_ACPI)	+= pinctrl-msm-acpi.o
>  obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
>  obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
>  obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm-acpi.c b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
> new file mode 100644
> index 000000000000..df180fd04749
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ACPI GPIO lookup handling for WoA (Windows on ARM) laptop ACPI tables.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/list.h>
> +#include <linux/math.h>
> +#include "pinctrl-msm.h"
> +
> +#define MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK	64

Wasn't this 32 for a while?

> +#define MSM_GPIO_WOA_ACPI_IRQ_OFFSET		32
> +#define MSM_GPIO_WOA_ACPI_INVALID_GPIO		~0U
> +#define MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES	16
> +
> +#define PDC_RANGE_PIN_BASE			0
> +#define PDC_RANGE_GIC_BASE			1
> +#define PDC_RANGE_COUNT				2
> +#define PDC_RANGE_ELEMENTS			3
> +
> +/**
> + * struct msm_gpio_woa_acpi_parse_data - Data for parsing WoA ACPI GPIO ctl resources
> + * @chip:		gpiochip handle
> + * @data:		Data for mapping virtual WoA ACPI PDC IRQ GPIOs
> + * @soc_data:		Reference to soc_data of platform specific data
> + * @pdc_range:		PDC GIC to PDC map ranges
> + * @pdc_range_count:	PDC GIC to PDC map range-count
> + */
> +struct msm_gpio_woa_acpi_parse_data {
> +	struct gpio_chip *chip;
> +	struct msm_gpio_woa_acpi_data *data;
> +	const struct msm_pinctrl_soc_data *soc_data;
> +	u32 pdc_range[MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES][PDC_RANGE_ELEMENTS];
> +	unsigned int pdc_range_count;
> +};
> +
> +/*
> + * Mapping does not need translating the acpi_resource in to a regular resoure
> + * and adding it to the resource list. Always return 1 to disable this.
> + */
> +static int msm_gpio_woa_acpi_resource(struct acpi_resource *ares, void *_parse)
> +{
> +	struct msm_gpio_woa_acpi_parse_data *parse = _parse;
> +	const struct msm_pinctrl_soc_data *soc_data = parse->soc_data;
> +	struct msm_gpio_woa_acpi_data *data = parse->data;
> +	struct gpio_chip *chip = parse->chip;
> +	u32 gic_irq, pdc_pin;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_EXTENDED_IRQ ||
> +	    ares->data.extended_irq.interrupt_count != 1)
> +		return 1;
> +
> +	if (data->nmap == MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS) {
> +		dev_err(chip->parent, "ACPI resources contain more than %d IRQs\n",
> +			MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS);
> +		return 1;
> +	}
> +
> +	/*
> +	 * Windows ACPI tables divide GPIOs into banks of 64 pins with one IRQ

Is this really "Windows ACPI tables"?

> +	 * per bank. The resources start with listing the real TLMM IRQ for
> +	 * as many banks as are necessary to cover the real GPIOs. The Windows
> +	 * virtual GPIO indexes skip these banks, mark them as unavailable.
> +	 */
> +	if (data->nmap < DIV_ROUND_UP(chip->ngpio, MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK)) {
> +		data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
> +		return 1;
> +	}
> +
> +	/*
> +	 * Use the "pdc-ranges" property on the PDC to translate the GIC IRQ
> +	 * from the acpi_resource to a PDC pin.
> +	 */
> +	gic_irq = ares->data.extended_irq.interrupts[0] - MSM_GPIO_WOA_ACPI_IRQ_OFFSET;
> +	pdc_pin = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
> +	for (unsigned int i = 0; i < parse->pdc_range_count; i++) {
> +		u32 gic_base = parse->pdc_range[i][PDC_RANGE_GIC_BASE];
> +		u32 count = parse->pdc_range[i][PDC_RANGE_COUNT];
> +		if (gic_irq >= gic_base && gic_irq < (gic_base + count)) {
> +			pdc_pin = parse->pdc_range[i][PDC_RANGE_PIN_BASE] +
> +				  gic_irq - gic_base;
> +			break;
> +		}
> +	}
> +	if (pdc_pin == MSM_GPIO_WOA_ACPI_INVALID_GPIO)
> +		goto no_map;
> +
> +	/* Use wakeirq-map to map PDC pin to TLMM pin */
> +	for (unsigned int i = 0; i < soc_data->nwakeirq_map; i++) {
> +		if (soc_data->wakeirq_map[i].wakeirq == pdc_pin) {
> +			data->map[data->nmap++] = soc_data->wakeirq_map[i].gpio;
> +			return 1;
> +		}
> +	}
> +
> +no_map:
> +	dev_warn(chip->parent, "Cannot map GIC IRQ %u to TLMM pin\n", gic_irq);
> +	data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
> +	return 1;
> +}
> +
> +int msm_gpio_woa_acpi_init(struct gpio_chip *chip, struct msm_gpio_woa_acpi_data *data,
> +			   const struct msm_pinctrl_soc_data *soc_data)

This function name makes me think this deals with "the ACPI case", but
it requires both ACPI and DT tables to define the TLMM block - in other
words, it complicates the DT-only case and it's useless in a ACPI-only
system.

> +{
> +	struct msm_gpio_woa_acpi_parse_data parse;
> +	struct fwnode_handle *fwnode;
> +	struct device_node *pdc_np;
> +	LIST_HEAD(resources);
> +	unsigned int ngpio;
> +	int ret;
> +
> +	/* WoA ACPI tables are only used in DT-ACPI hybrid mode */
> +	fwnode = chip->parent->fwnode;
> +	if (!is_of_node(fwnode) || !is_acpi_device_node(fwnode->secondary))
> +		return 0;
> +
> +	parse.chip = chip;
> +	parse.data = data;
> +	parse.soc_data = soc_data;
> +
> +	/* Get PDC ranges, the PDC is the TLMM's wakeup-parent. */
> +	pdc_np = of_parse_phandle(chip->parent->of_node, "wakeup-parent", 0);
> +	if (!pdc_np)
> +		return 0;
> +
> +	ret = of_property_count_elems_of_size(pdc_np, "qcom,pdc-ranges", sizeof(u32));

That said, do you actually need to do this? Doesn't the ACPI resource
give you the INTID directly? (Perhaps I'm misremember? Or perhaps that's
of no use to us)

Regards,
Bjorn

