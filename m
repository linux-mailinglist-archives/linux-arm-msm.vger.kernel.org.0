Return-Path: <linux-arm-msm+bounces-112001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6qcDeygJ2qAzwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:13:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE765C605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:13:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rs5+kEtO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112001-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112001-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26D433013AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325C739021E;
	Tue,  9 Jun 2026 05:10:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2415D34250E;
	Tue,  9 Jun 2026 05:10:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780981834; cv=none; b=IyQfpcMOy/7n2ZVOnnjIFkDCjFF9E59koghA9gu/MFiLtIHHIA4PQuLt76fJeCex/lK4cNgn7zlV38/Ou5am1FwLKpgJ4EzlXvijShSXS7v9ZmPctD1tnvK72eaz183uihAY9VrNxDLV+CHPjf7Prjk1++ytGQnl9bWPbqYQORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780981834; c=relaxed/simple;
	bh=WpOfWYsOGv9kVZso1tAODn5iwjjYi0wWOL2kPQ7WQVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5G9Vfr9EYpGz1JEiaE0gDchEUazI2q44JXAgLxw4Aa5l+SimAr75LX0d139MgCjRPPhIPZiimsN0iTBgSaB2Tb7DJlQJhp3wsSwEVtgRyJLUtHieFxQcgvcFwg+kl5nSPyrJff1Q36pTARIOmnsLB7eNYlo5dbf2G4dY962GTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs5+kEtO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D91C1F00898;
	Tue,  9 Jun 2026 05:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780981833;
	bh=QXwYSFO/CAa982xKorgRfVuCI6xgoA1aQPNLHYhjS0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rs5+kEtO80ELluAbo6JCkL/DVq2OfyETURTtSy5woIqIfT7CcAnZ0JtMDubF30NwW
	 pKCgNqrB/bza7tXEDb+O/TAYSGHIwnAFWBlxvchAlDYUu4W5v6ECT2tCUfEv2vk50E
	 gxJ/a8SrqfSAeuxsAe7Cg+HBPTvkWFQ3Dq5YrTbE49dS2t+vkNwCIEgUjxDgtYQANk
	 QdvaZfKhpFE/fNNI+fijur9CL2lA4f9b+ltN2AKWzfU4QOYaO59ioncrcAc7LK3WSY
	 d6aoJnQCyFXa7MOzhA/WLb4w0krTBE8vtdkHiO11liP98jK2v/HYw5ErxJzdEmUZJK
	 Kz19zbj1g0VIQ==
Date: Tue, 9 Jun 2026 10:40:26 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
Message-ID: <aiegQubVKWXs3MXw@sumit-xelite>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <aieAnN35K_WarmUD@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aieAnN35K_WarmUD@baldur>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112001-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:vignesh.viswanathan@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DAE765C605

Hi Bjorn,

On Mon, Jun 08, 2026 at 09:59:35PM -0500, Bjorn Andersson wrote:
> On Wed, May 20, 2026 at 12:56:16AM +0530, Vignesh Viswanathan wrote:
> > Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
> > bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
> > driver to support IPQ9650 CDSP remoteproc.
> > 
> > This series depends on [1], [2] and [3] to functionally bring up the CDSP
> > remoteproc on IPQ9650, but does not contain any compilation dependencies.
> > 
> > [1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/
> 
> I'm not able to determine why this is a dependency from cover letter,
> commit messages, or the patches. If you have a dependency on this series
> this isn't your typical PAS-based subsystem, so describing what it is in
> the cover letter would be wonderful.

Probably the cover letter didn't mention that this IPQ chipset runs
OP-TEE/TF-A as the TZ, that's why it's unclear. Without the OP-TEE PAS
series, the CDSP can't be brought up on this chipset. Similar would be
the case for all other Qcom chipsets supporting OP-TEE.

Not sure if there is anything missing for the OP-TEE PAS series to be
picked up. Surely we missed the current merge window but hopeful you
will be able to give some attention to that series for the next merge
window.

-Sumit

> 
> > [2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
> > [3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t
> 
> #3 is a fundamental part of the addition of this remoteproc driver and
> the solution would be better reviewed as a whole - so you should send
> the two parts in the same series.
> 
> PS. If you run "git log --oneline" you will see that there shouldn't be
> a "drivers:" prefix in your subject.
> 
> Regards,
> Bjorn
> 
> > 
> > ---
> > Vignesh Viswanathan (2):
> >       dt-bindings: remoteproc: Document IPQ9650 Compute DSP
> >       drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP
> > 
> >  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
> >  drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
> >  2 files changed, 172 insertions(+), 2 deletions(-)
> > ---
> > base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> > change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3
> > 
> > Best regards,
> > -- 
> > Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> > 

