Return-Path: <linux-arm-msm+bounces-47057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF47A2B4D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 23:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201ED3A6432
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 22:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E71422FF35;
	Thu,  6 Feb 2025 22:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIjdoy7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228423C367;
	Thu,  6 Feb 2025 22:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880009; cv=none; b=MeHF1v9/rlqG9TRZE7P7XBJeVdI3uh6uXa8hobDeezM7u3bmF2bWqPKEl/tHkZS4vBhGUEgyaJEV72CV+AcpleuBmZzM9H0a1soxeFRhTirYJrGwUncmk8bm+natAIAa7OvjEtgpUu7fe78sIoFS2uLpLOZzHvlTyl/unoL1D3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880009; c=relaxed/simple;
	bh=oB7yhd9eYYIy50bn91tuQKVReuuUgUvlw9L5hyQ859A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvbkOj3+PEIiLqVryCUM9Jtq+ydxSVDVFGoAJPaTomNWQj2Fy0fc+LLJIRELrvLsi+G1z+wWxMwNItl4zXX8LnIsU/L5SiA87ryxGD7gwSXsFsOB/Ez67cVvCNvUwQWBPiDNrtbpnIp0otfZR/mDw4a5SMBpWBcxklyLs/gzvMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIjdoy7V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC52EC4CEDD;
	Thu,  6 Feb 2025 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738880008;
	bh=oB7yhd9eYYIy50bn91tuQKVReuuUgUvlw9L5hyQ859A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIjdoy7Vd5OFj15074wFBHEr6EniJi7CkUhhz5y2ENlEG3HfipzBgALFfE3qCDJt1
	 8BioW4OVC7psiwLPRSUXmFACwijYeBAwW4umMm8YCQp1V/m4bKUZYag5zqD0dFZ3qP
	 vob5LmL6nnk3zVX3R9Z8fCp6HCA6CZbqRqXQyOSWkwAeF9i5cXX9JIl5pEbwOwatJm
	 k43cbSeeTWrCO9Uws65c4fAGmqzaZM1wqpl4rzx9WVzOhUHzYoEFlWTXC48bmoPV/B
	 a+4QmuReWSWdBJy3DTFg4EaSGyG/bfDfyX0snZZQ/0j6uIftsALd3ceACmHg8QwIZs
	 kJ1ioG+psjNxQ==
Date: Thu, 6 Feb 2025 16:13:25 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>

On Wed, Jan 29, 2025 at 09:25:44PM +0530, Mukesh Ojha wrote:
> When some client process A call pdr_add_lookup() to add the look up for
> the service and does schedule locator work, later a process B got a new
> server packet indicating locator is up and call pdr_locator_new_server()
> which eventually sets pdr->locator_init_complete to true which process A
> sees and takes list lock and queries domain list but it will timeout due
> to deadlock as the response will queued to the same qmi->wq and it is
> ordered workqueue and process B is not able to complete new server
> request work due to deadlock on list lock.
> 
>        Process A                        Process B
> 
>                                      process_scheduled_works()
> pdr_add_lookup()                      qmi_data_ready_work()
>  process_scheduled_works()             pdr_locator_new_server()
>                                          pdr->locator_init_complete=true;
>    pdr_locator_work()
>     mutex_lock(&pdr->list_lock);
> 
>      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> 
>       pdr_get_domain_list()
>        pr_err("PDR: %s get domain list
>                txn wait failed: %d\n",
>                req->service_name,
>                ret);
> 
> Fix it by removing the unnecessary list iteration as the list iteration
> is already being done inside locator work, so avoid it here and just
> call schedule_work() here.
> 

I came to the same patch while looking into the issue related to
in-kernel pd-mapper reported here:
https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/

So:
Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> CC: stable@vger.kernel.org
> Signed-off-by: Saranya R <quic_sarar@quicinc.com>

Can we please use full names?

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Unfortunately I can't merge this; Saranya's S-o-b comes first which
implies that she authored the patch, but you're listed as author.

Regards,
Bjorn

> ---
> Changes in v2:
>  - Added Fixes tag,
> 
>  drivers/soc/qcom/pdr_interface.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> index 328b6153b2be..71be378d2e43 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -75,7 +75,6 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
>  {
>  	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
>  					      locator_hdl);
> -	struct pdr_service *pds;
>  
>  	mutex_lock(&pdr->lock);
>  	/* Create a local client port for QMI communication */
> @@ -87,12 +86,7 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
>  	mutex_unlock(&pdr->lock);
>  
>  	/* Service pending lookup requests */
> -	mutex_lock(&pdr->list_lock);
> -	list_for_each_entry(pds, &pdr->lookups, node) {
> -		if (pds->need_locator_lookup)
> -			schedule_work(&pdr->locator_work);
> -	}
> -	mutex_unlock(&pdr->list_lock);
> +	schedule_work(&pdr->locator_work);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

