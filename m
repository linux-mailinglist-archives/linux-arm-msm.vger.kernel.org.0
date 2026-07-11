Return-Path: <linux-arm-msm+bounces-118473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r8mqLzVyUmqNPwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E5742340
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YUnlKhGZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118473-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118473-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4A95302165C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D253CB2D0;
	Sat, 11 Jul 2026 16:40:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DC3C3451;
	Sat, 11 Jul 2026 16:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788058; cv=none; b=L7d3+2Lb0ftxlnXGIaVkD95udTQFNIa3qcfjZb8j45anN+s4iR0pFlgoZr0Afx9eDyajpUHhjhMrbpmmyH7V6pkVGeCts4xM1YFZ5ohtJ183c4biUWcburh5jQkr2E3z+69EEuw7+KpH8P0Uf2UotjWctWqDP/UwhhZ70j+m8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788058; c=relaxed/simple;
	bh=Qm0dwyYF1p+AfwFruiP8NNbyeHOFzwPvV7o0lSwoIUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWV8n3IalAyM7K0/wAFrVfQ3Bxpbl5lAAH/Qkwj4bFo2KK96pmrHKZOIDiyhtw9PislE9SBoaCkeVcwhRy9/UIKkZIAMRvDBIIin/oa2+W1f96FPKg645+KeImKE+G/ZhoeDV4LKKRKq35UjkaZArW6RNStl1/w2727TMbKt4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUnlKhGZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A01F00AC4;
	Sat, 11 Jul 2026 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788055;
	bh=whzJt6Vhv1jhzZApuy8pQLYJ33OkfBpmMcQ/isuFQ44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YUnlKhGZzWUfior3gmETNva8REnt+prLJDKH0i3rsywiTEOCBzHsilgZbIrZJ/Tsl
	 DjiKY3ZbQgzOO+juU7B07LNskQvE9QfdqWt/QMOv70EVRY5cNe9NYlhp+E+uHTI1uQ
	 LI/9/FqKbbvYZz719R0MSL8WLtGh/syF+kazUM4OkGBUNMf1ZeECjm2TwXaobdAk5W
	 ogT1zVukDNJjmbUhLcBX4M+xgOhBQa7BRh5uTv6DfgaXnK1LgG/PWWsYLixf4h3C9C
	 4KJMjdNEIJpxe43AXHrSHCGBCXjDURE4PxLXICd3izgHNkg6pTMB623j2Yfq+6qwuP
	 9vG3NxrYvkiaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: scm: add tracepoints for the SMC call interface
Date: Sat, 11 Jul 2026 11:40:42 -0500
Message-ID: <178378800438.138068.7175582268598977713.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
References: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:yuvaraj.ranganathan@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-118473-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 425E5742340


On Fri, 22 May 2026 12:08:58 +0530, Yuvaraj Ranganathan wrote:
> The Qualcomm SCM driver is the sole gateway between the kernel and
> TrustZone firmware. When firmware issues manifest — unexpected error
> codes, calls that never return, or WAITQ sleep/resume cycles that stall
> — there is currently no low-overhead way to observe what the driver is
> doing without inserting temporary printk statements and rebuilding the
> kernel.
> 
> [...]

Applied, thanks!

[1/2] firmware: qcom: scm: add trace events for the SMC call interface
      commit: f6bb2daa4584229af155c2488b83151999315293
[2/2] firmware: qcom: scm: instrument SMC call path with tracepoints
      commit: 41329e72363c02facfeae063ef304aa7ced68c3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

