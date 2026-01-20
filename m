Return-Path: <linux-arm-msm+bounces-89828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD/wOFFwcGktYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:21:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273A51FBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CA07683668
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971E2428483;
	Tue, 20 Jan 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu7pgg2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AEA426D22;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911869; cv=none; b=aCIDiFIh/6PXAZqT38I7+iQjrh/S/7yWjf+fobtb22Eq9t8TQ3QJT/PYIoxZdICnG5xnWtobrK4ZIBuByap/1fj0aw65TzPrlUpxgloGIJmVEQIN4/6WJnrln5fQ0OU/NK68JARYDY8c1D/3z0rgw1q8QLCPPhf5Toc7ePF0SwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911869; c=relaxed/simple;
	bh=cABijGtH5qtV4tilYuBX2OxEKmyd4+buX5dd0F3c//E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B8D15LoXCD/BJT4AL7UTLJAuf9N93XjjE1/ZoXgoBAGElrX9IX+B121nX3yI5QpszceE1FRmDmwmHlbawE1hFCtH3tLLxaBKnH0M028GlcweU9ro2ehGWxbrQ6naZjv29vqWdQFmnda+2aRXe9VdB+yxNxDioBtAzG3W6cQrFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu7pgg2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBB85C16AAE;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911868;
	bh=cABijGtH5qtV4tilYuBX2OxEKmyd4+buX5dd0F3c//E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Bu7pgg2EouLO5AFXlmdeQo7pmsjif32cLrc1B9CmHjJe8mRrAkPK72btyqITfzR/2
	 eXcsX7OIBdhaaXjOLJocyi2jfAi5c0im8JwL16Du7nWBK3ePeMdr3KFGbLYtbTh0Wm
	 tsxMUeIc0Cf/vIwnnmitYoV1sIOluF87hJFVYrQ0/2lDZ4lCZVB6DBU/7lRHsqk37d
	 eE5V8ujqdovlTn9RHi7RzX7yRVdlJRNM1sb4zlDQ8vnt3X64PNcdMrPK7HT3hKDFeA
	 qEDEHYZwjgkirMI/O4HBPdjDbnBONb9GhlUxfGp9QxMXxo0qmpXwc/8VcmYELiktYA
	 d9eR4njhfD7Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAA2D2ED0F;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Subject: [PATCH v2 0/2] Enable uart and bluetooth for Xperia devices
Date: Tue, 20 Jan 2026 13:24:23 +0100
Message-Id: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdzb2kC/13MQQ6CMBCF4auQWVvT1kLRlfcwLEYoMkFa0haiI
 b27haXL/yXv2yAYTybArdjAm5UCOZtDngpoB7Qvw6jLDZLLUkihGY4YwzISW9BHpjrNS11X6ok
 a8mf2pqfP4T2a3AOF6Pz34Fexr7tUcSGuf9IqGGfyUveqQ9VjWd1n76KzE9L73LoJmpTSD6M9K
 dyvAAAA
X-Change-ID: 20251217-akatsuki-uart-4d7057864ba7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911867; l=887;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=cABijGtH5qtV4tilYuBX2OxEKmyd4+buX5dd0F3c//E=;
 b=8rewuacEgvIP8DbcRvn9B7+krUMaZJ6zZXJ0TfP2pU3lIGOpq44oRl06poMNxgG2V21gKaBCk
 r/tJf4Z9vJBCrpt61ZYXuH2JDpmXaE0+L8PHEWEV4o0WG13dLILcH4v
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com
X-Spamd-Result: default: False [1.54 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89828-lists,linux-arm-msm=lfdr.de,petr.hodina.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,oss.qualcomm.com,ixit.cz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	HAS_REPLYTO(0.00)[petr.hodina@protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid]
X-Rspamd-Queue-Id: 9273A51FBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This fixes the uart instances defined in the dts so the serial
console will now work if uart is attached to Rx pin on the uSD pinout.
Also now enables bluetooth.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Changes in v2:
- Added comment about serial0 console
- Fixed firmware-name to expected path
- Link to v1: https://lore.kernel.org/r/20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com

---
Petr Hodina (2):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Correct uart instances
      arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth

 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251217-akatsuki-uart-4d7057864ba7

Best regards,
-- 
Petr Hodina <petr.hodina@protonmail.com>



