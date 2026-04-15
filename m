Return-Path: <linux-arm-msm+bounces-103324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEsVMCMj4GmbcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD7409065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B49C13019FEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ABF34CFCA;
	Wed, 15 Apr 2026 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DN+8J0gN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FE14E2F2;
	Wed, 15 Apr 2026 23:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296733; cv=none; b=gIZxwTaGA5B7kEWx+ULgwBIxXOP71RstheU3ncAA/XaTkJRahZoN2Ky/2vMRNbjo5oGogohCXJ7+u5krzfb86Su0wNZPz3LLd91aW9dpSsJm3QWG56Z/bjdVcqIfFnva9+hv9X/Qutz6DlfARbNWCekWhitDsAwUr9/cCt6EZCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296733; c=relaxed/simple;
	bh=bBGGB5uETSggOS/t5xrmTu4m1EpOWZbQNCte2XUHoto=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GNsV1MQ9ylLnmOnc0mGhK0WfoMqYVkJa5D4ZjD9oeXSiZfJT363Vee6vuKq6Xux7Ybey+S6GyX+g9qk+kNZ5osnFE0oJ8vYsQfnW1jWQG1gWrS628XOVwYpbyx3BEqogwPzY3CunHNJuShRj3r//9xxNXJfKr+E8NpWL/k4Va+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DN+8J0gN; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776296723; x=1776555923;
	bh=bBGGB5uETSggOS/t5xrmTu4m1EpOWZbQNCte2XUHoto=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DN+8J0gNAHRo/mJ4YD+m8BP2eHkDFf/E0ov1ckY/GXxOwrSUldj4BRJiYdcp4o8ZM
	 h2WedJm+WLWq56abLwBzNHUVExHjD3HaK28aGRsK8yxl6F1l/evlx0rHyzgoeqDw1p
	 Y45b7Q2OU5AdesE8NrfP+mV6Hk1Xi3E3TTT3Q/8KusihltHWpENx4sQPCZ5wgkw9C7
	 VnPeca+hd3ZAxYESppo9306HIwZSkiVemJo76iTZuIyYFfuzeiFJV0F76Xhre/DgIG
	 2CBTSTZxWXsBdtsQ8A6BjUP5QQ4U2pzkaywP+RJ3mqHUdBuVOTsgxnF9IWdHggrYMp
	 T7N2RwQ3IXJog==
Date: Wed, 15 Apr 2026 23:45:18 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFT] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
Message-ID: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a4eaec15df0fb93034c62411ff77e2f3bdbef0b9
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103324-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,0.0.31.64:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.11.184:email]
X-Rspamd-Queue-Id: B4BD7409065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream the IPA IMEM slice for SM8650 is described as:
qcom,additional-mapping =3D <0x14683000 0x14683000 0x2000>;

Update upstream ipa_modem_tables to reflect downstream.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qco=
m/sm8650.dtsi
index 1604bc8cff37..0cfbf79c4c78 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -7087,8 +7087,8 @@ sram@14680000 {
=20
 =09=09=09ranges =3D <0 0 0x14680000 0x2c000>;
=20
-=09=09=09ipa_modem_tables: modem-tables@8000 {
-=09=09=09=09reg =3D <0x8000 0x2000>;
+=09=09=09ipa_modem_tables: modem-tables@3000 {
+=09=09=09=09reg =3D <0x3000 0x2000>;
 =09=09=09};
 =09=09};
=20

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-fix-8650-ipa-modem-tables-1704e39721c2

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



