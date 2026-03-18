Return-Path: <linux-arm-msm+bounces-98347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOfwGOJlumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:44:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FF2B84E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C88323034296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6183338236D;
	Wed, 18 Mar 2026 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b="kJFcEgLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C321B918;
	Wed, 18 Mar 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823131; cv=none; b=tdXQKgCmbmIrtdl5zxHgchx2fOtNhcmA2uGLiiqPt+3aCuYS62rJULfjU7CZTqVisqacfKcHvqX4z6ItsKqMohzBhAg6qgAtSE+8VJ0hBmVuKbKJpHtaN/K/EpVOxYLs09kG5M3MlnLVvRHRZE9J8TxboPU5o1oCDYjFR+fbvU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823131; c=relaxed/simple;
	bh=Tul8i66V9Ox8kqaavmP4X0LXSUE8QW6mGiDdQLOB3m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTcslk2zYgo1OGtVpLaO/FW3yxgOPFRpSnhwa8pY3+V28Xi7KYvRT6EGaTcC/Lz4c5rLVp38NRI7TVcnByt1fzxaA3vbJiDRGnpMLu4BgbUSY3otlqHOBLS1Cmd7sN5o5IQrRI8oIPgUyX0QNq16Ta4I4Jrx+k5MHR+jn8JfvcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de; spf=pass smtp.mailfrom=mecomediagroup.de; dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b=kJFcEgLz; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecomediagroup.de
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fbMdp2nCdz8ypn;
	Wed, 18 Mar 2026 09:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mecomediagroup.de;
	s=key2; t=1773823054;
	bh=Tul8i66V9Ox8kqaavmP4X0LXSUE8QW6mGiDdQLOB3m8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kJFcEgLzQ+Q9IvzDIYBJYLUpczNM4Z9dfOm/JHA1HyjT2gKGIGw6FGU8P4khMkGm0
	 2L/dPZQcIBpmw88XwqxZ3f2i/U8qt/rGNY2gqeQjzE/bwBaNZ6WbkJJagTNDPs2kbn
	 3IqEuarh7OQksE+yTH3FRnWPkSBAsbsjtGVlPWAdu5mHI0eaSlrcnqRcoeo+x3/RPW
	 Gyeq6CsbiJ/6UYFwQ6q3JDyAMKr3EnVHmzUJNPUtB98npm+1FkF2YXYH1TJk+a31UN
	 PjNQ31X42wphZWGEXW4fS2ttbqevvLAw0+EHQG8iv7BwJ6OzToyThwccf+ggmVfhoM
	 bmbYtoeEQFnVA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fbMdJ04Mkz7vFY;
	Wed, 18 Mar 2026 09:37:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe95c.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fbMdH37kxz8tYX;
	Wed, 18 Mar 2026 09:37:07 +0100 (CET)
Received: from debian.fritz.box (ip-178-203-082-069.um48.pools.vodafone-ip.de [178.203.82.69])
	by mxe95c.netcup.net (Postfix) with ESMTPSA id 4F37E801CA;
	Wed, 18 Mar 2026 09:37:06 +0100 (CET)
Authentication-Results: mxe95c;
	spf=pass (sender IP is 178.203.82.69) smtp.mailfrom=mecid@mecomediagroup.de smtp.helo=debian.fritz.box
Received-SPF: pass (mxe95c: connection is authenticated)
From: Mecid Urganci <mecid@mecomediagroup.de>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Mecid Urganci <mecid@mecomediagroup.de>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add qcs9075-radxa-airbox-q900
Date: Wed, 18 Mar 2026 09:36:20 +0100
Message-ID: <20260318083621.470826-2-mecid@mecomediagroup.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318083621.470826-1-mecid@mecomediagroup.de>
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177382302702.1405000.12757176945499536815@mxe95c.netcup.net>
X-NC-CID: mO6rgpQkQxrWdgUm1gl+Y+1xwpEIeC9yFEcCt59w/E62xlHomu8Q
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mecomediagroup.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mecomediagroup.de:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,mecomediagroup.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98347-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mecid@mecomediagroup.de,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mecomediagroup.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mecomediagroup.de:dkim,mecomediagroup.de:email,mecomediagroup.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 034FF2B84E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding for the Radxa AirBox Q900 board based on
the Qualcomm QCS9075 SoC.

Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8c3df8efaa4d..2c492f4d784a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -909,6 +909,12 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - radxa,airbox-q900
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,lemans-evk
-- 
2.47.3


