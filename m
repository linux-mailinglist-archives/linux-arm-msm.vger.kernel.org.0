Return-Path: <linux-arm-msm+bounces-92167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TEKyJWH/iGmz0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A119B10A35F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C96563001FBA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4F134CFD7;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqclzUoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781034AAF6;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585947; cv=none; b=V5LmVwu3eqzN32ePld0lvPUC/QPueTVgPze9AQeIdW0PLFjwL97+5vCI8xmqe+7FKrB1D72REwMn85U9NlcABRd87Ezoe7t8afsIiu+LL+mgitR0aYMpTKZPVc9sSKIad2XQU9rOGfNnuIpsNLjcNal6bb9LG3aolxcYzg2K0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585947; c=relaxed/simple;
	bh=dZs5JcM9PR2XSuawNt8WEAmuyyB1Df430ZFoJ6jAaes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJ+qmH2GA9JZaMkYUaH0hF1cNzOw0AyZgYrRtEXdd9SgB86tLRaikf85PwJ2vdsmTMYEPsPX9oYJ5NskVcZvdqe7EIDf5ZIl5w7T+znABbLlj6zXQ0bYPqqdVBeHwgP/B8jEDd3XUCSNZ8np1HQ8KWsfvGmre6YM1iat9UrLTc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqclzUoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ABA9C19424;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585947;
	bh=dZs5JcM9PR2XSuawNt8WEAmuyyB1Df430ZFoJ6jAaes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MqclzUoo8JDBUXO/yT0D4e4p1oEYncKkcd2JBXYq0QAMLUKwEHIohXvNPTeSzh5yw
	 /WS7Ldeau8CR2HFvIbcJbH812gzJ2UqkA6fFCZSZy9Kwz56obFxMEvCsRmgERikOhR
	 HGgRRm8yBRz2Gzl8+EJ0qa2/ctbUuflSOwHMjts70wecKupgdpNmMTYqKZwRaCC7E5
	 fONW8eUiRf8150cOLVh5fjJWH/h+Gk7/NAt+qagnnpIzSMz9aHKlVf+sdTRKSGAod4
	 BH9TEKWnFf+J+8+sabbGUPiXjEhLlm1tWMplOm50IFRhY2eZ47BV8/U7jDWvnAMISe
	 +I7J2rHmTVJTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A2CEF06E2;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 08 Feb 2026 22:25:38 +0100
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100
 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-b4-vivobook-v1-1-3a9b5e153909@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585945; l=1004;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=IBPKARxFia+6xnXTVvSKWy8Y0My2kh4kelOmQulvrgA=;
 b=O4QTAkI8VT1e9qSgk6yo+NuHGUmWb/iVwqJ1RTG1W4V1X3U4mHJJwFT7kvByhkCsTirTvtmeW
 hTlRAcNHkReDKl+Y/bDRSV/OA9nHXDMhbD0QhYNPT+BMnlfX2G0mw0C
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-92167-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz]
X-Rspamd-Queue-Id: A119B10A35F
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
Add the Purwa-based variant:

asus,vivobook-s15-x1p4 compatible to Purwa SoC

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc42f1a90f76a020753ae4daec8c5ea..5eaeda2c85bdc189d650bba82f173810854f5d1e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1124,6 +1124,7 @@ properties:
 
       - items:
           - enum:
+              - asus,vivobook-s15-x1p4
               - asus,zenbook-a14-ux3407qa-lcd
               - asus,zenbook-a14-ux3407qa-oled
           - const: asus,zenbook-a14-ux3407qa

-- 
2.51.0



