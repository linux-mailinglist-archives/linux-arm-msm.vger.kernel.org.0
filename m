Return-Path: <linux-arm-msm+bounces-103433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDNiNDLr4GnWnQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:59:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7A540F4A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECA093026A9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F213BD246;
	Thu, 16 Apr 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdKdXBRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA734C826;
	Thu, 16 Apr 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347753; cv=none; b=HOHQ01Fi0b/TPSSjelNVtbxi6+fbOQBOTWfZsdv76EBQFHqVhVgJ3ObM5h0HWGbgDQaJPFBD1L1hP5a84jsvPceu6ggXznSW+qYPL4enbuSUTIJQFLRY1fXPelaERyBLR6v+YCz7MgH/pWLADdMx7Xx9/dj8dDnjXE9nuvapqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347753; c=relaxed/simple;
	bh=lqD+SPwFirH7Jum4uHe9GyVl4vNoTIF1CF4z7fb6XtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHygj+SVc8fjP5qinPC5H3wQLgeMroh0FBZNJWcZCMGHd0D81MioolSTayz5+g6dDSFWqjd7fsEazMYUcBSkG3ZJc7gQwPT4UGOQbQXsNawGPu48iBQC0sqkXrlf0kdtlie7FjDekXIPP9ofUqTq51urUfHVgn/IfGrRMgEGYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdKdXBRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3211AC2BCAF;
	Thu, 16 Apr 2026 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776347753;
	bh=lqD+SPwFirH7Jum4uHe9GyVl4vNoTIF1CF4z7fb6XtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdKdXBRyaKd+k2Pm/1tyu3X9REMzQO/pZOyHyEYIYXlGLjDy+3b7whjVtiH0dBJ5E
	 XOuh42W+MwLU6UHuU1EUhYSNbFgew/yyeTtjChUTPmmVUaMqzpQxNc76dHY6GE99o6
	 KTgSt13CYfa5Y+eLVcXVqyqwhI8lwuLBrebnIik5FGJxOf2xHXnW/OgLJplzdgMzZM
	 3FvQXEy15EgFRTA1Z1wWNsA9a/xmNyE0zIhyVQjMzXt5AmrLoi7mMPucPZR8rxvEUB
	 NujR8tceRGp/GOg6FT195TKKZ3NrS3tIPS06qIz93xnbt0T0/JGmBSsy7URH+S1mMU
	 00vzIqZmINauw==
Date: Thu, 16 Apr 2026 08:55:51 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
Message-ID: <20260416135551.GA2923673-robh@kernel.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,ucw.cz];
	TAGGED_FROM(0.00)[bounces-103433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F7A540F4A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 08:15:05PM -0700, Paul Sajna wrote:
> Rollup of improved hardware support via devicetree for LG G7 ThinQ
> (judyln) from sdm845-mainline kernel fork
> 
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
> 
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
> 
> Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002

Generally no one is going to look at nor apply a 7 month old series. 
Anything not based on the current rc1 should be resent. Also, that's v1, 
not v2 that you sent.

However, the .dts change was applied and now there's a warning and I 
ended up here. So I've applied the binding change. You can resend the 
driver changes if you want your display to work.

Rob

