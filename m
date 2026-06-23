Return-Path: <linux-arm-msm+bounces-114112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nf9jIlRIOmoo5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:48:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D432B6B5635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:48:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SMU0My+O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C46A307BA12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DAA3C584E;
	Tue, 23 Jun 2026 08:45:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B7346FB3;
	Tue, 23 Jun 2026 08:45:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204350; cv=none; b=UDO++ndW6u07QTnhnYtYri/peHhkHIdO2YI/l3wj5M/zN8q8jstOeGjKc9L7Mi4KOThzHLOG/PEj+BsTLcPkjsszIRxRAGBA7YQqaU5og+TsNTd2c3Pkm7MMJLuhEZDRoCzwM5i6UEspeV5XbW/j5DFHcsrXvWbGoba8awjr1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204350; c=relaxed/simple;
	bh=wbCO3F4lPXa97a+vQ5tt+9+kDAxv1tfmb5sgyAK9gjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjRaFVKPwRhOLzarMDHQQdIfYq80I0O/W9BRPuzzZ9pd8DKCi/ZUeawnLGIFL6vxq9wKthAWZc0rp2egDpwqZ7YVr2x/NT5ErS5tsMMjhnXIGKLFAeObfWr4Qz5trp2fEni0CkDhb3RFrI2N8QgtzI6hqwi+LhB2BXpMRMuvK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMU0My+O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770731F000E9;
	Tue, 23 Jun 2026 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204348;
	bh=mxgLUx72szZWAaoTej/cb9fj2rTJeQTSlh5I5LOfJLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SMU0My+OIe/n/O8yRG1qoXD1Q/QvSC1JN+5AjgsHiBCr3z0RLOG5Nmx82KYLZpDBM
	 zErPy5HzbZzfMEYQ4/wDZyWDACGKABdOyviUyiJyEKeDgb2a+KkZYw4n3G4j9eiMWU
	 KOiBvu37LIX/qOOH2Yw94lrIkSsvR7NrGmYRozPCpyOSL3Q3yDqRjypHolwnHc7Ih/
	 UDTTL9QfHao+bmwVyZGaILPui8H8Er6OFKbf6qJFoOoyIYM20CSpMuV/d1tus7JOVv
	 RrPo2U+tCneHsGmT932ATAnnhFsEOu3HRue0OUjgp92MsjvOfUbo1FgLW1nhl55oiD
	 2oIJIEL2nNA/A==
Date: Tue, 23 Jun 2026 10:45:41 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <gwcckverwvbt7r4puj2iu2b2j36olwwu4ua4x4uthht7bfq6my@yifjh6swxisq>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-1-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622-loopback_mhi-v4-1-782b3a0f2eef@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.kumar@oss.qualcomm.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114112-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:email,yifjh6swxisq:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D432B6B5635

On Mon, Jun 22, 2026 at 10:39:15AM +0530, Sumit Kumar wrote:
> The MHI specification defines a LOOPBACK channel. The endpoint firmware
> echoes back whatever the host sends on this channel. Without a host-side
> driver, there is no way to exercise this channel to validate MHI data path
> integrity between host and endpoint.
> 
> Add a host-side loopback driver that binds to the LOOPBACK channel and
> expose a sysfs interface for data path testing. The sysfs interface allows
> users to configure TRE buffer size and count, trigger a loopback test, and
> read the result.
> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
>  MAINTAINERS                                        |   1 +
>  drivers/bus/mhi/host/Kconfig                       |   1 +
>  drivers/bus/mhi/host/Makefile                      |   1 +
>  drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>  drivers/bus/mhi/host/clients/Makefile              |   2 +
>  drivers/bus/mhi/host/clients/loopback.c            | 329 +++++++++++++++++++++
>  7 files changed, 402 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bd770747799a3341a23903cc1a108e650e915b8
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> @@ -0,0 +1,51 @@
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
> +		used for the loopback test. Valid range is 1 to the value
> +		reported by max_tre_size. Default value is 32 bytes.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RO) Maximum allowed TRE size in bytes. Reading this file
> +		returns the upper bound for the tre_size attribute.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Number of Transfer Ring Elements (TREs) to use per
> +		loopback test. Must be greater than zero and must not exceed
> +		the channel ring capacity. Default value is 1.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(WO) Write any value to trigger a loopback test. The driver
> +		sends random data to the endpoint using the configured tre_size
> +		and num_tre parameters, waits for the endpoint to echo it back,
> +		and verifies the received data matches what was sent.
> +
> +		This is a blocking write that returns when the test completes
> +		or times out after 5 seconds.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/status
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RO) Result of the last loopback test. Returns one of:
> +		  "pass"        - last test completed successfully
> +		  "fail"        - last test failed
> +		  "not started" - no test has been run yet
> +
> +		Reading this file while a test is in progress will block
> +		until the test completes.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..ff12a6da48947ac853bc638359a7046fea85fc21 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16441,6 +16441,7 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>  F:	Documentation/ABI/stable/sysfs-bus-mhi
> +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>  F:	Documentation/mhi/
>  F:	drivers/bus/mhi/
>  F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>  	  This driver provides MHI PCI controller driver for devices such as
>  	  Qualcomm SDX55 based PCIe modems.
>  
> +source "drivers/bus/mhi/host/clients/Kconfig"
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>  
>  obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>  mhi_pci_generic-y += pci_generic.o
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..d1463c3e0df0da461c815afaec623ba349b51dda
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MHI_BUS_LOOPBACK
> +	tristate "MHI LOOPBACK client driver"
> +	depends on MHI_BUS
> +	help
> +	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
> +	  as defined in the MHI specification. The LOOPBACK channel is
> +	  implemented by MHI-based devices (modems, WLAN) in the field, where
> +	  the endpoint firmware echoes back whatever the host sends.
> +
> +	  This driver exposes a sysfs interface for testing MHI data path
> +	  integrity between host and endpoint. Users can configure the TRE
> +	  size and count, trigger a loopback test, and read the result.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called mhi_loopback.
> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
> +mhi_loopback-y += loopback.o
> diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..693691fff26dc8fa0d58931b98ce5f287fbd5c3e
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/loopback.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * The MHI LOOPBACK channel is defined in the MHI specification and is
> + * implemented by MHI-based devices (modems, WLAN) already deployed in the
> + * field. The endpoint firmware echoes back whatever the host sends on this
> + * channel. This driver binds to the LOOPBACK channel and exposes a sysfs
> + * interface for testing MHI data path integrity between host and endpoint.
> + * The sysfs interface is stable ABI because the wire protocol is fixed by
> + * the endpoint firmware and cannot be changed.
> + */

This comment just duplicates Kconfig help text. So drop it.

> +
> +#include <linux/atomic.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
> +#define MHI_LOOPBACK_TIMEOUT_MS		5000
> +#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
> +
> +struct mhi_loopback {
> +	struct mhi_device *mdev;
> +	struct mutex lb_mutex;
> +	struct completion comp;
> +	atomic_t tres_pending;

tre_pending

> +	const char *result;
> +	u32 num_tre;
> +	u32 tre_size;
> +};
> +
> +static ssize_t tre_size_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +
> +	if (!loopback)
> +		return -ENODEV;

I think you have this check here to avoid race between sysfs cleanup and driver
remove due to the use of devm_device_add_group(). But you can drop these by
switching to non-devm helpers and freeing the sysfs entries directly in
mhi_loopback_remove().

> +
> +	return sysfs_emit(buf, "%u\n", loopback->tre_size);
> +}
> +
> +static ssize_t tre_size_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 val;
> +
> +	if (!loopback)
> +		return -ENODEV;
> +
> +	if (kstrtou32(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
> +		return -EINVAL;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +	loopback->tre_size = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(tre_size);
> +
> +static ssize_t max_tre_size_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
> +}
> +static DEVICE_ATTR_RO(max_tre_size);
> +
> +static ssize_t num_tre_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +
> +	if (!loopback)
> +		return -ENODEV;
> +
> +	return sysfs_emit(buf, "%u\n", loopback->num_tre);
> +}
> +
> +static ssize_t num_tre_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 val;
> +	int el_num;
> +
> +	if (!loopback)
> +		return -ENODEV;
> +
> +	if (kstrtou32(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val == 0)
> +		return -EINVAL;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +
> +	el_num = mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE);
> +	if (val > el_num) {
> +		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
> +		return -EINVAL;
> +	}
> +
> +	loopback->num_tre = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(num_tre);
> +
> +static ssize_t start_store(struct device *dev,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 total_size, tre_count, tre_size;
> +	int i;
> +
> +	if (!loopback)
> +		return -ENODEV;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +
> +	tre_size = loopback->tre_size;
> +	tre_count = loopback->num_tre;
> +	total_size = size_mul(tre_count, tre_size);
> +
> +	if (total_size > KMALLOC_MAX_SIZE)
> +		return -EINVAL;
> +
> +	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
> +	if (!recv_buf)
> +		return -ENOMEM;
> +
> +	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
> +	if (!send_buf)
> +		return -ENOMEM;
> +
> +	get_random_bytes(send_buf, total_size);
> +
> +	atomic_set(&loopback->tres_pending, tre_count);
> +	reinit_completion(&loopback->comp);
> +
> +	for (i = 0; i < tre_count; i++) {
> +		int ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
> +					recv_buf + (i * tre_size), tre_size, MHI_EOT);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
> +			loopback->result = "fail";
> +			if (atomic_sub_and_test(tre_count - i, &loopback->tres_pending))
> +				complete(&loopback->comp);
> +			return ret;
> +		}
> +	}
> +
> +	for (i = 0; i < tre_count - 1; i++) {
> +		int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
> +					send_buf + (i * tre_size), tre_size, MHI_CHAIN);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
> +			loopback->result = "fail";
> +			return ret;
> +		}
> +	}
> +
> +	int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
> +				send_buf + (i * tre_size), tre_size, MHI_EOT);
> +	if (ret) {
> +		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
> +		loopback->result = "fail";
> +		return ret;
> +	}
> +
> +	if (!wait_for_completion_timeout(&loopback->comp,
> +					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
> +		dev_err(dev, "Loopback test timed out\n");
> +		loopback->result = "fail";
> +		return -ETIMEDOUT;

So once this function exits, both buffers will get freed due to the destructor.
But the device may still hold the reference to the buffers in TRE and may
read/write to it later. So you need to make sure that you flush the buffers in
the error path. But we don't have any explicit APIs to do that, so maybe you can
call mhi_unprepare_from_transfer() followed by mhi_prepare_for_transfer() in the
error path?

> +	}
> +
> +	if (memcmp(send_buf, recv_buf, total_size)) {
> +		dev_err(dev, "Loopback data mismatch\n");
> +		loopback->result = "fail";
> +		return -EIO;
> +	}
> +
> +	loopback->result = "pass";
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(start);
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +
> +	if (!loopback)
> +		return -ENODEV;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +
> +	return sysfs_emit(buf, "%s\n", loopback->result);

I don't see a need for this separate 'status' attribute. 'start' attribute
blocks until the write is completed or timesout, prints an error message with
relevant errno and returns the error code. Though the syscall interface converts
all error code to (-1), it is sufficient for the userspace to know whether the
test has passed or not.

> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
> +
> +	if (!loopback)
> +		return;
> +
> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
> +		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
> +			mhi_res->transaction_status);
> +
> +	if (atomic_dec_and_test(&loopback->tres_pending))
> +		complete(&loopback->comp);
> +}
> +
> +static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +}
> +
> +static struct attribute *mhi_loopback_attrs[] = {
> +	&dev_attr_tre_size.attr,
> +	&dev_attr_max_tre_size.attr,
> +	&dev_attr_num_tre.attr,
> +	&dev_attr_start.attr,
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group mhi_loopback_group = {
> +	.attrs = mhi_loopback_attrs,
> +};
> +
> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
> +			      const struct mhi_device_id *id)
> +{
> +	struct mhi_loopback *loopback;
> +	int rc;

'int ret'

> +
> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
> +	if (!loopback)
> +		return -ENOMEM;
> +
> +	loopback->mdev = mhi_dev;
> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
> +	loopback->result = "not started";
> +
> +	mutex_init(&loopback->lb_mutex);
> +	init_completion(&loopback->comp);
> +
> +	dev_set_drvdata(&mhi_dev->dev, loopback);
> +
> +	rc = mhi_prepare_for_transfer(mhi_dev);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to prepare for transfers\n");

nit: Capitalize 'Failed' and print the errno. Applies to all error prints.

> +		return rc;
> +	}
> +
> +	rc = devm_device_add_group(&mhi_dev->dev, &mhi_loopback_group);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to create sysfs attributes\n");
> +		mhi_unprepare_from_transfer(mhi_dev);
> +	}
> +
> +	return rc;

'return 0'

> +}
> +
> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
> +
> +	complete(&loopback->comp);
> +
> +	mutex_lock(&loopback->lb_mutex);
> +	mutex_unlock(&loopback->lb_mutex);

What does this locking protect?

> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +	dev_set_drvdata(&mhi_dev->dev, NULL);

As I mentioned above, once you call sysfs_create_group() in probe() and
sysfs_remove_group() before mhi_unprepare_from_transfer(), you can drop setting
drvdata to NULL.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

