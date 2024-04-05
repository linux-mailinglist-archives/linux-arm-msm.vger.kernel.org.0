Return-Path: <linux-arm-msm+bounces-16586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0589A42B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C329283712
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44893172790;
	Fri,  5 Apr 2024 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDAwfHhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18782172774;
	Fri,  5 Apr 2024 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341817; cv=none; b=nm7yTzV2jD5AfvAU2g8XIXebl7yFN98bupSeGuw33TJC0WJO0zxYb78dyBBhP21Nmj7a8qOLb0NhYbzvNBr/vhd9pGFz9Xcaer226w6B0eEKQNK8TgSFKIeN/kMm28p1kE1LrFjNxe0j9ReGTOvzM4mhi/XTtr/EQ4DaNa8dV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341817; c=relaxed/simple;
	bh=xYv+yllgKOiYRv+Zx3YHHjGs4q6Fq8ZmslsdPglZjmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XOVZHIg39Or1tPGS5KawmibEFliTM8vDt5o8T55DcwctkJJl02uHIbaWeAyvjZTjlc3ymVlM0xC7G7iut5eCIQmwZBPtzq/SI8F2++kuFr11myYYhmKm/8PsfEHhsBHVIPsz8VOUQblkRqsXEYFrCcA0jrc7ksWnnBuESaEVujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDAwfHhB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604A5C433F1;
	Fri,  5 Apr 2024 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712341816;
	bh=xYv+yllgKOiYRv+Zx3YHHjGs4q6Fq8ZmslsdPglZjmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NDAwfHhBYsdNKv0flGcmjCQQAMb+1Ld3s4sAMkviYc10v9xLsCA/pvvw/N+4XplIJ
	 NkW4MbuxkAP7ltt8zrDw6ABdW9ZnomYJEIIlqNe43NNqgiwIKBjSZrFEHDvNRWZ8Wm
	 3RJNJeJz/ZZ+jzFRC+WAUac7/t0mx2jvXcrUmDXlE7KZ42ACG532qGU6++iIlMfFeD
	 Pg4OP3i996vOyn2Ml4dwm5xWGhj3lUPqeen5uKWp3dCO2+eSiQ/eUq9zWkpI2tzESr
	 6NYxE6tCjPIG5nUS8vjsLu1AJnYv096N8URg/lUoNB75GSSa73c0ws8eXeSOLT+te/
	 koR/dhnRf/w9g==
Date: Fri, 5 Apr 2024 13:30:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mayank Rana <quic_mrana@quicinc.com>
Cc: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
	manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
	quic_nkela@quicinc.com, quic_shazhuss@quicinc.com,
	quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com
Subject: Re: [RFC PATCH 2/2] PCI: Add Qualcomm PCIe ECAM root complex driver
Message-ID: <20240405183014.GA1964459@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1712257884-23841-3-git-send-email-quic_mrana@quicinc.com>

On Thu, Apr 04, 2024 at 12:11:24PM -0700, Mayank Rana wrote:
> On some of Qualcomm platform, firmware configures PCIe controller into
> ECAM mode allowing static memory allocation for configuration space of
> supported bus range. Firmware also takes care of bringing up PCIe PHY
> and performing required operation to bring PCIe link into D0. Firmware

I think link state would be L0, not D0.

> also manages system resources (e.g. clocks/regulators/resets/ bus voting).
> Hence add Qualcomm PCIe ECAM root complex driver which enumerates PCIe
> root complex and connected PCIe devices. Firmware won't be enumerating
> or powering up PCIe root complex until this driver invokes power domain
> based notification to bring PCIe link into D0/D3cold mode.

Again.

> +config PCIE_QCOM_ECAM
> +	tristate "QCOM PCIe ECAM host controller"
> +	depends on ARCH_QCOM && PCI
> +	depends on OF
> +	select PCI_MSI
> +	select PCI_HOST_COMMON
> +	select IRQ_DOMAIN
> +	help
> +	 Say 'Y' here if you want to use ECAM shift mode compatible Qualcomm
> +	 PCIe root host controller. The controller is programmed using firmware
> +	 to support ECAM compatible memory address space.

Instead of adding this at the end, place this entry so the entire list
remains sorted by vendor name.

Other related entries are "Qualcomm PCIe controller ..." (not "QCOM").

Use "ECAM PCIe controller (host mode)" (not "PCIe ECAM host
controller") so it matches similar entries.

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Does this actually work?  I expected "#define dev_fmt" since you're
using dev_err(), etc below.

> +#include <linux/irqchip/chained_irq.h>

Can this be reworked so it doesn't use chained IRQs?  I admit to not
being an IRQ expert, but I have the impression that it's better to
avoid the chained IRQ model when possible.  See
https://lore.kernel.org/all/20231108153133.GA393726@bhelgaas/

> +#define	MSI_DB_ADDR	0xa0000000

Where does this come from and why is it hard-coded here?  Looks like a
magic address that maybe should come from DT?

> + * struct qcom_msi_irq - MSI IRQ information
> + * @client:	pointer to MSI client struct
> + * @grp:	group the irq belongs to

s/irq/IRQ/ in comments for consistency (other occurrences below).
Same for s/pcie/PCIe/ and s/msi/MSI/.

> +static void qcom_msi_mask_irq(struct irq_data *data)
> +{
> +	struct irq_data *parent_data;
> +	struct qcom_msi_irq *msi_irq;
> +	struct qcom_msi_grp *msi_grp;
> +	struct qcom_msi *msi;
> +	unsigned long flags;
> +
> +	parent_data = data->parent_data;
> +	if (!parent_data)
> +		return;

Drop this test; I think it only detects logic errors in the driver or
memory corruptions, and we want to find out about those.

> +static void qcom_msi_unmask_irq(struct irq_data *data)
> +{
> +	struct irq_data *parent_data;
> +	struct qcom_msi_irq *msi_irq;
> +	struct qcom_msi_grp *msi_grp;
> +	struct qcom_msi *msi;
> +	unsigned long flags;
> +
> +	parent_data = data->parent_data;
> +	if (!parent_data)
> +		return;

Drop.

> +static struct irq_chip qcom_msi_irq_chip = {
> +	.name		= "qcom_pci_msi",
> +	.irq_enable	= qcom_msi_unmask_irq,
> +	.irq_disable	= qcom_msi_mask_irq,
> +	.irq_mask	= qcom_msi_mask_irq,
> +	.irq_unmask	= qcom_msi_unmask_irq,

Name these so they match the struct member, e.g., the name should
contain "irq_mask", not "mask_irq") so grep finds them easily.

> +static struct msi_domain_ops qcom_msi_domain_ops = {
> +	.msi_prepare	= qcom_msi_domain_prepare,

Rename so function name includes the struct member name.

> +static int qcom_msi_irq_set_affinity(struct irq_data *data,
> +				const struct cpumask *mask, bool force)
> +{
> +	struct irq_data *parent_data = irq_get_irq_data(irqd_to_hwirq(data));
> +	int ret = 0;
> +
> +	if (!parent_data)
> +		return -ENODEV;
> +
> +	/* set affinity for MSI HW IRQ */

Unnecessary comment.

> +	if (parent_data->chip->irq_set_affinity)
> +		ret = parent_data->chip->irq_set_affinity(parent_data, mask, force);
> +
> +	return ret;

Drop "ret" and return directly, e.g.,

  if (parent_data->chip->irq_set_affinity)
    return parent_data->chip->irq_set_affinity(...);

  return 0;

> +static void qcom_msi_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> +{
> +	struct irq_data *parent_data = irq_get_irq_data(irqd_to_hwirq(data));
> +	struct qcom_msi_irq *msi_irq = irq_data_get_irq_chip_data(data);
> +	struct qcom_msi_client *client = msi_irq->client;
> +
> +	if (!parent_data)
> +		return;

Drop.

> +static void qcom_msi_irq_domain_free(struct irq_domain *domain, unsigned int virq,
> +				unsigned int nr_irqs)
> +{
> +	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
> +	struct qcom_msi_client *client;
> +	struct qcom_msi_irq *msi_irq;
> +	struct qcom_msi *msi;
> +
> +	if (!data)
> +		return;

Drop.

> +static int qcom_msi_irq_setup(struct qcom_msi *msi)
> +{
> +	struct qcom_msi_grp *msi_grp;
> +	struct qcom_msi_irq *msi_irq;
> +	int i, index, ret;
> +	unsigned int irq;
> +
> +	/* setup each MSI group. nr_hwirqs == nr_grps */
> +	for (i = 0; i < msi->nr_hwirqs; i++) {
> +		irq = irq_of_parse_and_map(msi->dev->of_node, i);
> +		if (!irq) {
> +			dev_err(msi->dev,
> +				"MSI: failed to parse/map interrupt\n");

Possibly include "i" to identify the offending entry.

