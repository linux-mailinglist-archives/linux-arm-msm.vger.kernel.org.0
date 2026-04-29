Return-Path: <linux-arm-msm+bounces-105207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FKYK0sG8mnNmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F0494BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D8D43053DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E883FCB14;
	Wed, 29 Apr 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsxLuzWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452743FBEC2;
	Wed, 29 Apr 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468630; cv=none; b=G7bKKmpBhACArfYOA4dgBfQCVbkuuNdYrzJ7oQS6sxK+vlEdR0w9bSn/9A2Z7ilBEBuOP36KXhFS2PZ6+/gMgkZKpMEyv0i7F4VeWJr6fyfcJMLkXapZ0a6UoyQPC3SQ183Yg24zKRz4GqchgVzCZNE4mfYlJOKEk2hqZajip00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468630; c=relaxed/simple;
	bh=m6I0kIOLEEQyFWPgbgKBr90QtqznadjT7oLS6MfUb8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k/YvX62ZEYbjWaX/5EGLoj6T2KUQizelHhy27dYMQRjf/QwLpC9JUEkiMeS+96He1Mjvfn+w7i3l+1now+8ezSDMjZeRg2uG4kOAKKDCPIw1L3SwXbbKIBirAycQsF0h4MvnojRpV8DjNdA6wtOOWmH/fCHHXDWq9+sRAdAbBow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsxLuzWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE26DC19425;
	Wed, 29 Apr 2026 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777468629;
	bh=m6I0kIOLEEQyFWPgbgKBr90QtqznadjT7oLS6MfUb8U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HsxLuzWYLIHxQb4PvSG6Ujmo1bV4IG8g9ty2u3IuoTckvJJlQVq0U5TaUlsJvPdik
	 hO8ibiLaa9KDDYWKKWfGcorsXJTNxNd8htOhshhLVMqvkDclyU1Bo5nbPFWaeVGDbQ
	 H9S08H2KnCySQ3lWeWFHIUHZXK9APasMfDZR7F/Yy8olNsMEiOTYoX5EG7lMENYuXU
	 Q/Q7gOMpYrrrUkUCJRpIX3BJHycnb0FDtMdhhW6/M0pCn0KwlVm0HFZSLCnlZrIKVA
	 dpRQ1z95kxuq6arKtoOfPF5UDUW25Joqb5aWpWd2etJQPQfLzfdEDv3MGA54En1VYq
	 bADJTVN5m4LHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9828CCFA13;
	Wed, 29 Apr 2026 13:17:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Apr 2026 15:16:53 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAMQE8mkC/x2MWw5AMBAAr9Lst02qFcpVxIfHYhNKtiFE3F3jc
 yaZeSCQMAWo1ANCJwfefIQ0UdDPrZ8IeYgMRptcZ6bEjuReFj5W5L3FkS8sqHRF7pzV1kHsdqG
 o/2fdvO8H65RbMmMAAAA=
X-Change-ID: 20260429-beryllium-ipa-fix-7e9876883038
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XlrWu6+s0yzcZbPOuqwUJ1OG+3gH3ACkoRurIxaFbys=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp8gTUUmKZ9rMDMP4he+SdSlNbVNxIugNU0O8Ni
 MZMl2tA2MSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCafIE1AAKCRBgAj/E00kg
 cvzGEACNCAxF/J4o22AFXb6r0uX1FmcnZjznlEbXhaWpLqT4+tAJcREq+AkxPDRwQ9VVZbSkIqr
 EUEAt32Mhyd2jZJDWBUNcjIXPqLXLtYREyiGYNf9cPS9Y/c4EKdRugBUwW33ks/GBAtnEJOvbAC
 QsmF2eiyOJBvezknOrj9Hhru1Ov1BOSGN3ECAb2Hk4mYBPugnDPfAp5Fj16j+35MZb8/d2YL73O
 JrPk0R4qSjfy8AooCsNx81my9fZU+3JNCV3aIYxvrIeIjf8ZVlVRTp83kqcaBNcs2A3e2WEIYhn
 r7SLguPkJp8G8bJenvHWRFPeC6Kl1jadJSeI1NSJcNbMMQNucSN77b5OrCch/Tgb8J9QToYddac
 MWHIn04OC6pWSHW/Me9ZT2EpegMrYBMNmz1wdIZjzQrKw6Vgus2rkLjmLCOjlTwGaIoqgVIi4kT
 U869bTS/4JTP2mZrXBKkmwfATqKTCWSlf3PAfdpjU/1CC6uV8yMnU11sqFk2uC6+0Ju2YQHjBAj
 bpOVb+pXFtpJ8sKF2H+fXulDdJjiq1bXqb3VMYIKs2jbxsTSaZan3GRe+Aqeh6iYbxwwWyJmdLq
 uZoTP6cCZDa/iNSy4Xs/j1AgPfmZBwpe28hcIGQYoCY4h4vL4bCNAfun2aQc8D4tkHGeawbdGdA
 dA2J159BbDNZxPA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Queue-Id: 9B0F0494BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105207-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]

From: Joel Selvaraj <foss@joelselvaraj.com>

The path was accidentally reverted back to old while refactoring of the
device-tree.

Fixes: 5bde31dc7b17 ("arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort")
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1298485c42142..22354968aeaa3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -266,17 +266,17 @@ &ibb {
 	regulator-pull-down;
 	regulator-soft-start;
 	qcom,discharge-resistor-kohms = <300>;
 };
 
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/ipa_fws.mbn";
 
 	status = "okay";
 };
 
 &i2c5 {
 	clock-frequency = <400000>;
 
 	status = "okay";

---
base-commit: dca922e019dd758b4c1b4bec8f1d509efddeaab4
change-id: 20260429-beryllium-ipa-fix-7e9876883038

Best regards,
-- 
David Heidelberg <david@ixit.cz>



