Return-Path: <linux-arm-msm+bounces-118902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /1u+Ia2kVWpBrQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9627507C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:53:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LUcKxUjY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBC6C3029771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 02:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ABF37B3E4;
	Tue, 14 Jul 2026 02:53:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBCC378D7D;
	Tue, 14 Jul 2026 02:53:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783997610; cv=none; b=MdzEGFT4AJ81VYgNhDsVToDrW7o8MuZMznaes9IHMsaNvoNsJ+HOxDAXZ0jVpc3rLa14DcGyTaiDuTV16mqqn99DJQH17SXwanz7Ld+CDSty223TFbx/ODXS+5GtdEj1affUqKiQ3P6XsysB3PpLDedByWooxaGwFiKk2q6QRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783997610; c=relaxed/simple;
	bh=NVJEBYnjUAbOEmeXumg06ZQmEpkEW60hwM7Li9XCGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTK68kkAIQzidMfTStgJ/gdpZ0F1yhewuJDjJ42UdPGmiJM2PZl/rQvyww6EO/xzD+CqjdAUwA0nzZPdt+X0D5LAatec6Oy3/mlH3YnuTbCSFDwVFkBeb3ysEAqlBleLbKFZij4DcJO9gq+zrt43QwQjXbg8z3kvxxbX8AnX7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUcKxUjY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A45B1F000E9;
	Tue, 14 Jul 2026 02:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783997608;
	bh=b0YkISUvD66GFsQjNiTygrNgFmIa2vyWu5o957KGl9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUcKxUjYDlMXLD5VlEfPVWx7qilnoL0KFfalNjDtbZFA/WlZReayDkAuql3+lJizP
	 VSwkAQABOxzE+OKlyuBQ2NQqc4OgdzReR0lNMpxbuIOQz6gMCiApxk/W50R5DM1JM5
	 5+M3ZWnJcovaEH9p7F6RgkSF7cxiUKouDHsYxhbe6lvN3NJB1tp7mBXvoAv0ezNyOR
	 629BpT3YPWM18rrbv7VbLjkKaPywhY7RdTeBzNvWgQd3d1ZZnolTXEmjI10xsjkNZ1
	 dAqUn+WK7fo8DVldZ0Hu8qbBoK0nryBiDdlm2vnwVGYaBb5Bbe5k0eHCCgg6vrHxhA
	 sZirHSNj3qH1g==
Date: Mon, 13 Jul 2026 21:53:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
Message-ID: <alWkl-eYfVym4iCk@baldur>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118902-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA9627507C7

On Thu, Jun 04, 2026 at 02:12:53PM +0530, Vishnu Santhosh wrote:
> During driver detach, the device core holds the device mutex throughout
> the driver's remove callback chain.  When the rpmsg endpoint is
> destroyed as part of that teardown, the GLINK endpoint destroy
> implementation attempts to unregister the underlying rpmsg device.
> That unregistration calls device_del(), which tries to re-acquire the
> same device mutex already held higher up the stack, causing rmmod to
> hang indefinitely.
> 
> The deadlock manifests with the following call chain:
> 
> [<0>] device_del+0x44/0x414  <- tries to acquire same mutex
> [<0>] device_unregister+0x18/0x34
> [<0>] rpmsg_unregister_device+0x28/0x4c
> [<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
> [<0>] qcom_glink_destroy_ept+0x58/0xbc
> [<0>] rpmsg_dev_remove+0x50/0x60
> [<0>] device_remove+0x4c/0x80
> [<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
> [<0>] driver_detach+0x4c/0x98
> [<0>] bus_remove_driver+0x6c/0xbc
> [<0>] driver_unregister+0x30/0x60
> [<0>] unregister_rpmsg_driver+0x10/0x1c
> [<0>] fastrpc_exit+0x28/0x38 [fastrpc]
> [<0>] __arm64_sys_delete_module+0x1b8/0x294
> [<0>] invoke_syscall+0x48/0x10c
> [<0>] el0_svc_common.constprop.0+0xc0/0xe0
> [<0>] do_el0_svc+0x1c/0x28
> [<0>] el0_svc+0x34/0x108
> [<0>] el0t_64_sync_handler+0xa0/0xe4
> [<0>] el0t_64_sync+0x198/0x19c
> 
> The rpmsg device unregistration inside endpoint destroy is redundant.
> In both contexts where endpoint destruction is triggered:
> 
> - Driver detach path: the driver core already tears down the rpmsg
>   device.
> 
> - Channel close path: the rpmsg device is already unregistered before
>   endpoint destruction is reached.
> 
> Remove the redundant unregistration to fix the deadlock.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Regards,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_native.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 401a4ece0c9777398837d4427746fae0a5003e88..ab7ff3d2f56bf797592fc4227ce5b730bce72226 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1418,9 +1418,6 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  	channel->ept.cb = NULL;
>  	spin_unlock_irqrestore(&channel->recv_lock, flags);
>  
> -	/* Decouple the potential rpdev from the channel */
> -	qcom_glink_remove_rpmsg_device(glink, channel);
> -
>  	qcom_glink_send_close_req(glink, channel);
>  }
>  
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

