Return-Path: <linux-arm-msm+bounces-98587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AApoHyxsu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:23:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733C2C564E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6009C300D4C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA40535B64B;
	Thu, 19 Mar 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEEOJHAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633923EAB3;
	Thu, 19 Mar 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773890599; cv=none; b=O+yvsZ0dwI/cqPzNAZhoAiKG8w8v40PkqpOLDO8IROuR3uznFb/AtPBKBYlodxy5mx5o5Qh4zOnDG3rnmDi7mc5ZFYTTGkcB9LqnaKa1ejlX51bJeoK97JDE4okXpPwuZWJLs8LNOYvabg+Tmy5ziVJbRLmkuNZJFRaTYXIzsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773890599; c=relaxed/simple;
	bh=z1II2OHroAngsbbKC6NIOGadMJqERZcwkEotab2yXC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI0//a2bEjUubTKCSRHXHOiTsx17rm4Vtojhr2ZylgiJoYedfKcliZtK4oNWXuG7vsak6hUKQvebM9GrHC5sb5O5WW10+xzJz+LY8N+P2pC+bv9Fq7Xivce3y28UpAy3ECW1YBYULpQdPhCtQVR/bYh3OssUoi0qbDg1+0m3Vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEEOJHAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A7CC2BCAF;
	Thu, 19 Mar 2026 03:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773890599;
	bh=z1II2OHroAngsbbKC6NIOGadMJqERZcwkEotab2yXC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEEOJHAuIh1//5Z4rTC7D+iPDrXRhS1WakqDNbvGxfoLYMolrvps1d+opsTVpd9oe
	 f8di3zj+FXzZaIcfz4NgBSdQj/43vP8MobDwQVc2+yL5rHt6GFJauFeWpUQGTfRIIu
	 GrZMAspGnIxZl9UVA0+ERt/02cBpqVy0MCmGW4bRCQGT4OS6afEiyFgnUSVsWOCu/z
	 Sig1YPlZlsOq011d1iez6nlz9o/9OXyByeKYjtaMBlPOfLisBc/ObKFKpXkKGjFdzP
	 wIBjPk3fHlgwJEAtETuAJeYVhUFN3zVcV4t5Xih97QqapPwKlr4aXQIBNn5NqX1BUw
	 fFsd4HThmjsUQ==
Date: Wed, 18 Mar 2026 22:23:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <abtoWwqKLNgXD6Og@baldur>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
 <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
 <abdfDoH6rfNYKmHa@baldur>
 <y3xbffh2ogdf66tvtxu5ig6ucqgpfo7vozcr7e7hftqvbxfza5@6p3ridipdmkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y3xbffh2ogdf66tvtxu5ig6ucqgpfo7vozcr7e7hftqvbxfza5@6p3ridipdmkh>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98587-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0733C2C564E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:51:46AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 15, 2026 at 08:41:02PM -0500, Bjorn Andersson wrote:
> > On Fri, Mar 06, 2026 at 05:15:32PM +0200, Dmitry Baryshkov wrote:
> > > On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
> > > > Due to the way the DDR controller is organized on Glymur, hardware
> > > > engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> > > > Follow that recommendation.
> > > > 
> > > > Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > Changes in v2:
> > > > - Fix the syntax error...
> > > > - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
> > > > ---
> > > >  drivers/soc/qcom/ubwc_config.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > > > index 1c25aaf55e52..8304463f238a 100644
> > > > --- a/drivers/soc/qcom/ubwc_config.c
> > > > +++ b/drivers/soc/qcom/ubwc_config.c
> > > > @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> > > >  static const struct qcom_ubwc_cfg_data glymur_data = {
> > > >  	.ubwc_enc_version = UBWC_5_0,
> > > >  	.ubwc_dec_version = UBWC_5_0,
> > > > -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> > > > -			UBWC_SWIZZLE_ENABLE_LVL3,
> > > > +	.ubwc_swizzle = 0,
> > > >  	.ubwc_bank_spread = true,
> > > >  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> > > >  	.highest_bank_bit = 16,
> > > 
> > > Carrying over from v1 discussion.
> > > 
> > > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > 
> > > It depends on the fix which is currently a part of msm-fixes for the
> > > device to function correctly. Raised the question on IRC regarding the
> > > immutable tag or any other proper way to merge it.
> > > 
> > 
> > Sorry, I did see your question on IRC, but didn't follow up and forgot
> > to ask about it.
> > 
> > What do you mean with "depends on"? Why do we need an immutable tag?
> 
> Disabling LVL2 / LVL3 swizzling on the GPU side requires the patch from
> msm-fixes. Otherwise the GPU driver ignores passed swizzle, making the
> hardware use incorrect memory layout in case of Glymur (A8xx).
> 

So this patch must appear after the change in msm-fixes?

If you have already gotten the msm-fixes merged upstream, in which case
ordering is already achieved, without the immutable branch... 
If you haven't, the immutable branch is not going to help, as it doesn't
guarantee that the immutable changes arrives in torvalds/master only
after the msm-fixes.

That said, this seems somewhat theoretical, as there's no GPU enabled in
the upstream DTSI afaict.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

