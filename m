Return-Path: <linux-arm-msm+bounces-101849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5O+ZK4Q/0mnOUgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:55:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658439E10B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65BD03007E1C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD4133BBCF;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCqaUxD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426D267AF2;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775386497; cv=none; b=sDI1tHqfsEcZHVZCu7UkABF+2dxBcI0KHgpd2H25wErPseZyzHAw7W0ipkyoZrSYBp0k6xXCxvXxZweanc+8YKBRRoSq+/c86yosr4Y9vblybB82oUAwPOgus2JDU0rhFXg2uCPXEux5+ei62l5cy4WheUXjdqOLtkTze54UhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775386497; c=relaxed/simple;
	bh=GKrvjJQ6InTyeSypzq7Vxjnbaw/6EBeuclqAJOInFkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAG2p2vdka+MxLAPRMfb7EGzLp3o0IE5W/vLJrA3rj5VzxzL4bsWeVxvrILm0lEw76CatC9cJ4g1mSQhcn/TgqElzMmgX7rWP6bJ1fPuP1K+yM1v5oKC4kdGxvTAR1iJJhfgGPiPr2V4XLhSM2Up+7iF8aanr7eZf9wdx1nU+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCqaUxD8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57F4FC2BCAF;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775386497;
	bh=GKrvjJQ6InTyeSypzq7Vxjnbaw/6EBeuclqAJOInFkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oCqaUxD8Co/jpqC1NLY/FVGbBF0JHMwBkCFKV/OfBBH9aFlopxXicaH2HKKaD/8UM
	 sGWmKFlYxMEbbPhSVZPIVwMUp+9LZRXnTca+9k5yOLeHuIJvWNCpZazx1KWiHaSkkr
	 K+MMcjZ3/mE2KI1xTU25J6cr7B9MPTFT7KBWdD/uB8oXRbvWcegLqd5/Y/w1oykA3E
	 dOHa0c/f8aDp4KNEvk4xnupH/9+DoQL3+fNa9JioXa4Fx2FgIcKwt99TOgNgfV79gD
	 nPWaEHCMriwahd5cB9HXEs5ilrtikNQP5QB99XPIj2GRnQgfRBzeNEmz5xtSXvsOfr
	 kp0NrWOZSQr+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB88E6401B;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Apr 2026 12:54:56 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Append
 compatible strings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-beryllium-compat-string-v2-2-91149be07835@ixit.cz>
References: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
In-Reply-To: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>, Arnaud Ferraris <aferraris@debian.org>, 
 Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Petr Hodina <petr.hodina@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cv7cDYuMTi6gyf2Pp9mcIzjD0CpCT5mLI+pIjAH3UTA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp0j9/da2r9Zvp3XxR8GRM9SV8Jl0kFoIA4qD9/
 mWIBbIToWSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadI/fwAKCRBgAj/E00kg
 csVCD/9SY21ucBUIdch1nEgdipJ3CRwzcK1fErN4W2EXhhzDyamREDIgxzpK8jCK3SOjocmzSpF
 FA5BygMPXxW7xz8+mWbi5QJtRiiTKVIbqPC4V6MedTeWKAFG39mhsgXLE94VlHxsRx3/PQYJEgq
 M5rnDwVbrhnzHqispVETKPaTAs+EbUSecsRKCBPNSqrMT6SNSZoyCBJyyTxa0yw7ATJtTZ3BlDP
 4n3zcMmHsQZCIhweT+aX50sO8V+tq0AH0fIl1eRJB0Szo6K6ZF0FI8gOvUYzQlVJ6AjeVFJP5O0
 jSQef9LQqggmZBfog6ParwaFSbJi8ecV5JB4arzmT7jIp77JEzUO2BcdWxNlM4IArEHFo8PEm4B
 C8oID31Xk3v/kmv/G1cCDNaiJcNC4XlMXTbhXT9YJJa0tw0t+GzIZXoKh4Wasnwp81GWrnGHYzP
 7sC2AW6UbVPOtkz9qR7ZdeoQX1y3xixFW8NTCMkZ19LyoDB13gDkpuFeCf9fT6PgzdmzeDzV+++
 fCUh4z4mqqHe3cPTXuNm9ASXjFm3RH8SP0jBLrIpzH26KafXMLaAxxGXorhuUOpcZpRiTFXiHmc
 JhP6VJApmL7UiaFBGiB3J2seBEngmUAd3ztD1t1Q0QA46xDDDD+JTixaQood0X8rzqRqR40gK43
 wkmlxX+e5xSVv6Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101849-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,debian.org,hotmail.it,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0658439E10B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Reidel <adrian@travitia.xyz>

Add the generic "xiaomi,beryllium" compatible string after the
panel-specific one, so the compatible list follows the required
ordering from most specific to most generic.

This allows userspace to fall back to the generic Poco F1 compatible
when no panel-specific match is present. In particular, hexagonrpcd
relies on trying all compatible entries to derive the HexagonFS path,
and currently fails when the generic device string is missing.

This change modifies the DT ABI: systems describing the EBBG variant
will now also match on "xiaomi,beryllium", whereas previously only
the panel-specific compatible was exposed.

In practice, no upstream userspace distinguishes between Tianma and
EBBG panel variants. All known consumers rely only on the generic
device identification, and no panel-specific handling exists.
Therefore, enabling the generic fallback does not change effective
runtime behavior, but fixes userspace that depends on generic matching.

The previous state was incomplete, as it omitted the generic
device-compatible string required for proper fallback matching.

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 2d6f0e382a6cb..d157622f84d13 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Xiaomi Pocophone F1 (EBBG)";
-	compatible = "xiaomi,beryllium-ebbg", "qcom,sdm845";
+	compatible = "xiaomi,beryllium-ebbg", "xiaomi,beryllium", "qcom,sdm845";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index b58964cde8342..71816a9f33b48 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Xiaomi Pocophone F1 (Tianma)";
-	compatible = "xiaomi,beryllium", "qcom,sdm845";
+	compatible = "xiaomi,beryllium-tianma", "xiaomi,beryllium", "qcom,sdm845";
 };
 
 &display_panel {

-- 
2.53.0



