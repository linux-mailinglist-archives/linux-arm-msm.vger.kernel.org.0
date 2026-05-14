Return-Path: <linux-arm-msm+bounces-107590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EuSBtXCBWpMbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:40:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A7541C87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C641B3023326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5903AE193;
	Thu, 14 May 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX870/BR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B735E93B;
	Thu, 14 May 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762446; cv=none; b=uzi+s4uW1KsmZbAuHUm5HQw9sl8IO0uDCrDxLxkPdehgYTAimS+Of3ZuGkvHTonuo7u+ywuhzkbnUHminPQcaqoMstl0N1r+U/q/C/mclfY+bN+SEOP0CRJpz76idTmRL+54yaYsJdYgkJ+fgxVu2EZxW9v107xYCXXKKgjvfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762446; c=relaxed/simple;
	bh=iWCSZhdPb+8cBMuEmy8gSvTQVeilWYLmuEzyouzd7YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioznIQJHJ8oQhxAVLQdfk7z11ejNEfHYSpJJArBizh4+3GTHhn7rlzvDYZ8UzTedm7yPb4ihYTzkClvpZAvvpy0QVMPar+9icdILR7t9aXtaWFinlR+QnuvIcFbIOWkPFONSvdKP2VAR/fdJVmQDzmeSxudlJYOSfyDpLp7nM18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX870/BR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A76AC2BCB3;
	Thu, 14 May 2026 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778762446;
	bh=iWCSZhdPb+8cBMuEmy8gSvTQVeilWYLmuEzyouzd7YI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aX870/BR4AkM531xo6QouLrnsue0uIXWdlOfArk/WJtHsanCKyTM2w9zXR28xVImI
	 aR1ocP432CLGhdFFPANZ2zxuptdM6K4VLf6i9Ku61mNVNhnCi1OxvyG6QZsbxTgtz/
	 k+TrwGz1rJ2PnAItjV2X6NpSsPFw0BwtEgIddkekqyUdA1cT+b/48EbhV4Dnh5Ff+F
	 l4gysj8udrc7yx7I+I4SOFbO1zqwGK5j5nxHfAPzLQi4V6OqqS9IEaTTq1vfxaRbI8
	 sZ055fcAAnQbZClSRkkMy80vdQdMAopGR7BxGlvCJ2QbKHk3kq+7ZbEwpra5IycTF9
	 BybhmCNHu4eIw==
Date: Thu, 14 May 2026 13:40:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com,
	cristian.marussi@arm.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <20260514-towering-heavenly-earwig-b18feb@sudeepholla>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
 <5494a379-1e49-4551-a5f0-50d0bd7cd7d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5494a379-1e49-4551-a5f0-50d0bd7cd7d0@oss.qualcomm.com>
X-Rspamd-Queue-Id: B39A7541C87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,kernel.org,samsung.com,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 05:11:41PM +0530, Sibi Sankar wrote:
> 
> On 5/13/2026 10:30 PM, Lukasz Luba wrote:
> > 
> > 

[...]

> 
> > Based on this description I have a few questions:
> > 1. Why we don't use SCMI notifications for this purpose?
> 
> 
> This is an attempt to retrofit firmware, that is already out in the wild
> running on X1E laptops and Glymur which continues to use the same firmware, into
> generic linux frameworks, so that it provides some useful information to
> user rather than it being a complete black box.

We cannot accept changes that rely on firmware interfaces that are not well
defined. This is not a comment on any specific interface, but if an interface
is not specified with the same level of rigor as a standard specification, it
should not be expected to receive mainline support.

> We already have a ton of firmware changes suggested by Sudeep/Cristian that
> will be taken into account for the next generation of SoCs, will make sure
> this is accounted for as well :)

It is helpful to know this but also unfortunate as we have only just begun
reviewing the interface and refining its shape. Please do not rely solely on
the review completed so far, as the interface may still evolve. Until it is
merged, it should not be considered accepted. This is why I am insisting that
the interface document be reviewed and accepted before any driver changes are
made.

-- 
Regards,
Sudeep

