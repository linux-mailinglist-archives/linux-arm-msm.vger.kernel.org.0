Return-Path: <linux-arm-msm+bounces-116598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0K7sADbGSmrNHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:01:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E570B640
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gmr4EvLV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 829493014E72
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E25D3AF66C;
	Sun,  5 Jul 2026 20:58:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6583A718D;
	Sun,  5 Jul 2026 20:58:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285096; cv=none; b=YLNEeNF7XojK3wayu1wLX+NjxQ8YBR10QkGrVDRtY+hrxyWS77ARr6VkwqKa429LEsk0Ud+xjGR7Z6tqpARvUXcMvOIDLHw7671x5OZ6ijqDeEElMirl0bsgyiFOSBClJSVKLRbiUUz9LxQ9edrnAR5dIaiWvehku7RK+/qYsRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285096; c=relaxed/simple;
	bh=XFBlTIGkaWjoNx5xHMtj7Vo+7g0pPQ9tvPKD6GLGrDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV7w1tCH0VDH2A3gIpX5r9WqKRBdUjsRQWJ8SvtiREBei/v8zxAMSaD0DQlloZZr3YzEKRcLXmDr2xFKVKvNxnFoNIrkV3LFzB7ZufNE/el++I6w/2LA+NbwDW/2OZ5qRnxPFk/NKSQoPtDz96eAU3BcrkjwBB0XdnwWgOD5zXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmr4EvLV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E971F00A3A;
	Sun,  5 Jul 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285094;
	bh=JvZytdzTTPhNYDU4eJaWvR11B9s+mQ5rAWhVX+g6IYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gmr4EvLVfUzWATf/UbfHbX7YRgeBDr0VncCZW8H/9UYv+Maiyyw5x6A6N0tlDWPam
	 lfNiODjCnTUJ+Z0rv+yU8fzsQOC+JwOvW0eiI+OA4X+g49O71vfVb91GmgugScrMMC
	 uaJXs9xF1I2Qg00f2E2dUxXS+9E4+4ChctITfvPxofRt6FYWsq2706765R8S9SYQ83
	 V6U5r3JyKW+DY7qT7Zc3NkRQ5FB+J0qk6Atlx/dwiqr8VWR6dwpFDt7p5bYYxanAtZ
	 eEnhub35/wGfXM/2nqrB14z8ea80yW4CNPHLkcbvHXAsoW14nE8KkaUTXo2M9jEyya
	 Nlk5oT8kHfCdA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Recognize Snapdragon SDM850
Date: Sun,  5 Jul 2026 15:57:52 -0500
Message-ID: <178328508272.1157743.75958355725119817.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116598-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david@ixit.cz,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E3E570B640


On Sat, 27 Jun 2026 19:50:14 +0200, David Heidelberg wrote:
> Useful for sdm850 devices in tree and also will be used by Comma AI comma three
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
      commit: d529495c991a2b7d07c01622e8b3cb5ec066acee
[2/2] soc: qcom: socinfo: Add SoC ID for SDM850
      commit: 743af1d6a8b4bfa62dd01b5c2d81b1c62ea597f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

