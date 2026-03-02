Return-Path: <linux-arm-msm+bounces-94819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCsXI5hZpWlp+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:34:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B731D59D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A01AD3023327
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1684E38F628;
	Mon,  2 Mar 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr/a28hT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1F379EC2;
	Mon,  2 Mar 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444052; cv=none; b=WFZON4XodPbxwNe3XdQtaBBZ7LpoSTsYZGQVcbRdrKMla992XZyIBG1R2ly18YKlLdP9tUeXDh8LJT14mCQyq6TJa/ueIYDfnyLhnhtwXCIR7hGP3QzhU+imII9sUiyBiefO4SCEfiPI6QwnsWWIYDk6enji8LndGqamzhrL/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444052; c=relaxed/simple;
	bh=BbQ5c1PtUfUvhyQdeZBjPDWObss0xuvH4G0y+wvUXtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=if1Ck5YUl8KU45yVbUAPUO5TMQTn3VoczvmNT74iCucQ7YWmDKfkPDX24wsvd1Y3meRrSSycUYSv04RDuSo4ckGNZpbed/RE4H7pBRi+cCpHra8Jc5EBayH/4Inc5e2vFxgLiTaxP7qR8w1HaBD/y5ZTp+B4NZ24pKEimy109/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr/a28hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8EDC19423;
	Mon,  2 Mar 2026 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772444051;
	bh=BbQ5c1PtUfUvhyQdeZBjPDWObss0xuvH4G0y+wvUXtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gr/a28hTmMvlf2F5ED+RYL7IpqHR1V/7+g4716t8aKjqitpMJ0OZZY+2zgbhv4yV6
	 aFPmFgBPlVQgOgG1WA4Y7eVmuFiVdHcbS7fpdPWIHRBAhnVyp22A0nqRYJd+PKp5JP
	 C5LDdRv/ZDzAHx0o88VTL6ZM8kSOZuCYtsRePAz09RR2wxeUxUUJ8T80wr7bqWV1Rs
	 iTIp9YEUikWcfDjQjREMh5/WGpX9MuoHzuoM1Llv0bkdIvVPzQktFgV3IKxim5AMnA
	 iQ3oEuA2tHjHLKamK2syvT9medLZcXm+11dcuHhFt72y1gGI3tlIWAci7m/PCdL53r
	 vwyLrAlOnWndw==
Date: Mon, 2 Mar 2026 15:03:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] bus: mhi: ep: Add missing state_lock protection for
 mhi_state accesses
Message-ID: <ob25vew2cpsmabeehkx4uuyrxxpno52zhjqovkqfduzxuvhzix@vouag4gwiy5m>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
 <20260203-reset_worker_deadlock-v1-2-7ed889b5bf19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203-reset_worker_deadlock-v1-2-7ed889b5bf19@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94819-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06B731D59D4
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:25:02PM +0530, Sumit Kumar wrote:
> The mhi_cntrl->mhi_state field should be protected by state_lock to
> ensure atomic state transitions. However, mhi_ep_handle_syserr() and
> mhi_ep_power_up() access mhi_state without holding this lock, which can
> race with concurrent state transitions and lead to state corruption.
> 
> Add proper state_lock protection in both functions around their mhi_state
> accesses.
> 
> Fixes: fb3a26b7e8af ("bus: mhi: ep: Add support for powering up the MHI endpoint stack")
> Fixes: f7d0806bdb1b3 ("bus: mhi: ep: Add support for handling SYS_ERR condition")
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 73597de373ef7e0c428bcbc126d63a9a97f95144..e9d14006453aa8b8999486a1cef17ca43f4cc4e1 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1113,7 +1113,9 @@ void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl)
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int ret;
>  
> +	mutex_lock(&mhi_cntrl->state_lock);
>  	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
> +	mutex_unlock(&mhi_cntrl->state_lock);

Ah, I sent my patch *before* seeing this one. But still this part is wrong and
will cause deadlock as callers were already holding 'state_lock'.

So drop this part in favor of:
https://lore.kernel.org/mhi/20260302085612.18725-1-manivannan.sadhasivam@oss.qualcomm.com

>  	if (ret)
>  		return;
>  
> @@ -1148,7 +1150,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
>  	for (i = 0; i < mhi_cntrl->event_rings; i++)
>  		mhi_ep_ring_init(&mhi_cntrl->mhi_event[i].ring, RING_TYPE_ER, i);
>  
> +	mutex_lock(&mhi_cntrl->state_lock);
>  	mhi_cntrl->mhi_state = MHI_STATE_RESET;
> +	mutex_unlock(&mhi_cntrl->state_lock);
>  

This looks fine.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

