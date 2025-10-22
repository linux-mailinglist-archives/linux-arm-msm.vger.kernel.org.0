Return-Path: <linux-arm-msm+bounces-78416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E056BFE637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EACE33A374E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FFE29B8C7;
	Wed, 22 Oct 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teAV8WQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1181C84CB;
	Wed, 22 Oct 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171413; cv=none; b=aa6LKECwbglN4gH3aOztTMGtFZ7aG8MvV99UEJbZ1ELJXVhhkHthhjjH/2Q/iPFBOWwAoj3hHI63+kYSzjRadpcAZ474oTOYkwF08IapngfMiLy60jGQwKuMtTvoGOLczphr6Og1NHzO4jpsuK8N0BdQC6f68l/5O3xpYQDQowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171413; c=relaxed/simple;
	bh=KSensTcJ8snAZyRB7NSkeX45VKRDVxD2iZ4SiwHqe6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVzUCfbiVMhmTBCUx/Tcs4/GelUcyOUP9HbZje/yKRqWyv7IvZwFfZ/pOHNA4OHdeLomJ7NRRGXA5vVMhiBcj8nbrMJ4SxdSlklFP97fxF76aEekn7LNjF533NaQ1+bUMb82E4zdA+po2P4JDst7V7kCsPr7GgBZeOhWn1PsV4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teAV8WQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14BFC4CEE7;
	Wed, 22 Oct 2025 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761171413;
	bh=KSensTcJ8snAZyRB7NSkeX45VKRDVxD2iZ4SiwHqe6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teAV8WQuXY7chklzBvXPodEb99pSN1bEi+XW7T/RyfXxiynLj/U/FRvZ8zSpCRZ7H
	 WN8OzgjSEex0GBo79nouNpr6qvBp2Rh1wGPOSBYYN2WHEAWTZJDKfdBe5VtGimIxZQ
	 oPP59djsnvx7KRPOEOewNBtFrbKRzvg91jtH3mZw0FvWkNSdalkZGp40oCAeX8pDUY
	 OUx1q+RISD7Jibm8/VWtRXWjP2P4OJsgcLgEzrePqYlzx1/T+VUwlMQEzGVqAx4X82
	 6DZLN7nU1uVwifa42/q6tT9J/CTSJycvBNA4Dm+2Y9ohI81e8CtL8O2zB/VNxeiLVo
	 3brD84z0L/TzQ==
Date: Wed, 22 Oct 2025 17:19:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
Message-ID: <76gekllxr5meizr7wbvxjibdncdw7kp2q4zjjxtmdtfnwt4owc@dum7e77j4bie>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>

On Tue, Sep 23, 2025 at 09:18:43PM -0700, Jingyi Wang wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> Some remoteproc need smp2p v2 support, mirror the version written by the
> remote if the remote supports v2. This is needed if the remote does not
> have backwards compatibility with v1. And reset entry last value on SSR for
> smp2p v2.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Please confirm that you really co-developed (pair programming) this
patch with Chris.

Isn't this a patch from Chris, that you're "forwarding", i.e. both
Signed-off-by should be there, but the Co-developed-by shouldn't.

> ---
>  drivers/soc/qcom/smp2p.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index e2cfd9ec8875..5ea64a83c678 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -48,10 +48,13 @@
>  #define SMP2P_MAGIC 0x504d5324
>  #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
>  
> +#define SMP2P_VERSION_1 1
> +#define SMP2P_VERSION_2 2

#define ONE 1
#define TWO 2

#define PLEASE_DONT true

> +
>  /**
>   * struct smp2p_smem_item - in memory communication structure
>   * @magic:		magic number
> - * @version:		version - must be 1
> + * @version:		version
>   * @features:		features flag - currently unused
>   * @local_pid:		processor id of sending end
>   * @remote_pid:		processor id of receiving end
> @@ -180,14 +183,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
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
> +	if (restart && in->version > SMP2P_VERSION_1) {
> +		list_for_each_entry(entry, &smp2p->inbound, node) {
> +			if (!entry->value)
> +				continue;
> +			entry->last_value = 0;
> +		}
> +	}
>  
> -	return restart != smp2p->ssr_ack;
> +	return restart;
>  }
>  
>  static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
> @@ -222,6 +234,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
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
> @@ -516,6 +542,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	struct smp2p_smem_item *out;
>  	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
>  	unsigned pid = smp2p->remote_pid;
> +	u8 in_version;
>  	int ret;
>  
>  	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
> @@ -537,12 +564,14 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>  	out->valid_entries = 0;
>  	out->features = SMP2P_ALL_FEATURES;
>  
> +	in_version = qcom_smp2p_in_version(smp2p);
> +
>  	/*
>  	 * Make sure the rest of the header is written before we validate the
>  	 * item by writing a valid version number.
>  	 */
>  	wmb();
> -	out->version = 1;
> +	out->version = (in_version) ? in_version : 1;

Doesn't this imply that if the remoteproc advertises support for version
3, then we suddenly also support version 3?


I don't remember if we've talked about how version handling should work
in this driver, but we should certainly define and document that in the
comment at the top of this driver.

Regards,
Bjorn

>  
>  	qcom_smp2p_kick(smp2p);
>  
> 
> -- 
> 2.25.1
> 

