Return-Path: <linux-arm-msm+bounces-38243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E159D1293
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 15:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8061C282BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB6419924E;
	Mon, 18 Nov 2024 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qSPIZy55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D08836;
	Mon, 18 Nov 2024 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731938561; cv=none; b=FT536aEeZfKOQ924IrY9sNQknfchhwiN7oZFhu3TNKNnaWM9ngz+SUWkT0o3vIkb4Z5YIxEnCPesw10O5+2jEe9fP9kRNoOZMguVqB8WMjaN3t61/D5YK1lhka4HIgKoiwpChtLHl/F65p2GwrW2YrO279je3AxW5ueYXmlF/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731938561; c=relaxed/simple;
	bh=pnoPWSE2kQs6V5C3DEIfZ9Urt1vmv3cikv+UcUv4nAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSWDF0xoVBHD8XMEae4gf7tDIHSFTbpQndixQaGgiUi0D7ZbKlMsDkdfyxgKnPUdDZh4ZSqZWiGjmYPCyhKE7YtbsqrWRZ56XqMMM3XGqeKA8F3ZkAxQvIOvl7e3ZLJbFgfue4+9fnnCoTDjYY4y1giq1fG6ge5jbQ2NiHN4r5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qSPIZy55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354B8C4CECC;
	Mon, 18 Nov 2024 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731938561;
	bh=pnoPWSE2kQs6V5C3DEIfZ9Urt1vmv3cikv+UcUv4nAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSPIZy55hgSbQcV2Y/3c9cSKVIs1vOBy8X68eH5HXg/ly9YK9Yujm/vOkaU8w29/F
	 DmsUCteCi52uyzdZRDB2EQUkPdCJ8nWfB8ICVS/tttVSx/5qYW4oJd2VGnFYN6Ntko
	 ex2u17fQx6L1FuaAUhdb8hMJ3SOP6K/qId5J/8Wk=
Date: Mon, 18 Nov 2024 15:02:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <2024111804-doze-reflected-0feb@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-5-quic_ekangupt@quicinc.com>

On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> Add changes to support debugfs. The fastrpc directory will be
> created which will carry debugfs files for all fastrpc processes.
> The information of fastrpc user and channel contexts are getting
> captured as part of this change.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/Makefile        |   3 +-
>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>  4 files changed, 205 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> 
> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> index 020d30789a80..4ff6b64166ae 100644
> --- a/drivers/misc/fastrpc/Makefile
> +++ b/drivers/misc/fastrpc/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> -fastrpc-objs	:= fastrpc_main.o
> \ No newline at end of file
> +fastrpc-objs	:= fastrpc_main.o \
> +		fastrpc_debug.o

Only build this file if debugfs is enabled.

And again, "debug.c"?

> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> new file mode 100644
> index 000000000000..cdb4fc6845a8
> --- /dev/null
> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2024 Qualcomm Innovation Center.
> +
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include "fastrpc_shared.h"
> +#include "fastrpc_debug.h"
> +
> +#ifdef CONFIG_DEBUG_FS

Please put the #ifdef in the .h file, not in the .c file.

> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> +{
> +	char cur_comm[TASK_COMM_LEN];
> +	int domain_id, size;
> +	char *debugfs_buf;
> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> +
> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> +	cur_comm[TASK_COMM_LEN-1] = '\0';
> +	if (debugfs_dir != NULL) {
> +		domain_id = fl->cctx->domain_id;
> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> +				current->pid, fl->tgid, domain_id) + 1;
> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
> +		if (debugfs_buf == NULL)
> +			return;
> +		/*
> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> +		 * domain_id in debugfs filename to create unique file name
> +		 */
> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> +			cur_comm, current->pid, fl->tgid, domain_id);
> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> +				debugfs_dir, fl, &fastrpc_debugfs_fops);

Why are you saving the debugfs file?  What do you need to do with it
that you can't just delete the whole directory, or look up the name
again in the future when removing it?

> +		kfree(debugfs_buf);
> +	}
> +}
> +
> +void fastrpc_remove_user_debugfs(struct fastrpc_user *fl)
> +{
> +	debugfs_remove(fl->debugfs_file);

Why remove just the file and not the whole directory?

> +}
> +
> +struct dentry *fastrpc_create_debugfs_dir(const char *name)
> +{
> +	return debugfs_create_dir(name, NULL);

At the root of debugfs?  Why is this function even needed?

> +}
> +
> +void fastrpc_remove_debugfs_dir(struct dentry *cctx_debugfs)
> +{
> +	debugfs_remove_recursive(cctx_debugfs);

See, you don't need the debugfs file reference at all, you don't do
anything with it.

And again, why are you wrapping basic debugfs functions with your own
version?  Please don't do that.

thanks,

greg k-h

