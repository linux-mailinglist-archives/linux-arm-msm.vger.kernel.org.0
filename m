Return-Path: <linux-arm-msm+bounces-107487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNkDEXbsBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:26:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988A53AF99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE6EF3021D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66AC3B5F59;
	Wed, 13 May 2026 21:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+ci/loL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8D3B635B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707557; cv=none; b=ETOoGbAZjLWl+vnSBPwXM8ejjFwh45OevEikyD9fLUTop1tEB/NRlxMyy/ibDE0oJbeSN4I4LnxujZNFqkFAUMkgz01QSCe/VrtZak24/QmaSlfFj/VqMB6OjE0IbZbo5gBkfjxsyNhXQUkp7yDJ9UZMkwgbgjsmDRBPUnln81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707557; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFRVSmqbiwp1fxnH11lg2eVK465mRx+I4iAq55Xqqc1hxqakrj73YZmMbyA/Xd/e7FnJYOmSc9dpD7vSCdFoc9QgB773ek/aGpbnoKLLxD8DLdHIYNFZhvEoOb3HbRttSaIbv3fSRXDish0ggvpiJygujIGZjfIfirDjcaGD0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+ci/loL; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c2cd216c9so7463224d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707555; x=1779312355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=N+ci/loLd6dNmYosBRse99wVjwpX5l5f8DBdbKdw4tz/AoB547AfAIFte2hd4enN0i
         8XjhNH7l80MwC9OM8KLhYhBnnjt5kbzE5kGmDoxonFnIDxbt5Xjd5WxkPTKEUkQ8QeYt
         9m7k77JKoqExdJXDBbaxBZDTsWj3/V9ATj6omJ/Uw8nOXcWfy4A+s4WTK9wlPS+xj7yY
         HyrC1Qu7aZLiK7nKIAKAXzrnAAz+7/ICTMNMCOZC0pr1L0/N31Nv4Y43/eHQBhKehyWZ
         JWDaNnszOq7s3m2bBSKwqUleYX3rmwlDLlZ8Vhjd5pU1RiYfc4Pr1pCxt2s6f4Yd7kov
         xUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707555; x=1779312355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=droYhtOmHdV3LhWrEZpA4C6v3fBLCBjGl3Bu59lYI1hjL1cChny7klu5R2m9trrOp7
         iDdbDFTbytsVFpkil3xxBD7Xjdt6AI6oOIz1hPm4VnozujxwlLfoi7yZj1YklU17jKPR
         YGdjVJlP9FBjSXfnueQzJEobRZB31YU6zroGGajK8PJIYS5ll5cDSoun5p3rSYNCpACE
         T+ZST6L68y6mJCfaWBnOIEIIPfpVs3RhUDZ+y2G0ibTmSxWsLiWAMdo+eS4upWrLSxdC
         j8Ot7iyyshCMpXfJZixjJhbkqwQBIAOIqWai2tUxTSWt54YYlzYbV16MnMZKTqtE1ODq
         1z2A==
X-Forwarded-Encrypted: i=1; AFNElJ+PY+wcNyCfrBV/NZgIVQ3fQOamxPZQ8Yq2jBhg1rcc+qlH3eviP/vBtFfc0PoMMX9xxEDpOuQY1y+fqOR3@vger.kernel.org
X-Gm-Message-State: AOJu0YyGXHVumJU8CG6BJwaFPistX7wcQp/oxTV3PK22si3Ho2GDfF5v
	3ImhDBmeBXjSeei0cG4FbG9hq3roDxh8EB+AoZS/pqQ+mb3qPW0k18UH
X-Gm-Gg: Acq92OErNpDAmcHPhZLdt1JO3oxxhHbKiu5XCA2V7Mlw9czYYOGWf+LCBCFgu6VKijo
	+60PfCV6nYc20hXvh2n6ot/wuIvWSmz5UfOvzeJT1bn1DHMUxn9vc8kCyP40eguiiT0D0Y4jf6M
	FmgZIQ3FH4WpGD88X5/t5ZMauETqOGfZWjRXisGc7nxTCKXPp/EK9JCy7XCJ+t5hK4169aodTk1
	rp6p5Ax5OS/UBuk6a0LavRpgx4bWn80yZaKeCpXpf+PkR06n1YaXfWdX5ry3qQlNkdvk9Qs9dqU
	37wVJWyzoBqRxfgqvSTnzj0A07jER6pd40jMD0ErTayZdWij6en8HN61Ku0VS+MzrN8sR56PTqs
	SlkCXWJlBEWaW8RpAMheoaiRxFYPIs+MPZ7HddthTyLQLjTNYyFvjZLKeUoYd1zXIDJ2zpiUvBP
	AKezBH+JJ6JsBraaXdHqoSIoUAUg==
X-Received: by 2002:a05:690c:e295:20b0:7bd:5c7d:4b15 with SMTP id 00721157ae682-7c6ab5e9aefmr42888857b3.5.1778707555385;
        Wed, 13 May 2026 14:25:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:31 +0300
Subject: [PATCH v7 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-2-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4988A53AF99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107487-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1ef0000:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


