Return-Path: <linux-arm-msm+bounces-90613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK6PLWzVd2mFlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 21:58:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D178D645
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 21:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66CD9300FEDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CCD298CAB;
	Mon, 26 Jan 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJ91L7hK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988127F010;
	Mon, 26 Jan 2026 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460829; cv=none; b=aG6amgIUsFwyGXJEvKi0QUHlH6BS6EE/+m2Si96mTQkWpAzd3ksuc1vgy9ORL/Cd4+EByuW1+UDo60TtC5olDaA/5x3dIsk6LsBlEB/2Nrvn1OKdiuwTmfh0vkP3/fapuUJ0OvGZKYOqXokcXZIMfFZ5ZnTl/qDb2DRC5reqqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460829; c=relaxed/simple;
	bh=VbDvg+iF4L8GTqFSLo0GAIgHzGx992VNi1dZiuUC5aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7R4aILUquO9dskoa+9cj1+1SZ5efupGmnhj9SFriaP7S8zgXMoWgUtXN6yJPC9wUsyZ8rNqoJgrwUY104/oNiZXRliW4L8hEIPVlM8Cuh9KRJqW+RA/tPUoAmv9e+zsmGX1TYIqT0hq/aiyhJq4Hqf5FVqFyeDy53l9tfZo6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJ91L7hK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164C3C116C6;
	Mon, 26 Jan 2026 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769460828;
	bh=VbDvg+iF4L8GTqFSLo0GAIgHzGx992VNi1dZiuUC5aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJ91L7hKUUd2cE5X13ZfzzQKRqrhjoivO2yi4F1dchC3srI0NPnC2/r0Ut8AIRqh7
	 O2dtsWsOvDqoSO5lB/ehqshIuiGdFxJ4Rgkhvv1lIK9N/k6uiy5QXNV6VwFxAmQYU8
	 imqihzpmrELEgjF93AWFFhr+HrKw2FSpuiPbO7DvIbw8SAYfFJy4x0PnCB+HmLBxUz
	 +F/4bVV4s2ziWcnXFVgWa3GFLiywWezwX5LtC4oXkJaFU9M5KfL7OA53yJkDLquaJm
	 S/icY9VDHFSg64mjshU+LN3Fu9JhbnlO2E5MbUe81xk/s8iOjd0nInyIj50Rq8eJCS
	 /aL8pBsqXheqQ==
Date: Mon, 26 Jan 2026 14:53:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xingjing Deng <micro6947@gmail.com>, srini@kernel.org, 
	amahesh@qti.qualcomm.com, arnd@arndb.de, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
 <2026012631-suffice-enforcer-8553@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012631-suffice-enforcer-8553@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,qti.qualcomm.com,arndb.de,lists.freedesktop.org,vger.kernel.org,buaa.edu.cn];
	TAGGED_FROM(0.00)[bounces-90613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buaa.edu.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11D178D645
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:24:55PM +0100, Greg KH wrote:
> On Sat, Jan 17, 2026 at 10:03:51PM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not
> > checked.
> > 
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration.
> > 
> > The file has passed the check of checkpatch.
> > 
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > ---
> > v5:
> > - Squash the functional change and indentation fix into a single patch.
> > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t
> > 
> > v4:
> > - Format the indentation
> > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > 
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > 
> > v2:
> > - Add Fixes: and Cc: stable tags.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> > ---
> >  drivers/misc/fastrpc.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index fb3b54e05928..d9650efa443f 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >  		if (!err) {
> >  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
> >  
> > -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > -				    data->vmperms, data->vmcount);
> > +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> > +					data->vmperms, data->vmcount);
> > +			if (err) {
> > +				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> > +				    res.start, resource_size(&res), err);
> 
> Shouldn't the caller function report the error?
> 

That is correct, all codepaths through qcom_scm_assign_mem() will either
be -ENOMEM or print an error message, so we shouldn't print yet another
message in the log here.

(The usefulness of the error message in qcom_scm_assign_mem() could
certainly be improved, but that's a separate matter/patch).

> How as this found and tested?
> 

Looking forward to Xingjing's answer here.

But failing to handle errors here means that we're ignoring the failure
to map memory to the DSP, which will fail us later. So, that part is
correct. Exiting through err_free_data looks good as well.

Regards,
Bjorn

> thanks,
> 
> greg k-h
> 

