Return-Path: <linux-arm-msm+bounces-101190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL3EEBWDzGlXTgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:29:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAB373E27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7123A308B27A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 02:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B05305064;
	Wed,  1 Apr 2026 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IFgVqcbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59818287503;
	Wed,  1 Apr 2026 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010321; cv=none; b=E9PervXmQrp2JfALMk4XeEuSXqZKaVkWgkP1WI6ViFw9jEg5oYMhZTRdNQs50gNei0rw/+1irH9nHaHadXg2X9Z3XMiBRre8PV2T2lr8gVjMz1nZe8nX75V0ZEPjpQa+Mx80OABOZsCbGfyiMJq/rcfVMW3vq++V1J+6FCxHjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010321; c=relaxed/simple;
	bh=QcCoHBoFogDWn2MHlJF90XrSQzMBlvKZWbZtWZwgvWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5H2cIClAnO1RrZojITtzQzuHHAP3UYJih0AxjrcHct4pUVZ2+tDhi9IvnvsHClVMBnacbx0J6QobCgCecLMRba5ox4hT3PltEi66JCaOUhb6qkeScRul+yNp7/B2No6CsREBL8NzzXq3zwqHldPf0Q13Urs4eYq5DR5+NUdAdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IFgVqcbb; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775010312; x=1775269512;
	bh=QcCoHBoFogDWn2MHlJF90XrSQzMBlvKZWbZtWZwgvWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IFgVqcbbQbj8e+tUtaaf5vST1BYRE+LjVOkoN1q8t9BFM/OtVz2TtHAUaRbLDxRaA
	 3ZvoyZCz5fV4KjNNBlN5BuD7ctgRy65DsbL2z2G4eYbUZSwNrXuMr3NgN4G0qYAfdT
	 TCd/jEWG+7AebxRbudOS7VheOx/Gu5JhaCyIkK3BUq1BldoxH9H07FdonHcsDy9rD1
	 6rPKNSQRqx/+oNj/OVXRycWN/IEhkiN/SijKqSDj9GxWp0NwsZVoiF8Tts0DVRHUGo
	 HmgBTHcU3y4PMa6WUBG/+Wm9KsgXY5CjsdX7NxdgN9aUGq2Bbw+MQVQHC/yji/vFDF
	 kl2ksU/QX+5tg==
Date: Wed, 01 Apr 2026 02:25:07 +0000
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
Message-ID: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
In-Reply-To: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 460e4765e1f48540bce99727d0ec027a1dc063c1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101190-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.138:email,0.45.198.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,221c8000:email,1fc0000:email]
X-Rspamd-Queue-Id: 02DAB373E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the qfprom efuse node and describe where the GPU speedbin fuse is
located on Milos.

Note that for SM7635-AB at least, the value is "221", the max frequency
for this is 1050MHz. There's another speedbin out there for 1150MHz but
we do not know the value for it so just document in this commit.

Once the value is discovered we should add the speedbins to the A810
Adreno entry and update devicetree.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..d1d23dfe7806 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1168,6 +1168,18 @@ tcsr: clock-controller@1fc0000 {
 =09=09=09#reset-cells =3D <1>;
 =09=09};
=20
+=09=09qfprom: efuse@221c8000 {
+=09=09=09compatible =3D "qcom,milos-qfprom", "qcom,qfprom";
+=09=09=09reg =3D <0x0 0x221c8000 0x0 0x1000>;
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <1>;
+
+=09=09=09gpu_speed_bin: gpu-speed-bin@138 {
+=09=09=09=09reg =3D <0x138 0x2>;
+=09=09=09=09bits =3D <0 9>;
+=09=09=09};
+=09=09};
+
 =09=09remoteproc_adsp: remoteproc@3000000 {
 =09=09=09compatible =3D "qcom,milos-adsp-pas";
 =09=09=09reg =3D <0x0 0x03000000 0x0 0x10000>;

--=20
2.53.0



