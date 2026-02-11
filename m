Return-Path: <linux-arm-msm+bounces-92621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLP8F7bojGnquwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6239127738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC4D303C29D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0177334D4CB;
	Wed, 11 Feb 2026 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5b1m4ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D4280CC1;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770842284; cv=none; b=NGDBdjiTGGIJGxdhd1YhY3dHtA0JkMfrlVG+SxoSYC0xNtStCqIopK5+CrWrqX5ggzCkK5yAV7ljQXL1ikMS4VR3iBQO09K7n25JBOPqt5gjLdPym9ZmZ75wh3PJUd1o8FPbjGkoT4YbGtvKJPeEaxH/ZbZnYBOSCX8LLJhqEKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770842284; c=relaxed/simple;
	bh=rap1EndKToaKcqnmx7VI4aUDFNWzatQAsp0KTkJwJfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0QC517mkYNzXvImhAZV+NGe+LOwEV6bwoaFz+phyaI6xLh2xiyHC6hzmukGtGwKc1GObVo5LBvY4D2ejdtt7TkYjwbFlj8ov0zZzTCQDjhzcgVpTuwBhhE/HTqKoOrZldOI0Z2tahqYEHtJHvf57rcdAHMSZRg1VHfxonNrz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5b1m4ez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60544C19425;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770842284;
	bh=rap1EndKToaKcqnmx7VI4aUDFNWzatQAsp0KTkJwJfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O5b1m4ezre4UV3qyfQnHnfhD6AZ5n8/Vs3ybujBcdpissAOxhsQnRpTA92wc/WcqE
	 hPOnd46UAa4PAp9BzIWcfpckwi8UO1vw0odjkVFjctc+3ylw0VmVl2K90j1McmVrx2
	 AgbHJghHX5AeNCpe9HoyeJmf4d+/6zmxWCIEsobJkZIbUVOpSLQAReVduPldpDzw+X
	 4byJJ9Grrd/Tl81Bl0DEFWZHrfsaazccTp3S0OSYnsd+GjMfj2Kkv//E8AEN7EvABQ
	 QeZwpQ5qDlddXtqZt8EiJS1zlYmezW5KCZQw3YUcG20JS9q938/w6uGI2xU2FHQvJl
	 HN3s6lPbE/MxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C94BECD6E9;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 11 Feb 2026 21:37:50 +0100
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100
 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-b4-vivobook-v2-1-9f500415d2ed@oldschoolsolutions.biz>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
In-Reply-To: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770842282; l=1020;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=PIiPkqq6VcHG3ksDSsOKNpwFjbQlxSUzu0Mnzw3gWck=;
 b=Z8ZyLz2cUOpwlEZo6psPovsQy9dY6p1M1nRjossm85l0V3zL+L7Sd3I2u7Eu5yVip9r+yE8bh
 8h0UA9n2DFKDsC9JA9RiGsC+gA4VMIpv9LrA+bGvR6Uf3WzOHoL7eBs
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92621-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto,li-nk.org:email,asus.com:url]
X-Rspamd-Queue-Id: B6239127738
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
Add the Purwa-based variant:

asus,vivobook-s15-x1p4 compatible to Purwa SoC

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Tested-by: Colin K. Williams <colin@li-nk.org>
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



