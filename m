Return-Path: <linux-arm-msm+bounces-33301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E02A99228A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 03:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8AEE1F21AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 01:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEDFDDC7;
	Mon,  7 Oct 2024 01:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+6EDAXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A5C8D7;
	Mon,  7 Oct 2024 01:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728263914; cv=none; b=qGf2eUmLXn5d7F45wkEE4Zu/1wnqRrSvnluc/+uKYx4dncpQ83Zctvo1kbi2HdtQarAG0ca8NaEl0YNBafjMcYD+8oIeY++oztC4eUjuvPqHQMCBf7DwmQYYpxENXDoi7LmC3VkDTIOH1qjzPTlu6QSH6MoyNmW1ZxKOgWQ96BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728263914; c=relaxed/simple;
	bh=jIeIDhuD7B6PYQz4howXktaATGkaNZIsJZVVjgkjcTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvH55Deki2wVqKSPf5pt+j96VDV+d9Cecnn4YolK8eTdmJoNnksUR7hiTTe0eojG7H1b+00MgHpmeXz3uSH4eUUY/u/1IhiX4nmoOdXcahDycXjlKo09iNIjRWCTwR81bPbgXRag4bz8AUvtAqG1my093sZGhb0CDf6wdd1iHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+6EDAXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B74C4CEC5;
	Mon,  7 Oct 2024 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728263913;
	bh=jIeIDhuD7B6PYQz4howXktaATGkaNZIsJZVVjgkjcTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+6EDAXlNOOeJqTi76IspB4TOMesu0BGTg31mLIFZvw6hJsArpmC6KX1zJ5E6ZKu8
	 2/ZIpzwyAVcVXBajOOXxFlU+/Rlz1eTsTS8p2iJPSjC35hHsCmpukIzOYe3TlJ5kvJ
	 a5SLvN5GPnTRX+LBBjETgaN3ifc2xF/G4DmgMsz9RUbchWv9x63aq3KmHY/y9M7PMS
	 aw0E3KBkLJXwLkwzJsVOF7Hz65kMydVCbqWk8Dj69rLKpMxQZjVb6y7qapxtyH2GfI
	 n3DYkyqzXMGB6+56cd2EmVyRT3CEfr0Etlnpg3ksCi3vfQCg+INdtq7q0LM0uHBLga
	 27VHQ7B6/NODg==
Date: Sun, 6 Oct 2024 20:18:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
Message-ID: <ylfkupkpy26gupri4lbwij3sh4uwrm7lxr7q7q2rhrgiwai6mc@bkplz3mlrsxb>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005140150.4109700-3-quic_kuldsing@quicinc.com>

On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
> The qcom_tzmem driver currently has multiple exposed APIs that lack
> validations on input parameters. This oversight can lead to unexpected
> crashes due to null pointer dereference when incorrect inputs are
> provided.
> 
> To address this issue, add required sanity for all input parameters in
> the exposed APIs.
> 

Unless there's good reason for the opposite, I rather see that we define
the API to only accept valid pointers. Then if a client passes a NULL we
get a oops with a nice callstack, which is easy to debug.

The alternative is that we return -EINVAL, which not unlikely is
propagated to some application which may or may not result in a bug
report from a user - without any tangible information about where things
went wrong.

But, if you think there's a good reason, please let me know.

Regards,
Bjorn

> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 92b365178235..2f2e1f2fa9fc 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>  
>  	might_sleep();
>  
> +	if (!config || !config->policy)
> +		return ERR_PTR(-EINVAL);
> +
>  	switch (config->policy) {
>  	case QCOM_TZMEM_POLICY_STATIC:
>  		if (!config->initial_size)
> @@ -316,6 +319,9 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>  	struct qcom_tzmem_pool *pool;
>  	int ret;
>  
> +	if (!dev || !config)
> +		return ERR_PTR(-EINVAL);
> +
>  	pool = qcom_tzmem_pool_new(config);
>  	if (IS_ERR(pool))
>  		return pool;
> @@ -366,7 +372,7 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
>  	unsigned long vaddr;
>  	int ret;
>  
> -	if (!size)
> +	if (!pool || !size)
>  		return NULL;
>  
>  	size = PAGE_ALIGN(size);
> @@ -412,6 +418,9 @@ void qcom_tzmem_free(void *vaddr)
>  {
>  	struct qcom_tzmem_chunk *chunk;
>  
> +	if (!vaddr)
> +		return;
> +
>  	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
>  		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
>  					       (unsigned long)vaddr, NULL);
> @@ -446,6 +455,9 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
>  	void __rcu **slot;
>  	phys_addr_t ret;
>  
> +	if (!vaddr)
> +		return 0;
> +
>  	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
>  
>  	radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
> @@ -466,6 +478,9 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
>  
>  int qcom_tzmem_enable(struct device *dev)
>  {
> +	if (!dev)
> +		return -EINVAL;
> +
>  	if (qcom_tzmem_dev)
>  		return -EBUSY;
>  
> -- 
> 2.34.1
> 

