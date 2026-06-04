Return-Path: <linux-arm-msm+bounces-111231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/vjMHGrIWrfKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:44:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F55641FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:44:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=IpwjZxQa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC672315F73D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6294779A4;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502A43637F;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589929; cv=none; b=DDgqaqXKjjYLlhpC+oLe2sH3VxACBvH/Q1BuDlcoWiX3VlvupjjoTYJPUGwS76C6su/MWH1O8+0swxOsk4foXb//340aKEwGLJUrJC8HmAcntgZwI8fYyiv2mNVzoI1FByvkujL0bzWc/XZn8qc7zptoypQc2GowqO1c1CHCkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589929; c=relaxed/simple;
	bh=hbnbdk5hcXpiYf5E3X8ufCwSA0tJeSFQ5rt8/7yaBNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqJadxTl5RfdPZtPfN9auqpW0EC7uIK9l/akqyiGkp4OrYME1YZxeaStvioGuh91ZWfxMSwGnvvXfXvF0LDzHmf2BPAGxwGKXnAt1M43p9GTpQmjw+GERWocUp7P26QDZ/RnuUH4yYsySNO2CjvDxO1SlV6Xqi1zHjuyDvbYnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpwjZxQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A8A0C2BCFB;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589929;
	bh=hbnbdk5hcXpiYf5E3X8ufCwSA0tJeSFQ5rt8/7yaBNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IpwjZxQatwEe1UoM5dFR/73BbjjlHYCQ0G0FgdPNMe6QBUNusDa8HXDTF3XkfAPqi
	 KuAbtKvOM/6cN5HloLgHqGkpdJ7Z/3JgxK4auJTyXgVRRIdkcw8A91yFpdzj0KuMtn
	 SGzsPDYW2Ox9z8EfrSdACTeyMBaOAyN/IsNBIgDD10J4QE7gN8Uw9XgYxeHdyfzLHt
	 lzQHJSI12xM8/Q9MSJxOu+llMcHSfc+BJ3ukbSBHhxswfIBYZ2TALNrXbyNPEiBZJu
	 CttIBLkRXjhLlTJH2aM5FbvqEbVtPFZjW0/VZksVnwZBm7Nt9+kwexvvuhYenJ6EcO
	 jMBXS6DwEH9JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFDCD6E79;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:39 +0200
Subject: [PATCH v3 03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-3-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=936;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=G99UBcbrZwtaqeqPJRUSaHBYDMjBAma4TMxJ7Y0s0tA=;
 b=odZyReNdb99FgoeqjyM6fIvUCH6gHpn51nnSK4wb/npORtUWhHaBsdredYAVtZtuUzc6hmoyo
 xgGwfI3EzcVD6jfrnyBx5G3rIpaExZJC/SSGnsJ2EDf4XE4rVwPLPkJ
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:jerome.debretagne@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,m:jeromedebretagne@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111231-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40F55641FC8

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Define the USB-C orientation GPIOs so that the orientation is known
for the two USB-C ports on the left-side.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 476e17415da273330e3638e040db9cd4ed408bf1..c3b143ed11c73b7c1bedc576c10af8db30effc36 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -60,6 +60,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 		/* Left-side top port */
 		connector@0 {

-- 
2.47.3



