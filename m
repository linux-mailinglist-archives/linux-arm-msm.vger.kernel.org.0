Return-Path: <linux-arm-msm+bounces-117107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m6wwAsJyTGr1kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CFE717174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:30:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ku8lRHNC;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE35430046B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F248346AE3;
	Tue,  7 Jul 2026 03:30:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E82EC081;
	Tue,  7 Jul 2026 03:30:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395003; cv=none; b=hPiE45BWdtYJgcylp+Bbd0w6SmYPO/AbfAEcevx+HIlslPqkGbJz+hUEEb9ayNMEjYVkvFKV32ghoFSQcbeDrNuU3Goyr8GnYkwymMjSD5G/Pf3LZFSRp50p1sDU5oXwYcQMMVzxJj6zqgWJaPFIvFdynzApYWl5+h6280bCwxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395003; c=relaxed/simple;
	bh=vwTBaE6vqMPebBkKF7s+KPBrtgEj536dBlfksERdWc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV14XVDAyrc4Ikxp0LXi/1FjPNwYJj74gTBpsZffIdtXrGj4Y9j2ADlaao5WqVtVB17+vllgGHfpT6Bhe1FcsJPnHRBzzh1YBahDtlTJPs7BUch1s5Vh7WCIPSl/8IG3Cqv3HKw+H4wEr0hBVECCIKgOo2V2ln3T70aODwW0sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku8lRHNC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD081F000E9;
	Tue,  7 Jul 2026 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783395002;
	bh=BdSm9w9LnGQJ1pBIB81KY1z5WxN6VkGbTHYbagBNgrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ku8lRHNCf6CVUofmXA1M+X8vLitBCB4bGajAqHfEjRYVlj3ZBKiSd8nDs/NKWNmdv
	 eFJl0dxLtt5dNsCVIB0fjasu2zLQV6tIf6zOtJi/Tg6su5wVcP4XiOruAF71+chXYy
	 ySPwzzi2CikKrsisiTiFlc/GMAPO07pVMrzMtHBhwaReQCMC8Djl2EZKV1Tcoat/CB
	 VKn8lV7ZNCSDgh+YeLShXKRrje5tBR4+ferJmiXbqIxzHsC/spkSWrhw6NCj5bFAvE
	 ZPQu5d7QM2uEuEMH64UNi9YwPUT2ssxypt/27wNovIvXs9HVGChfYG0bSOP+l0JHDO
	 4v4JWLDcvtQFg==
Date: Mon, 6 Jul 2026 22:29:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Lew <christopher.lew@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smp2p: fix __iomem annotation on entry->value
 pointer
Message-ID: <akxyWw03z9fGqO64@baldur>
References: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
 <cc9cd039-83c1-479e-bb97-4c3b1345cf35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9cd039-83c1-479e-bb97-4c3b1345cf35@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ben.dooks@codethink.co.uk,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:christopher.lew@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117107-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baldur:mid,vger.kernel.org:from_smtp,codethink.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00CFE717174

On Tue, Jun 23, 2026 at 11:30:47AM +0200, Konrad Dybcio wrote:
> On 6/23/26 10:59 AM, Ben Dooks wrote:
> > The entry->value is passed to readl() so should be marked __iomem
> > so remove these sparse warnings by marking it __iomem and do the
> > relevant casting to ensure no further warnings:
> > 
> > drivers/soc/qcom/smp2p.c:280:64: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:280:64:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:280:64:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:318:34: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:318:34:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:318:34:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:446:26: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:446:26:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:446:26:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:501:33: warning: incorrect type in argument 1 (different address spaces)
> > drivers/soc/qcom/smp2p.c:501:33:    expected void const volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:501:33:    got unsigned int [usertype] *value
> > drivers/soc/qcom/smp2p.c:504:26: warning: incorrect type in argument 2 (different address spaces)
> > drivers/soc/qcom/smp2p.c:504:26:    expected void volatile [noderef] __iomem *addr
> > drivers/soc/qcom/smp2p.c:504:26:    got unsigned int [usertype] *value
> > 
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> 
> +Chris, is this actually iomem, or should this be treated as normal
> memory (since this is just coming from SMEM, perhaps just memmap()?)
> 

It's generally DDR, but in theory SMEM can dish out iomem, iff the item
we're looking for happens to reside in a RPM "aux" memory region.

It would have been nice if I figured out how to abstract this away when
I wrote that code...

Regards,
Bjorn

> Konrad
> 
> >  drivers/soc/qcom/smp2p.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> > index af0ceeaf6e07..fef6f17c3257 100644
> > --- a/drivers/soc/qcom/smp2p.c
> > +++ b/drivers/soc/qcom/smp2p.c
> > @@ -102,7 +102,7 @@ struct smp2p_entry {
> >  	struct qcom_smp2p *smp2p;
> >  
> >  	const char *name;
> > -	u32 *value;
> > +	u32 __iomem *value;
> >  	u32 last_value;
> >  
> >  	struct irq_domain *domain;
> > @@ -276,7 +276,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> >  		list_for_each_entry(entry, &smp2p->inbound, node) {
> >  			memcpy(buf, in->entries[i].name, sizeof(buf));
> >  			if (!strcmp(buf, entry->name)) {
> > -				entry->value = &in->entries[i].value;
> > +				entry->value = (u32 __iomem *)&in->entries[i].value;
> >  				entry->last_value = readl(entry->value);
> >  				break;
> >  			}
> > @@ -302,7 +302,7 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
> >  		list_for_each_entry(entry, &smp2p->inbound, node) {
> >  			memcpy(buf, in->entries[i].name, sizeof(buf));
> >  			if (!strcmp(buf, entry->name)) {
> > -				entry->value = &in->entries[i].value;
> > +				entry->value = (u32 __iomem *)&in->entries[i].value;
> >  				break;
> >  			}
> >  		}
> > @@ -528,7 +528,7 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
> >  	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
> >  
> >  	/* Make the logical entry reference the physical value */
> > -	entry->value = &out->entries[out->valid_entries].value;
> > +	entry->value = (u32 __iomem *)&out->entries[out->valid_entries].value;
> >  
> >  	out->valid_entries++;
> >  

