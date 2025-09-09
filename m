Return-Path: <linux-arm-msm+bounces-72828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3BB50111
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9511884F8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC935085E;
	Tue,  9 Sep 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Chw176oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5E2EC566;
	Tue,  9 Sep 2025 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431581; cv=none; b=hdZ368AwcP26futxlAE5OWnNHYVm7wdqX1AC7wZxLZhii3/VU1lSKiqYN3Pzr+IR8YZm9GD6NFYICmmKqQE2OtqTKYTLL2osydfIRCPBMJj78qwgsLfkywYjbHiL++UMCHHvgsZJwBz1VLZvrYz1guIjjT2mUGRylAnot+dSmGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431581; c=relaxed/simple;
	bh=hYUpB0xDXo+q9NrfRMCdveiJ6tEPqlcUWGAKcZB4/ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY6tT5X7CyYqzaFLg7OIoEGOolxCvpCdrrdgpSV7AwKuMb0n408CVe2gtyWkIXJGLR2f7f4NqMsIOQX+Gu4dWDvmxXXkxhlD3+OS6PgipTn0N/yOliK5QLv0ubRsl+urhzVBijHrC+mh2oeDnpxtkrGP0belMPQkR1GgWUFszoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chw176oq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1014C4CEF4;
	Tue,  9 Sep 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757431581;
	bh=hYUpB0xDXo+q9NrfRMCdveiJ6tEPqlcUWGAKcZB4/ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Chw176oqM8gaI/W6GW5hwRUOJX7frGBeyG01E61mzX4wanPIftAaICtDY5Bkl0D6J
	 AEd8plEjQDRE/ELv+agdA3WM//tbdjrpeGrTtbHC9IQ1XFETAq2IdxYK4w/Sg3Q3mQ
	 h5jZlxMQEpJ4ELxLhv1pBJJPkr8uIwjEl5bsS2wg7/EhIkFKqM5fHqKf+Rx3iwcuup
	 +RGT5mPF/Zh+X6ZH1Q50ZGKUas6KeoSgPkhosjbn3waNIQsZ/h0pSzySXIIOOPNeTa
	 B+yrEHEbGwZIgpxGkwjABKwl5B43duv4Y553pLUUnUaJ1Qo+DHZQssIc6M7eYekLL1
	 fXA4CKEjqhbQA==
Date: Tue, 9 Sep 2025 10:26:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink: Add support for SOCCP remoteproc
 channels
Message-ID: <y3jxi3xmm4lkvgud5keuu4qv7enqfe3z2y76gho6eal32k7cnk@zv2lat4mjqhi>
References: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>

On Tue, Sep 02, 2025 at 02:45:44PM -0700, Anjelique Melendez wrote:
> Add support for charger FW running on SOCCP by adding the
> "PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
> updating notify_clients logic.
> 
> SOCCP does not have multiple PDs and hence PDR is not supported. So, if
> the subsystem comes up/down, rpmsg driver would be probed or removed.
> Use that for notifiying clients of pmic_glink for PDR events.

Swap these two paragraphs, so that your commit message starts with a
problem description and then you talk about the solution to the problem.

Regards,
Bjorn

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index c0a4be5df926..bcd17fc05544 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -17,6 +17,11 @@
>  
>  #define PMIC_GLINK_SEND_TIMEOUT (5 * HZ)
>  
> +enum {
> +	PMIC_GLINK_PDR_UNAVAIL = 0,
> +	PMIC_GLINK_PDR_AVAIL,
> +};
> +
>  enum {
>  	PMIC_GLINK_CLIENT_BATT = 0,
>  	PMIC_GLINK_CLIENT_ALTMODE,
> @@ -39,6 +44,7 @@ struct pmic_glink {
>  	struct mutex state_lock;
>  	unsigned int client_state;
>  	unsigned int pdr_state;
> +	bool pdr_available;
>  
>  	/* serializing clients list updates */
>  	spinlock_t client_lock;
> @@ -203,17 +209,17 @@ static void pmic_glink_del_aux_device(struct pmic_glink *pg,
>  	auxiliary_device_uninit(aux);
>  }
>  
> -static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
> +static void pmic_glink_state_notify_clients(struct pmic_glink *pg, unsigned int state)
>  {
>  	struct pmic_glink_client *client;
>  	unsigned int new_state = pg->client_state;
>  	unsigned long flags;
>  
>  	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
> +		if (state == SERVREG_SERVICE_STATE_UP && pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_UP;
>  	} else {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
> +		if (state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
>  			new_state = SERVREG_SERVICE_STATE_DOWN;
>  	}
>  
> @@ -233,7 +239,7 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
>  	guard(mutex)(&pg->state_lock);
>  	pg->pdr_state = state;
>  
> -	pmic_glink_state_notify_clients(pg);
> +	pmic_glink_state_notify_clients(pg, state);
>  }
>  
>  static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
> @@ -246,10 +252,14 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
>  
>  	dev_set_drvdata(&rpdev->dev, pg);
> +	pg->pdr_available = rpdev->id.driver_data;
>  
>  	guard(mutex)(&pg->state_lock);
>  	pg->ept = rpdev->ept;
> -	pmic_glink_state_notify_clients(pg);
> +	if (pg->pdr_available)
> +		pmic_glink_state_notify_clients(pg, pg->pdr_state);
> +	else
> +		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_UP);
>  
>  	return 0;
>  }
> @@ -265,11 +275,15 @@ static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
>  
>  	guard(mutex)(&pg->state_lock);
>  	pg->ept = NULL;
> -	pmic_glink_state_notify_clients(pg);
> +	if (pg->pdr_available)
> +		pmic_glink_state_notify_clients(pg, pg->pdr_state);
> +	else
> +		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_DOWN);
>  }
>  
>  static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
> -	{ "PMIC_RTR_ADSP_APPS" },
> +	{.name = "PMIC_RTR_ADSP_APPS", .driver_data = PMIC_GLINK_PDR_AVAIL },
> +	{.name = "PMIC_RTR_SOCCP_APPS", .driver_data = PMIC_GLINK_PDR_UNAVAIL },
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

