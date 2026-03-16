Return-Path: <linux-arm-msm+bounces-97771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDHxGClht2l5QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:47:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3282939C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FAF830074D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D6244661;
	Mon, 16 Mar 2026 01:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWtTpDjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D82242D9B;
	Mon, 16 Mar 2026 01:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625266; cv=none; b=rNeDfeUrB2Za6ys12BNQRHKGMK6SW6UURcdrk8m8yy9bsz3594mNI4tOr+DmOeEA1eTjpFUFvNJ0GmBCWqvaNEbrtXws+2xLefmU4oRhQNdNWJMzyRV+WYZwVuxC7xJK9v9U0cTxViA0fPeH/HnoBOrmck3Bh1YzgGSvn2HvBWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625266; c=relaxed/simple;
	bh=+zrryHUg8/bVE6Yv1L0PSu02nfjsqtyzt8BBmAqU7So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKPozRX95BvtMKauzgM9GQNdpaGTnpZfJ6q7ojzqIzOEpPUPiqw8UZHn58FXcr6I9lVOtxAUdvE0yHd2Kw3F3kcHbf3d1vYpjYUB+RjJX6SunS+nguItIZt2uCAc6iLKcsV7K7YG2PZvsYLEzulsHnpUdJZa+WGr+sfSis8+SWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWtTpDjS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD6C4CEF7;
	Mon, 16 Mar 2026 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625266;
	bh=+zrryHUg8/bVE6Yv1L0PSu02nfjsqtyzt8BBmAqU7So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWtTpDjSirvxx+mPHVfb83yAeIVflYWZiM76WBWWtZ/GeCSluumt0ulYfM2mfnaXk
	 e0tQFsuCakhTzWCgwNLys6xdUn+GBN/D08nsTngmSTQxC6tAKxhuEGtZJXYAee4DBZ
	 rbb2Xq1zkdLvSUuMDzwcov/yHduTgo4y27vphC+s6tiuUJTuRrOzn+azCLjnnUWQ2q
	 c9d1XS7HANwi0wupdmP6BtcSeDXG8ROlHb0twmXBfSY/BipnZXtCYButT1CsXQrqpf
	 S0X4u3IClcRvU7+k1rS8/JZPZtXE+nMcu8JdSsU76dIvHRy+Z0CVZ7JHCXQWZf7+Ts
	 jHJFEDVpuFfjg==
Date: Sun, 15 Mar 2026 20:41:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <abdfDoH6rfNYKmHa@baldur>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
 <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <guisclar3eonn22vpjbdnzwbztwkrbbmvous7q757lihne4zbb@jtnnmune4uit>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97771-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,quicinc.com:email]
X-Rspamd-Queue-Id: 8A3282939C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 05:15:32PM +0200, Dmitry Baryshkov wrote:
> On Sat, Feb 28, 2026 at 08:34:27PM +0200, Dmitry Baryshkov wrote:
> > Due to the way the DDR controller is organized on Glymur, hardware
> > engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> > Follow that recommendation.
> > 
> > Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fix the syntax error...
> > - Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > index 1c25aaf55e52..8304463f238a 100644
> > --- a/drivers/soc/qcom/ubwc_config.c
> > +++ b/drivers/soc/qcom/ubwc_config.c
> > @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> >  static const struct qcom_ubwc_cfg_data glymur_data = {
> >  	.ubwc_enc_version = UBWC_5_0,
> >  	.ubwc_dec_version = UBWC_5_0,
> > -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> > -			UBWC_SWIZZLE_ENABLE_LVL3,
> > +	.ubwc_swizzle = 0,
> >  	.ubwc_bank_spread = true,
> >  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> >  	.highest_bank_bit = 16,
> 
> Carrying over from v1 discussion.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> It depends on the fix which is currently a part of msm-fixes for the
> device to function correctly. Raised the question on IRC regarding the
> immutable tag or any other proper way to merge it.
> 

Sorry, I did see your question on IRC, but didn't follow up and forgot
to ask about it.

What do you mean with "depends on"? Why do we need an immutable tag?

Regards,
Bjorn

> > 
> > ---
> > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > change-id: 20260228-fix-glymur-ubwc-f673d5ca0581
> > 
> > Best regards,
> > -- 
> > With best wishes
> > Dmitry
> > 
> 
> -- 
> With best wishes
> Dmitry

