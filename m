Return-Path: <linux-arm-msm+bounces-116612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0u9sFJPGSmrpHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE370B687
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FxtOuucq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB9AB3047598
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64A43BADA2;
	Sun,  5 Jul 2026 20:58:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3493B9D98;
	Sun,  5 Jul 2026 20:58:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285114; cv=none; b=SPTdSA1dsj00yNEPDT0UB5x++vLTMcDzyNSVj6QF7GwmtDdK87xd4U+JUhxrh/cwtn2W9pvZn4TpjSZB9H1Sybw30Sfyal4LAb5JTKSX+Euy646GjvAxnC/0aNA6/paF97iU6yw0trZ613Tp57s+kvNzd9bnphjHpDUavXIJiX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285114; c=relaxed/simple;
	bh=aM8ZxywwvfruV4ryRtRLQIgKsDkpqHVak/UvMNubB0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/hEOGREC1o7DMLCwpMma54277HMA1a62fyRuM0MgozuebpNDHXrja8fVObvJhFiy+o/Hoomsye3FBRKUg0Bo7KZ61GxcKFr3WWH245Oz6eaQrL/jhdXHNDjh2jmIajoevUSuVb/7XYvKhMoV/9UVbMrnfUval3uUwqNRPnYQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxtOuucq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6C11F00ACA;
	Sun,  5 Jul 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285113;
	bh=w+2OqMxstGJNcYgfW4oAkhrXcXYrGOCxcTLCEuwprR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FxtOuucqtmybDVla9sB9DFqWYRJZOAIKvUBn7YjEqgpYPXillQW647woLckQ9Qd7u
	 Qz26DwhUYmV+ZMJEybCgAMrxiVei6lGCB0loB7CqTsHtmGdKO2/hSniiV3xgi3zpED
	 M3iCq5tpBdhm/6u2/4MqjljjAJGr0OAKZUQAx1wuauVON3iKGzPgzhHZOYCPS3aojp
	 +fTxxx+K9vfs6HkLpy+ExBQCp/n3R1nOoG3Wg6zeCfYU+yiUutgml40RgJdYuzZwXW
	 CVDtPvx8XHRbDcJ8pFaBLos0zRpSZQ+FemD5V4E1/ICfS1vrsgnZU7CEXwC5QZ+xfr
	 gt9Y4zcJJQLxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
Date: Sun,  5 Jul 2026 15:58:06 -0500
Message-ID: <178328508289.1157743.16998094017049759939.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116612-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08EE370B687


On Fri, 22 May 2026 10:00:26 +0000, Srinivas Kandagatla wrote:
> Add support for Display port Audio on Arduino VENTUNO-Q board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add Display Port audio on Arduino Monza
      commit: f9665fc0681c1a0edc03be9900ba3f318fe3c5bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

