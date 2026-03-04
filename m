Return-Path: <linux-arm-msm+bounces-95451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMBLEqQqGnZvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:04:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3F420761A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99853053B01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 20:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD63D371869;
	Wed,  4 Mar 2026 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnV8zCCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EC3016E9;
	Wed,  4 Mar 2026 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654663; cv=none; b=cHu4FkHPfGmZkxwhJLZeU7No799+ldWZpBAC/CT549wGCeATkjdutuzwf/m9DHGRfyiTEnVTZJ9e8iTyovjfB2grsQbiLTmquXYO/2CRCdnp3VdUqnkQNEnEaItAjZFr07yi3QGZlzJ+J/njMoyG8W4t1H8TX2mj+pzJh+VfF9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654663; c=relaxed/simple;
	bh=k9nyZkvWLcBmAO5OFoY+hnYWXM4uBUZ1HO/IjJvDH4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e38NUSDO7zq5AyBrEfPA2rZr2cZGkoR5q3KtDmO/CXYjBc03B46pn2oGdxdn3ZlXDkqpyoi/D+rFP7STNITDPZV+7INiy3zLtjm7Pb6vaFUHq7G5yYb5+WnLNN58dZCnzUOuu7VeT8/SOIOKVM9vB5S5ORNAlO4J6XqCw9YbSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnV8zCCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6004CC4CEF7;
	Wed,  4 Mar 2026 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772654663;
	bh=k9nyZkvWLcBmAO5OFoY+hnYWXM4uBUZ1HO/IjJvDH4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnV8zCCHJTx00iRdYWtOUzU/VD7LlBVtZyB1ZPRG8jPfeq3fGEVmeTBkC6Ou4bsWr
	 ALo1ZA8b/lAGNpd3nCDeNheROxT2wn8v8lpOb4XlEJ7rxkw+W7zNkvnXDrUdjBdWDT
	 ENQhZhCJkL4MOuTka06D9t0dlQLzeQ/S6HJXQj9YgShGGqmkLc/cWRsEUPc0vHCwG/
	 AD5XIt6vRE4/XMy5I721rBNhXmXXRX+I6EC2UkCqWVpD8uEanzScI0on+DFEFI6OkT
	 3V6Lh+rE59vC2C09QZ30Fo5Bq+LZplnG2GqJkBBLLwPSQEJ+U8vHBfdRjsiN+PbiOD
	 r7Otri2jwzNrg==
Date: Wed, 4 Mar 2026 14:04:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Print error codes in failure paths
Message-ID: <vrvbq6wih4jrq3rorshqpwzxkrwtknwh7pbub4xvunmnvf5fyu@45b7g4zrpdcu>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1C3F420761A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95451-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:53:19PM +0530, Mukesh Ojha wrote:
> Few error paths in the qmi_interface module log a failure message but
> do not include the actual error code. Include the error value in the log
> so debugging failures becomes easier.
> 

I'm definitely in favor of such improvements! But I would like to make
sure we get most signal-to-noise ratio out of it.

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qmi_interface.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> index 6500f863aae5..941612b1bd2e 100644
> --- a/drivers/soc/qcom/qmi_interface.c
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -321,7 +321,7 @@ int qmi_txn_init(struct qmi_handle *qmi, struct qmi_txn *txn,
>  	mutex_lock(&qmi->txn_lock);
>  	ret = idr_alloc_cyclic(&qmi->txns, txn, 0, U16_MAX, GFP_KERNEL);
>  	if (ret < 0)
> -		pr_err("failed to allocate transaction id\n");
> +		pr_err("failed to allocate transaction id: %d\n", ret);

Seems this can be either -ENOMEM or -ENOSPC. In the prior case don't we
already have an error message. For the latter, is it realistic that
someone has created 16384 QMI transactions?

>  
>  	txn->id = ret;
>  	mutex_unlock(&qmi->txn_lock);
> @@ -413,7 +413,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
>  
>  	ret = qmi_decode_message(buf, len, handler->ei, dest);
>  	if (ret < 0)
> -		pr_err("failed to decode incoming message\n");
> +		pr_err("failed to decode incoming message: %d\n", ret);

As far as I can see, most of the qmi_decode_message() error paths has a
more useful error print already. Which errors have you seen? Can we
provide an even more useful print in those cases?

>  	else
>  		handler->fn(qmi, sq, txn, dest);
>  
> @@ -502,7 +502,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
>  		if (txn->dest && txn->ei) {
>  			ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
>  			if (ret < 0)
> -				pr_err("failed to decode incoming message\n");
> +				pr_err("failed to decode incoming message: %d\n", ret);

Ditto

>  
>  			txn->result = ret;
>  			complete(&txn->completion);
> @@ -661,8 +661,8 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
>  		if (PTR_ERR(qmi->sock) == -EAFNOSUPPORT) {
>  			ret = -EPROBE_DEFER;
>  		} else {
> -			pr_err("failed to create QMI socket\n");
>  			ret = PTR_ERR(qmi->sock);
> +			pr_err("failed to create QMI socket: %d\n", ret);

pr_err("failed to create QMI socket: %pe\n", qmi->soc) seems like it
would be more helpful.

>  		}
>  		goto err_destroy_wq;
>  	}
> @@ -766,7 +766,7 @@ static ssize_t qmi_send_message(struct qmi_handle *qmi,
>  	if (qmi->sock) {
>  		ret = kernel_sendmsg(qmi->sock, &msghdr, &iv, 1, len);
>  		if (ret < 0)
> -			pr_err("failed to send QMI message\n");
> +			pr_err("failed to send QMI message: %d\n", ret);

Ditto.

Regards,
Bjorn

>  	} else {
>  		ret = -EPIPE;
>  	}
> -- 
> 2.50.1
> 

