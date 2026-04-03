Return-Path: <linux-arm-msm+bounces-101693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHBFL/3wz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:55:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC7396AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 673573051627
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8898F3D1CA8;
	Fri,  3 Apr 2026 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zqcdEjHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3933CFF68
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234651; cv=none; b=d1uQ9XpsgdGs8JmhqFfV1f9a5i8Z0UrkRboeVXFG33j0F81EZpAEE8aCWOOAhdyLv1sWQYG+4euldsjhM+vo+c3mbnnqLIsdULGbbgx7od6ioWEwaITbhPtkCkXNnYBaOWjF7b4O3g5BbH4mogiPuCZqI6JCgSiB8PrNLGv5uaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234651; c=relaxed/simple;
	bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNnU63SJPaPnzcD+0VpR08ad2kTgBmZITsj41amGP9ptFh1pDADDwX0ZfHDmzBkkWyBCduBgK5WVLN4rL7OZ4nPUGoWzxD7hYloZrpi3t1GlTW+ev0JSHXUYccpmUQTimURKo3X9aAZLgkDOvsA6QySyi9YntvRyJqhCJKYhHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zqcdEjHa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so253867166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234647; x=1775839447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=zqcdEjHa9ePvncK9nBm3YpJMCC5jYwE6eAoc3miUGvEVknCKL+nwjw/1w/wiQwuFGB
         x/WcPzyzFxyryMhvTpJvT7mDLVep5NGaxbP7mcCnOIWHdBe5Jv2SAfv2nU0e4HVhWBpW
         mazepIQLnD8M134/ZF/p5JYxe+XKCkFkDvjlsXjGzuaECto2NVddXK+3vLJhTkmPuPAO
         6HJKyPt9KZeufIyJpBQyDAw/4Evd1665uDyDxXETS2Fny0hXMLP0V7HuEuCQyDIvvsz7
         Gkj6xrgK5eDU6KFCSZIw4MhcsFsptBU7+Te1bqcNTu93QPrl9OhSMpfET5Rih7GJQHTa
         bJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234647; x=1775839447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=nFXNrUdqeTx/9psML/BjTCnQ/ll5Ee3Kt8WYz05MnjRQsLHIweeuFPEW+yZXxObfie
         V9FwmK6GuDj9galWD6LIxsX2v3UmHyh1lM3pEVY0YSIqqrsiKm876OTbpbUU3eQ3ue1o
         lQhfoDq7hsuki13cFDQ97Gb9NbOa4sKzf29mZOfbDPB7QwCi+X9KOTB38xKWAzqKnJJT
         fjksa2Jkl2ZiPRDW6OhBnKxwHaD8fogEffIC0mgDUWLxzuonskz6MgLRL1wcEF+JTYZb
         MUGsnYf6gnS2/8Q3FO7Sam7CTmvZH8vl7dqLsMM3BcqEupFciOrIvcM3Jo1B6SyVVeP5
         xzRA==
X-Forwarded-Encrypted: i=1; AJvYcCWhL8CR289smFZ0g3Lfe0KqLoKAio36HBaPiuhf4nSJ1ZqYepgDhUqxcZNK+1PmqjqXZE8sCDtZ550+FwIh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/VghOhx6RN3isNfB5NwNjkDhWBiFFcunLdbIMqghmfQGBB1ud
	J0VBK5xF5z03dBrU0X27mFKfdwyttNfb3OeDv/TP/Pos0flMIxTrlZ/m86pmSh2k3LM=
X-Gm-Gg: AeBDievSn+zVa1ygyGkfKe2yLeCthAGA4W7TOpGAkCzDGSvZzoAXcHaX+tf86/HiqWk
	Ky/bavfz5ezkXamXTj8oyMa5EQguVZ3LaaO0dcwWYvCPYvo7YTwesojqM+dUbeR/XTgerylCn+1
	K39YeORRH0w7EKnQal0CSiSo351ccaJ/DfjnjmMI0uWtyioec0arCFFfU9bHEFjy5WIWWr7lhXZ
	97Zl/5GRcSz0NlhVTVCWVYg08rBp6qqjFcuQjiVzkx/DrUAygifoPE8wlmB1/A9D5iM4BPc1qcW
	6ie2yMjH88NLqCOveefNIs/AtrEELJcsGWod38uQik38ple2Z8WpnZQ+i5lruoDFPnhKki8DgPM
	3W8gcqakGgHG7VB7oVcDizAhmz23pBIHuO7/2EM0mlpcHl2uD/WYs7Q9iINtECnRICSm322nlIN
	L/ZK8GDhHcBnDP+YY3NpnI3cZLQxPyqLWRJyPW6IGLuj/3Jj0krnqfJCUmO7Qy7b7VT/7iCMnAr
	aTeL5W+o2o0lCkUdoWrgUQ9o5LOikE/9w3UKQ==
X-Received: by 2002:a17:907:6d05:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9c67b9e36cmr170984166b.46.1775234647458;
        Fri, 03 Apr 2026 09:44:07 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:52 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
 b=JH5s532eJLrbkYEhCO81ATxiNZvSlOjA4jvYKqWx9Im6HP9GJB+uMtLmI6LL+WUd9YApjuxUY
 XnsscnhBa1nCaN9g1z2pFNSWuIl/LnuTKTRL9nqvdqAlri9/er5aUaD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101693-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C9CC7396AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..31c6d6627619 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&ipa {
+	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

-- 
2.53.0


