Return-Path: <linux-arm-msm+bounces-92169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGkwK23/iGnD0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966010A391
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 115AA3010BBA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0366534D4DC;
	Sun,  8 Feb 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYakqXsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C791A34AB15;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585947; cv=none; b=k+JxmGqziUuBbcDDeyIj0zJTtrkBU5L4sFkfbOsEKAXYeLYngAzrj9QXpgv9bTTuVI7fl8iMhNXMfhknt9zjM+k59R94TBfZ7VhayCNwfFUw/F3MnOXtgcf2agdSQDQ+qtECUkaAd6V9JY5JiTqJI1kMSC3iN0blIvmSdCVv+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585947; c=relaxed/simple;
	bh=Jv6JzNhbW3FoTxd7kM/+A8rveZuvMbwdjQ+xC58Vtb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cm4IiJbzMAUlw2M2gFHrJCu1ZfeLs6JSimunWQtQ6vsS5OPvrFVopF1s566ilA33Ny3l3QBTV2+Z2vf7WPWQVuXJgwUXd55mnDfmwFGt9NtDKQWnC6ifgtmNeeHdVPNRj/SqZwOXKZTCFMFZrafHuUm+FakBhMDiil85CRtNUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYakqXsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77288C2BC9E;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585947;
	bh=Jv6JzNhbW3FoTxd7kM/+A8rveZuvMbwdjQ+xC58Vtb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FYakqXsglJKh+h9ffo6UuUAyyMON7JaG/klMM9mhWy8TP73z7gX9jStmSLgoyQwsD
	 Tzj5Lt04jzpXGbS1Lwoe7MaZsSM/eDRUxaJv16wJ6GfWGvIkwns0zSEZiJLibyHZO+
	 jLyTvcEmUyIkOo5ZTk3lSD+bVPxCKSL0i8DCtbnJJSDHWYKusLWEZt4VsJubeXYRBk
	 U4xlPHld/6ZsIWxgRQm1VnuUKhhzcDlwQyNKWAIsPjv8fEzhz47xP69yvKJcH0Fmrx
	 Gr8ao63EIOF2cTaHnsD3Pm279BoQOoYaTZJ4Twgnvrdfcgc2W/nfmJcUjqa/PIrs8G
	 m21r9b0JqMcyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE70EF06EC;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 08 Feb 2026 22:25:39 +0100
Subject: [PATCH 2/4] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook
 X1P42100 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-b4-vivobook-v1-2-3a9b5e153909@oldschoolsolutions.biz>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
In-Reply-To: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585945; l=870;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Z+hY6KG+Sx+z/m5Jxyf1HPdCwq1ydRrs6GXjeMG5dTw=;
 b=184IJkcbRr7f4UUuL6BFSg4EHnggzXSG1u75RToG7ecuymij5DaDnfYUwTEA5lJ6B0QTBR8vz
 kRyvd3b8Fp3DSeGlawk7i8EVcOFb1oBvePJDrZCgd+Ynmk8fd+CPIjV
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92169-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,oldschoolsolutions.biz];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4966010A391
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Enables access to EFI variables on this machine.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55f53c508d1ddb2d7a9e62281d1544..2fe1632f06e908683ba2841d68f9d382f407a425 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2290,6 +2290,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,inspiron-14-plus-7441" },

-- 
2.51.0



