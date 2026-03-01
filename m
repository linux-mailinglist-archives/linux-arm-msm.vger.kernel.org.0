Return-Path: <linux-arm-msm+bounces-94718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHPkCiImpGmyYgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:42:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CB1CF5F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B756B300D969
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5511F91D6;
	Sun,  1 Mar 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbQfejR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88805175A7A;
	Sun,  1 Mar 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365342; cv=none; b=omWZUgMOKAxI47SdkNoQDrCUC3TSEmDXd1AFasKhUJZUS8XLCz47G4CF3GUE+AK6mriqJRdCo1ER/ne6U2rq7lviWzI5ec+5s//KiGZk5L3e4z3owi4LzlZqar3ySJYBkW1ZGTpkOBQCrKAXpdXaMvgVjfP46uXZASEH39Bx8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365342; c=relaxed/simple;
	bh=f+bAkdDZB2L11jf0C0TAV2CE8KsC5uGvHGZbEgadEzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTVHRFnEVR3fsNHYwOnj9bsKFFG2UvvRajhiyKTAdZdBdZPB9BKOm27oiGk6fhqQYRSBHjROZGwBXiO947u1p+VNBKVtetPALBz7LfmSR5vg92PP6umMhSkvWdCPd0TGJCTnX2btGSTMwKtActTncT04fwN9pnDMjmTr3yLR+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbQfejR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B77C116C6;
	Sun,  1 Mar 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365342;
	bh=f+bAkdDZB2L11jf0C0TAV2CE8KsC5uGvHGZbEgadEzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbQfejR45jgg2Q/jVSOOzm3u9pYz2LclxuBgRu6FTSB6R5DqkevwiZjnWToCIhNNA
	 +HMh4bp87ihehl/zi1P9sSWYXqiZY+P/XqIlJH3pd7MKvJntjZZ39mywf6QgPp99A8
	 tHMuKX6nLZU+qW9hlkrfEeL3zejuzIFV8jPfjNGCLdSq1O3tICqhhk9RYXWhfJcBQm
	 S/JEWa6TOTEKBzCsuWgySe+4i2/UktuSuVIhPXamB4fEkJI08Uhx11L15ABiiKb+6a
	 gJ2uf/4ZAFUOR4oB8EcCL45u/bfG9WBVVpb9ocUR+jYhFaGAH5vcQsV+NGGmlAybtI
	 k5CVgiiuXCEqQ==
Date: Sun, 1 Mar 2026 12:42:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add
 SC8280XP
Message-ID: <20260301-poised-black-roadrunner-2fa89a@quoll>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-2-mitltlatltl@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94718-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE4CB1CF5F0
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:12PM +0800, Pengyu Luo wrote:
> Since SC8280XP and SA8775P have the same values for the REVISION_ID
> registers, then we fallback to SA8775P compatible.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


