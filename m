Return-Path: <linux-arm-msm+bounces-44291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C6A051DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E7357A051B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C639E19D897;
	Wed,  8 Jan 2025 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDC9BW7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE0020B20;
	Wed,  8 Jan 2025 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736309356; cv=none; b=nzUulLhuuuccMVgBVkCFANytSXwIti6Yx3FO6IgC6KqldDaMLQkGAQ2ahIE2BRLdabL2Pyp0fvwbMYcRvyOdlwYhOO/IsGOE7zSBaIFb4h4tUT6/dwm101GZyuiPzuId/vgRwor9Z+Ey9o8bmfrgL3uuUKQwNv2h+ZYLrbLUDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736309356; c=relaxed/simple;
	bh=CEYtu9VGBw91XWaqqL0qpNZ2yN57aTvcXDO+F4dF4K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ro1pbKTR9sIuJgiBOkUngqEQL4kqTj1AOe5kF9V+RI12dTtYNTVLsBSRevWyNj1MtEsKhEnnvJPWSNTl/4QcdHfvItmRQBmErAwELMhsmLtNmcdQR7GYv1WsxmrqLNENBkqn5IxHtOqakFe9Qw8vzCVFEmJsGo5gPixgG5BaO34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDC9BW7V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E59AC4CED0;
	Wed,  8 Jan 2025 04:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736309355;
	bh=CEYtu9VGBw91XWaqqL0qpNZ2yN57aTvcXDO+F4dF4K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDC9BW7VvWTTz7iv6MIA7uIuLMKFo+h+7xU3JwneFcrKX0kfdOnzxs0niyObGv3BM
	 oJhtVE1O5pq62ZVKeIRrkKP4mIcR7an84fU9fRsShu88NPAtLiUVU+wgSpKjhmCHx4
	 XVayJK4tageSXMQ8XFHGYxQ56s7mI3ClSbT3FYbYQmo/v3CK+ZiddAUcTb0ATJXxli
	 OJrbPfe6W+mBRCU1zI4K/PyCeqT79/fdnoRu7AvF0ymUCUA6qQhAiA45VbIYpbD1qq
	 TRl5RkqyZEiKHzTpw+VbdZRz5JL15nIBaTEfiT6S3meKeWSsesT0bI53zQdlyI2Uzv
	 eVvxa59yMsE/g==
Date: Tue, 7 Jan 2025 22:09:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 4/8] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-5-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-5-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:43PM +0530, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Add support to bring up hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ9574 supports secure PIL remoteproc.

I'd love for this to be extended with a short description of what the
WCSS secure subsystem is, the reason for a new drivers etc. Following
the style of
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  drivers/remoteproc/Kconfig              |  22 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 406 ++++++++++++++++++++++++
>  3 files changed, 429 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 83962a114dc9..c4e94b15c538 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -255,6 +255,28 @@ config QCOM_Q6V5_WCSS
>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>  	  a non-TrustZone wireless subsystem.
>  
> +config QCOM_Q6V5_WCSS_SEC
> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
> +	depends on OF && ARCH_QCOM
> +	depends on QCOM_SMEM
> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> +	depends on QCOM_SYSMON || QCOM_SYSMON=n
> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n

Please review these depends, did you inherit a few too many?

> +	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
> +	select QCOM_Q6V5_COMMON
> +	select QCOM_RPROC_COMMON
> +	select QCOM_SCM
> +	help
> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
> +	  for the Hexagon based remote processors on e.g. IPQ5332.
> +
> +	  This is TrustZone wireless subsystem. The firmware is
> +	  verified and booted with the help of the Peripheral Authentication
> +	  System (PAS) in TrustZone.
> +
>  config QCOM_SYSMON
>  	tristate "Qualcomm sysmon driver"
>  	depends on RPMSG
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 5ff4e2fee4ab..d4971b672812 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 000000000000..ef4e893e37c7
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016-2018 Linaro Ltd.
> + * Copyright (C) 2014 Sony Mobile Communications AB
> + * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Please check that all these includes are required.

> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/smem_state.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/tmelcom-qmp.h>

This will require mailbox maintainer to first accept the tmelcom mailbox
driver, and share a immutable branch with me (or we have to wait until
this include file trickles in).

Please ensure that mailbox maintainer is aware of this request.

> +#include "qcom_common.h"
> +#include "qcom_q6v5.h"
> +
> +#include "qcom_pil_info.h"
> +#include "remoteproc_internal.h"
> +
> +#define WCSS_CRASH_REASON		421
> +
> +#define WCSS_PAS_ID			0x6
> +#define MPD_WCSS_PAS_ID			0xD

I like lowercase hex digits.

> +
> +struct wcss_sec {
> +	struct device *dev;
> +	struct qcom_rproc_glink glink_subdev;
> +	struct qcom_rproc_ssr ssr_subdev;
> +	struct qcom_q6v5 q6;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void *mem_region;
> +	size_t mem_size;
> +	const struct wcss_data *desc;

Assigned but never used.

> +	const char *fw_name;

Assigned but never used.

> +
> +	struct clk *sleep_clk;

Assigned but never used.

> +
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +	void *metadata;
> +	size_t metadata_len;
> +};
> +
> +struct wcss_data {
> +	u32 pasid;
> +	const struct rproc_ops *ops;
> +	bool auto_boot;
> +	bool tmelcom;
> +};
> +
> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);

Please avoid "parsing" DT in runtime.

> +	struct tmel_sec_auth tsa;
> +	struct tmel_qmp_msg tqm;
> +	int ret;
> +
> +	qcom_q6v5_prepare(&wcss->q6);

It would be sensible to check the return value here.

> +
> +	tsa.data = wcss->metadata;

This looks broken.

wcss->metadata is assigned in wcss_sec_load() only if tmelcom, and in
that code path wcss_sec_load() invokes kfree() on the pointer.

So, as far as I can tell, you're either going to pass NULL here or a
pointer to a freed (and perhaps overwritten) buffer.

> +	tsa.size = wcss->metadata_len;
> +	tsa.pas_id = desc->pasid;
> +	tqm.msg = &tsa;
> +	tqm.msg_id = TMEL_MSG_UID_SECBOOT_SEC_AUTH;
> +
> +	if (desc->tmelcom) {

As I point out below, mbox_chan should probably only be assigned when
desc->tmelcom == true, so you wouldn't even need any additional state,
just check if mbox_chan is valid here.

> +		mbox_send_message(wcss->mbox_chan, (void *)&tqm);

This does return errors as well, perhaps worth checking that as well?

> +	} else {
> +		ret = qcom_scm_pas_auth_and_reset(desc->pasid);

Please confirm that you're not required to keep the metadata buffer
passed to PAS init_image during qcom_mdt_load() alive until this point -
as is required by all modern SDMs.

> +		if (ret) {
> +			dev_err(dev, "wcss_reset failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, 5 * HZ);
> +	if (ret == -ETIMEDOUT)
> +		dev_err(dev, "start timed out\n");

Don't you need to qcom_scm_pas_shutdown() here to have QHEEBSP release
the memory back to you?

> +
> +	return ret;
> +}
> +
> +static int wcss_sec_stop(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	struct tmel_sec_auth tsa;
> +	struct tmel_qmp_msg tqm;
> +	int ret;
> +
> +	tsa.pas_id = desc->pasid;

tsa is passing a couple of random values over your mbox. Please
zero-initialize these.

Why is this filled in outside desc->tmelcom, when that's the only place
it's used?

> +	tqm.msg = &tsa;
> +	tqm.msg_id = TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN;
> +
> +	if (desc->tmelcom) {
> +		mbox_send_message(wcss->mbox_chan, (void *)&tqm);
> +	} else {
> +		ret = qcom_scm_pas_shutdown(desc->pasid);
> +		if (ret) {
> +			dev_err(dev, "not able to shutdown\n");
> +			return ret;
> +		}
> +	}
> +
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return 0;
> +}
> +
> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			       bool *is_iomem)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	int offset;
> +
> +	offset = da - wcss->mem_reloc;
> +	if (offset < 0 || offset + len > wcss->mem_size)
> +		return NULL;
> +
> +	return wcss->mem_region + offset;
> +}
> +
> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	int ret;
> +
> +	if (desc->tmelcom) {
> +		wcss->metadata = qcom_mdt_read_metadata(fw, &wcss->metadata_len,
> +							rproc->firmware, wcss->dev);
> +		if (IS_ERR(wcss->metadata)) {
> +			ret = PTR_ERR(wcss->metadata);
> +			dev_err(wcss->dev, "error %d reading firmware %s metadata\n",
> +				ret, rproc->firmware);
> +			return ret;
> +		}
> +
> +		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware, desc->pasid,
> +					    wcss->mem_region, wcss->mem_phys, wcss->mem_size,
> +					    &wcss->mem_reloc);
> +		kfree(wcss->metadata);
> +	} else {
> +		ret = qcom_mdt_load(dev, fw, rproc->firmware, desc->pasid, wcss->mem_region,
> +				    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
> +
> +	return ret;

ret can't be anything but 0 here, so better just write that.

> +}
> +
> +static unsigned long wcss_sec_panic(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	return qcom_q6v5_panic(&wcss->q6);
> +}
> +
> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	void *ptr;
> +
> +	ptr = ioremap_wc(segment->da, segment->size);
> +	if (!ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size %zx\n",

Make that %#zx to ensure that the base 16 size is prefixed with 0x

> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (size <= segment->size - offset)

I'd prefer if the expression in the check and access are on the same
form. I.e. test offset + size vs segement->size

> +		memcpy(dest, ptr + offset, size);
> +	else
> +		dev_err(dev, "Copy size greater than segment size. Skipping\n");
> +	iounmap(ptr);
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index = 0;
> +	int ret;
> +
> +	/* Parse through additional reserved memory regions for the rproc

Leave first line in multiline comment blank, as the docs says.

> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	while (index < num_segs) {

You're zero-initializing index above, checking index here and explicitly
increment it at the bottom of the loop. Why isn't this written as a for
loop?

> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		of_node_put(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
> +			&rmem->base, &rmem->size);
> +		ret = rproc_coredump_add_custom_segment(rproc,
> +							rmem->base,
> +							rmem->size,
> +							wcss_sec_copy_segment,
> +							NULL);
> +		if (ret)
> +			return ret;
> +
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops wcss_sec_ops = {
> +	.start = wcss_sec_start,
> +	.stop = wcss_sec_stop,
> +	.da_to_va = wcss_sec_da_to_va,
> +	.load = wcss_sec_load,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +	.panic = wcss_sec_panic,
> +	.parse_fw = wcss_sec_dump_segments,
> +};
> +
> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	struct device *dev = wcss->dev;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node) {
> +		dev_err(dev, "can't find phandle memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	of_node_put(node);
> +
> +	if (!rmem) {
> +		dev_err(dev, "unable to acquire memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	wcss->mem_phys = rmem->base;
> +	wcss->mem_reloc = rmem->base;
> +	wcss->mem_size = rmem->size;
> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
> +	if (!wcss->mem_region) {
> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
> +			&rmem->base, &rmem->size);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	struct wcss_sec *wcss;
> +	struct rproc *rproc;
> +	const char *fw_name = NULL;
> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
> +	int ret;
> +
> +	if (!desc)
> +		return -EINVAL;

It shouldn't be possible to get here with desc == NULL, so let the
person have an oops with a callstack to aid debugging. (I.e. remove the
check)

> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops, fw_name,
> +				 sizeof(*wcss));

Not sure how your system composition looks like, but please consider
something like b64b1266d619 ("remoteproc: qcom: pas: Make remoteproc
name human friendly"), to avoid the human-unfriendly pdev->name. (Only
if possible)

> +	if (!rproc) {
> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	wcss = rproc->priv;
> +	wcss->dev = &pdev->dev;
> +	wcss->desc = desc;
> +	wcss->fw_name = fw_name;
> +
> +	ret = wcss_sec_alloc_memory_region(wcss);
> +	if (ret)
> +		return ret;
> +
> +	wcss->sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
> +	if (IS_ERR(wcss->sleep_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wcss->sleep_clk),
> +				     "Failed to get sleep clock\n");
> +
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +			     WCSS_CRASH_REASON, NULL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, pdev->name);
> +
> +	rproc->auto_boot = desc->auto_boot;
> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = devm_rproc_add(&pdev->dev, rproc);

In the event of auto_boot, I believe it should be possible to enter
wcss_sec_load() et al from this point onwards. So, it seems reasonable
to acquire mbox_chan prior to registering the remoteproc.

> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	wcss->mbox_client.dev = wcss->dev;
> +	wcss->mbox_client.knows_txdone = true;
> +	wcss->mbox_client.tx_block = true;
> +	wcss->mbox_chan = mbox_request_channel(&wcss->mbox_client, 0);

"mboxes" is optional in binding, but seems to be required here, but then
mbox_chan is only accessed when tmelcom is true.

Should mbox_request_channel() be made conditional on tmelcom?

> +	if (IS_ERR(wcss->mbox_chan)) {
> +		dev_err(wcss->dev, "mbox chan for IPC is missing\n");
> +		return PTR_ERR(wcss->mbox_chan);
> +	}
> +
> +	return 0;

qcom_q6v5_pas.c was recently updated to clean up various things on
error, please do the same here.

> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	qcom_q6v5_deinit(&wcss->q6);
> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);

mbox_chan?

> +}
> +
> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.auto_boot = true,
> +	.ops = &wcss_sec_ops,

Please avoid unnecessary flexibility (i.e. ops is always wcss_sec_ops).

> +	.tmelcom = false,
> +};
> +
> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
> +	.pasid = WCSS_PAS_ID,
> +	.auto_boot = true,
> +	.ops = &wcss_sec_ops,
> +	.tmelcom = false,
> +};
> +
> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.auto_boot = true,
> +	.ops = &wcss_sec_ops,
> +	.tmelcom = true,
> +};
> +
> +static const struct of_device_id wcss_sec_of_match[] = {
> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
> +	{ .compatible = "qcom,ipq5424-wcss-sec-pil", .data = &wcss_sec_ipq5424_res_init },

Please sort alphabetically.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
> +

Regards,
Bjorn

> +static struct platform_driver wcss_sec_driver = {
> +	.probe = wcss_sec_probe,
> +	.remove = wcss_sec_remove,
> +	.driver = {
> +		.name = "qcom-wcss-secure-pil",
> +		.of_match_table = wcss_sec_of_match,
> +	},
> +};
> +module_platform_driver(wcss_sec_driver);
> +
> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

