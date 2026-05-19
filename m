Return-Path: <linux-arm-msm+bounces-108332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC+OJMz8C2qrTAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D331577ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE9623018086
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E7B36308D;
	Tue, 19 May 2026 05:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZza5EeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA735CBCB;
	Tue, 19 May 2026 05:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170168; cv=none; b=arrpLhJRSLsNUDuYctpxAFQjAnERMll9iBYx84QJGs2gCMWbakzS8YxwKhPC5FYTV7vEkz6MiNCRp3CD4BhKbhloeXLJMxJKjb8+Z/1vyVTCFRHJZ22ztUqeEOX6G1JbAStixjCWlTt6v1Z5gFmUKv5eUWM5Z3dJF7l3CgyjlFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170168; c=relaxed/simple;
	bh=hzaICTjgfaI54SlWx4axxGE0BwjC97SmM1sxfONlANk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bWFAILILBaeN9+fXKcaCdYam500LBu3AWN7ylAce24coDYosPtyAoOYdnmKAClRBnijsA6vVFvbJcU4gmxqNpXX+9ecZaiWe1VMXrY7tFkA54F4KCdK0fspoQ9IF1OOn+SbkqDaBBtomaVRVBc4ktxpLspgDnpMSDoSd2bGH8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZza5EeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34C7FC2BCB3;
	Tue, 19 May 2026 05:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779170168;
	bh=hzaICTjgfaI54SlWx4axxGE0BwjC97SmM1sxfONlANk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GZza5EeLnb22Vo2A06f/PBLD7bO4wDgmIvr0nLwvyibd/st0IMc7J6GKSDsAXxeaL
	 3SZznqqsONqMIhdiS/MyOwcjs7kZ9vurRcFKUynpl/keKlkVXZSRzr6C9UyJt2sAz2
	 U+MldHjONTvs21PH/ORjtF/RF06A2DbPGWZ4Udl59TUlMqgfFLBUsQ/B+GtRPodNCT
	 IpYkI6Wio5JFqMIYJlqkobDI1v5knCXOpP1z7+Vv7BhgoiFlJqCTGs/efwT/gsF8Zc
	 uvFRjnG9zmRNqnPV7xKDRbsRIqXXLtrsq9hl8tOvxdBcTogTXjfS3/N8UedZDFHzSr
	 j4mNI0h1T4N/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2012CCD4F54;
	Tue, 19 May 2026 05:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 19 May 2026 09:56:06 +0400
Subject: [PATCH] arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock
 rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
X-B4-Tracking: v=1; b=H4sIAHX7C2oC/yXM0Q5EMBCF4VeRuTZJS9jaVxEXVcPOxnarRSTi3
 RWX30nOv0MgzxTgnezgaeXAfxsh0wTMR9uBkLtoyERWikJWyG4qhFRofhbdOKLXM2HPG+ZK6fx
 VtT1JAfHuPMX5TtfN47C0XzLz1YPjOAHWP1SbfAAAAA==
X-Change-ID: 20260519-ipq5018-cmn-pll-rate-fix-388a379bfe10
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779170166; l=1302;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=U/e+sHep+NDUEPBbykGQ7tknr4hOCzaANIv9del2SXY=;
 b=ylGeyNJlRJtXoZrDQ8onYc6fVQ67HU+OqwbJXah/CZ/VC+tBBGi/OrRlMD7X9btf2HSWoVuQX
 f0Wfwsw/6Y+BLbMG2hqRoXedwxRGe4QJfWSM7p5xJUYY4YUcRSitaaG
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108332-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,outlook.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 3D331577ACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.

The CMN PLL driver did not account for the ref clock divider which is 2
for IPQ5018. Therefore, the computed rate was twice the actual output.

With the driver now accounting for the CMN PLL reference clock
divider (commit: 88c543fff756), set the correct reference clock rate.

Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..f6cf2cca44eb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -256,7 +256,7 @@ cmn_pll: clock-controller@9b000 {
 				      "sys";
 			#clock-cells = <1>;
 			assigned-clocks = <&cmn_pll IPQ5018_CMN_PLL_CLK>;
-			assigned-clock-rates-u64 = /bits/ 64 <9600000000>;
+			assigned-clock-rates-u64 = /bits/ 64 <4800000000>;
 		};
 
 		qfprom: qfprom@a0000 {

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-ipq5018-cmn-pll-rate-fix-388a379bfe10

Best regards,
--  
George Moussalem <george.moussalem@outlook.com>



