Return-Path: <linux-arm-msm+bounces-83881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D4C94856
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 22:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B1C3A5DCF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 21:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41BF25EFBE;
	Sat, 29 Nov 2025 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUSxfzvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77755221D9E;
	Sat, 29 Nov 2025 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764450789; cv=none; b=puxC4kBciGs5gFNeTtIrGUR6GoOybrtkBzuyw7NkUsaWEcnCcEOIutV4QVGIBK9X3hgz9Ap22YzlhOcG/E//PNqNIVGOSPok5PjJG08FBbJnv+xMWx4NMVxXBo9eu1fL8mjPidNauyCoH0IX/UOAGwkb6rIhXjqKBRtOO6OAbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764450789; c=relaxed/simple;
	bh=kSjAdfoJYC+PJLWFy8PJF6bd9oG6wm/Job1NGxFVUJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBX0g3HKDFWsvEpQOceGqmT3bhiGu+t+IMwaaNOMmp6hS7rQTy2zPD/YDtuaSBsTKN5LMv7MnhQRzZhtBmTmQNk0PItUxXi7esSTaEkTDcKgDGg6yEdnweAkdeyLIlr5Mj46SBthC3BtS7OyVYvmjF6ypJw2+yU7Iw6GVm95CEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUSxfzvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB8AC4CEF7;
	Sat, 29 Nov 2025 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764450789;
	bh=kSjAdfoJYC+PJLWFy8PJF6bd9oG6wm/Job1NGxFVUJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUSxfzvCV1vn6hq4eIE40vece/WKD+7shcRqDyCJRPzx+x3GZRoGJmviEtaQhhXXY
	 wgZwDcoFjUDC7FCShAH10URTVg3jBuxUv5DYf5Kv7rVl3RtemTD52Kg7SgzwwH9uKk
	 n9CsBfHf34dvmMFgZCzvokKjLtZS4Hn5tpWuC3sqrt2aLjXeI4wkrAY3F+ATEFUAW9
	 lXRUGG82kVZrv5yNg2w20hSAivF7h/L0c32RdvlOb+LbvFUypM2M2bEoDiUzzoZqq1
	 u1X5epT6LvKgO/1C8AvDcopdevHjvbKMPTq2i3tXoncU1qKh/8JISHK84Ytv78XKEv
	 d17C5Ssm3epgA==
Date: Sat, 29 Nov 2025 15:18:55 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of
 qcom,halt-regs
Message-ID: <qszmet2vcmricxze56b5p2jegmqwc4io7fewhhniqskyic636v@lnswyat7577p>
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129013207.3981517-1-mr.nuke.me@gmail.com>

On Fri, Nov 28, 2025 at 07:32:05PM -0600, Alexandru Gagniuc wrote:
> The "qcom,halt-regs" consists of a phandle reference followed by the
> three offsets within syscon for halt registers. Thus, we need to
> request 4 integers from of_property_read_variable_u32_array(), with
> the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.
> 
> With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
> -EOVERFLOW, causing .probe() to fail.
> 
> Increase MAX_HALT_REG to 4, and update the indexes accordingly.
> 

Good catch, thanks

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Regards,
Bjorn

> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 07c88623f5978..23ec87827d4f8 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -85,7 +85,7 @@
>  #define TCSR_WCSS_CLK_MASK	0x1F
>  #define TCSR_WCSS_CLK_ENABLE	0x14
>  
> -#define MAX_HALT_REG		3
> +#define MAX_HALT_REG		4
>  enum {
>  	WCSS_IPQ8074,
>  	WCSS_QCS404,
> @@ -864,9 +864,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
>  		return -EINVAL;
>  	}
>  
> -	wcss->halt_q6 = halt_reg[0];
> -	wcss->halt_wcss = halt_reg[1];
> -	wcss->halt_nc = halt_reg[2];
> +	wcss->halt_q6 = halt_reg[1];
> +	wcss->halt_wcss = halt_reg[2];
> +	wcss->halt_nc = halt_reg[3];
>  
>  	return 0;
>  }
> -- 
> 2.45.1
> 

