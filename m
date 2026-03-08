Return-Path: <linux-arm-msm+bounces-96001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJY0KI76rGk1wwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:26:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DB22E782
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDB8C300B2A9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 04:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FBB285418;
	Sun,  8 Mar 2026 04:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kv+RRiR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEF280308;
	Sun,  8 Mar 2026 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772944008; cv=none; b=CsWbJqfP5mFSdqjrPL/4K1PZr+L+H7IdTIh56RmvsHbGoUOIkVzl5FHL5hwG+faJQdTwHH6MzpEQfIYOPwPImAJ7HoSKrQbzGEDyIHt6kBw5khKX9Lh5Ys0V0LoFC749XIHY1netoe+9U7yk/mSmJs4gYPJFTNAq262KoGTdewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772944008; c=relaxed/simple;
	bh=puZ80ERpAgU7wp6jWVI2K86/4tkx1V6xQ3eixJD0L9k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fLnUs4hOM+tqOuR6aw+HP8aPHWJDpiKnCUrtN16B4h/zNmB8cNSSSxCH/ByFnbuvshvAX17NqZWQTzJxngBZWncO9TphS/WOF5KCRg9r8iMrN5jD8O8NMhKzMSRr73YYKLrf0vnWLsSzQFR+RPK9T7zN5MjhOPyeMvWDDaJtJeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=kv+RRiR3; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772944003; x=1773203203;
	bh=puZ80ERpAgU7wp6jWVI2K86/4tkx1V6xQ3eixJD0L9k=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kv+RRiR3U0N70kKTwqKxQ1Nhpyir+rxCw0Em4zeim2qyw3Rfy00aukgBI9+WGQIi5
	 okAObrwtsJVhjdqI5/apKdA6RvpbMB2n9+U9kK8Potafual7HNYt2GhZaoUCRXim0T
	 vsTgLyGrqBRYJn5X5GlnHe/OemHz0I5JAm5xMqwm6zw/SSH9r0ruXP7Wm6r4hZcgC8
	 B3rjgoqSfmh4wT0p8JFOynq5DMfvZ+pb97LegmOVKoW8xtWXU1X9VbUV+hWaQ0WcYZ
	 UWc1ZZYrgCWnEJEuLOuhRic5hjkPKj6hbJrTHyMfK/Y3sMMACIE8LYBmJobbUwnsg+
	 DY0seJ5tPJ8HQ==
Date: Sun, 08 Mar 2026 04:26:37 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Thara Gopinath <thara.gopinath@linaro.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
Message-ID: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d454274081e17d6e402dede603c065557501ebc6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 886DB22E782
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	TAGGED_FROM(0.00)[bounces-96001-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

This resolves the following error seen on the ASUS ROG Phone 3:

cpu cpu7: Voltage update failed freq=3D3091200
cpu cpu7: failed to update OPP for freq=3D3091200

Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qco=
m/sm8250.dtsi
index c7dffa440074..37c41cc1abdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -665,6 +665,11 @@ cpu7_opp20: opp-2841600000 {
 =09=09=09opp-hz =3D /bits/ 64 <2841600000>;
 =09=09=09opp-peak-kBps =3D <8368000 51609600>;
 =09=09};
+
+=09=09cpu7_opp21: opp-3091200000 {
+=09=09=09opp-hz =3D /bits/ 64 <3091200000>;
+=09=09=09opp-peak-kBps =3D <8368000 51609600>;
+=09=09};
 =09};
=20
 =09firmware {

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260307-sm8250-cpu7-opp-d34e2ed9d0a4

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



