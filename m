Return-Path: <linux-arm-msm+bounces-92752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHzLIkjljmluFgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:48:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD41342F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0C2830055E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE949349AE8;
	Fri, 13 Feb 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIEKyZ5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69134888F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972483; cv=none; b=RPAtXvVopWilKKvnrSoj6n68MQ3VOPo4LUeR47XNK7pTbi8klEat0yRu7ol/LHmUm5a9cqstL916S4zyy1GrJfSGBf2g6tAFPI8GjGepFPKgXLxvB+Zz3sfEYC4Yk8s5uHU24JUe2Yvhr6jvikFH06lwQcmVDRlwkwe7QCUctf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972483; c=relaxed/simple;
	bh=sYVPcY0W5aokmXXau1LiI58XbehQLsCoQ855DU9hmIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtKP48zqWpVyMLVaDS8Vgs92dbxjH8wXQfj0RoGsfeg3i1XRIJVDkLOXdy4FSpxNbkfftNbiSUuCtm26vg2hGknjClFtbehiHRKgY++mpPB9+odGxNdYM1zFAAT4HvIx/YfbPdRMCbV7J1y5QrkkN/rwrYcHwqCXtwBM9DWd05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIEKyZ5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26643C16AAE;
	Fri, 13 Feb 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770972483;
	bh=sYVPcY0W5aokmXXau1LiI58XbehQLsCoQ855DU9hmIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIEKyZ5r/uNPJ9Vd0kESgfL8eu0ddYOGmMO9eBDw4pvtJ4iRAOHK1QHbZ56ADdNlp
	 U0sl+rrUJeSOpm2efDE0bxRpLvIsUNg5R3Ba4dAZsj9EsHUzBcJRiyW1nU9UsMpi3w
	 rQ9cIsbs6FZfPAuFgtM7eQihknk/A/50dRHDTXc0Yv7xNi3Uc/KJsk2VZmMKNpAYFJ
	 Okow9mMImpT0kujkfr6NR4AOuuAw/zZpnhV8Yz6gin8Q1YfdfuB9lRaoaEc9A67kuZ
	 FrRPuHnwgwtS8DUF/SVOxFCuDHgmbhjAMxTBhn7BXch8wS8Bxj2T8HKGXoXsZnu/ul
	 C1wnMmWbmjW+Q==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqoqA-000000000YZ-175U;
	Fri, 13 Feb 2026 09:47:55 +0100
Date: Fri, 13 Feb 2026 09:47:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <aY7lOq6jOwTEsrZW@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-2-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-2-loic.poulain@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92752-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADDD41342F3
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:36PM +0100, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.

What do you think can trigger a suspend in that window?

(A racing user space request to both disable and re-enable runtime PM
could theoretically do so but not in practice.).

> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.

I think the commit message should reflect that this isn't really an
issue.

Johan

