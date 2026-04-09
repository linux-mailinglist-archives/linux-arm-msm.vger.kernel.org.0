Return-Path: <linux-arm-msm+bounces-102542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DPDAa0J2GlOWggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E27833CF5C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0665330071CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0A033CEA7;
	Thu,  9 Apr 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOakyBPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117033ADA9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765925; cv=none; b=OlvJ9LKJQuSTo5TENHsQw/WHLlUElLhRLrngIOJwnEnvEfBuEGs+b4G/njDmhz5LP+NZLGLZdIEeLF8vw/uUvnL9Pl67sJsFfkLPrGa8AW0PKzipDpN5Qct3/mTiZgcPCrNutf73AZWPR4lNCM4T0hFffaLs6hXxXc5bcIUOLDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765925; c=relaxed/simple;
	bh=mnyIpwA8/epHgHoeb8f0RmLxnS8bfUTJWV6cjsEiKVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBuEcvPx+nplXcjB2TRPjCvMNssvVlp2reKtXauKBCzhY88F1G5Pz/BFKCTczd0/fXCOBUBAQP4betvLppw/Y9woP2vGX2BXc0nPFi0bt+lwbpYWjuL4EViJBcztRsXP+IwT7qPQHUU4E3xT7Yofe+5+MooKHJ5ZKH9oFDq8Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOakyBPx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b2503753efso11505815ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765924; x=1776370724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ju9xIYAZJV5mCf28srD3IZypPl0SWMmGJqicl4PQgS8=;
        b=rOakyBPxITn6rfpIeuN9L3Qx8QI/Kw4lL5QlxBO4bYLTjxMQDhFiq63P66nxMViaH8
         lcxQ2AHTlIKV6jDUrXiYFpm9bfjoGsDiV8Sp2A9y9kaYVsChbWA0pOcR0LPa8txmDGLD
         GT2bKANGoUFVXYnLug89rsI+iFUgNvq9asy3QzPL00m+qjeONiNv3/qwZ7kMey1YJPxG
         4X5LEhM/M2WvFtjHlmYJ/KrRns4L6z7Bdeb+HUtk659m4KSTALYBTdVWusZKfiQL22XK
         oSN9bf33UxWhW0gspFKiYNyhcSU9TI8QysVDcBeJe/5MSUyDu2RSkOjmAdEEsGaaQC5t
         pxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765924; x=1776370724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ju9xIYAZJV5mCf28srD3IZypPl0SWMmGJqicl4PQgS8=;
        b=a/dC3WXvyVH9lFQyjuzls9b9fAxTuFEZyPH5RUWLpC1A6rdEmn58d7TuOtvSZ66HZo
         5JAgmZ8rpQAHY98QU4WbEQS1WU0aBNzkHD05TT2QRzX25fgLPRkvX9A361u06TwfFTQy
         EffvApPuYKmSyB0zAmx/SSs0j000yzhYkFlUrQxLC9pqpj20lhSeBNAUPd7SToL9J4Si
         PLp0pUe+mH8z+WurDgEdeK2jG/bG/X+Kjr3SgQSIaxYLUgQva66LDLJWTVZ2jT9IMAF0
         v/0819qKu/16gutcMi5M28LsjMcHY6k0rMyiXQ1z27BOpgqbTLb3FAe2lgXSm24bztr8
         hZUA==
X-Forwarded-Encrypted: i=1; AJvYcCU9iy6/rJ7DaE69x1rn6ruf71+HdTpoxgFg9qCUwP8HyCjcfQYl1rkiIPwEDS2QYfZR1RNaXReF7edGnjbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vpJ58CSfy09G5A50PjTLThA0NWAHosi31Abrwy6CS07wtzMh
	QOY2JRL0lY6hkyw2Jo7eW61e6d41nAzdYTIyTpNI29LosCGxUeNiup1K
X-Gm-Gg: AeBDieviHXNUyBXbVjYX9WyFYsCO7mHZ8C5IoKp9lAjrG/+nwAj5ECu+OCWsxOYcgaM
	WrlzEUQwgAD8BfYr89qsJv8QhXpK2bS+hvtqyy/qjXziLUXQ970TXhBz//16gBczsm4BFPWiIAB
	h6di5yERJ5sIiC0arJRcWvB6QTNlPq2B5cxshp4RvN+MVNa/dl21svji29SvCkCAayh6GC8FTA4
	BeyZWEuI1BvD2Rl0JN2talzbqC0kH1qcLUPkNudEB0+sk+/fWqtGzIg1FdLlue5C40bm5d8twC0
	5/tNz7bRRkkvQkIFcGBJbO7EF4ewA0pbwshoeTOsZUl7fsI7kPQ1n4A4A1AIJFpCKKI/AcscGIq
	Ch3TVEXlW3QMla6mz/jvVyKpIIAy5A/PXiw6kB8AabDbWjN2Cf/2HZwL9t84zGHFxNkrYvHvoxA
	NgsSJ7s6TWyLfN269X+v5e4IruNir3OJgD5qM5pRkyDvWJeMgJsxLx9dDa07VK5/Wjm52iSw==
X-Received: by 2002:a17:903:3c4c:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b2d5a69ae7mr2868625ad.36.1775765923837;
        Thu, 09 Apr 2026 13:18:43 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:43 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1e80100-microsoft-romulus: add PM8010 camera regulators
Date: Fri, 10 Apr 2026 08:17:16 +1200
Message-ID: <20260409201717.108169-2-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409201717.108169-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-102542-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E27833CF5C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PM8010 regulator outputs used by the front-facing OV02C10
camera module on Microsoft Romulus.

These rails provide the supplies referenced by the camera enablement patch.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 14b5663a4d48..4427ecae423f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -857,6 +857,57 @@ vreg_l3j: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j>;
+		vdd-l3-l4-supply = <&vreg_s4c>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {
@@ -867,6 +918,7 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
+
 &i2c0 {
 	clock-frequency = <100000>;
 
-- 
2.51.0

