Return-Path: <linux-arm-msm+bounces-100801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIdACWp4ymnk9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:19:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B535BCE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F13EB301A7A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7CF3D3D13;
	Mon, 30 Mar 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzPO1khB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFF23D564E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876700; cv=none; b=B3pdoET2XUol0GsUJVV8TnqYYyUyk1WWPa82HAPKvn58dm2jtOkQCwK7meaeMDvkj9WnOLYUVpPBCJGGE1ENqAoYjL1nOMXlzusJnLesaoQpZAnjAU0G8h5CdMmy1Ty8GbSqI9t1wvQYIUI/IgEHv/1OxEEknCWHfT01ZgKkdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876700; c=relaxed/simple;
	bh=Lp+yV4eOUxpcO9cFGBxuCU7uDDn3sFJPCCwKMc3szRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvYGQzNeYJ6TPI9039pHkgHxuJg8ZcGJtgBn1/jmN6ACUvYHTMBMT8JcIyv4X2dSPx9b/1E8foPVO++l1XwSx0S98/VIhRVorCNO/ynXeASFxBFJfSRA/q0cb6wz9wzPtkUlrHqqgHPVOrIAUEBEftKqzahCAgZGRvfq4fKTVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzPO1khB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D20BC4CEF7;
	Mon, 30 Mar 2026 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876699;
	bh=Lp+yV4eOUxpcO9cFGBxuCU7uDDn3sFJPCCwKMc3szRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzPO1khBeuQKidjsv+6DAfp5xj1GkF/YT31D1lHve3GPaeu/07dQTrmmUgQ2NJmHK
	 Yo3xWckScuBd8qrOEqxHvLdjX/MTPSsdx1rdO5mgS8B4wnrfsb3qG+1pnzVRvMPOVH
	 cwPBUK0EiYRmrtFNWKWjw/CzSPxw7RIePVeRJk8owY1ngoOjUdsgIo3XGlID9L6Q4N
	 qp9BpAVrQrbmUnr0xYCuRBwSxz9mwpDiO08csqXURC3S4T1V/RdGBkcbdYdm9vQZQl
	 sMaadG6rPbmPoL565jg3YdNs8vkXOAtJbNumDPI6/bm9uzyEaGptl8qWQ6jy8NbI7j
	 Bv/lCd1UQhOaQ==
Date: Mon, 30 Mar 2026 08:18:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] soc: qcom: cmd-db: fix minor version decoding in debugfs
 output
Message-ID: <acp2snyXEzxuY_HS@baldur>
References: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
 <eed2185e-1754-4e5a-8a19-36b9f968c03a@oss.qualcomm.com>
 <bdaccf73-d7aa-489a-b0fe-94ea2d1d2a83@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdaccf73-d7aa-489a-b0fe-94ea2d1d2a83@oracle.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.com:email]
X-Rspamd-Queue-Id: B98B535BCE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:33:13AM +0530, ALOK TIWARI wrote:
> 
> 
> On 3/30/2026 11:05 AM, Sneh Mankad wrote:
> > > cmd-db encodes the version as major in the high byte and minor in the low
> > > byte. cmd_db_debugfs_dump() prints the full 16 bit value as the minor
> > > version, resulting in incorrect output.
> > > 
> > > Extract minor from the low byte using (version & 0xff).
> > > 
> > > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > There should be a "fixes:" tag added since this is a fix.
> > > ---
> > >   drivers/soc/qcom/cmd-db.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> > > index 84a75d8c4b70..eed7013c7676 100644
> > > --- a/drivers/soc/qcom/cmd-db.c
> > > +++ b/drivers/soc/qcom/cmd-db.c
> > > @@ -301,7 +301,7 @@ static int cmd_db_debugfs_dump(struct seq_file
> > > *seq, void *p)
> > >           version = le16_to_cpu(rsc->version);
> > >           major = version >> 8;
> > > -        minor = version;
> > > +        minor = version & 0xff;
> > 
> > Minor is already a u8 type, so assigning a u16 type version to u8 type
> > will automatically truncate the higher 8 bits.
> > 
> > Its the same reason why version is right shifted by 8 before being
> > assigned to major variable.
> > 
> > I do not think there would be any difference in output with or without
> > the change, do you have any example?
> 
> 
> Thanks for pointing this out.
> 
> You are right that if minor is of type u8, assigning a u16 value will
> implicitly truncate the upper 8 bits.
> 
> However, the intention of the change is to explicitly extract the minor
> version from the lower byte, since the encoding defines the version as major
> in the high byte and minor in the low byte.
> 

You should say this in your commit message. Don't try to sneak changes
in, describe the actual problem that you're fixing in your commit
messages.

> Using version & 0xff makes the extraction explicit and consistent with how
> major is derived using version >> 8. It improves readability and avoids
> relying on implicit truncation.
> 
> Since this change does not alter functionality and is mainly for clarity and
> consistency I believe a Fixes: tag may not be appropriate.
> I can also drop “fix” from the subject to avoid confusion.
> 

I agree, this isn't a Fixes, because there is no problem in the current
implementation. A change of this kind would merely make the code
somewhat easier to read - but there will be more of it to read...

Regards,
Bjorn

> Thanks,
> Alok

