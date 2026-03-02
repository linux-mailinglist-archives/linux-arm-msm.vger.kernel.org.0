Return-Path: <linux-arm-msm+bounces-94810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNumN7hSpWmU8wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:04:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF641D5358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A38B33034A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ABC3815C8;
	Mon,  2 Mar 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqDn5yZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0C3376A9;
	Mon,  2 Mar 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442097; cv=none; b=FNPccRUoZdnMMhWP7hEA4jm6jy3IEJWUPS8CEpeH5f9lsWrd3pE1GdNqnR1KG8fCOYlPtChnxanjUXwDLTJAn6Kz5IMeGnDO4qFZ+sy+KiZ6Do2b83SuKnu3+LcTwxIRvYzvpSVFzyn6EWt02ID16i7yXb1gS+AFkefqt7hyWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442097; c=relaxed/simple;
	bh=Q5AhbmlTjf+Zxcabh3OWPfjJlGLKMLNIR1YK4h6bMo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPbbmLheEZ3Fjxp2gGUzZy+xBG9gF+9sShfz6QjP0KspagTGQdJ41th4rx3uKWNKfQPF4RFvuU5IX8PFl0gg/N4XHoAHrBk2uOlv7Ra1U8hYB0M9ZmDB6k79TMonQYbQ3z690xl9zSGxOLxtbCwJlq6LcKwC/PirXUOYxVSYmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqDn5yZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F7C19423;
	Mon,  2 Mar 2026 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772442097;
	bh=Q5AhbmlTjf+Zxcabh3OWPfjJlGLKMLNIR1YK4h6bMo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqDn5yZhMmJn4pIq6F8yUVqZIZ5y+fOOrPraiNfelD9OLraZ/+Kh865/57aT0UuSz
	 NzApiq2pbq8LcEWBZtvhkfCLBYDkl1nq+y50htjimssn0VvEqh2A/doxbB6dprwp8h
	 N1Gtgze/lqfnb9i101y917qVuah3yeJlW0cOwUq5x8NW/phe0JVWmNpZlisi6hihcs
	 +5Tn9b4hzeAxjtVHDID3dWdg36ooNgOc6znPP4XNDjEMXVeq0J39sBkr2a3vGkHwag
	 GwgF/Zy1XqaYOTfWc8ceELbvLIYDxM6mbYR+BbqSkIvAHyYIcISfNTJ7tzz0FqhEAg
	 gfh7NU6YdhoDg==
Date: Mon, 2 Mar 2026 14:31:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Message-ID: <ma3chadfmnseacgsjzve3aascg7cpnkdj2kttkkdtrfoxdvllw@vc6qy5nsnufk>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
 <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94810-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4BF641D5358
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:25:01PM +0530, Sumit Kumar wrote:
> There is a potential deadlock scenario in mhi_ep_reset_worker() where
> the state_lock mutex is acquired twice in the same call chain:
> 
> mhi_ep_reset_worker()
>   mutex_lock(&mhi_cntrl->state_lock)
>     mhi_ep_power_up()
>       mhi_ep_set_ready_state()
>         mutex_lock(&mhi_cntrl->state_lock)  <- Deadlock
> 
> Fix this by releasing the state_lock before calling mhi_ep_power_up().
> The lock is only needed to protect current MHI state read operation. The
> lock can be safely released before proceeding with the power up sequence.
> 

While inspecting the code, I also found one instance where
mhi_ep_handle_syserr() was not locked. I've sent a patch to fix it. Please spare
some time to test it and give a tested-by tag.

> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index cdea24e9291959ae0a92487c1b9698dc8164d2f1..73597de373ef7e0c428bcbc126d63a9a97f95144 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1093,6 +1093,7 @@ static void mhi_ep_reset_worker(struct work_struct *work)
>  	mhi_ep_mmio_reset(mhi_cntrl);

You can also perform locking after mhi_ep_mmio_reset(). There is no need to
protect mhi_ep_mmio_reset().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

