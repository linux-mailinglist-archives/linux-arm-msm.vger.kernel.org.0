Return-Path: <linux-arm-msm+bounces-102853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wuznOI2822kQGAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:38:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51D3E489A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624BA300CBF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0B6286A4;
	Sun, 12 Apr 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="WXmrPcJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C067219FC;
	Sun, 12 Apr 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008330; cv=none; b=FjbPo/EUCEuSfGeDsY5u9dqMtGJiGktfqb2rI+TNzc/vvoBSNJGfGaa2T/znP8vf/UIsC2fvnLW9LS4RTE+rrCRJCOqiVzrim6oceyT7dEn3SOiGQLXPJrmGLRmZqh8XLgCZkaPjKhjLMHHv22tAOfdxOZnoLhYUr7jdsVU6X+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008330; c=relaxed/simple;
	bh=jEgfcSbwJlLH0Oyy6WeC0ojZ+uUmj7VN65R/Quwt3EI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BwP8K/T/9ndZE5kidJTIO6uazNQN9Bd8pRrLdhduph9yfiEXwrHRP0VHBdyTANzE4WYweh3N+LzEyTvIT5LA54YYauJXNOOZlkCWee1ceTG3/cQUqd3R9/hVHTCaARrccRfEvl65DH81hHnYKgEcADwI+gDpssIdvqgbZjhtFVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=WXmrPcJ9; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008327; x=1776267527;
	bh=jEgfcSbwJlLH0Oyy6WeC0ojZ+uUmj7VN65R/Quwt3EI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WXmrPcJ9Lq/eV9kLi2JkLpg7Zircw1k8YOZI9npziIjdjfEjKeO3Dv8is56aW4uXU
	 h3mdo1jAUK1yydi1joJLnuC+NkMen4/GBTw6twwuxnKjFn8OEdnxMaCQY8ECJ9A4FP
	 CNiGO/2PD4JaObiC3uB58a/DwQcwZEp4AHDIUaWeGszCcxqP4hUhyq7laF6FR09aC6
	 qmMNKB+WkkPpTBpKc88gkdDT3nokVCTbJYINBcDUaQtKcX1DnH0i3M5F68aFkTO/fv
	 viLdCjuZRoImNkxIJMgU8m4MS0RqyceYkoHJkSceci/T7Ywf1sNJ/Wb44cM7rta8bU
	 IxyKHNG6XR9Mw==
Date: Sun, 12 Apr 2026 15:38:43 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] arm64: dts: qcom: eliza: Fix reserved memory addresses & sizes
Message-ID: <20260412-eliza-reserved-memory-fix-v1-1-05cb3e33a9fe@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9d3b2bdffb6a6b82d2865081f6831ce4c2ba83d8
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
	TAGGED_FROM(0.00)[bounces-102853-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2F51D3E489A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update cpusys_vm_mem from 256KiB to 4MiB, cpucp_mem from 2MiB to 1MiB
and fix cpucp_scandump_mem node name to match actual reg address.

This matches the downstream memmap and kera-reserved-memory.dtsi.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 4a7a0ac40ce6..349dbf1fc819 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -405,12 +405,12 @@ gunyah_hyp_mem: gunyah-hyp@80000000 {
 =09=09};
=20
 =09=09cpusys_vm_mem: cpusys-vm-mem@80e00000 {
-=09=09=09reg =3D <0x0 0x80e00000 0x0 0x40000>;
+=09=09=09reg =3D <0x0 0x80e00000 0x0 0x400000>;
 =09=09=09no-map;
 =09=09};
=20
 =09=09cpucp_mem: cpucp@81200000 {
-=09=09=09reg =3D <0x0 0x81200000 0x0 0x200000>;
+=09=09=09reg =3D <0x0 0x81200000 0x0 0x100000>;
 =09=09=09no-map;
 =09=09};
=20
@@ -444,7 +444,7 @@ smem_mem: smem@81d00000 {
 =09=09=09no-map;
 =09=09};
=20
-=09=09cpucp_scandump_mem: cpucp-scandump@82000000 {
+=09=09cpucp_scandump_mem: cpucp-scandump@82200000 {
 =09=09=09reg =3D <0x0 0x82200000 0x0 0x180000>;
 =09=09=09no-map;
 =09=09};

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-eliza-reserved-memory-fix-dc0f65d29996

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



