Return-Path: <linux-arm-msm+bounces-76271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D11BC2CC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1728B3C1C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F66A248898;
	Tue,  7 Oct 2025 21:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSrD36xy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FF248886;
	Tue,  7 Oct 2025 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873935; cv=none; b=M1pnCwccT53ZmT6iqVqv5Ruig0bWF5A9pmRh4ZEvMNPeE4NRS36wvrAAxnEKuB3M8iFphG79oGpH0xPdHfv8t6QkW1VgYV1C8z7uQpW9bgIKNq6K79fn8TgI9qt701+md5PJt8eRYTPQKRp33CDqgrYn+Nrr3lrdPNrGgEF2Eiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873935; c=relaxed/simple;
	bh=TMwIds0fuxfKRBQzxd/ixcrte7vyYIAz+jX147CkLDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlN7FV9Q6+/2ug0wYKVTCeX5Vbd+SBz3niyQ8SO9wPBNTlXhS4C+4mzWN5lWD6mEX3Jh6IMUUnSbqbnXcIQ3LkeuIjtr4UoJk0jNFW4e5T1QD6stzZBmpFoznamHKplGrJOGrGQckN3Kl1Jc7j+Dut18YZDDdNm+iS5ER2b52ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSrD36xy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF006C4CEF1;
	Tue,  7 Oct 2025 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759873934;
	bh=TMwIds0fuxfKRBQzxd/ixcrte7vyYIAz+jX147CkLDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSrD36xywBi7OfvFdz3w8RLfn5c4KIRcDrjkhhR9kT04IvayhOYLGrShtGwuLWAxp
	 MI+/n4IBMV/qIS5/+icQSKEcixKWy71grk631y0bi8+/AmcI2TLlz+KhzRva8Ewp2+
	 K452qQySI7NhoBDJ9TzH3tOvwP8uu2X31Ss2EkXDh8zUNFDKr5g7XImpxcMNgsz0Wk
	 X1A7N2JA040KMLQ1b2g0VfVAmRdb1RhqyXsMcfcEoDhMWc6jue35/MmU8O4pJNrETB
	 llYSOksomLxzc/4QmzRXHuiHGUZkiYaS/r2EzwKWFM7wmYG/g2QRZ06VRzx15Ci6R8
	 GUX6kZhK7YqAg==
Date: Tue, 7 Oct 2025 14:52:13 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <fo6q3gl3dmcso5gcfp2taaao3qwazxw5uutkcwi6qg4aojt2av@tprjv3xhcs57>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:56PM +0530, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles IOMMU configuration. This includes mapping memory regions and
> device memory resources for remote processors by intercepting
> qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> during teardown. Additionally, SHM bridge setup is required to enable
> memory protection for both remoteproc metadata and its memory regions.
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which indicates default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 61 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ed7bd931dfd5..940fd89d4fc4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
> +#include <linux/iommu.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -255,6 +256,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> +{
> +	if (rproc->has_iommu)
> +		iommu_unmap(rproc->domain, mem_phys, size);
> +}
> +
> +static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> +{
> +	int ret = 0;
> +
> +	if (rproc->has_iommu)
> +		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
> +				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
> +	return ret;
> +}
> +
>  static int qcom_pas_start(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -289,11 +306,15 @@ static int qcom_pas_start(struct rproc *rproc)
>  	}
>  
>  	if (pas->dtb_pas_id) {
> -		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
> +		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> +		if (ret)
> +			goto disable_px_supply;
> +
> +		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>  		if (ret) {
>  			dev_err(pas->dev,
>  				"failed to authenticate dtb image and release reset\n");
> -			goto disable_px_supply;
> +			goto unmap_dtb_carveout;
>  		}
>  	}
>  
> @@ -304,18 +325,22 @@ static int qcom_pas_start(struct rproc *rproc)
>  
>  	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
>  
> -	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
> +	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
> +	if (ret)
> +		goto release_pas_metadata;
> +
> +	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
>  	if (ret) {
>  		dev_err(pas->dev,
>  			"failed to authenticate image and release reset\n");
> -		goto release_pas_metadata;
> +		goto unmap_carveout;
>  	}
>  
>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>  	if (ret == -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
>  		qcom_scm_pas_shutdown(pas->pas_id);
> -		goto release_pas_metadata;
> +		goto unmap_carveout;
>  	}
>  
>  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> @@ -327,10 +352,16 @@ static int qcom_pas_start(struct rproc *rproc)
>  
>  	return 0;
>  
> +unmap_carveout:
> +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_scm_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +
> +unmap_dtb_carveout:
> +	if (pas->dtb_pas_id)
> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>  disable_px_supply:
>  	if (pas->px_supply)
>  		regulator_disable(pas->px_supply);
> @@ -386,8 +417,12 @@ static int qcom_pas_stop(struct rproc *rproc)
>  		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
>  		if (ret)
>  			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
> +
> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>  	}
>  
> +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> +
>  	handover = qcom_q6v5_unprepare(&pas->q6v5);
>  	if (handover)
>  		qcom_pas_handover(&pas->q6v5);
> @@ -757,6 +792,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> +		struct of_phandle_args args;
> +
> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> +						 "#iommu-cells", 0, &args);
> +		if (ret < 0)
> +			return ret;
> +
> +		rproc->has_iommu = true;
> +		of_node_put(args.np);
> +	} else {
> +		rproc->has_iommu = false;

Default value is false, is't it?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

