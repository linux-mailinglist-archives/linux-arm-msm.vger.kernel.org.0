Return-Path: <linux-arm-msm+bounces-30813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75F96CA0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 00:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E06728161C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 22:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1C713CA8A;
	Wed,  4 Sep 2024 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEXcTfGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6D535D4;
	Wed,  4 Sep 2024 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725487533; cv=none; b=mhhfKWoRyaDY/aSwjEmEyiVHfjTHQtuPyqNJirGU5PpOsU0Aijx5lP+2NwszGogrJJqNKOXWTJpL/i3hjmZbvyORJrJLWLaYEWqhdAVuyEnggtAlaZh6kVZ2oR2D/4c0Gk9vfExjQ1ihFqyHxNfKMXxhmV7J4o6tyuUUX0tFgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725487533; c=relaxed/simple;
	bh=GzCO57HQw3/FkzKNII7/AW7bLDuc3mFI+fN7PFgwbRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niQ5zIAWqix/T3n2LZz7ApBjdfNXqIZzPFw3gMFKgqYCmLcI8JQSGoUy2SS+lW//UsSbPSLVdeny9BQ/TFj/zJs8ABuZbxPcUqU21Q9SzZiRyJMTmyXumP9onIExgD4dd4Q2+n5oz1sBFFFsrD0i/3M9zLBgm9YwVE0YRh4po+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEXcTfGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50632C4CEC2;
	Wed,  4 Sep 2024 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725487532;
	bh=GzCO57HQw3/FkzKNII7/AW7bLDuc3mFI+fN7PFgwbRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEXcTfGa8MpENqDJOXIrD+rqgXL1Gx2112abHt09+D1ibT73PPryQXxWLUm2VcgQZ
	 uqWHvcCB2nQMu60OwJ1+DCFScfCN8hpkyv5isIroymd8YFoGNsqP+jlQhXnVa1ZFaf
	 61mnzMSUmxY+KFwJxSzQVzIEToAc8xc6RrAgttng9f+RzTsiYpxVaR2gp9Y/ieqWlk
	 A6bfR7648pwpTH33U3en7Cb9I4wNJY/EvTdIFRH+yBpbcoUv/00zSqzbXB6UDOK+pa
	 cnaU+Qj+tVY6NjNZ70GSAEYBV+Rh7cROTzNu6VzqHrDQXeJzvEDvHGu3v++p6cfQ7M
	 xwQJQXKRzT56Q==
Date: Wed, 4 Sep 2024 17:05:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Message-ID: <gaxovmf4uy4qz2zlfx5x3bdjtslhldfedmwqdlanxgl4t22ku5@mrvrdvwpo43j>
References: <cover.1724968351.git.quic_uchalich@quicinc.com>
 <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>

On Thu, Aug 29, 2024 at 03:15:54PM GMT, Unnathi Chalicheemala wrote:
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm".

Perhaps we can add the reason why bootloader/firmware is looking for
this node? Perhaps "looks for a node named qcom_scm, in order to patch
the wait queue IRQ information." ?

> However, DeviceTree uses node name "scm" and this
> mismatch prevents firmware from correctly identifying waitqueue IRQ
> information. Waitqueue IRQ is used for signaling between secure and
> non-secure worlds.
> 
> To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
> hardware irq number to be used from firmware instead of relying on data
> provided by devicetree, thereby bypassing the DeviceTree node name
> mismatch.
> 
> This hardware irq number is converted to a linux irq number using newly

Capitalize IRQ, and Linux throughout the message.

Regards,
Bjorn

> defined fill_irq_fwspec_params(). This linux irq number is then supplied to
> the threaded_irq call.
> 
> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 59 +++++++++++++++++++++++++++++++-
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 00c379a3cceb..ed51fbb1c065 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -32,6 +32,14 @@
>  #include "qcom_scm.h"
>  #include "qcom_tzmem.h"
>  
> +#define GIC_SPI_BASE            32
> +#define GIC_MAX_SPI             987  // 1019 - 32
> +#define GIC_ESPI_BASE           4096
> +#define GIC_MAX_ESPI            1024 // 5120 - 4096
> +
> +#define GIC_IRQ_TYPE_SPI        0
> +#define GIC_IRQ_TYPE_ESPI       2
> +
>  static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
>  module_param(download_mode, bool, 0);
>  
> @@ -1819,6 +1827,55 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>  
> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
> +{
> +	if (WARN(virq < GIC_SPI_BASE, "Unexpected virq: %d\n", virq)) {
> +		return -ENXIO;
> +	} else if (virq <= (GIC_SPI_BASE + GIC_MAX_SPI)) {
> +		fwspec->param_count = 3;
> +		fwspec->param[0] = GIC_IRQ_TYPE_SPI;
> +		fwspec->param[1] = virq - GIC_SPI_BASE;
> +		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> +	} else if (WARN(virq < GIC_ESPI_BASE, "Unexpected virq: %d\n", virq)) {
> +		return -ENXIO;
> +	} else if (virq < (GIC_ESPI_BASE + GIC_MAX_ESPI)) {
> +		fwspec->param_count = 3;
> +		fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
> +		fwspec->param[1] = virq - GIC_ESPI_BASE;
> +		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
> +	} else {
> +		WARN(1, "Unexpected virq: %d\n", virq);
> +		return -ENXIO;
> +	}
> +	return 0;
> +}
> +
> +static int qcom_scm_get_waitq_irq(void)
> +{
> +	int ret;
> +	u32 hwirq;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +	struct irq_fwspec fwspec;
> +
> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	fwspec.fwnode = of_node_to_fwnode(__scm->dev->of_node);
> +	hwirq = res.result[1] & 0xffff;
> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
> +	if (ret)
> +		return ret;
> +	ret = irq_create_fwspec_mapping(&fwspec);
> +
> +	return ret;
> +}
> +
>  static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>  {
>  	/* FW currently only supports a single wq_ctx (zero).
> @@ -1936,7 +1993,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Let all above stores be available after this */
>  	smp_store_release(&__scm, scm);
>  
> -	irq = platform_get_irq_optional(pdev, 0);
> +	irq = qcom_scm_get_waitq_irq();
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
>  			return irq;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 685b8f59e7a6..ab0f88f5f777 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -143,6 +143,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> +#define QCOM_SCM_WAITQ_GET_INFO		0x04
>  
>  #define QCOM_SCM_SVC_GPU			0x28
>  #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
> -- 
> 2.34.1
> 

