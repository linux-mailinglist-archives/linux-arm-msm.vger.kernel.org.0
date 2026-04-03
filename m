Return-Path: <linux-arm-msm+bounces-101646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG8wG17Hz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:57:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CA394C78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5AC303D312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97584372B39;
	Fri,  3 Apr 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pitMKBff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174E30EF8F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224521; cv=none; b=WJ0Tjfa4zUN9OXE50Y6udpifatgTlwembewwihoU9y4O9I2z1vyusrFlIr391Vbe90uJ0/2sMiZ4ZqMfwIU8IKkOC29kmCDCNtAzE8QTdrcytafDvuLrD41Tbw7k+Ff3WHOu6WPMTG1819VgaJYmAYhIdhfpcWcQNh4EiP57Zog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224521; c=relaxed/simple;
	bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AabjlkpDG7UZSrvJbk66Ct9j5Ggd+Zk3jRwqtj3WSVT+N8yoIkaz46HhbS4rC6neF5m2XKefb0KZxpp49eZt22PSRQCIWmx1Ommp2AyFgYIZBbkJm38d7sz3veLfNYboeUHryvvoNnivLwuyRhwc0qgtjpE3GDeUG+i6tAxTM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pitMKBff; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so281723866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224514; x=1775829314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=pitMKBffVYy8pS3eVc2jLbEX/YabbXEkPdmH3+7Bh0wvmHVH5Lx5UqB0JyiLfRV5Xx
         gyb4BVZJlPZ42jWX1Cg7AlUIMGub913rXtCxWz6CwzAJ0NYuDKH3zxo76LIz1aBxqD/8
         r+FJswYi/uKfh7LO+qGKIS/mCccQ0OQWapV678f/NPyiBwjhfpSilCaBOf15iVDIK7tH
         d8UTXctvWm21Z9uVUDxUFIm3NsQuXfrd2OCOge4EiC6JsHDOPizkPJ9I74LvvWZPilQ4
         G6N6PfN5NL+E/YSry+SEI3N/NiRkholMSOzxdYHv7MkciFpqH7VZC6+DJWGtoSr1YdyP
         JIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224514; x=1775829314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=TYwy9pEJd7anVEsGORPHqKepWap3hfnibTxeQvrdZ3LOzACFalPyriKi/y96AdBaDY
         M/p7o8gC9UxUVaM15D03tEDpALrH49vAAmd8clgyR2p/jsfBpSe7HGyp3gl9+VJze2wf
         agogBzeeLqDzOqDoS3RRHHqZv6X4PkCPLc9rzluS2JMLNN2yJccBAM5puYjWzpAcVUpR
         w3yVBEWMbN30C+qO8GbzUspFpNshfJYRAw3PGX9wq3TzFH9/qcitQBCkDosVaomT8QS9
         FgkcJ878b8421dVpCMlJgVRqZZKJjL43dYSy1oBL9iGeFyn56lvjEAStiZH0lJA+s7lW
         L8nA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0vM87/nFNLfm6saOkibVWcsHjDxO22aHeKN8UW2X+/l3MnHQxh9WIHRt9NCPomY8GsBJbq55p+uSyfJl@vger.kernel.org
X-Gm-Message-State: AOJu0YwvI3TvBFkNTTLYfBudmeJyTOinuyQyBeSlaQz8FHn0wn2nYvTx
	WWdwZgwfjOmei9zMQxXhXiydtzR6WZqonm1LCxi9J6Ts96vK0QEGLDMsICeAHUuBHSk=
X-Gm-Gg: AeBDiev0BqDGEcUT8RGuox74g7sZIerOP+lPhh00EWBAJ5zYnSWvARVFh57E2pcXQfk
	pZmLcGCxZnO0RGwM5WBPXgqvFe54d8jIcjUmF2LybTj3IZMK2YnVp+gZh6iKQ80CneTBSZLlEgb
	sBu1x7OFnLKQqzgDIAokj6vGfKHqDQ8kHfPCiMtRPnXSv2j9siWRFTe5bRZmhaiWyhDeNhXyxMh
	+eiRtJwMIV2JnGic0jOPG4PNXJOfQ48Qnl2cLwpYyMCijjC0AiGTbVRidQgb4M9qQNIBKl34nkS
	bzaVQuhK1VKqEMaNfjNoltonhSOOeI5NtjAwDYf0Wwfy5md01y0omIZ5HVx+RzrH61dbj1HASzN
	aDNORj+tibdHZPhsIuzlQgnGDI9qwio8iWGUy9Qu15YxcW+zqef1luKFB2Q1nK2xpTz90b/OpmY
	Ru4gZ7HT61Yo7hxbLlS4aOBVk7LSDH0bC3IdrQrWSop9pFnyuWsnqhtE1B14xFXgSUsTzTCwd8F
	q3leM+lWbdSy3WpfQJlFd5VtsHNEXLJ+5biEg==
X-Received: by 2002:a17:907:d08f:b0:b9c:10c4:e708 with SMTP id a640c23a62f3a-b9c67a34a9dmr143022066b.42.1775224514386;
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:47 +0200
Subject: [PATCH v2 1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document
 WCN6755 PMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1270;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
 b=lmSluzrxl2IvHohqbLRwM8ZeK0TA0Y4HsWh+y4B3jOfVOirTRYkehiK7ceZ42CboR9e5Ts5BN
 rMEWV8MPDVyDP+/ux64qnG2NCnxwOhrrXEqE51f24EPFDrswFgQmVZA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101646-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 061CA394C78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the WCN6755 PMU using a fallback to WCN6750 since the two chips
seem to be completely pin and software compatible. In fact the original
downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 47c425c9fff1..105174df7df2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,11 +16,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qca6390-pmu
-      - qcom,wcn6750-pmu
-      - qcom,wcn6855-pmu
-      - qcom,wcn7850-pmu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-pmu
+          - const: qcom,wcn6750-pmu
+
+      - enum:
+          - qcom,qca6390-pmu
+          - qcom,wcn6750-pmu
+          - qcom,wcn6855-pmu
+          - qcom,wcn7850-pmu
 
   vdd-supply:
     description: VDD supply regulator handle

-- 
2.53.0


