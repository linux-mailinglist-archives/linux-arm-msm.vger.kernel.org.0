Return-Path: <linux-arm-msm+bounces-117697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qO3BDwxsTmqdMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0B727FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OMzxppiK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117697-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117697-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 237743170A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A547F2C2;
	Wed,  8 Jul 2026 14:57:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7947886D;
	Wed,  8 Jul 2026 14:57:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522629; cv=none; b=Thu5FBHWMDxcv1BXRvRpuzagbs0aVog/je7eK8pn/3winrMhCJTYEMmRHTEM9TTiPS7Nr6UAAi3bOUjFnZ9pVv8DH9XJ1woXK+/QGlXr5C4U/auM8DHUjicJYxD1CZr2PRgPMImRsPxsqrSxoFYz2LqrOwebfpzncWTTO047qSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522629; c=relaxed/simple;
	bh=gIeVNfBL/n1k1I6Kqw8V0OV9vhqiBPGbsrB/yeYBIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTZS8mRcGLWWNT6F0P7lFIgY7GCPZ0BJiw5Y3CHRzuj03t5oL0KQPZetTuG/Lbk3f+Jy9UJ/OrcaY4rqg3Kxx9MIb8p/HMB8ZFubVI33i+JrUtIKwxvtBmLkTKK5R5jfcSRfqjAcSsUT7Kro33hfL2/BJX/OIJUhRvaPVAWKMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMzxppiK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABF61F000E9;
	Wed,  8 Jul 2026 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522628;
	bh=16KRBVBRb/i56hxVEG+GEdxM63sdS1nY+MaW0YknO0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OMzxppiKaxpgMsc7vVsV70fc6592dfD1LrIsHmeZroqk9z7iL75SYGqduncR3Gg0g
	 1xb6BBmyjWHmBvlHcZiTaBhuhm/Bou0PHws1Lz1B1yupvEdXhzeeEknWEfcMFaQ2kh
	 Aydr1IUJOEDezgLxSfKBSfO1Lk+3UPGNRdPDM65l6CAbAQnUxdEp96z4nA1TqEeQyM
	 tAiV7KCGZvnWSkJJe1GKWhNwB4LryjlKEc1/RWjbpgWxJHReARqlbY44osNcgAAinM
	 l6shuw26zoBpAcxLkwlStxOkV2mUIQ7PufXnFQYWFg+Ar4pkI8eBxnvPhYO3LCIQ4t
	 Uxt2h3ez9JMWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Date: Wed,  8 Jul 2026 09:56:09 -0500
Message-ID: <178352261567.2235436.2041468548247783824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117697-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92E0B727FAD


On Wed, 03 Jun 2026 12:41:34 +0000, Alexander Koskovich wrote:
> The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> and gives a warning. The 'interconnects' property is also missing from
> the binding.
> 
> Dropping the nodes here and will just submit panel binding & driver for
> use with MSM DRM.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
      commit: 7d3670ccf61b99283ebe44ba19f5e4643ef7cde7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

