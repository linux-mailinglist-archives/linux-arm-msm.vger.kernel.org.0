Return-Path: <linux-arm-msm+bounces-80183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F070C2EE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C09E94E1F14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E223770A;
	Tue,  4 Nov 2025 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtqJFlWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496241D5174;
	Tue,  4 Nov 2025 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221495; cv=none; b=TrWNIR91mRS8TWj2oW+ca7CdZDacjEbTm1QpTr84nJDtjgR3lHlyOnUji95GMt9CqQuu0i0mRknheCchUl68Wo3vm6flV2+5vTMjAbGEoUn3vFNX/H3nz47Vrr32eVJgaBsjaQN+Gw6pCrmVOI3niINBkZi1y4qldYwNKQL7wjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221495; c=relaxed/simple;
	bh=RFluSH2c/tQO9Nj2HIMedshSeLvwcgAN0h1uOkZGxOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM+HWGTV2m8L1Wgn8IOxkmcih/+BAJQ7QLMmKQd9pjO4+nUyBK7P435ddTzsEKbr/GASdnr2USEa7iOwGb8j7gB2izlWIIhvXUHZBKmv5THeZuafhhJcGWXFHkGC7K1eriT15M9N+cvrxtQ03xzRLQ5Z9DB2KjYl6O2QMeRqxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtqJFlWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237BEC4CEE7;
	Tue,  4 Nov 2025 01:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762221494;
	bh=RFluSH2c/tQO9Nj2HIMedshSeLvwcgAN0h1uOkZGxOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtqJFlWxN48EHZ6m4Vs71XABqkqSHNA+J9xKtZE/yJvhxrW22GvuoB+canVe3T2Fp
	 gGCqludTo3AtiS0EpSWULM1b5KCAF4uMUYYhrHbAYmi5117Fuu1XppAp9o1QoLzUP0
	 eu8/RtHN6ajUFY01QeHnQhXP7jsPBeicbmM99gW2/QJYx574Ldt1xS5ifXgdw0jsT2
	 U6h6k0e9pNPHMy1vxQVeHP3EY1KdQlvcXd6/3VD4W8gF8qt41Na5qj03amZU3KMF96
	 W5Z5srpRXZadHdsDYG2t8+sZ9Ap/P+i/ttUEJXLvdgSOh/0XXxfnT1OUWzKZHpyrrs
	 o3SAfpTJ3NS8A==
Date: Mon, 3 Nov 2025 20:01:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: chris.lew@oss.qualcomm.com, konradybcio@kernel.org, 
	jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V2 2/2] soc: qcom: smp2p: Add support for smp2p v2
Message-ID: <d6vx4owncfgnpnujfepavtxeg76pt6rzlxf4fhhd6uwwtrfl3v@6rnc2llvoo26>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
 <20251103152929.2434911-3-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103152929.2434911-3-deepak.singh@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 08:59:29PM +0530, Deepak Kumar Singh wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> Some remoteproc need smp2p v2 support, mirror the version written by the
> remote if the remote supports v2.

I don't think they _need_ v2 support. The subsystem might implement v2
and only support v2...

> This is needed if the remote does not have backwards compatibility
> with v1.

I guess this retroactively amends the previous sentence to make it
valid? Please rewrite these two sentences.

> And reset entry last value on SSR for smp2p v2.

The first two sentences described a problem and a "solution" to that
problem, here you're just throwing in a fact.

Please document what version 2 actually is and make it clear why
resetting "entry last value on SSR".

> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smp2p.c | 41 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 39628df36745..c35ca7535c14 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -36,6 +36,10 @@
>   * The driver uses the Linux GPIO and interrupt framework to expose a virtual
>   * GPIO for each outbound entry and a virtual interrupt controller for each
>   * inbound entry.
> + *
> + * Driver supports two versions:
> + * V1 - For processor that start after local host
> + * V2 - For processor that start in early boot sequence
>   */
>  
>  #define SMP2P_MAX_ENTRY 16
> @@ -50,11 +54,12 @@
>  
>  #define ONE 1
>  #define TWO 2
> +#define MAX_VERSION TWO
>  
>  /**
>   * struct smp2p_smem_item - in memory communication structure
>   * @magic:		magic number
> - * @version:		version - must be 1
> + * @version:		version
>   * @features:		features flag - currently unused
>   * @local_pid:		processor id of sending end
>   * @remote_pid:		processor id of receiving end
> @@ -183,14 +188,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>  static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
>  {
>  	struct smp2p_smem_item *in = smp2p->in;
> +	struct smp2p_entry *entry;
>  	bool restart;
>  
>  	if (!smp2p->ssr_ack_enabled)
>  		return false;
>  
>  	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
> +	restart = restart != smp2p->ssr_ack;

This is hard to read, please try to avoid the immediate reassignment.

> +	if (restart && in->version > ONE) {
> +		list_for_each_entry(entry, &smp2p->inbound, node) {
> +			if (!entry->value)
> +				continue;
> +			entry->last_value = 0;

Why do we only do this for version 2+?

> +		}
> +	}
>  
> -	return restart != smp2p->ssr_ack;
> +	return restart;
>  }
>  
>  static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
> @@ -225,6 +239,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>  	}
>  }
>  
> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	struct smp2p_smem_item *in;
> +	size_t size;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return 0;
> +
> +	return in->version;
> +}
> +
>  static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>  {
>  	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> @@ -522,6 +550,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	struct smp2p_smem_item *out;
>  	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
>  	unsigned pid = smp2p->remote_pid;
> +	u8 in_version;
>  	int ret;
>  
>  	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
> @@ -543,12 +572,18 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	out->valid_entries = 0;
>  	out->features = SMP2P_ALL_FEATURES;
>  
> +	in_version = qcom_smp2p_in_version(smp2p);

This is a bit obfuscated in my view, and doesn't seem complete.

We're calling qcom_smp2p_alloc_outbound_item() during probe(), at which
time any non-early booted subsystem will yet to have been launched and
hence they haven't allocated their SMP2P SMEM item.

So in_version will be 0, which is less than 2, so therefor we're running
version 1.

If the subsystem is then brought out of reset and it implements version
2 (we intended it to be launched by bootloader, but it wasn't - this
shouldn't be a problem), we will have a version "mismatch".

Upon first interrupt from the remote we will determine in
qcom_smp2p_negotiate() that we're version 1 and they are version 2, so
we will not complete the negotiation - and thereby not deliver
interrupts.

> +	if (in_version > MAX_VERSION) {
> +		dev_err(smp2p->dev, "Unsupported smp2p version\n");

I think we can afford ourself to add "...: %d\n", in_version); here. It
would make the error print directly actionable the day we hit it (or
make it obvious if we hit this error due to a bogus in_version).

Regards,
Bjorn

> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * Make sure the rest of the header is written before we validate the
>  	 * item by writing a valid version number.
>  	 */
>  	wmb();
> -	out->version = 1;
> +	out->version = (in_version) ? in_version : 1;
>  
>  	qcom_smp2p_kick(smp2p);
>  
> -- 
> 2.34.1
> 

