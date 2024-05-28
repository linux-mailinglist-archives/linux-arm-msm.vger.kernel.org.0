Return-Path: <linux-arm-msm+bounces-20845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4878D274E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37A57B21707
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF8045BEC;
	Tue, 28 May 2024 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeOVer9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A41DA23;
	Tue, 28 May 2024 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716933355; cv=none; b=GXkr/oWMgPpiO8XmQe6m/vu4BJptZGdKxnccAYXeA9ABb9vJmSbVKRWbi1Wny9Ztohaf/eInzqm7NzD0e5U836EXagRpxwTKC8TqjOqGwQ2o33qH0HdjUtU7GyfO3+B7G2cv6z3OscXef46ZAMoxatoGcN/uL4b+hbl2F3EBy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716933355; c=relaxed/simple;
	bh=tthgWJCVupl6ERWmdbjXbvx9AlEgF2aFcE/8hKqKCZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqRSQW+bQ9LpXQ1QcU/fL+aqC+XsfmTMEKXDddgi3fxzYT8arKR638orD9wAWxMLdebXbylDlPr8GauKVfMbkeCD09/txeB17GhMfs2GQVT5Cqv1baf3hNVbIy39A5W7QaYllfVdBPTvg8L6sVClJ9e3wEkgy8FUW7up6u5nsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeOVer9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8534C3277B;
	Tue, 28 May 2024 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716933355;
	bh=tthgWJCVupl6ERWmdbjXbvx9AlEgF2aFcE/8hKqKCZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeOVer9DpU1XjBV10SP47aXhFGt4HUm8faTIBQLbS7zPZ6585uXYSiNOiPJd2Os1n
	 7pdwSwF+W+tRsf8WlrPBYcc03rvODX6OVYPrG2mPlquRlfUjnVMB/tuFKkFJssVJ0t
	 UHUc0j8lAHd7cNboljjzXMDbXiEEIMPrcNoDmBMCgUlgnWFLuFz9hIN+Of0sxMZmMv
	 Snv7bOHhWG5599Z124M2o4Jw1T00019os/KZX+SKkmhTn08pyZ3Ay8MBys9WvCsppK
	 8CYFkM/yDGzYsLNwK+Gdi2HREUALIqkjReBoHcATe4d7J+NiDT+VqXCSgJHL0/nSqb
	 ZsQnf+Jl/+2Dw==
Date: Tue, 28 May 2024 16:55:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
Message-ID: <nwoeg22jg5yd4amgqqegplygy6aickehvfc6eanmody74h6nss@cmixbwx6vpx4>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-3-fb88fd17ca0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-hwspinlock-bust-v2-3-fb88fd17ca0b@quicinc.com>

On Fri, May 24, 2024 at 06:26:42PM GMT, Chris Lew wrote:
> Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
> hwspin_lock owned by smem. In the event the remoteproc crashes
> unexpectedly, the remoteproc driver can invoke this API to try and bust
> the hwspin_lock and release the lock if still held by the remoteproc
> device.
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>  drivers/soc/qcom/smem.c       | 28 ++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..683599990387 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -359,6 +359,34 @@ static struct qcom_smem *__smem;
>  /* Timeout (ms) for the trylock of remote spinlocks */
>  #define HWSPINLOCK_TIMEOUT	1000
>  
> +/* The qcom hwspinlock id is always plus one from the smem host id */
> +#define SMEM_HOST_ID_TO_HWSPINLOCK_ID(__x) ((__x) + 1)
> +
> +/**
> + * qcom_smem_bust_hwspin_lock_by_host() - bust the smem hwspinlock for an smem host id
> + * @host:	remote processor id
> + *
> + * Busts the hwspin_lock for the given smem host id. This helper is intended for remoteproc drivers
> + * that manage remoteprocs with an equivalent smem driver instance in the remote firmware. Drivers
> + * can force a release of the smem hwspin_lock if the rproc unexpectedly goes into a bad state.

Please wrap these at 80 characters.

> + *
> + * Context: Process context.
> + *
> + * Returns: 0 on success, otherwise negative errno.
> + */
> +int qcom_smem_bust_hwspin_lock_by_host(unsigned host)
> +{
> +	if (!__smem)
> +		return -EPROBE_DEFER;

This would be called at a time where -EPROBE_DEFER isn't appropriate,
the client should invoke qcom_smem_is_available() at probe time to guard
against this.

> +
> +	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
> +	if (host == SMEM_HOST_APPS ||host >= SMEM_HOST_COUNT)

Missing <space> after ||

Regards,
Bjorn

> +		return -EINVAL;
> +
> +	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
> +
>  /**
>   * qcom_smem_is_available() - Check if SMEM is available
>   *
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index a36a3b9d4929..959eea0812bb 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
>  
>  int qcom_smem_get_soc_id(u32 *id);
>  
> +int qcom_smem_bust_hwspin_lock_by_host(unsigned host);
> +
>  #endif
> 
> -- 
> 2.25.1
> 

