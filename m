Return-Path: <linux-arm-msm+bounces-92843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKoQMkozkGnbWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9513B678
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47CF730182AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 08:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2985280CE0;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmk/GVq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C62940D;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057986; cv=none; b=nlLDneRGiFKhGsvNaY5/iCTN/EHyG8hGgeUf2P2VyBlL8L7af6fukXP7zYfPvJE2HU2FapVMJ7eUUN4MnyrXVRlTzh/wvDz3VnCeMLlvduiZKRFwmc/NFhR4MwRgUMT9BWoUhcEtRrbpl6EG7HqKINaJeBO7XVoYEhOz0lF2IGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057986; c=relaxed/simple;
	bh=VFE2y5wjuFHFi0D+jRiMkhsTz6cKliPQL/bS+Fws7CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9w6BtmmZ5kKimF9VsYeFgmQOAl4WmJvDPHNIJCKk2z9Wp5MhrEhak0J4D5TbuGTq6awiOCDPjpVM9pZBbq9G7g5LtMLSihUqHc3UzxVIwv8njw40KLIsySv0n8A72uyzNmHh54aUWCJ7OiwiPGHXYQpOLSagL8XldgTTXLRfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmk/GVq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43890C19423;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057986;
	bh=VFE2y5wjuFHFi0D+jRiMkhsTz6cKliPQL/bS+Fws7CM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jmk/GVq2XjGTPgfENIHzIfGEyZALZ7qIKsVjMuaaA1wUgDxHuPE6LWgaLwQwT2n6P
	 apCvpOrED/FvPGHgqoBDQlhC4XA0K16X97AXJVxy9oQDy5QARCPm20HSHuN5faY3xc
	 e8uJgfAOf0idlnf72cUPvU/WUEIFcj6jzTm+By6oCj7xwYW42Y3wQouwLtnioukAfs
	 jwvgRPHTdv+YdP8Vel9RJBnsdLZky3qvOoJCgdqAxI/pWpn5CmAlFT/1K7E8BaaduX
	 Ltmg9FzDj0mXDR2TEjcut2pgQgS0LEdDthDy2KuqFmxLDqbMljp0/E2JGzgPMUUA3k
	 UL8u1elaqKdBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D43BEDF142;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 14 Feb 2026 09:32:53 +0100
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100
 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-b4-vivobook-v3-1-3c88065bbf77@oldschoolsolutions.biz>
References: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
In-Reply-To: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771057984; l=1042;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Ob76MMVVgaNIRiTmQ4oMoqiJcv8/sZb/spbBVJA3R+s=;
 b=W+x2wkWBb8Z7jDGkMUd7S03dTgzDSVYeqUowV8TPF7CPaU+u3nRG1r7n0MBHrKoNUW/l5ZdfE
 D1QlkzJDNgFBD1WDRReiX9esJt2e1GNfBZMnvYK01f2akxmkcui/eth
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92843-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Queue-Id: 46C9513B678
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
Add the Purwa-based variant:

asus,vivobook-s15-x1p4 compatible to Purwa SoC

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc42f1a90f76a020753ae4daec8c5ea..8ca0b96c5221dff40be88b0d820671a8614da0b3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1131,6 +1131,7 @@ properties:
 
       - items:
           - enum:
+              - asus,vivobook-s15-x1p4
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd

-- 
2.51.0



