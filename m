Return-Path: <linux-arm-msm+bounces-109068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHFOAb8FD2qFEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:16:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D972F5A588D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4465030562D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633C0349CD9;
	Thu, 21 May 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARm1rHaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EE202F70;
	Thu, 21 May 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368680; cv=none; b=eG72PvLf3G//E2Ub2EDjvAFSlptvQzoAXjpQ8s+vk+O6kQKwd5DDlAoNSgkHMC+sxTn2abyCpMK5ftAsbZ3M3OUl35lHBgauRduWvEsdKOo92yhBRgjPU2v5aSVsxs8EX7pi+NhhH/49j/B17OkLc4GF825rEqUKKJQgZ88LuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368680; c=relaxed/simple;
	bh=tEdqWOdLGoscQom5A9Sv8FsWifnV/7IKAKaBKNZF69A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PVymthm/vTDw/4tmY79MS5GcfxPle3jBkYh8yuhEuiZIqJA3qRKlbaSEgiEv821CdlNsrT0hxRIZOOPLIavFNg+XpKXAgN8G5VHUfYj3urmdDou/nfud+mmbo7xVqAEaql/LQrAZF+Bbpw/UGzES+OGhg3o7QMYO0t3FyJ49nZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARm1rHaG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268511F000E9;
	Thu, 21 May 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368679;
	bh=HSu++TYyXNWN7UkuhucPI0krl37s1KlXCzikluLnBvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ARm1rHaGiTpNM4TayhTd4I5+Bp31XH/mna8eZsWVfBcox620aXO4o7Cu4h1yA+Jyr
	 YWvK3rZEvHhxxb8g/87nDRW2Oea+jWEDLQ5k1ml5fvCT3WcKekfrbIckHd89ZTNTUC
	 xNKPSuglSJOMnjo2xpgThehFJD+2QES2FX++/WtPn2UsxzqXGLRXKr8cD4NwkrjPKc
	 Wb7r1aGws5vQ+4yNqeD1TBZzhgF6i0wl5tHBcrt0udEpB/X3FPLyJ2T8F2Oyue4Nkx
	 nd+1w4WLi+fAQMzEndtZrRtiXTe0ZlGPhx09v1dG/8sqO76J0MMuSE0UTkSxJAHwVG
	 r1Hs5UWr3WI7A==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260514-msm8960-wifi-v2-3-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-3-7cbae45dab5e@smankusors.com>
Subject: Re: (subset) [PATCH v2 03/10] mfd: qcom_rpm: add msm8960 QDSS
 clock resource
Message-Id: <177936867589.3586629.11413200027317835778.b4-ty@b4>
Date: Thu, 21 May 2026 14:04:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D972F5A588D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 21:08:32 +0700, Antony Kurniawan Soemardi wrote:
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.

Applied, thanks!

[03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
        commit: 72c793196d12cb27e192dee77c3ea64c755b7687

--
Lee Jones [李琼斯]


