Return-Path: <linux-arm-msm+bounces-101691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFx4JUnwz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:52:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D72396A01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891DB30D097D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9283D0914;
	Fri,  3 Apr 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gY1kgvcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CB3CD8CF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234650; cv=none; b=lKjDjp2Ropl6IK0eInR2TvNxQRBU43kjA3Xzk3Cl0i1FN6QKUjSOA0Fne5prBZW/4Mf4KJKMszgsWyy9nelxXiGBg6GlQJCM6Yqjel330VqtaDTpeBjjjfEWNcCUbIOrNXE6MWWysDUgQJ6qNljwf3A/BaO0DXiNG9280fdj46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234650; c=relaxed/simple;
	bh=WcFI7fW0Pcq6jNkDjMXMqVuX9O3i+aJIuxhJa7yzRNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vtm7iydAosgrxR5C1Kc+MlAUYSeAba3QhdgQ8qqlgUgNyWJR89eumcP2QMI2gS6Jq1wv6y4tbiRmOYfj1SWVE57KhtCXOXoopYMXYAMfBBwTLHnxZBFgTqYsicypkLH9Ny7CiLgg0xGI4/iDbXd42Jd9q9u9bmbKs0yhL7ShtAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gY1kgvcM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so134082366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234647; x=1775839447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj/bpUOlSRd6rW4jWC3OLwCcjT6pqLJzLSn9zcAFMO8=;
        b=gY1kgvcMOmkjIc+Sw56go0y7rwhudlay7EtDsrFhy+H4qFXlGHr0WBggzLyVvDuvr1
         gz1AdL58/NRuLeilGLT+OTCvHsa59f3SQfG3xCdo71aLdVgvTcezuJMF44l6bHDfxgPm
         yy4yfUXxThIBLSmz79bKlqDAwN7YSg9k2n495eEyp2Y7W6hUO09M5kabfkc2B67OWEjh
         ND1m1gwgHbr8ecQkmVG9TzJdl+nzyYWw06MOaT1EAzyuuMcF//aAZxK0BSPSOYiXRYnF
         jQQ7y/HIJYB3SNBBL/qzPFvYk66cB2PHfTetbCcojZjOxgpSpbn9rJP+s6kZJt85Eo8H
         ISRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234647; x=1775839447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aj/bpUOlSRd6rW4jWC3OLwCcjT6pqLJzLSn9zcAFMO8=;
        b=nepQ0ragyv0V0c1UbNCfS9BgbPaNWmPEdPYdzAbYM1xD0ldh+T3Mnf6rP6e1FxzE0d
         MLvbETxJZ+r32rYfMCjAZL32+BR0erkwqT1RTv0Ll0AJ5Yp+WYOm0aY09mBxbtetT1cN
         PKilUz6JzO3kXJFK18bsCV1TrRvC8lm+pWwPh5der1lSeJn2qoXd0cfrdRsuBmO4Ejsc
         ro1qgvQu+yhqR42i34x94568RW1cuRSwsTzBomjy/Mhh/B8hzoQ29RpsHv86Wx96Inp0
         YTphnOrhJu+VtelwKYpqcZXYVcquB5whdIONjbX+O2qpAStdTUkhPyEh6PUf4A4V1KRZ
         pKMg==
X-Forwarded-Encrypted: i=1; AJvYcCUwtBH9cV5BcW2aOzfQfwodpQMKuxjT0NjwLE/QtdvX1pQ3cSjGmjOE8JkaHqTI6VprmqdbdOYCl3p/orkp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4GOrJ5uIIngKujS4Cg474TV928orvNyODg2lTVue9MowIPrT
	Tz1/zKSxJsBE2GPHMQa6oVxUb+xmY2fe2E9tGn36EHlQUEMcuCMlj697L8qEbdGbrkQ=
X-Gm-Gg: AeBDieut9ACLbAKnW2lnsq+pE/GdF4BnCdmVQv9tNelhT8KWbfeSSBqVIfWp8wb0mP/
	qtRTYsdnKM26HuQYQcn5B72elGHAMlU6wjc2JVclA1PFttB7AJU7AE/18juP42V5y8NbR0iR8BB
	7McwBkfHa/8BxWRE4gthf8QOA9Lf/sbHPVLDe5u6lA9fatSlvNw06i0w1hLyUlaEUk89tszBpya
	+ENuMWS6mNPAeq7rrjCZGgsRh7ELR3V6UO3qz/dQwUgoexp/ia+8pQ6YEu7jm7vzaJa1trgiEQj
	gmlsNFj1mwz+MEFX5AgUBB2++Vndos5XkgfUTB57ZWSzYHV+lY6+glLVQ3IzGGTImRaGDnhYehd
	x12UD9RqLUbF7Z1ep8Nz+CfpOdGROtv3Y5JfJu4X+8C3DKav5/TbkdSO1O8XyTJvCP5aRkJoLPB
	odjbkfk8fm4Kw4+i9fD26LkrivHxUvcOS5IbqCekfeSRMQQWUVBE80JNPEpJtSlf79Qe48zzxX6
	brmf9F0N6b7HPm7RXEQ/xZMjP4cCYHjxbq6he/DBAyZmK56
X-Received: by 2002:a17:906:9fd0:b0:b9c:24a7:510c with SMTP id a640c23a62f3a-b9c67447fcemr195777866b.1.1775234646571;
        Fri, 03 Apr 2026 09:44:06 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:51 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1967;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WcFI7fW0Pcq6jNkDjMXMqVuX9O3i+aJIuxhJa7yzRNQ=;
 b=mMufU+3O/8xMvtjbv05vIQqfZ/0FU/w1WUouJKeI15nIlvTAkcK37zXpUG09vOiAwkgrSzdL6
 0+ESErF2sMFCRg9IUwwswYdTCnwqqBAq2SLjj+ipyh4TsFUiADE8K88
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101691-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.62.65.128:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3f40000:email,3da0000:email]
X-Rspamd-Queue-Id: E1D72396A01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the description of the IPA block in the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 1c045743ef77..c388dacf47d5 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1599,6 +1599,50 @@ adreno_smmu: iommu@3da0000 {
 			dma-coherent;
 		};
 
+		ipa: ipa@3f40000 {
+			compatible = "qcom,milos-ipa";
+
+			reg = <0x0 0x03f40000 0x0 0x10000>,
+			      <0x0 0x03f50000 0x0 0x5000>,
+			      <0x0 0x03e04000 0x0 0xfc000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "memory",
+					     "config";
+
+			iommus = <&apps_smmu 0x4a0 0x0>,
+				 <&apps_smmu 0x4a2 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_ipa_out 0>,
+					   <&smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,milos-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

-- 
2.53.0


