Return-Path: <linux-arm-msm+bounces-33213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F934991C33
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E091F21ABA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 02:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C39E1DFE4;
	Sun,  6 Oct 2024 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7Gp1ezb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A8628EC;
	Sun,  6 Oct 2024 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728182789; cv=none; b=uBIOqQCk2dzLY0RDqVdx3/wSPplBuWsp17LD7UY39qI+UuiiQxN1V0fu2YaMnF0aCvOw2q0MVjiWV8I3BjzCEwnQ45YUC4n+NAPQ09iUzDEBNfeXB3N7D/skVdb5NH4Suhy9Fllm8wC3Heaie6eHlkzbtew2R/ee1LFMJzTXlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728182789; c=relaxed/simple;
	bh=Z2/gnog6ibCVaeY477MA2OTBXT9XH3hqgsYCopAGr28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY0M/ksLTfR4o7DKusweiQWu2R6VANBnJRTEbOh0t0SPzsj9RPWssRef6MymNExUPw+BxNmkQJ05NGsLoGxUdEHxtgf2iL9zVTPHT1ZFKy6bd5sk9tluHZGNrxyQQ8NpYkyrnVN+OZrrF4Dx5k4O4ycwV/hTMhOK+QttOyJdSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7Gp1ezb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65780C4CEC2;
	Sun,  6 Oct 2024 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728182788;
	bh=Z2/gnog6ibCVaeY477MA2OTBXT9XH3hqgsYCopAGr28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7Gp1ezb12tDoxtjHz23w9GfTenf2phj004JFoh7FhA/qzcx3n5rQ5ciH4iPZmpqe
	 IEGYA3dK7r1t2K6vgCD7rPqKdzBxBw1lz8iUSUp/DAZJoftrUMv972y4xS2yrG1W2h
	 Lb4wkk7NNIlteOrvdZ2F/qLE4NBqiFnexnxeipot3Kuthnb511Kga01TQVeV+gi0ok
	 EQ1A6yLm8V24imySFurx9M7crXcM7qTHkNrrsAL/J0GAbUjvgIBgyZA07FkvIIz1rk
	 I/DCwXLW1DenwOXKxq+CltuTorfZRkAd1fvqh7xFaWOOS00cqN2LHGC3bE+RX+INzx
	 /a1FXNY1wz/Mw==
Date: Sat, 5 Oct 2024 21:46:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom: scm: Add check for NULL-pointer
 dereference
Message-ID: <zxzjrnmoun6fm2tzrx6eaxbvy5kddvld7hezknt7k7mvfcqw5a@u3fgfo5yqw4q>
References: <20240920181317.391918-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920181317.391918-1-quic_wasimn@quicinc.com>

On Fri, Sep 20, 2024 at 11:43:17PM GMT, Wasim Nazir wrote:
> Avoid NULL pointer dereference while using any qcom SCM calls.
> Add macro to easy the check at each SCM calls.
> 

We already have a way to deal with this in the general case. Client
drivers should call qcom_scm_is_available() before calling the scm
interface.

Unfortunately your commit message makes it impossible to know if you're
referring to a case where this wasn't done, or isn't possible, or if
you've hit a bug.

> Changes in v2:
> - Cleanup in commit-message

This goes below the '---', by the diffstat. I don't know why you don't
have a diffstat, please figure out how to make your patches looks like
everyone else's.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> 
> diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
> index 029e6d117cb8..3247145a6583 100644
> --- a/drivers/firmware/qcom/qcom_scm-legacy.c
> +++ b/drivers/firmware/qcom/qcom_scm-legacy.c
> @@ -148,6 +148,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>  	__le32 *arg_buf;
>  	const __le32 *res_buf;
> 
> +	if (!dev)
> +		return -EPROBE_DEFER;

-EPROBE_DEFER only makes sense to the caller during probe. In all other
cases this is an invalid error value.

> +
>  	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
>  	if (!cmd)
>  		return -ENOMEM;
[..]
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
[..]
> @@ -387,7 +397,7 @@ static int qcom_scm_set_boot_addr(void *entry, const u8 *cpu_bits)
>  	desc.args[0] = flags;
>  	desc.args[1] = virt_to_phys(entry);
> 
> -	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
> +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);

I don't think you understand why this is written the way it is.

>  }
> 
[..]
> @@ -1986,6 +2113,13 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Let all above stores be available after this */
>  	smp_store_release(&__scm, scm);
> 
> +	__scm->reset.ops = &qcom_scm_pas_reset_ops;
> +	__scm->reset.nr_resets = 1;
> +	__scm->reset.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &__scm->reset);
> +	if (ret)
> +		return ret;
> +

Why did this move?

Regards,
Bjorn

>  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
> --
> 2.46.1
> 

