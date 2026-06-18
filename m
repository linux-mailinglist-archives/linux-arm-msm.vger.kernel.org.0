Return-Path: <linux-arm-msm+bounces-113763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNOZH8feM2oaHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:04:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5469FE6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:04:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="BXG/3qgY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71ABF301548B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8EC3EF65D;
	Thu, 18 Jun 2026 12:04:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A82EACF9;
	Thu, 18 Jun 2026 12:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784244; cv=none; b=p603guX9Zlx4tUCHt8ROn8DTJ4OF6BGnroiwZBSqxUGdgV8sG2oMG6t7r6ZkZZ3iu0Xaqe+5iumL5ImRCta0fA89GjKPmr4K+t8lUVkecdikrcQP5QDVJmhPOxRrNe6Lf1b5U9MQktT9Dr/ZYpRkGDzxDA8uUxeojWxI/fXbq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784244; c=relaxed/simple;
	bh=H+uVBLBjZhVOEmnSdqKVtufUeTA9uOMf1dZkoiK9ZnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pTL1jl7Imaaw2HgoYwcU9b1b/nxUzI0wgKnw/M+s2VamAs3ReUbKmOopHOq++F89eKLz7Kr7qM1ZHamKsHVb+g6Pz5qpJ5tDaTPhGJ1ApgcMbGzdIrVS3f9bEO3kkAG6ZO3d6koseKhtttTGlGQR7idb5XU+uRbh7YnFYkxN608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXG/3qgY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464181F000E9;
	Thu, 18 Jun 2026 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781784243;
	bh=KKl8snhSh29MYg8po+6Jx8Ki8jmIiB+11DYp+nyUnD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BXG/3qgYAEsSD1z0+lW+msOu/JdaneopkHJDNUR5xNEPllIqONmyxKy0/IhcZis5A
	 cWCelo1RiZEQDqKGsARVLgTcptPEmJ6dyCwvkkGM9XpFCkFadv4TRjcm2wyVOfm0An
	 1bZ4HbkgHOM2xmyqxQPiG9IDVN0eblYFgXG0JKICiwPD2cWhP+IH1p5a1fMfxgh062
	 Se66kXpJOIv1yaJJhz/S1dG/MY0eNS5DBtKDv+ZOh8e0xwdsE4uGA+MC3uuTcQLRCU
	 AS/oeAUCHk4nLjGFT1zXv4AWCWd8mcLldv4MgZOmDWHnayyzNzjSD8/mnGWFPk1G2u
	 Wp5GoJ9wA1erA==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 srini@kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260608102714.2503120-4-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-4-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v3 03/10] mfd: cs42l43: Use new SoundWire
 enumeration helper
Message-Id: <178178424001.2084541.8794808457896966561.b4-ty@b4>
Date: Thu, 18 Jun 2026 13:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:ckeepax@opensource.cirrus.com,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113763-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8E5469FE6B

On Mon, 08 Jun 2026 11:27:07 +0100, Charles Keepax wrote:
> Now the new wait for SoundWire enumeration helper no longer depends on
> unattach_request it is safe to use from probe time. Update the driver
> to use the new core helper.

Applied, thanks!

[03/10] mfd: cs42l43: Use new SoundWire enumeration helper
        commit: bbd4169932ae54394a61ab26905b483967543f5b

--
Lee Jones [李琼斯]


