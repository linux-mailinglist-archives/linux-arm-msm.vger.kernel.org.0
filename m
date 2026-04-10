Return-Path: <linux-arm-msm+bounces-102599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA/bCHip2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1963D373D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 831473025A4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDD03A4F24;
	Fri, 10 Apr 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lTaVXfNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C73A1692
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806824; cv=none; b=iHSK4/pglSP0+evFfk/i93L+2ijEu7Z6hxZHasx8h/AiG7iDBm8i/3H015atP00Ax+ER8xnxo9ntdnDs+8amkAnujRJufFRtrd6mN0jvM9iR7IqjKQDGhdb4xV7u+6wJ8r+OU9J4uqTCQtkkYWP8mwnhtdly7XJN2QOo8GHyiMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806824; c=relaxed/simple;
	bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1ro562ocdLLQ1Pi8gg7pzln2og52y67GnCUtzO6eHUGvNp6HphkHpLmTdFWxCI3mVLPt5RW0Ba3XGkzs0mQyO6erNdnMbzBm+Jr7y1ebFsGuIknUh2YIuGm4gRCwbxNQ3SJ1/RiQP30kOoVmHLZXtcvLgbhgCuQ1VnxwWSeye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lTaVXfNi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66fb5f2183fso3056790a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806822; x=1776411622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=lTaVXfNi43hwgps480WK0yRwWJJa9uKJW8qzbEyMQBm/ZGGyQfMEyvT7sAzCi0ZLPu
         wGyUy/REAvPwnlCCkd7qPIpuBXxerkbbKbxwBW+3GZTSPFfuND5cR0RbeFVSArNLzitu
         /14Dr0RebizlLtrwNVlsn1zjbJG6yyNtave+e6Jo4IzwBgewYDsEvTFclVcRsRiRVD4T
         +3zFByWV+J6sFKE8deMZ9mcUnvoF8aFuG9Jqs61sVNXACFzTdaC3QZjYeudK1p1M903I
         ma0zCE31MeRKzzx24S/FKcWrFlxiSX39IWE6A9vIwrtneO3aFJFF7TxNUgAI0jL9vaKH
         3+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806822; x=1776411622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=gloLvv308yLV8mcv8EfQxc4Ffvlr/xy12KN3PylOIxUHhuYU1Niz7xTIeLZrJ1VOls
         wX2u2aXCi1cimQImsgGGTJcDTYdnJAv2w2Y3avKiSObCy8l40aHl7UXtczW7mQ5rxKrb
         LkmCKG8uKTEiykt36+0/91XAWpZY65dHWW5nv7TMi1NIqfA0x4oa2BUeBANLLXkVkfBy
         PmpFEnYtiNdYdsrDiTSZw//Op21Z/dNTP+N+dwRN5jHroNYImh35xN+GZor6cjslepVU
         VEfJ9uS8KkwtAjpZoB/Ur7g66XeL0xZj3kUVpGqqrFKFQZbYf3s4f1HIZ7i30u02ZWbV
         5kkw==
X-Forwarded-Encrypted: i=1; AJvYcCVqia56cJ5F+iRKcAyICxwVogzoENpkLEhuOOUwaoG6ntJTof7qo1LEaq/0a/4LlQnDzP9yXhuwpvNQ2G7B@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuVUsPgwnOdxY5+LzNjmRpHSFb9Bg1YefDmcycS0CuAMZUPsn
	RFw9PKRp6R689zk12htLfWeCzQ0oVXmSKhu8ssXvGaSJ6xwRkYwIh9bznYzuKzNiyLk=
X-Gm-Gg: AeBDievZzSqJq2rNhPAGEDC/EcTxdftItNMEZFxghbePsqKJ8gMHwD5qyLgxxl0dj0t
	0eLAFcwLwY7TZG2BzOF3BJjyPvbfBLaJFmd8loQoTeC2HrVUCDDCO5EckwHA2jKULhiG5lmVtVH
	626cQDG5KNmdMsg/Rm5meMF46o9OgPUgfhOkP8OYtuOo4T8nBX4DM+3bRichMl/R9DV7Zj1blFL
	CRp5cE379OjW3HismsRSQeuP+TRLbW9PVQ1ehz8vuuyIVXVqjJ2xxL9ZFSS6Rra6+vqq2YJMX8F
	vqptoyMiQQWhGwlJzYVtyjR7661L3jM1hJVh6ux+/joctHj35w3mIp01WJro3du6unCGB27tM6O
	JPsQr6d2CcgxpZcHgvjuYJcuz58SyhnXEQWyJzLnKxuT5q9C8c5H2nmvh9cSF9Hn9iqGMi3cwhH
	IyrLmI78HV57WUrzV/3X7n4vFFKnDNsqrRJV6INcsY8CbL4Qr+/SJvhNnuMPEC17hip0CChUNWB
	FsHZ6NjmRsaZDVk
X-Received: by 2002:a05:6402:2486:b0:66f:9480:c1e6 with SMTP id 4fb4d7f45d1cf-6707b1066d4mr850626a12.26.1775806821580;
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:40:07 +0200
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qcom,ipa: add Milos
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-ipa-v5-2-v2-1-778422a05060@fairphone.com>
References: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
In-Reply-To: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
 b=aZP3u9u4aF/aWtgstnRFKd1QY1+rp53fkEgNZq0mSVHNE8yfSTsbH43s+yGXWMRCEHxhU8h6g
 iVCA+OBQwlRDn2JtYK5XKW3+D1YJw+fF7dxECHyHVhmNzIeL192zbYY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102599-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8D1963D373D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Milos SoC, which uses IPA v5.2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e4bb627e1757..fdeaa81b9645 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,milos-ipa
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa

-- 
2.53.0


