Return-Path: <linux-arm-msm+bounces-106417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDP+EZGc/GnWRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:07:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5E4E9D30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA20A301368D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1513FAE19;
	Thu,  7 May 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muonouMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49C36A008;
	Thu,  7 May 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162488; cv=none; b=Ffey7X3fH7oS9F4zA9GLTZKbsRvlFk4JKuzmJSf9AKE73o4aV7V3o1R/ZINYkCB1Y2sZ9phdQQuGWYBc5SFefBACaf2bJgkzsCcTvdH5udlZu3vNPu/JrVauK/hLbPXiC37oJe4OJKHbSjNgJ7Dbd/hiDWYVKSgR4SOGkGM36IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162488; c=relaxed/simple;
	bh=9Q0yyTk8fhXxRkGVuTTrnubEiJEGi19GcYh079J4Fcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7D+ZmobyRJlo7JekZ95RYjD6JglWUsUF/zc8spaBpCKNQ4o47Ufta2Hyj/FJu/dWvvlCznKkAliIKQz5KEWCyUWqIQjm3KhOZ4NUm4J+1/GIIEU+tLUuXvxDjksgTg+wup05RKoNX/lkvT47RssBiwFtgUDaYZpRisNX9Pfxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muonouMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03478C2BCB2;
	Thu,  7 May 2026 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778162487;
	bh=9Q0yyTk8fhXxRkGVuTTrnubEiJEGi19GcYh079J4Fcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muonouMRmz1mLBSqyt9jAC//B8uXcEGLmbv4abi8Qejf4pOL67pd8eLqbDKMzATtp
	 Mn+eLLv8KsDv2NXzMBAnU7aMRSGGvP3zUYMuzqDA/nRR5rvUA2KVmzoolGLJgLPPMj
	 M9Blh8hpS5JlxYadk8NyLTmO6L8AxgOZYpn23ppwl0zFsrCpP8yspdcuwPUv66VVKO
	 wzYh9D9TQd+h6v9kn75demlc8RnpT789/P0ofi/WcpMJteOzNxYVtqzhwIJ8cPXJ5H
	 gbjYqBqkZ/9qujoL8iWB525jly0ymZAJRCQZADfj+P6pI3YU98LKfMB0nUnkGHMsDy
	 iUj8umqKLO1gQ==
Date: Thu, 7 May 2026 09:01:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <afyajZbt1hjEbgvY@baldur>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9DA5E4E9D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106417-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with

Describe a problem, not an action.

Why is this patch part of this series? I don't see how it relate to
"minidump SRAM destination support".


Change looks reasonable.

Regards,
Bjorn

> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index d9ee180388aa..f65b132004a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	scm->dev = &pdev->dev;
>  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to find download mode address\n");
>  
>  	mutex_init(&scm->scm_bw_lock);
>  
> -- 
> 2.53.0
> 

