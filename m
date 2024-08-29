Return-Path: <linux-arm-msm+bounces-30146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCE9653A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 01:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 636321C22B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 23:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5018F2D1;
	Thu, 29 Aug 2024 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEUTfNLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08F18EFEB;
	Thu, 29 Aug 2024 23:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724975146; cv=none; b=OwLoS4kTkt0c7SMVnYHAsvi0Vgjg332W+NY+tZ15SJxnU99Pv5YNZva3IvBS3zLAEwu8etZ4ppswojBMKvEOiWq0BPtKSFXGemiLHVreN2qO3y3YEi5Dfgake405nXvAlBIuoEKLWYXNkcR2VU9YHBv/2rVo+aGpo+mAvNr+GaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724975146; c=relaxed/simple;
	bh=mB+gFgRsjrN1n+Vmo4u3AaQ+WoeWXnfwpWmVbAnCFqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smxYXt6iUPtSbp3sP4+4SUCL8ERNAmvEtHgOjc5Hxaplh0T0zBaDr/skrz0nzt0QznkE2L+IVZ3E7kbfwIMrD9c3H3hHj3sGzFz1npnA6K+VeJrOc8u+5nJt893fnFG19J+gaaiyVOFM1GH/HHyd1CtRGDtWNrOUuRBfnqr9pVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEUTfNLz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BE9C4CEC3;
	Thu, 29 Aug 2024 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724975145;
	bh=mB+gFgRsjrN1n+Vmo4u3AaQ+WoeWXnfwpWmVbAnCFqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEUTfNLz4GKXtANc/aeaMq4xCcZPhy7mByMa/ACg1eOE/UynPYS6H7CiOpkgLQ5KZ
	 /2tu+Sbss+514G8Nv8psWJ8hzTntQkbslQMhJUDfwVnmVSpKJMRKGEr81Uym+ozFYB
	 9expCgAmyXUewVYBfUA0CwsiIoh6ZWdzptgzMH9/3B/Tt+UeDW3Rtib7qM3ODM1vIq
	 zDzh8grbPeDcDR5Y/1w6L0g7JxgiRHqYpHO728Lj/AqEUmGvFmEgGqnCjfjsYZTF+5
	 yyrUXhFGX0D5qK74RHBEJY5X80Aj91hpr3jjcuXHFGfrLrj2qYHCwOyBLhZdpGka/i
	 BmJPQv3PKOy0w==
Message-ID: <343c2bc4-46b5-443b-bb3b-ed4a45ecce76@kernel.org>
Date: Fri, 30 Aug 2024 01:45:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com
References: <cover.1724968351.git.quic_uchalich@quicinc.com>
 <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <9acc746885d6b06c2333f0493413c44b85fa7f02.1724968351.git.quic_uchalich@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 12:15 AM, Unnathi Chalicheemala wrote:
> Bootloader and firmware for SM8650 and older chipsets expect node
> name as "qcom_scm". However, DeviceTree uses node name "scm" and this
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

Are these going to remain constant on different implementations of the
interrupt controller across different SoCs that use this? Are these
mandated anywhere in the arm spec and/or present across the tree with
parts touching gicv3?

Also, the subtraction comments take some guesswork.. perhaps something like
0..31 etc. would be easier.

The MAX_(E)SPI macros could also just have the hwirq number to make the
if-conditions below simpler

> +
> +#define GIC_IRQ_TYPE_SPI        0
> +#define GIC_IRQ_TYPE_ESPI       2

We can definitely use dt-bindings for this

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

This could use some prettifying (incl the previous comment):

if (GIC_SPI_BASE <= virq && virq <= GIC_SPI_MAX) {
	fwspec->param[0] = GIC_IRQ_TYPE_SPI;
	fwspec->param[1] = virq - GIC_SPI_BASE;
} else if (GIC_ESPI_BASE <= virq && virq <= GIC_ESPI_MAX) {
	fwspec->param[0] = GIC_IRQ_TYPE_ESPI;
	fwspec->param[1] = virq - GIC_ESPI_BASE;
} else {
	WARN(1, "Unexpected virq"...
	return -ENXIO;
}

fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
fwspec->param_count = 3;

is much easier to follow along in my opinion

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

GENMASK(15, 0)

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

Is this smc call left unimplemented on !auto platforms? If it's not
(or it spits out bogus data), we're going to get a WARN splat in the
log..

Additionally, this mechanism ties the trustzone and hypervisor together..
Why isn't this done in gunyah which abstracts these resources? A hypercall
sounds much saner than tying in a third party into the mix

Konrad

