Return-Path: <linux-arm-msm+bounces-116604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MyLjGg/HSmoDHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:05:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33470B6DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S0p9Q7yF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 355D63086917
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA053B42F1;
	Sun,  5 Jul 2026 20:58:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B13B27D6;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285101; cv=none; b=N4OEkFQPsNe/aLdzbtoBZ+tH4y2PiqqzqsC1R0mn9WCVRSwvj5O/VRCHxIuHy1BRafZX2RieSKIOcQMSYsIYKR8NKtlEhUCZt7keoj16aA2bo2HpOCDOxfWQxPQIOXzbbnzVvUl1KOzoagidapYPF0ooXk7f4HuuaToIU26qgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285101; c=relaxed/simple;
	bh=kBWSGyjigF0oaca5snB49givCKMem4xkeuFmrTlBOU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFyV69IeAatPKNg/7KsxlmOzt/2k1/8tpThm7tFv4nm9la0l1FsWOkscUmIaQNJCvONEp+lyyeYMapFfvA9g92m1+cIZ+Y6w8vSnzWvO7IlydD1uLTMVlTuZ4Q7UJ1ptFt5AdChpgIN1+DWDKVP5lBJrLWvsh3a5MY3oElwGJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0p9Q7yF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E311F00A3E;
	Sun,  5 Jul 2026 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285100;
	bh=2DOaO2rB8pIsLyulSkce1JIFhSoJTz0rHCi+f88SNhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S0p9Q7yFFUJFVjqVFGPDyaG8l+B2Y5GGp6VCbo/5yY5be3ptjK8epT9mBR3xTqH3B
	 B7VUfQL/62m3+HYL2KToTRDJ2IoktDxXsdSpgQDEIv4BOS4jbb07WgVe9k5ggxr4cL
	 uaI5ktSoJfZlpaqryA+Dtqoy1it1LLCvc/Dvky1A2dqCD8fIRdE8jEC8KVBczWVRm0
	 9uHJ0v5UTc7XcVkFIdUFOTeI/FLKkda7WFhLdstRz0OJElxaQ23FWqRbGtzK+U5ksH
	 zT3Pu7KXHlTLEWmIFkKTleAyD0lzO/5kGD8sI7QNUDFhB/BzwIFKV4PdfMtdrlvlx6
	 Nlm22zikE1RHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: hamoa: reserved-memory changes
Date: Sun,  5 Jul 2026 15:57:58 -0500
Message-ID: <178328508271.1157743.2928712624151218974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-116604-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E33470B6DD


On Mon, 25 May 2026 13:47:47 +0200, Hans de Goede wrote:
> Here are 2 patches to hamoa.dtsi's reserved-memory node:
> 
> 1. A bug fix fixing the length of xbl_tmp_buffer_mem
> 2. A patch removing a bunch of memory reservations which are already
>    reserved by the EFI memtable and which are otherwise unused.
> 
> 2. Is marked as RFC because I'm not sure if this is a good idea, but if
> the reservations are already handled by the EFI memtable it seems best
> to me to just let the EFI firmware handle these.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
      commit: dd923fcc2151d2d077542870304bec94f094bae7
[2/2] arm64: dts: qcom: hamoa: Remove mem-reservations which are already covered by EFI
      commit: 7d240c5dd34ae8560f8d0557fbbd7b0165eab486

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

