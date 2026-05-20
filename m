Return-Path: <linux-arm-msm+bounces-108865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EtPNPzwDWrA4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7155940DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55583316BF74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166B03CCFB0;
	Wed, 20 May 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5wA2z0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A032B123;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=MIs/DT1hHecEfVsvDgQZ1bwfVeJoiOe7PSSgXAZrIKOvumz/VttulPC8wiTaagFPFsqTlTX5RlCncsRbW9K5pgB0uG453peTW4vLhJnkg2kg/D69dFogJkXGGAH0sDMbYf4bZBnLQbCR1CZ6pghLwE7/zt78AxNszBaBOx76vDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=xEDVCdkua/7iBsfv2z75bWb1evX4JvLZuoi6otdCeQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APVYHDZ+Ls7+jeo5E9MjB+7eVoFStvwvoNx3g8ePBbfXP0Tcs9b8TasuDyu83qdrWmNasZVkmHKnf3mNDSa3adZEWnymNl11E9xnJRIn5/CfvGSg4LJT2nPWrwfn2tad90o8de3haRsTYa5dYGsCL1lndsCl79Gc+ITLZLB88Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5wA2z0r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F103C2BCFC;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=xEDVCdkua/7iBsfv2z75bWb1evX4JvLZuoi6otdCeQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G5wA2z0rJweQK5zrc5Se1Sa6RzlOwp/uFy7jdlMULH/6pW5ii4YHl7hMQMLeB3tGh
	 2vm8fe1G22CwWgzwpoddsTZxTlxjpCSCqxILcYNwtxdIu7RDAJrOYYLlgoFEt0zmO8
	 SdtW3rIFzIMD1Fl1Ax07uKuLvRGTX/mEp0vtgVjBcweFBH5I6J5xARGUNFjz58kjFs
	 qV4TzRYZkCHHPqhOkYVlUafTXfN8FEMG2Fykro69xNfuXMXrFB32zPph4KKcdWGq28
	 Q19UxCHdn5OK/3TaRhP1CLCqFIAF6yfcCkcMsE0Icx2bt/OL2Kz7Ql4ix4kcwZUSei
	 fRyK7oPZxPa+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72931CD4F3D;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:14 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi
 rtc offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-10-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1302;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=U33Edd1LJ3viLModpsBHxlsQb9yGXvyVVmxT4ozJBOg=;
 b=asv2ZIpTTgM/SJ1GCriLiQm1TaOlO+NniVF0jnu8gepeegudJvUl5sTQf3BFgvV5YhTt5uqmi
 WZO21yXZaRZBRVHWnIDLaoAMxtkMj03jiaiKyGyO87HeWLxRhE3HADp
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108865-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bc:email]
X-Rspamd-Queue-Id: 7D7155940DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Align with the reference implementation from the ThinkPad X13s:

Switch to using the Qualcomm specific UEFI variable that is used by the
UEFI firmware (and Windows) to store the RTC offset.

Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
stored in a UEFI variable so that the OS can determine whether to wait
for it to become available.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 52d8e9527bd26f97305905650e2486a59e6d7157..ae0a054f2f9d90c9341766528d6be0b9561a530f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -749,20 +749,11 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
+	qcom,uefi-rtc-info;
 
 	status = "okay";
 };
 
-&pmk8280_sdam_6 {
-	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
-};
-
 &qup0 {
 	status = "okay";
 };

-- 
2.47.3



