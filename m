Return-Path: <linux-arm-msm+bounces-92891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFQhH6vOkmlvyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:00:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D9F141680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7507300BCA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF522FB0B3;
	Mon, 16 Feb 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="to6pMS6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100822FAC12;
	Mon, 16 Feb 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771228840; cv=none; b=hdkeGgXgdslxNavr6Q74aXD2Ybm+8szYhnWimqa3QlFCw67+oJFoFYButMoisS52O7GPGF+p1P+6hbQmE4nwrXMMTUVXwoLCDsBPHcwYsI4OKm612WX0NxTQZHCdIAFTsFUciwqxEZ1XYa6K2ePETzQ3EHJoOjuymxK9fTyMOUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771228840; c=relaxed/simple;
	bh=bgVZxugtG1BIY6QjYFyiwvvgJVmuYucZxrEWFggHE0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ4F8HLFu6gDgzhpTX2Ljuti71hFmczFk2f8zvoVLc23Qz/WOyWsQvUASQJtAgSXQSYUDfMeuQXiyWpt4P1mmRT9jfEMvuGWgB7mKiOuyIDnCUXrj1ziH4bxuRiR89+MvAoF/HHQSzGZNZvz6DRj+6hlm82qKrjybeQor5TNako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=to6pMS6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAAEC116C6;
	Mon, 16 Feb 2026 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771228839;
	bh=bgVZxugtG1BIY6QjYFyiwvvgJVmuYucZxrEWFggHE0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=to6pMS6gnBNHz/7wV3hwOoMISgHhcS+x+ywpBQnekvt0uF1qDOFgvKkZlSIPhNtur
	 rstZn/aylXngqLQiN9iSZV6nT6D/DJVchgaNlJlBaqMKzP3CuFmhSKgERG5j3vXK0b
	 Z65CEznvF3c10Z0uWqJ80Ji60vgI87PsIZoNhYVQPTkB09ue7cPdUEeo0iSzqWyS7T
	 uNnih/DwWEubMrDEJ0xK/elwY8JG9vUolbZew7woymgr0sO+5tT409IXj6D7HFZljQ
	 xjAMLIU+kl6WFdWPuV05XSyDADBeTVC6m84aWsZIshbCWefKizG4xNXNKKtSYq0zDx
	 zDNLOurdc/MGw==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vrtX1-0000000033q-2lIc;
	Mon, 16 Feb 2026 09:00:35 +0100
Date: Mon, 16 Feb 2026 09:00:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks
 for sparse
Message-ID: <aZLOo3tMAWhXhdkR@hovoldconsulting.com>
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,hovoldconsulting.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5D9F141680
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 12:05:50PM +0100, Krzysztof Kozlowski wrote:
> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
> respectively, so annotate them so the lock usage will be tracked by
> sparse.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> index 21be447374aa..befa68d1dcaf 100644
> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> @@ -710,6 +710,7 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
>  }
>  
>  static struct qcuefi_client *qcuefi_acquire(void)
> +	__acquires(__qcuefi_lock)
>  {
>  	mutex_lock(&__qcuefi_lock);
>  	if (!__qcuefi) {
> @@ -720,6 +721,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
>  }
>  
>  static void qcuefi_release(void)
> +	__releases(__qcuefi_lock)
>  {
>  	mutex_unlock(&__qcuefi_lock);
>  }

The mutex implementation does not use sparse annotation so this actually
introduces sparse warnings (unless something changed very recently).

See 
	
	https://lore.kernel.org/all/ZJ11H8btBhvCx9gD@hovoldconsulting.com/

for what his looks like for the code in question.

Johan

