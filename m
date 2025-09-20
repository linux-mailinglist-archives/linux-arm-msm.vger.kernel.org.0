Return-Path: <linux-arm-msm+bounces-74259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF54EB8BD18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 761095A488D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9506322127A;
	Sat, 20 Sep 2025 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWreJdvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A821CC62
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332844; cv=none; b=ZhkeBNvImc1klgy3yA6ty2TEueBvmi/P3gi/igpPUF54wF51qiBvM4Mst0thxnjsQdIDb+3wJtzVdKCUf2pf0mmm5qudkwwp4FBAwrNTx0A9KD7YIsgum5E4XE2qrPQkEuvxnMeDo99IGoQkVp7KrTiJlJ2WhFRheLUhOtwzgT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332844; c=relaxed/simple;
	bh=q7Xfm32bQVivWAKM4yd8tFW9E2pSlnxh8P7wsqP1uaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFtjWBHL1vZdJOkLvEqqJfFtyxH3BmWRvv96V3oztu53LtL1dnNTy/FtzvUpk4xyuLE0AyM2HStmEfR2ok3TnI7riRS3fby56H4B8yg2pBnSlaLpDNaWq2I0M42ByUD4gI8Ga8auoNg2EV3nIdHHYq/MMWELu4pn8MayVVvOUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWreJdvk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2680cf68265so20219755ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332842; x=1758937642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K4nVmfnY5pKLRLdVHuNKFKe2bl1ttzHe8ukP+rPnfM=;
        b=GWreJdvk9R+m7b+Wk8nriEP4+W/lgVd3qBU+tKvtEIFTOypNh1COn8D8EvPrrBnQ2u
         SIig0FH6PtUAYEN1qh3uf0s+xqVfa6fKng217ts075BqKYohfsnHvt3QqCCI7YKU16iv
         vIpjmNiXGlAIGwzmR709g/cTY6bgF7bjGR1QSAf7PmPBI38guYryS3BFi9Hy8qDA9AsA
         PG9mD9Yq+0ybN18NVyhZNVeULLPje38ZOP7YSEuIWqV8l1rzsoFme9GhsKoU12q+bb2c
         unsA1QWWGeZH32NeXHCGrh0elXkTOTaVi7s0LFnn8Wou3SpXFj/RvQwYIu2NL+gGr+K4
         6/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332842; x=1758937642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K4nVmfnY5pKLRLdVHuNKFKe2bl1ttzHe8ukP+rPnfM=;
        b=ZdcKHdyv5TglNlA/pk8PuYUDaHOqHfNBZtw+tJ2oBSgXEweevY7IaABpkbChVgqhfC
         OmD3CjqBLU4XlXK9z/Z6z3GzSLK5JeJ/7h5jovlFo46RfIF/M/VZ59o7B4D42HOSo5Qs
         Ny4SVUiM7XHaqEGcl3tq/ohWqRwrcdF5FVuQ78KShtCfrdQx+xQZVKiVKM3KaAegYihW
         Hadzo2T43CH2ZKBxTnrLWrXhmu493mYp/GnKC060DPdPGA591599UxcDhTudGmY7kyqV
         X4bB9YuShZ58MN1J17rrFIpqo4TklRhYUUwZc48QqyVVWAHn1r+Q0IGw2B/1X2pTmOo4
         FwOA==
X-Forwarded-Encrypted: i=1; AJvYcCUUd0hu0BGPHhjYXQrKaBoJHtS3vlRMBMe475LuZ1A4w+0NCPWSMfHU0eJ6SbYa5kodNcghLKpTgk1wsgt5@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB+Qu8WfmTBs08VOCSlSPMEOqgzzMFvi1M0riav6WIT/Y2xaP
	b13Q8nbq71EH2curx3rMu4un+l+oHFXmtTKVjuMMn++AElIehzP8MHK7gdoeKART
X-Gm-Gg: ASbGncvdmldXatfhGDk+b9x51NK9zNXdUIIqNaVsyXjV/zZPRKYS9zwJAeM5ebdDheJ
	cxOJ91yv0+ZcdfrdZPNx7uvB0BMoVhOp9qW1uU3dnBjCb4tsLIm/zNzLiJnOwIV8VBiWsodBb+E
	Us4Y3WkuwVSS5IGGCs2BUAbrIOS6qkfSXOnMmf5ihVpNTAeKyDVjc7SAmRoCJw8+Z6JLEuSepP9
	31SVhXnBEHmLYCIlhulGlN/w5GPJIjoiZNxDbHzRtM8OO4UTdakc7oRutz7We8ontwV724oWPWJ
	aeQqW8RhnV1idWofbwTFxuywC07sL506tKM7dsj6p95OYQgavl3J4etmn8jPqfNLD6sTLhRcU86
	EA+DGCHoP6QyPQDJrLT00yWwvJMBjxxg=
X-Google-Smtp-Source: AGHT+IFeOVs15dznIpdCf/M/7Af5SWFGR9Jd7+90ee4NmadJFomFWtlVJj00c3XSdaHZLu1bl73iYg==
X-Received: by 2002:a17:902:ecd1:b0:267:af07:6528 with SMTP id d9443c01a7336-269ba50848bmr68817665ad.35.1758332842235;
        Fri, 19 Sep 2025 18:47:22 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:21 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
Date: Sat, 20 Sep 2025 01:46:37 +0000
Message-ID: <20250920014637.38175-6-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable UFS internal storage of the Samsung Galaxy S22.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index c088f1acf6ea..0a55ce952f93 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -146,6 +146,24 @@ vreg_l5b_0p88: ldo5 {
 			regulator-max-microvolt = <888000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p5: ldo7 {
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-1 {
@@ -370,6 +388,27 @@ tsp_int_sleep: tsp_int_sleep_state {
 	};
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p5>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <1200000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l9b_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	/* Keep USB 2.0 only for now */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.51.0


