Return-Path: <linux-arm-msm+bounces-99966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFbOFRpoxGkYzAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:56:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C032D327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B6393011CAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFF138F23D;
	Wed, 25 Mar 2026 22:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqrLtmca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02741CFBA;
	Wed, 25 Mar 2026 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479384; cv=none; b=A37Cam8Gp6pN/tiNkXirNDr/Um5IHYwAuM1jEVu1Vn026gm2nJZPcuAPV0oHthqgmhKW3eLq//TIVf2R4s4tjdA7W29JxguNpuFdDWI8LxfIYgp2gCs+2eAyNreZS11hdjTgr7iUBZtATj4/3LMmu/at4wEcAH/AwRB90aj4QY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479384; c=relaxed/simple;
	bh=1w2d3ITGOVbfzCTyT+2G94mj8V14/URsiXuFpQHnIg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTffAm1HcNKeRIZBLgJH67owQXSufd7C1OQ7PinyEg4J5pnyw6hWlJJk61RUIKaL9PzAhecjL6J81BIEoNJHbQ7IcAMI57DmoyWP2GvMDoPu5D7vbHtBWxRGiPPZzcu2QnCGpRvzS7a5sT/b92yoid6u1MsPe8v5Dnz1Zw2brXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqrLtmca; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0435BC4CEF7;
	Wed, 25 Mar 2026 22:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774479383;
	bh=1w2d3ITGOVbfzCTyT+2G94mj8V14/URsiXuFpQHnIg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqrLtmcaDSoQE39WKFwhGeW18R2GPkkQMe3KBsm3kRfWH+18Jujqdh49LDGLsLqU2
	 VnEjH77MWdywGMtcVxZf2/NGjC0K8Imj60QXavP/NVcIj1h1BQqoryy9hkhn5TqLMi
	 Fxr3K6WMfYguId40Wq2BhMR5h5jFP3tIApKcxxaAWJJ2/F5FkPvIyk4cCT8WVh4t9O
	 DxzVc4wl8VJFdc5yLB22KCyMO798NZjuAQa3mP0NJ3TBJf/a0WPOj9adX9XqsOEQZ0
	 p4FEUCcKGdmy+DS4rIt8qSnqcJmDmYBzVAWzlvKDaY9JoSDhp1hS4W/laUvj0eu2gI
	 DUIJw6bNkygpA==
Date: Wed, 25 Mar 2026 17:56:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
Message-ID: <acRn4xQPsBJbCBmE@baldur>
References: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
 <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
 <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99966-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F18C032D327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 03:45:24PM +0100, Konrad Dybcio wrote:
> On 3/13/26 3:37 PM, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 03:08:03PM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The two non-multiport USB controllers present on the platform are
> >> role-switch capable, so mark them as such. They need no additional
> >> plumbing, as tested on the X13s.
> >>
> >> Enable OTG for all devices featuring a data-role provider in one fell
> >> swoop to prevent hitting the edge case where UCSI code would time out
> >> trying to get a reference to a struct usb_role_switch, which wouldn't
> >> be registered if dr_mode was set to anything other than (the default)
> >> OTG.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
> >>  arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
> >>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
> >>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
> >>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
> >>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
> >>  6 files changed, 4 insertions(+), 40 deletions(-)
> >>
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Unfortunately it seems like that while it works, it makes the x13s crash
> upon resume
> 
> It also crashes there if we flatten the DT node and I'm hoping the solution
> to that will fix both, but we have to hold it for now
> 

Please resubmit once this has been figured out.

Regards,
Bjorn

> Konrad

