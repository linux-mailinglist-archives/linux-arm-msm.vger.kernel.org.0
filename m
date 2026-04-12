Return-Path: <linux-arm-msm+bounces-102855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEdxKry922lDGAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:43:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4874B3E492C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA94F3012C7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C926220F49;
	Sun, 12 Apr 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fl9B0RUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79221CFE0;
	Sun, 12 Apr 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008570; cv=none; b=uqWymm++fIndyrnjmH92vI1FL03q4ZT5o/4Nrq+sIr2Ci/KLPq9zTNXYGC67QVzS8XXaI8uA+z01pvw54OS2ATlTI5a0CdHMnwa728OeuIYm1jyvgePaCA9DZh90++bl29kanM2LjgbWsbPi/R3HGdiOu/sfLdx0RUoBkhmmxYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008570; c=relaxed/simple;
	bh=rIbysXru0mgKRFjCg8cHayNmcXciQRQrTZ8kA9mqINU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBpaTS/kF4pks6xpKDz/4O+lIKWDh6TRpBk3y6e8jNYiAvD2GamNx+nhKsGuHa08UGMvbhKIvThjGRmujsDQK11A2P36NkzI+cd13utssCubYrHxPXz+eDYwQ4WK5wTvZfdC1KTvpcHQhHj3hkW2ygrSApS7CVqCO1f/e7iVLCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fl9B0RUc; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008565; x=1776267765;
	bh=rIbysXru0mgKRFjCg8cHayNmcXciQRQrTZ8kA9mqINU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fl9B0RUczJJiuJBdQxqAuXsqbXzx9tV9HENtCWugDb3uwWqd5/MN37sB0Tnr7BqLv
	 DF9NTs6QD3/sGqBrxU0OJy1J9p6gm8zOD90T+drCQ0iX4jWecoXstwJUbnaoadMwBS
	 AML4xwd8t82jtdalpUbYo9vbtETpiQwmoRCSxLGOib7i+wGoe2EpBK+iIscZ8zO4/I
	 bv/Zk38V2/VQ41auDFDNQNWdJhcL8KEXZJSc1ovplDeTuyUn2kKyESHGL9AOhedX9l
	 HHRG7MeOyeG6oGfk39PidujuSWUOU1KAecx90wrJ1qD2NXJLBYOcbjDFPZCfO1ezR0
	 1R7tT8shgtc+w==
Date: Sun, 12 Apr 2026 15:42:40 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
Message-ID: <20260412-sm7550-id-v1-1-958a673ff791@pm.me>
In-Reply-To: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 03430faf182fcb56a7018892a77bb956d739a3ed
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
	TAGGED_FROM(0.00)[bounces-102855-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 4874B3E492C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the ID for SM7750, an Eliza SoC variant that can be found on
the Nothing Phone (4a) Pro.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/q=
com,ids.h
index 336f7bb7188a..916f418a869e 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -290,6 +290,7 @@
 #define QCOM_ID_IPQ5424=09=09=09651
 #define QCOM_ID_QCM6690=09=09=09657
 #define QCOM_ID_QCS6690=09=09=09658
+#define QCOM_ID_SM7750=09=09=09659
 #define QCOM_ID_SM8850=09=09=09660
 #define QCOM_ID_IPQ5404=09=09=09671
 #define QCOM_ID_QCS9100=09=09=09667

--=20
2.53.0



