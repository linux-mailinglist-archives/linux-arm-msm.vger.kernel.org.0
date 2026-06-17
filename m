Return-Path: <linux-arm-msm+bounces-113491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v4jLLtsjMmr/vQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F86966C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:34:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=FKHvKp0Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9886F300CB2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0603128BE;
	Wed, 17 Jun 2026 04:34:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F391AAE28;
	Wed, 17 Jun 2026 04:34:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670873; cv=none; b=BDPbFoIbZKIM9+UPt6hB3KYX1TISMGo8G5k8lMdjiNxLWx+FAxzeNi7/xKXM1/vQ4ZpAbbYFZCDMs0UTVQKw9RBH9q/Am+30U2tntV9WNeAZxb/2wW51jJRT5hwn5jsCgyEpiBo1wCll0BmkXwhN8smV6xBPNskk6wJythf0XiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670873; c=relaxed/simple;
	bh=he2cJBBB7awj2DWdAOcbOCB54bWPkkIoNu372dVit/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QeRlATRB7N9TQHrOwY2paqVuV4xqkk/Hpv5dzcgqpVHU+PtTnpSKq+/tu9+ix4s+LCH2RcwhIJNV1uySzj6fzoOpvigcJoqPmO/Z3YMZMx0Tjj9aG1ugtzOlYI4FwR+hTNIoHkCx4c2SHWsAgn5nxuJhK/8Zlo95kt9Wz35YiFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKHvKp0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFCE6C2BCB0;
	Wed, 17 Jun 2026 04:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781670872;
	bh=he2cJBBB7awj2DWdAOcbOCB54bWPkkIoNu372dVit/0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FKHvKp0QGCo0D7Tu6+u8mbduWgCbx0IS/mM3EL0P+WbdiB7ePmN4fi/+dWJJ/w1Gp
	 4Ykpo1DUj/q4dlkLDd1jtq7fbFkpfv1r9Pe9Qjh+xZAICcLytMLR8B6gIFFDrgLooJ
	 hSgizQXcojtGVGeaZYmdsCPJdStzR4795/+y0ebq4YmXefx61///4d/uQrEu2UYslz
	 m03PEkW5miRwDqs0zRvjh0Na8xBOVIO2AaL/pEFD1fXppCWWxIygcW+EdkjdRfJFIO
	 ES+ULyfqIY+cBay7pZiLUbcNKgI7g4Me97wiFcaQgnGldR9b2rwR5vXlOL3LhBNZwh
	 XIxyCCPAo0DWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06D8CD98E1;
	Wed, 17 Jun 2026 04:34:32 +0000 (UTC)
From: Haritha S K via B4 Relay <devnull+haritha.k.oss.qualcomm.com@kernel.org>
Date: Wed, 17 Jun 2026 10:04:24 +0530
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document the maili
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-b4-maili-upstream-3-v1-1-1b8cb7e425d8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM8jMmoC/yXMTQqEMAxA4atI1hOwOhQ7V5FZpE7UyPhDoyKId
 7fq8lu8t4NyEFb4JDsEXkVlHCLMK4GqpaFhlF80ZGlmU2ss+jf2JH/BZdI5MPWYozeuIKLCWVd
 DLKfAtWz3tfw+1sV3XM3XCo7jBEFi7Md3AAAA
X-Change-ID: 20260616-b4-maili-upstream-3-b198aaa8969f
To: Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com, 
 Haritha S K <haritha.k@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781670871; l=998;
 i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id;
 bh=QERCdXGosQegGLSoxEuG9NnIUKptP7q6k2ZKHvSRHas=;
 b=WAotvr0uQcjTXhUxvjBHdPDShW9EAAwzrDzxorB7YjD+4SbubRzRH12mhY67qkUAsKJrpgBOH
 yveHkcYVqh7BLc2W1oKlUfxaVrBbi/gxPisO0eOnLjmdAx71izFrH6F
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519;
 pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
X-Endpoint-Received: by B4 Relay for haritha.k@oss.qualcomm.com/20260422
 with auth_id=745
X-Original-From: Haritha S K <haritha.k@oss.qualcomm.com>
Reply-To: haritha.k@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113491-lists,linux-arm-msm=lfdr.de,haritha.k.oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:haritha.k@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[haritha.k@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D8F86966C7

From: Haritha S K <haritha.k@oss.qualcomm.com>

Document the Temperature Sensor (TSENS) on the Qualcomm maili SoC.

Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0efaa8349ee..5a8f7673e730 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
+              - qcom,maili-tsens
               - qcom,milos-tsens
               - qcom,nord-tsens
               - qcom,msm8953-tsens

---
base-commit: a76326dca329a7a738ba367529868dfbafb4a403
change-id: 20260616-b4-maili-upstream-3-b198aaa8969f

Best regards,
--  
Haritha S K <haritha.k@oss.qualcomm.com>



