Return-Path: <linux-arm-msm+bounces-116605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0bIFbnGSmrwHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FFF70B6A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TwBi+5CE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D40BF3047D9E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268D83B1ED7;
	Sun,  5 Jul 2026 20:58:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0D3A9632;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285102; cv=none; b=TrJTL65SlLd4ko/bc83pB6lQDE/ySLnh2mSfE0jONruoT00bqjvsdM5HlX8YpVXZL7IN6gTU/THpgXnJrOTNAzv970egfeKfRAAHGprNeSf67jGHVh6gFrDbd0IUsjCDvv3WHHyYPgXL1y9zcDuhhKWDmpr9jBvGcvBAVaalNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285102; c=relaxed/simple;
	bh=aGGiZLydK4RCrd6EPSkpIgq5BEvXzF25Bj5Or3yIncw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=boc4yLtraEzNaPYC/rufnhKqPKCQnEg3IoCsULin8p1fjcFvvkBpUEPgLmU2kfIChzAKr1iqp7cT9RLg2rbArhMKiEJjoQ1dvGCbyEWgTLWV3tiTTVmC0M2o2iGNwpO4EfG4WO6VhSqOBQtzWW/Y+IRz5ke6OtJvgTdKgKrhuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwBi+5CE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A561F000E9;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285100;
	bh=hFeO7rsW6H6wU2vdvyiaFls/FVqCTObUGm8u8D4ymu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TwBi+5CEsq1poxaJbAaB/Vz8i4ZTUMu18qCEwamz4ZSo1ogPyuMm+7DvGUF36qYiE
	 l93rJA3ea5nmaHJKws2jAxZ/C9mPoMXaYc68xRHyHCMHgCD0BzEVgPAOZcU+tKn/Jy
	 NQ70Vd+QlUZLfV29jqP3ey2A3CnSMWOhADsIkdxgxIQbnB7rhV5dmPfasL4+0LJbxm
	 Pdcvc4c7TGJu5uVSwMG0xIisyTCfDP1SZBTVuFFx/amXHgDadfXzgzxAoxTsnKu04r
	 m1r3Ow9rbevnV1i51Qu1AylVr0RIzGCVq8HGZKR0Nd9/d4XQS3FDKEYosqbOWgnphm
	 mRaC4VtBuCg/g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Mayur Kumar <kmayur809@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: use C-style SPDX comment for source file
Date: Sun,  5 Jul 2026 15:57:59 -0500
Message-ID: <178328508272.1157743.12538054196278589308.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193840.59156-1-kmayur809@gmail.com>
References: <20260510193840.59156-1-kmayur809@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:kmayur809@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91FFF70B6A2


On Mon, 11 May 2026 01:08:40 +0530, Mayur Kumar wrote:
> checkpatch.pl reports an improper SPDX comment style for this file:
> 
> WARNING: Improper SPDX comment style for 'drivers/soc/qcom/cmd-db.c',
> please use '//' instead
> 
> Per Documentation/process/license-rules.rst, C source files must use the
> '// SPDX-License-Identifier: ...' form instead of the '/* ... */' form.
> Fix it.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: cmd-db: use C-style SPDX comment for source file
      commit: 90388101052ec56d24323e35c87ff594abe28e29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

