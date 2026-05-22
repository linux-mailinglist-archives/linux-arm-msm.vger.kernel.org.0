Return-Path: <linux-arm-msm+bounces-109255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEOUIho2EGorVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:55:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DF5B28E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9459030B7053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8DE3D5657;
	Fri, 22 May 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/E8dxdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD8F3D34B9;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=W89Z89fntXpOa0O0sdSIG7BuURuw5NRTJ3IxqkWdThuPPicDmNUmC+RKj8UeR+T84BuU18ybK5Modi/UKCnTigY9T5IsZJcRjJs+vEw8MPX1+vltmIHt9h8UHHIChSPC7B1AD8BFKTLCpyrY+bAok61hpMpNEwUrdEYm3N72q8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=HlnxicECOaJGFUNn4uuTlkWF6gz28FOW5955bz8C4/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaSBchl/6SEB0oybjwuG1HcxDXLEcCHHE9QQgvQCszBz5Awr7rN+5PKzXJsBuofUbOWP6jkyD05bVjAFlOfWAGa+xPuLLxP3O02DkDYZIWQwnFX6Lat1zwYYtY3J5AdmBvfgdUaXCfWzOBGYC4FHys8FeVjcaEOJeeK2lBzwwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/E8dxdc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D4B5C4AF19;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=HlnxicECOaJGFUNn4uuTlkWF6gz28FOW5955bz8C4/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j/E8dxdcORHHJtaTLnVCfinMBihm1GXxQOLTIWxLY7CCJf5Z4rXgfiryq91BYzreg
	 tXruMOVYNfVfmLeKMflWDD+quAKsIhb+ukRVqbmFPmQdSZEQCU6d2FPHblxOazPgo5
	 70ipXTI6T/2dL4ZjLTFTiWsyP0GTntFZhBsraAq833wYGNbootZgM0ZE4nuikBFYCZ
	 QLHkWGjTJUHflNP8m2NorfcoZZ8w0NwLs5dlYPWES9WZxVjZpejkRqWVnKxaNSDbDU
	 p7z2Rqgjf7GNpQ/I+hTq0Al79bEkHWqnRiVyfyKxUixXGu6rT+SCYaweTuzSPhl1Np
	 MXrb+baBxg2zQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8499DCD5BB0;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:25 +0200
Subject: [PATCH v2 09/10] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi
 rtc offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-9-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=1363;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=DHDnAoJLxGRzZgCQPXZ9YZ8sqp9U3koHrcqXIq/qniU=;
 b=pTfI4utmFqB+zEmIRyY1Ef49GtbMR0a+iroc9QnNqto9KHBiA0w/DEDcxEInozoBGXb3fjCeN
 DCoOnAbv+yrC72Lokz7OvxLjh1XbbXwl9w9qTphbT4HFGreOz15IGZH
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109255-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,bc:email]
X-Rspamd-Queue-Id: F29DF5B28E1
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index d1f72cddebf1df7b67be698a77656532d2f74766..60f65fd450ecba8196509a620be029314e5efc05 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -732,20 +732,11 @@ &pmk8280_pon_resin {
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



