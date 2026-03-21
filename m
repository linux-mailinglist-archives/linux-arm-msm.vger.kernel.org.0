Return-Path: <linux-arm-msm+bounces-99027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ1rENnOvmmLdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C692E66E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACDE4301F99F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9AD32D0D4;
	Sat, 21 Mar 2026 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="AL1xUTN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472703264F1;
	Sat, 21 Mar 2026 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112440; cv=none; b=b/SQWdz0cIf1tkwFMMtE2gSl9/ncgWERTgjJcjk/ipB65mcbUJCuaNkUTb5DFeQtPxj7rIkCFe3jAZRO1oy4KEMS9zSX+3bxE8dEk0bCWp5DelXqFfRRnm4pD4SPDFUR2G6vkIi0VqxmvpmKuUFLNowps8Qeb5IB7q+cQY5+UME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112440; c=relaxed/simple;
	bh=16WT+dWlu48Do9AHQpanNt3jkbXXPxdo9v00mO3bebk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAT583f3CY758GuqYNynPjQpXNnsJ+qOjBPeuB1FwIOqwszNBk9xr/ThNKGZgHtjpYboSagvm6UwAzaSs1Q6ix0eXMBHcLECXrV+xPv4rz7BmPxJgQ5AYV44VHl2bkk1byq4COs44VAlwnIjZsiuYWdctLAZNe8LiTHof7eHoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=AL1xUTN5; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112436; x=1774371636;
	bh=bwALxwerlNLw3tnoBJemo1zGo2hLr2iyPXbmgtW0Buc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AL1xUTN5nq7crEX4wrFY7X7lC5hQoo901Xnan9oceskp8WNN474Y/ue9KetWuJChz
	 r7enjn7V4WuzlC2jbofVp/ck/ABJaFTKpcXx+sz8XuQeV2cXwih519TTZZZb3++cl1
	 rHsu9tByMML83DsFOZ3RJTWDJ/1UIo8hJ32n7VxAzvmwZQyH1e+V0z1tIP2+gvuEMN
	 mAiutyIsZCZLE+BnC3XQ2TktbqgaCtQOXZ5l5hx5y4BlfErH2c54VSA6Qb1lR+ftxi
	 f/6sl8Tcq9pgFu8bqTq3Np0JHy0xDqViNOTNDvSTBRZTCXaLny4JZVDVhg6C9gyaZw
	 mMwG/SU5RQyxw==
Date: Sat, 21 Mar 2026 17:00:31 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
Message-ID: <20260321-asteroids-v1-1-4b902901cb49@pm.me>
In-Reply-To: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fddc6c2422d85dd0433e49d77794fd86dd620a2e
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
	TAGGED_FROM(0.00)[bounces-99027-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,e1f00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,e0600000:email]
X-Rspamd-Queue-Id: 92C692E66E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The rmtfs_mem region is currently sized at 6MiB but the default for
milos downstream is 2.5MiB. This causes remoteproc crashes on devices
that expect the smaller size:

modem_ac.c:281:Access Control Error: Could not protect the region specified=
:Start:e1f00000 End:e2180000, PID:1

Reduce the default to 2.5MiB to match the QCOM downstream config, and
override the size for FP6.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa..c0981ab731c4 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -724,6 +724,10 @@ &remoteproc_wpss {
 =09status =3D "okay";
 };
=20
+&rmtfs_mem {
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



