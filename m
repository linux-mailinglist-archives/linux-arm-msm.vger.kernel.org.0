Return-Path: <linux-arm-msm+bounces-20490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A08CF600
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 May 2024 22:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB3431C20983
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 May 2024 20:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C57F374FE;
	Sun, 26 May 2024 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsmZax6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B31A2C26;
	Sun, 26 May 2024 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716756382; cv=none; b=nSOYSSYVI2yesFCHRlgqzllG8GgNgyPqaEzKSBkbMluFgX3qcrcN2tpB8gcq6x+KssNquFyBMTvbWDgvghSXRDblYs41kBz1mssB8csFXXHel25jmtVD07QW8xDBLJlltuCP1zXFJbu3yjKr/TEcu+QtYjuu45kfrD23l/XWOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716756382; c=relaxed/simple;
	bh=rt+luzDKVTP2ZR/sRuF+JTDWUKx2Jda97Licl23pJpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWK8jRMpAJeVpIyKpsBSi2hJgMAqOs+XiIWjCT2Cq6tsB2soRPuxR66yTbsAE4ciEaWGicr9zAYGcvAwF0mJySK/BOf5EhmJsdJfFkuR5ZKhnrmXqE2SOM0fBQIIOlSKW7GTzT1ElIj9H59HAN9xXhWbhSGGNCCZMc0eeICSMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsmZax6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675ACC2BD10;
	Sun, 26 May 2024 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716756381;
	bh=rt+luzDKVTP2ZR/sRuF+JTDWUKx2Jda97Licl23pJpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsmZax6Yx3f5lNdSyocfqc+vTxOaLnwtvDKqz5V3HtPnVgOrV89wB9ll0CYKii5zG
	 ZG7VvqrRdVLGI1KbK4zbsCly7pQhAnM8zfJ7qf+hqI9Z3seImnu0fFwWDFwV/5+hrw
	 EstKGuzt3ozMg6LmBn+rSdU3Lmlf/Gpg97NBHAvvyjF1AR/BjRUjjHSHxZuoJgU8kI
	 C6jWEQzs1QJvB5VAv1HCpBor8lKehM5UGgJjRk15mRXr2Qv4i52ZyQgVQW3vfKZzc6
	 pnfl5WBQt/dHNs/K4AXmxwdR3mxTzkIABqvoJdfukqSpGuleXq45+Gx3DjtJLZUXeP
	 RiRavu8oB1J/g==
Date: Sun, 26 May 2024 15:46:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
Message-ID: <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>

On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
> For SCM protection, memory allocation should be physically contiguous,
> 4K aligned, and non-cacheable to avoid XPU violations. This granularity
> of protection applies from the secure world. Additionally, it's possible
> that a 32-bit secure peripheral will access memory in SoCs like
> sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
> needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
> pool can be used with dma_alloc APIs.
> 
> However, dma_alloc APIs will fall back to the buddy pool if the requested
> size is less than or equal to PAGE_SIZE. It's also possible that the remote
> processor's metadata blob size is less than a PAGE_SIZE. Even though the
> DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
> back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
> is disabled.

Does "fail" here mean that the buddy heap returns a failure - in some
case where dma_alloc would have succeeded, or that it does give you
a PAGE_SIZE allocation which doesn't meeting your requirements?

From this I do find the behavior of dma_alloc unintuitive, do we know if
there's a reason for the "equal to PAGE_SIZE" case you describe here?

> 
> To address this issue, use an extra page as padding to ensure allocation
> from the CMA region. Since this memory is temporary, it will be released
> once the remote processor is up or in case of any failure.
> 

Thanks for updating the commit message, this is good.

Regards,
Bjorn

> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  - Described the issue more clearly in commit text.
> 
>  drivers/firmware/qcom/qcom_scm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 520de9b5633a..0426972178a4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -538,6 +538,7 @@ static void qcom_scm_set_download_mode(bool enable)
>  int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  			    struct qcom_scm_pas_metadata *ctx)
>  {
> +	size_t page_aligned_size;
>  	dma_addr_t mdata_phys;
>  	void *mdata_buf;
>  	int ret;
> @@ -555,7 +556,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	 * data blob, so make sure it's physically contiguous, 4K aligned and
>  	 * non-cachable to avoid XPU violations.
>  	 */
> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> +	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);
> +	mdata_buf = dma_alloc_coherent(__scm->dev, page_aligned_size, &mdata_phys,
>  				       GFP_KERNEL);
>  	if (!mdata_buf) {
>  		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
> @@ -580,11 +582,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  
>  out:
>  	if (ret < 0 || !ctx) {
> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +		dma_free_coherent(__scm->dev, page_aligned_size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
>  		ctx->ptr = mdata_buf;
>  		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +		ctx->size = page_aligned_size;
>  	}
>  
>  	return ret ? : res.result[0];
> -- 
> 2.7.4
> 

