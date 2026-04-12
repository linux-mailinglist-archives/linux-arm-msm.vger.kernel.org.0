Return-Path: <linux-arm-msm+bounces-102854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP5eDKO922lDGAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92C3E4915
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700CE30238C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0180A23EAA0;
	Sun, 12 Apr 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gAUnYHhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CF21CFE0
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008562; cv=none; b=N4zprz4I+qxhRn34RvVYGDSYlD/C+PSBt33YTbVmBHP/BMmPvJGjaCGR9NfNAWX5G8Vvt1AbLPGseiJ2bsPLmShDd7cCCoyqMub1c0jWI6NBRN7tL3s9a938tABQC2FnMlv5+myzTdB0xbgpbFer1bY2RJGD1YSFYmXmbuSVisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008562; c=relaxed/simple;
	bh=9CJk1t9F5SlcrGWRfmBpqYFSi3T6SQXOkmV4qt1SDp0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r0vkc8l5OIV4GnRUJeVNtnag51/u39hdb/EWmuLPThMAyB2zNIDVCOzU5bF9mPARxn3fGnhmxCLQXaa0X7hkcoYHmkcxBEIqea+oxuxmZa57BNEAH8H2BXfb78p6LBq/s24kTqmgJSpf/Kwzx58RXruPzHSVXFpgQm1wPf9xSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gAUnYHhP; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008558; x=1776267758;
	bh=Bew5KmnMorYR9Zy4h2US12KItYTg2WZYjqhq27DwyJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gAUnYHhPlCE+E7gw3mtMPsgFK2cide3XojrrNiUp8f9iJQBvBNhh6JHmEERdXjEvx
	 MR8FEmWV6P+uBzWo9+Q7A34fcEvidCd+NiiB7KEXwNjZL7CAvs4o6x0aTZk3TKqEFp
	 7YfxC9ygz3WzXcLXnHg5XIigcHUNXVuIFsPl3PQfkS8Lp5L0qC4Unz0+S+swFBlMKq
	 5pEbIZ4vUlD5lLq3kgipufPdgwnx7+Gf4ISpO9KZThhBuNlUlb2okcHgyWeKGRVig8
	 b6EyGdtvJLrgeJAuMTLOaAKniHB3lExwEwF0WaVGcmKdvmrJZ2OXdFOjfeK68a8T3F
	 G90so3nrTZ6ag==
Date: Sun, 12 Apr 2026 15:42:33 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4e8e6fdc8a05e68b6f9295d76e263b00689f5864
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102854-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5D92C3E4915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the ID for the SM7750 which is a variant of Eliza, and found on the
Nothing Phone (4a) Pro.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
      soc: qcom: socinfo: Add SoC ID for SM7750

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-sm7550-id-271d5875311c

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



