Return-Path: <linux-arm-msm+bounces-102206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMC8Ehwp1Wli1wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:56:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D13B1644
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E584630F053B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9790A3CE4BD;
	Tue,  7 Apr 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTOtE1Ak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1143CEB86;
	Tue,  7 Apr 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576826; cv=none; b=WVU+jHKWKGz0rftrHiv8doRH2/3D5jGRmhfg6VrYJMBRTs5+GwVnI5b/mmNhTAf30CRls8grXrqrGW8a1JT0so9jRSI+e/LceJbH34uuw2exTvSZLY1xYYKZGimRheGhMrSqnAz6wDqT6P//FL5GSe5ds0nkX73G0pKOc9Rabog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576826; c=relaxed/simple;
	bh=8ymOGtV7ZYio6bX7A1zy+b5IP5On8ZOjobHhJ+TuRqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZqIaJJuWhZxGajpN14Tyzf86Dcp5fCAXqlUgbbGr9mm8yjl4pcqXcQfyRnPjuTktCMtqXVwAi+swh9D3hRy8oCnkhISiPEirDHQxoL9aGixNc0ZRF80hESAzYIYO+2dz6A+BOt0Bco14nxS+cY/vNRLtPYYPRxJDmNNJuQtnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTOtE1Ak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFED8C4AF0F;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576824;
	bh=8ymOGtV7ZYio6bX7A1zy+b5IP5On8ZOjobHhJ+TuRqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uTOtE1AkWvvO2Vu5ysd1n7/PvWHVAwhSQCTVoLWgu7ygjCtKF58aLlfsG58b64inY
	 VhpGQ2GTzWVRNHUqN4R8vdOX6Vlg+X85PpkEaBSGTg/exQorRcTlo3JVKXu02xx5HM
	 K9D319G5+PiZb0YvW4ce2fT/FNh0Iw8amYj33mjc+0dj0LNH3SKJJXU3eVJbgV4aFD
	 KYRcwDwdv9dElHFH8L8py3K8Ux3Ga3W4OqPNmbQ9FiIjo2yz8D7IDmXRUwkvR5zqbi
	 7kNleM6XMvhS7/C4UUF5ruhitweeZtyW3/eC5TyOxiDaxQNSD+NgOvBdCYg2mqHqxZ
	 KeNLkAjA/TK/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F0AFF510D;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Tue, 07 Apr 2026 16:46:47 +0100
Subject: [PATCH v2 4/5] dt-bindings: arm: qcom: document QCS8550 RB5Gen2
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-rb5gen2-dts-v2-4-d0c7f447ee73@axon.com>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775576820; l=1053;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=X7bqqJqdT0hN1KiBNbd6ABCxR6gi8MIYVUn555bOoDI=;
 b=OeaN3zxK/rDeXYT2t8n1lD96/GlAUiqHzDiqozb5cmod8TSQdp+46BoAi5eK46CurRWzcTZ/r
 4ly8UMYqIPcAIIT/UyBKVjQFHom3lHRU5L22JcDGpSQmGsFgz6g3Rnw
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102206-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email,axon.com:replyto,axon.com:mid,qualcomm.com:email,thundercomm.com:url]
X-Rspamd-Queue-Id: AA2D13B1644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Document the Qualcomm RB5gen2 from Thundercomm based on the
QCS8550 chipset from Qualcomm.

[1] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1335a7bee397c46e8dc62806091531e32b7327d4..f9f8001e3e6b66e3a926255bdb15363f4c7c2b66 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1093,6 +1093,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - qcom,qcs8550-rb5gen2
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.34.1



