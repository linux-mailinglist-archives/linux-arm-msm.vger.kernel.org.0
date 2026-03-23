Return-Path: <linux-arm-msm+bounces-99286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLXVBh1JwWlmSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:07:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1272F3DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC5A30F9E29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35833AE6E2;
	Mon, 23 Mar 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FkOPBNOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD03AE18C;
	Mon, 23 Mar 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274088; cv=none; b=BLMmXMn2D6Eh5yeXaaffreuQOfML4QNNQ2ERYemPdF1A7ZTx/XE4TH8p+fzbKQma7FX/1qdcGOi/+lc4ZyfHOxfT8a0fV4XH3MMzNw4C6GkaP5YQN02kW/rUpL3+BJeY4PrulszIujz+l3+vde+G1tQXOyZ0+BS5QheUNV8dnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274088; c=relaxed/simple;
	bh=CJ05O/D3YyINstpoJfjOM1H2gNnTSCwwOkhDciVwz48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6f4FQGeEkajhVtIV6yuwne6mMiTd4OTl0hNuKF2JgMTemXFJseYTa+zKfkuDaH9aiWAb2IlRZrVaeKKU/eKbYmnXZCr6B6BfIb/WCH2ssPwu4pC9K51hzsFr/gf8wc8SFdoeme5qitjguF3qXDCgGnuNsUJEfO8lgKJAX+0yGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FkOPBNOH; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774274085; x=1774533285;
	bh=BDNCp6uII1CrHPsn/n4iEUtlyhyWeKsnKrHaZIh5o/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FkOPBNOH4H8c62h6M+sEw3DpvAzAJ5LV19rhe7xTz59BeMlUXkLA9Fwovkl1RtVVy
	 WG0vfRtsMeQv54jzGsEcrQehlnNi0DGHon2IxDQt6XH1xTD0ykPlHzfPBhWCsXqifP
	 t+EazgOmyXHbHfPLpHmHMo84fbbMZbf/tONvUxTH5npKUTjSmcSdkzB4KGaFm64nzK
	 qG9d3SVBhtH5qWsOSORXusfXQ+Ja1Ck8Sd9AXHNHfT0nHhfNhZSkSKyOcsusRjGL4s
	 9H8tMFY/rq/PEuY8LiG4mOp/nFBZoj1B42gbWaPmUOAktM0P+tViyXT1DUFX534stY
	 g4AGX96GccSbg==
Date: Mon, 23 Mar 2026 13:54:42 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
Message-ID: <20260323-asteroids-v2-1-1a35fa9e178a@pm.me>
In-Reply-To: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e222cd248fb651b7434a62ed8b527f518beb0b76
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99286-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid,e0600000:email,fairphone.com:email]
X-Rspamd-Queue-Id: 2C1272F3DB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The rmtfs_mem region is currently sized at 6MiB but the default for
milos downstream is 2.5MiB. This causes remoteproc crashes on devices
that expect the smaller size:

modem_ac.c:281:Access Control Error: Could not protect the region specified=
:Start:e1f00000 End:e2180000, PID:1

Reduce the default to 2.5MiB to match the QCOM downstream config, and
override the size for FP6.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 5 +++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa..5663ab4589f3 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -724,6 +724,11 @@ &remoteproc_wpss {
 =09status =3D "okay";
 };
=20
+&rmtfs_mem {
+=09/* Increase the size from 2.5 MiB to 6 MiB */
+=09reg =3D <0x0 0xe1f00000 0x0 0x600000>;
+};
+
 &sdhc_2 {
 =09cd-gpios =3D <&tlmm 65 GPIO_ACTIVE_HIGH>;
=20
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..915642498516 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -640,7 +640,7 @@ cpusys_vm_mem: cpusys-vm-region@e0600000 {
=20
 =09=09rmtfs_mem: rmtfs@e1f00000 {
 =09=09=09compatible =3D "qcom,rmtfs-mem";
-=09=09=09reg =3D <0x0 0xe1f00000 0x0 0x600000>;
+=09=09=09reg =3D <0x0 0xe1f00000 0x0 0x280000>;
 =09=09=09no-map;
=20
 =09=09=09qcom,client-id =3D <1>;

--=20
2.53.0



