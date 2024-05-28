Return-Path: <linux-arm-msm+bounces-20843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C18D2701
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EF7B1F2534E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAF717B43C;
	Tue, 28 May 2024 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onsvdPnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237A17B432;
	Tue, 28 May 2024 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716931634; cv=none; b=SJw0v5SLS0seIXz7ti/7aKH5FRhELVMkAFLS4bbDvfnVftahwO/YeFVISswC6pkzNqOAa88tP7eAdf6Jg7Rw5yVeqZMGBu05rM1lmgeixl8xIy1em98RXRiIEnx4jpvY/dYFIe9vuRZGgW46fPEgm8IXWO3TZg5Tuy2n+1J/0Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716931634; c=relaxed/simple;
	bh=I1/rPkBVRL+mZ4abLJj6ktTmgOZwov5VOgii3O+1e/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9K+WgTyrFZhNRiynfjcF9AjhICVxGIPqR05PtXMRVhH4II8tZrtOEDo1iyEY7i4e39nQx3w3WKRn0DuSSbSiw6tvVGyETevZTDAsHA5UWbFouDI0F6opyRUtH7L0GYZZrC8vRp8a28kC1cKoNE5287YfoE/wO2BkhNinuKzcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onsvdPnv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64163C3277B;
	Tue, 28 May 2024 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716931633;
	bh=I1/rPkBVRL+mZ4abLJj6ktTmgOZwov5VOgii3O+1e/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onsvdPnvSR9jUn3MMH6xETjjunFTtNntwjGExPLhXIBUT8afQHyqUkn+F2Oy1LXm9
	 frU+wsqgNJ8Eir0x+deTPWksi4qsdT5WO97baiEBFnE6A2jGVZVQR5EXcNHYUVQCuo
	 7bmqu3MJGwkSASwLB/DLTHss8kUcWVEZ8HjnbmanYhx/3QxNhLY8Uz8JOe9AoxX5Yk
	 u4Gogfch8L6RHnGDnRbGA1Jr6rEUgzOnYK0fBxnTBaqjm5hbMjhMN006Hazgh/GZBx
	 D9rgeVO08BcqmnemFTV2ff8el4BzvtsShc1VllPob0bcBUdKJlFs9TWKQN8XAzl5NL
	 /zZiXMB53X49Q==
Date: Tue, 28 May 2024 16:27:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: mathieu.poirier@linaro.org, konrad.dybcio@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10] remoteproc: qcom: Move minidump related layout and
 API to soc/qcom directory
Message-ID: <jukn3ip6m6twfgxs6olnn5nxfsskewfwgfms3fb47w5jefuful@lne6rvpcqqju>
References: <1714724287-12518-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1714724287-12518-1-git-send-email-quic_mojha@quicinc.com>

On Fri, May 03, 2024 at 01:48:07PM GMT, Mukesh Ojha wrote:
> Currently, Qualcomm Minidump is being used to collect mini version of
> remoteproc coredump with the help of boot firmware however, Minidump
> as a feature is not limited to be used only for remote processor and
> can also be used for Application processors. So, in preparation of
> using it move the Minidump related data structure and its function
> to its own file under drivers/soc/qcom with qcom_rproc_minidump.c
> which clearly says it is only for remoteproc minidump.
> 
> Extra changes made apart from the movement is,
> 1. Adds new config, kernel headers and module macros to get this
>    module compiled.
> 2. Guards the qcom_minidump() with CONFIG_QCOM_RPROC_MINIDUMP.
> 3. Selects this QCOM_RPROC_MINIDUMP config when QCOM_RPROC_COMMON
>    enabled.
> 4. Added new header qcom_minidump.h .
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

I wouldn't be able to merge this without anything depending on it...

[..]
> diff --git a/drivers/soc/qcom/qcom_rproc_minidump.c b/drivers/soc/qcom/qcom_rproc_minidump.c
[..]
> +void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> +		void (*rproc_dumpfn_t)(struct rproc *rproc,
> +		struct rproc_dump_segment *segment, void *dest, size_t offset,
> +		size_t size))
> +{
> +	int ret;
> +	struct minidump_subsystem *subsystem;
> +	struct minidump_global_toc *toc;
> +
> +	/* Get Global minidump ToC*/
> +	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
> +
> +	/* check if global table pointer exists and init is set */
> +	if (IS_ERR(toc) || !toc->status) {
> +		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
> +		return;
> +	}
> +
> +	/* Get subsystem table of contents using the minidump id */
> +	subsystem = &toc->subsystems[minidump_id];
> +
> +	/**
> +	 * Collect minidump if SS ToC is valid and segment table
> +	 * is initialized in memory and encryption status is set.
> +	 */
> +	if (subsystem->regions_baseptr == 0 ||
> +	    le32_to_cpu(subsystem->status) != 1 ||
> +	    le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED) {
> +		return rproc_coredump(rproc);
> +	}
> +
> +	if (le32_to_cpu(subsystem->encryption_status) != MINIDUMP_SS_ENCR_DONE) {
> +		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
> +		return;
> +	}
> +
> +	/**
> +	 * Clear out the dump segments populated by parse_fw before
> +	 * re-populating them with minidump segments.
> +	 */
> +	rproc_coredump_cleanup(rproc);

I don't think this should be invoked outside drivers/remoteproc, and the
comment talks about a remoteproc-internal concern...

> +
> +	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);

This function changes the internal state of the remoteproc and relies on
other operations to clean things up.

I think we could come up with a better design of this, and I don't think
we should spread this outside of the remoteproc framework.

Regards,
Bjorn

> +	if (ret) {
> +		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
> +		goto clean_minidump;
> +	}
> +	rproc_coredump_using_sections(rproc);
> +clean_minidump:
> +	qcom_minidump_cleanup(rproc);
> +}
> +EXPORT_SYMBOL_GPL(qcom_minidump);
> +
> +MODULE_DESCRIPTION("Qualcomm Remoteproc Minidump helper module");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/qcom/qcom_minidump.h b/include/soc/qcom/qcom_minidump.h
> new file mode 100644
> index 000000000000..0fe156066bc0
> --- /dev/null
> +++ b/include/soc/qcom/qcom_minidump.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_MINIDUMP_H_
> +#define _QCOM_MINIDUMP_H_
> +
> +struct rproc;
> +struct rproc_dump_segment;
> +
> +#if IS_ENABLED(CONFIG_QCOM_RPROC_MINIDUMP)
> +void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> +		   void (*rproc_dumpfn_t)(struct rproc *rproc,
> +		   struct rproc_dump_segment *segment, void *dest, size_t offset,
> +		   size_t size));
> +#else
> +static inline void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> +		   void (*rproc_dumpfn_t)(struct rproc *rproc,
> +		   struct rproc_dump_segment *segment, void *dest, size_t offset,
> +		   size_t size)) { }
> +#endif /* CONFIG_QCOM_RPROC_MINIDUMP */
> +#endif /* _QCOM_MINIDUMP_H_ */
> -- 
> 2.7.4
> 

