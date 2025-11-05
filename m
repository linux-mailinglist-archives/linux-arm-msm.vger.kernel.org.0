Return-Path: <linux-arm-msm+bounces-80492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70194C3831A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 23:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 234914E1C76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 22:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE612F1FC5;
	Wed,  5 Nov 2025 22:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8iv9g/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD22DF6EA;
	Wed,  5 Nov 2025 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381688; cv=none; b=e+pYpaDEiSnciWNgSSbU0llKmLf5LEfJTapVVh1rU+3LnGyvBJ16B7hTuoL32GHUnV7t3rsBlCfqhpV2UB7ZH1qqEeRp3j+qPBEr6ZRYYnXW/5qJoxBGR5waU9/qss7lcOzdARoSmhFrl+c6N5lZgRq2LRVIS1g+SZ+LGdrLIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381688; c=relaxed/simple;
	bh=YbGVu71YZkImQjgmhlDTu5GSqIXCdlKNFblMING4tEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzJ4jaBI4HnoIn5wfpLVTfcP8Vw88ycD0Djzucj+nfM83NU+xOD+0m3Gm6EoFn9cMG9Y3WZllm3870Yv/Fq/ejJyX/lA+vl0rzYxq0ZfQLl7U60n42DIHjXjIxfABkj67SBerVCjqPrTFdj09T3qHLFYlpKVFJH1GgBegG+0Jcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8iv9g/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2224C4CEF5;
	Wed,  5 Nov 2025 22:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762381687;
	bh=YbGVu71YZkImQjgmhlDTu5GSqIXCdlKNFblMING4tEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8iv9g/UIr+0WzwSQ+GeE1DSQOiECg8faqKgcYg6sN/OWDcp5fCQD6Hgf4llEb8XL
	 +bTSDYym7s3ZsOGrvm1gKLlZXFmMBb5F4koR2juSVeU1m8zTimN4IQEnTb+JgadARK
	 ekWAzXMnUWp9T7I1sm0J8Ojwx8tncA/NV1AJW3hBwDAQwS6mjpgI+4kEBiY7ukGi3K
	 AR3Y13UGkFwIP0S0SYHxlaYu2bFjOtFhjstv9eNQ8pOgeuXLWlSchXxnkQ+gbxhS7h
	 O+bVv6+6B6Bcxaebka87ebj0+CE9BzFzNKrJwqc/c3Y4r9UMOmUd3MGv4GjXVyQbpW
	 hLYUAKMy77FXw==
Date: Wed, 5 Nov 2025 16:31:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 3/3] bus: mhi: ep: Add loopback driver for data path
 testing
Message-ID: <myzlzn6jv5ghpdj2k4gbcqh6bogi6w67yu6nj4haib4asgkapi@ddy4ebdpb6xt>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-3-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-loopback_mhi-v2-3-727a3fd9aa74@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 11:09:07AM +0530, Sumit Kumar wrote:
> Add loopback driver for MHI endpoint devices. The driver receives

Start by establishing why we want this.

> data on the uplink channel and echoes it back on the downlink
> channel using a workqueue for asynchronous processing.
> 
> The driver is useful for testing MHI endpoint data path functionality
> and debugging communication issues.
> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/Kconfig           |   8 +++
>  drivers/bus/mhi/ep/Makefile          |   1 +
>  drivers/bus/mhi/ep/mhi_ep_loopback.c | 134 +++++++++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
> index 90ab3b040672e0f04181d4802e3062afcc7cf782..ce7b63c2da82a6ca49528517687f4910552c35bb 100644
> --- a/drivers/bus/mhi/ep/Kconfig
> +++ b/drivers/bus/mhi/ep/Kconfig
> @@ -8,3 +8,11 @@ config MHI_BUS_EP
>  
>  	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
>  	  such as SDX55 modem connected to the host machine over PCIe.
> +
> +config MHI_BUS_EP_LOOPBACK
> +	tristate "MHI Endpoint loopback driver"
> +	depends on MHI_BUS_EP
> +	help
> +	  MHI endpoint loopback driver for data path testing.
> +	  This driver receives data on the uplink channel and echoes
> +	  it back on the downlink channel for testing purposes.
> diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
> index aad85f180b707fb997fcb541837eda9bbbb67437..02e4700e8dc3f860d40290476b0a852286683f8f 100644
> --- a/drivers/bus/mhi/ep/Makefile
> +++ b/drivers/bus/mhi/ep/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
>  mhi_ep-y := main.o mmio.o ring.o sm.o
> +obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
> diff --git a/drivers/bus/mhi/ep/mhi_ep_loopback.c b/drivers/bus/mhi/ep/mhi_ep_loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ba6154dd9b785f051043c10a980ab340012ba986
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/mhi_ep_loopback.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mhi_ep.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +
> +struct mhi_ep_loopback {
> +	struct workqueue_struct *loopback_wq;
> +	struct mhi_ep_device *mdev;
> +};
> +
> +struct mhi_ep_loopback_work {
> +	struct mhi_ep_device *mdev;
> +	struct work_struct work;
> +	void *buf;
> +	size_t len;
> +};
> +
> +static void mhi_ep_loopback_work_handler(struct work_struct *work)
> +{
> +	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
> +								struct mhi_ep_loopback_work, work);
> +	int ret;
> +
> +	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
> +			       mhi_ep_lb_work->len);

If you didn't use the "pile of abbreviations" naming scheme for your
local variables, you wouldn't have to line break this.

> +	if (ret) {
> +		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
> +		kfree(mhi_ep_lb_work->buf);
> +	}
> +
> +	kfree(mhi_ep_lb_work);
> +}
> +
> +static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
> +					struct mhi_result *mhi_res)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
> +	struct mhi_ep_loopback_work *mhi_ep_lb_work;
> +	void *buf;
> +
> +	if (!(mhi_res->transaction_status)) {

Unnecessary parenthesis.

> +		buf = kmalloc(mhi_res->bytes_xferd, GFP_KERNEL);
> +		if (!buf) {
> +			dev_err(&mhi_dev->dev, "Failed to allocate buffer\n");

No error prints on alloc failures, the kernel has already printed for
you.

> +			return;
> +		}
> +
> +		memcpy(buf, mhi_res->buf_addr, mhi_res->bytes_xferd);

kmalloc + memcpy == kmemdup()

> +
> +		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
> +		if (!mhi_ep_lb_work) {
> +			dev_err(&mhi_dev->dev, "Unable to allocate the work structure\n");

Ditto.

> +			kfree(buf);
> +			return;
> +		}
> +
> +		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
> +		mhi_ep_lb_work->mdev = mhi_dev;
> +		mhi_ep_lb_work->buf = buf;
> +		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
> +
> +		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
> +	}
> +}
> +
> +static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
> +					struct mhi_result *mhi_res)
> +{
> +	void *buf;
> +
> +	if (mhi_res->transaction_status)
> +		return;
> +
> +	buf = mhi_res->buf_addr;
> +	if (buf)
> +		kfree(buf);

No need to check for NULL, or have a local variable.

kfree(mhi_res->buf_addr);

> +}
> +
> +static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb;
> +
> +	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(struct mhi_ep_loopback), GFP_KERNEL);
> +	if (!mhi_ep_lb)
> +		return -ENOMEM;
> +
> +	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_loopback", WQ_MEM_RECLAIM);
> +	if (!mhi_ep_lb->loopback_wq) {
> +		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
> +		return -ENOMEM;
> +	}
> +
> +	mhi_ep_lb->mdev = mhi_dev;
> +	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
> +
> +	return 0;
> +}
> +
> +static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
> +
> +	destroy_workqueue(mhi_ep_lb->loopback_wq);
> +	dev_set_drvdata(&mhi_dev->dev, NULL);

Shouldn't be necessary to clear drvdata here.

> +}
> +
> +static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
> +
> +static struct mhi_ep_driver mhi_ep_loopback_driver = {
> +	.probe = mhi_ep_loopback_probe,
> +	.remove = mhi_ep_loopback_remove,
> +	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
> +	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
> +	.id_table = mhi_ep_loopback_id_table,
> +	.driver = {
> +		.name = "mhi_ep_loopback",
> +		.owner = THIS_MODULE,

module_mhi_ep_driver() assigns owner for you...

Regards,
Bjorn

> +	},
> +};
> +
> +module_mhi_ep_driver(mhi_ep_loopback_driver);
> +
> +MODULE_AUTHOR("Krishna chaitanya chundru <krishna.chundru@oss.qualcomm.com>");
> +MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 

