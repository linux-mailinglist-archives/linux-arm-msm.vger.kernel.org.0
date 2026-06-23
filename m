Return-Path: <linux-arm-msm+bounces-114261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p4onFmjTOmrSHwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F016B97C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 20:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=MK9u3qz8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D096730316E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0147C38BF70;
	Tue, 23 Jun 2026 18:41:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E03815CA;
	Tue, 23 Jun 2026 18:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240098; cv=none; b=Jze5A0kh0D2MnT6YNbh6XiHhoIJWZTh8/CJQdOcYY+JDtggJ2oP7tw2CBn9CwXarAv1CR0Bjs4SLEdTHWMMmP+Sjf0uTdI7Xo0W9xyS16OJa3n+GQesK8gn38DtvY2Jk29gKHibBZJRxREXnmD5QTKGIozDSyDdxvtHJ2ku3GLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240098; c=relaxed/simple;
	bh=+v4G0ah8ba4jvcnAMGRfX7axDYfTDxc2GAfdz46STA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XKhPrF1KfWKrnwf2uIMUXrK2nnOgKVItFo10kFOu25HCG/XarV20EBQ+fSaTbHzoFbiyUZwWxEQvO+CXaW3VvfLZ3z+kWmzP2R+sHmMgaJcbl2jFclxusLy4mITXf5Gb3dXRcaFSN2ni4Jv5P6LOtjnGlTwNSlO/tMiI3t2PAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK9u3qz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B296C2BCB8;
	Tue, 23 Jun 2026 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782240098;
	bh=+v4G0ah8ba4jvcnAMGRfX7axDYfTDxc2GAfdz46STA4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=MK9u3qz8GYhHiaLZqgtsHKdmsx9ZQcgXfDJuxdaaAT93PnQUxGOYT+CCp7Qqdq6ZS
	 h2ZCiy2kzB3u2xYQOTbLqR4mgOJuOnDpWXMBcqnehh4/+5bQFFPwiRYc8i74VDB97S
	 4/rqR7x88MwpXyP488GMgd0SiWXfbCHM0GsAUgClw9912sE8Ci14fMR/t/7KUjEK2S
	 5/l6d5H6FGv846Evwzc/8RAMHuq19PaU9O6P0wAAIPO4Wg3ZNbeDkpAbBShh2EL3fn
	 mkr+l41V+6NgXyP7rO3dsfnhqqoJcPA+WEjTYgtXeUeO94yNUgtNCcVopUtZujfYL0
	 d1HmthPngKDTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27076CDB470;
	Tue, 23 Jun 2026 18:41:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 23 Jun 2026 20:41:34 +0200
Subject: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA
 850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAF3TOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3eKURAtTA12zJNNkw1QTEzMzo2QloOKCotS0zAqwQdGxtbUA8jg
 +/FgAAAA=
X-Change-ID: 20260623-sda850-6b5c1e44662c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=sCETGokdPT28+RQWD1iS9ITAy/9lm/wifsqVmn6O6ss=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqOtNglR5svPqZW4gfuHTY4j+yRZLGfkXuivIcY
 OqMuZIlul2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCajrTYAAKCRBgAj/E00kg
 coo8D/9jwAGMPLcn+7aSyldg+mJnNs57yqMWFs2brYkeTdYstripNqfJcObbclsHI6nD5TJKGBt
 fil0rSsw4pvSYpj3g/9PEGLgdrNvPNgNrfYxrlRPI4J08K6UIrEGMGHun2XBfbEPK1ngINW2EpR
 x+evjW3OAZIWhKzIhNFWANbhgZnl6u2dYzNGCmC2JAb+q4VsB99e0fbwCyy5PcI7i1Pr4HWZVd+
 e9BD3dZSIsVKf5cWd5O0xGXs8FY3V1evXsc8Zdb+Lss7IR0W4gJhUYwTs5pfRnGTVjyZrJVAopC
 upzDwLEGcmh7F4DcLL/P7inVEH3sO4gMSyeJnRE/QcwOzwLNqeNBJ4bo+FOt+aaMt+6W14Z96E+
 8bjdz8VunG4ToBuQ1yzEkFjujoCG7BBo5R3SMr4PM1LQ4wvkIE+mUbNWbCa/dCzC3nvwlOCTuyo
 mD/a7tbL2mOTUxXm+jQuntzmmf0u2+9xISiAC9CkHvoW7V2nB6qD89yj8FX+deKu87jOmmT9f1f
 q/ydYUbwB5CgJHx1fhWRd5hEN4+PviZsokq7KXNi9BkRWUScr0YrzRi1B7UgVIm0rfQVqL2HOQQ
 kmldGrT199P1havmNfwvweaTgxeXew33n1UIMKDKjSpCFplJxnDwaW77DCYctQ4Vu7Ai4H6lTxT
 4KPsPtUWbCUKaIw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114261-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4F016B97C4

From: David Heidelberg <david@ixit.cz>

Add SoC ID for Qualcomm Snapdragon SDA850.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Will be used by Comma three.
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad41cd..4b3062f57eecd 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -179,16 +179,17 @@
 #define QCOM_ID_SDM450			338
 #define QCOM_ID_SM8150			339
 #define QCOM_ID_SDA845			341
 #define QCOM_ID_IPQ8072			342
 #define QCOM_ID_IPQ8076			343
 #define QCOM_ID_IPQ8078			344
 #define QCOM_ID_SDM636			345
 #define QCOM_ID_SDA636			346
+#define QCOM_ID_SDA850			348
 #define QCOM_ID_SDM632			349
 #define QCOM_ID_SDA632			350
 #define QCOM_ID_SDA450			351
 #define QCOM_ID_SDM439			353
 #define QCOM_ID_SDM429			354
 #define QCOM_ID_SM8250			356
 #define QCOM_ID_SA8155			362
 #define QCOM_ID_SDA439			363

---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260623-sda850-6b5c1e44662c

Best regards,
-- 
David Heidelberg <david@ixit.cz>



