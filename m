Return-Path: <linux-arm-msm+bounces-90044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOMcJCMFcWmgbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:56:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14F5A344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34652A6992D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E04C4921B2;
	Wed, 21 Jan 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLntN/Uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B04921A4;
	Wed, 21 Jan 2026 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008624; cv=none; b=Wg/+Mcqk68V6x6ORfZ8quWqOWJt4Ta8ffQuf7XyU7QKtx9Fv/sKWyYZsO7SFnqrEZrtDckP3FUBFSB6Kpf4MvieSH0vs1TY2P8Y1jvjlLTIJVISVira98uaVhCi9TgAyGYryPgob3Lc8PpCFt+p7mCznpiB3cbK8pR9xhqlKz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008624; c=relaxed/simple;
	bh=3NufzOOUpRVgTlGEqPb/RONmrOLyphUBqbKNx+dznU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpe5WBpN10s1kYGn08AdI7o1uR/aJLG1ZeQ9KXvRymObOrQVLXVV5BwhRH89qA7FLgutAaosN4NgEJ3OcuPXR8YCnFjAQn0bzQjalVPgmvPOBanDpFzyUev9d0QPhqQY/XA84K6sN2MWXRxAlRqHr48EqHLzPpdp8WyGOcrxaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLntN/Uz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D41C4CEF1;
	Wed, 21 Jan 2026 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769008623;
	bh=3NufzOOUpRVgTlGEqPb/RONmrOLyphUBqbKNx+dznU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLntN/UzKRS1L5Yxq76njol0e9ptYEOZv4qvwpfqqB4mLYZB9tu1wiRuRCqSuV4i7
	 eH7260Y7tRhPKig6RYHI1XwvjmAGnfnyD32E6an1yJHUj2uKzQjB5mFbFV5nXghJ1E
	 HiuzdWLPiusGMB7vXcXpQDb+jXZPfU1HVIOiQMYEdNC9k9waRlhJL20yWHXUkg2Is5
	 K2AWvb7T2jUETGsZRWNuyXw3/Wf7s+reRTjxXLvh6EC6+Pcx/FEtCFuCqoTj2QIZ3f
	 dGiZFVgLv0jSMgBeWqBxtz2jZsZt64ycvwzykCe30kcsN+MG113QsgMhRO28+OSg/h
	 Vh+cjnO5IIVNg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1viZx4-0000000067K-39Ms;
	Wed, 21 Jan 2026 16:16:59 +0100
Date: Wed, 21 Jan 2026 16:16:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdaLF_A5fghNZhN@hovoldconsulting.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90044-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 1A14F5A344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > The hw clock gating register sequence consists of register value pairs
> > that are written to the GPU during initialisation.
> > 
> > The a690 hwcg sequence has two GMU registers in it that used to amount
> > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > the updated offsets now lie outside the mapping. This in turn breaks
> > boot of machines like the Lenovo ThinkPad X13s.
> > 
> > Note that the updates of these GMU registers is already taken care of
> > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > properties on a6xx too"), but for some reason these two entries were
> > left in the table.
> > 
> > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > Cc: stable@vger.kernel.org	# 6.5
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> This one does not seem to have been applied yet despite fixing a
> critical regression in 6.19-rc1. I guess I could have highlighted that
> further by also including:
> 
> Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> 
> I realise some delays are expected around Christmas, but can you please
> try to get this fix to Linus now that everyone should be back again?

I haven't received any reply so was going to send another reminder, but
I noticed now that this patch was merged to the msm-next branch last
week.

Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
cycle and I would have assumed it should have be merged to msm-fixes.

(MSM) DRM works in mysterious ways, so can someone please confirm that
this regression fix is heading into mainline for 6.19-final?

Johan

