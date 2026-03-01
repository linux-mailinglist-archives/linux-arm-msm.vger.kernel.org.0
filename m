Return-Path: <linux-arm-msm+bounces-94751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RtZPIpt8pGl5iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:51:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F61D0E2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE5D300D6B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25F7337BAA;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiU6GOj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78351846F;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387479; cv=none; b=k2/EaYVaDq8XgFsfdtFb1iCeQQ2e5yh4eu1DKDvZOj27xcoREMBqcVrSQfMSHZ5xNHkaHJ+nuhNRj+MEqmFyk/fi8o1x1vtJdOmaJw+bbBbHydd1RUuk0wiQ3hNW7Rnq9dtDiVbF28CEvlAOKP2nSr5DzTLEZQukz9Sa96ssZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387479; c=relaxed/simple;
	bh=MjnsDPgFAH43KtWaVxLKPW5yKsdDxokV0+MlP67ycVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CK0FmK4no+AGirUmUJVfELonWd30zhEk1Wa+RfuGV4z4sMAimgC0jqYWCIUVBxZvphDwRi4ZRMw5eZlK5KCAnPPiyARweEjBOBa4xyoSaICf5Wdk7OTNA1QgJEKE9A8QN6xOi7QlMD31x6Jq+OUZZw92wQJKKoMJ61ns6WRHHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiU6GOj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250CEC116C6;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=MjnsDPgFAH43KtWaVxLKPW5yKsdDxokV0+MlP67ycVI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WiU6GOj9rgexHKcbUHxhE8vGSGcuc3LMoT+0qfWE3k1XeDPfoe2yNosTKzUIWE8qS
	 OJVMhlkkcYzGpu4fFUI912wLylzP9x9bO/453Mkf6FqpjcvU0Qjim7Q0DiJ1476viN
	 n3tK/DGQO2Ju0bcnDQd8eTZsmaofde4gro7FE4AccOHlwhURPe2tFKt1AbA+Cq6EZs
	 Q6FNqY7ecD/r3I4CUOtkZvI/ki0zVqyEtjcVcmFU5/XY9JDTUxusILlxt89uzUHea+
	 1apFeptc+0dB8kVxVq+GflLJHHh3EbcdieDsLFMstRmT5E/sXRMDpi29Ec44RSPqDJ
	 1UCNBSrLHOg7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B00FD0070;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 00/10] Input: support for STM FTS5
Date: Sun, 01 Mar 2026 18:51:14 +0100
Message-Id: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJ8pGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3eKS3LSSYlPdJBNzY0PDtKQUc2MjJaDqgqLUtMwKsEnRsbW1ACF
 15gRZAAAA
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MjnsDPgFAH43KtWaVxLKPW5yKsdDxokV0+MlP67ycVI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyU634xeBikriSOlFJINC2u0T7+JKAJtJW5f
 ar1XfFgWcuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cpAUEACYalYL4mkkSfpqeXUaJbkCmdmssv5VfFW+rERyHBJSp7TnWVxDS1+NVPPKuVWQ3V5jWO1
 95Fpt0i3orAUfQE0HYiJX5IzIKmBACWJKjT79FbHYLhjmNlHj83/xsBU9cWa5ecO15Nq9Xh3PY1
 Tu1TP0ifOnNRy+h7dKppCOvi/1Zun++l/zBq1AaFk1I0R/N6z5Ufhn/trmg0pUuOapn7uEPsmoB
 iJl3d7Rf3ONswHNMKPyGqaUH9liS8+roURXtSpkK5pj+Gtu2L2yfkcw0AZPOeubBwIiFJ/zPCX3
 K8Btrp7+3HVRe7T3lVlj6FvOPEUJzIWpjfJaE+K3WGH9H+/qUTunlhO+a/XtDgSsWmqGP5tgmst
 SfHqdqZPWROchdZzrp6oypxOPnet1oTi6i658H71ftRIgI37D+xR26G1M/hFH7/JMFHLlvEi+31
 7XOCtZTpy0351ebfBvJw+PvjhqmjUszGD7XXyRFKGt2yD2CSZi1om9gkB1AKfcha0lHeTtRiYHP
 44L3zPrYBAuHPFYbtyRSbmGSyZPANqp40p7h4Ndmk3dPrzYO3N41K22EGB95t5R4Lszq7AvhB0w
 2ZeGvRrvkF57XAInWTw2YPRp5yQUqBfhbB9gmdWIBOOBIRvlGuuEwqqPu+t2wkJC+0Uw4otw9+A
 T27k3Kd3cB6D90A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94751-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E26F61D0E2C
X-Rspamd-Action: no action

Used on various phones. Minimal basic support.

Includes device-tree with possibility to enable touchscreen on Pixel 3.

Sending as RFC, as this is first, seemingly clean version which works.

What is missing:
 - firmware loading
 - switching between AP and SLPI mode (to wake up phone by touch)
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (6):
      Input: stmfts - Use dev struct directly
      Input: stmfts - Switch to devm_regulator_bulk_get_const
      Input: stmfts - abstract reading information from the firmware
      Input: stmfts - disable regulators when power on fails
      dt-bindings: input: touchscreen: st,stmfts: Introduce reset GPIO
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5

Petr Hodina (4):
      Input: stmfts - use client to make future code cleaner
      Input: stmfts - add optional reset GPIO support
      Input: stmfts - support FTS5
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  21 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  21 +-
 drivers/input/touchscreen/stmfts.c                 | 595 +++++++++++++++++++--
 3 files changed, 577 insertions(+), 60 deletions(-)
---
base-commit: c6870e543e8d55d725cccfe972fbfb5798daa1af
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



