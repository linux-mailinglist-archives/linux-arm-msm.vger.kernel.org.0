Return-Path: <linux-arm-msm+bounces-70785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCAB34F5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7ED74E15ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C771F2C15BF;
	Mon, 25 Aug 2025 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lal8//b+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC32C0F6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162643; cv=none; b=Q0AonL6c3QA451umBnbr2Rgqar/RcSHAxHfNnL2wPnR+IsAVs3V9e6l0nXEOyB1V3lYCB+cTTl+8r3gE7dx8IE56e9u/n1EygaF6yOCe+YzyNmDFl2KyRFhDAB969Pi2rnGgkS2kRfwOu9RC9AHviGklYwehGX6CURVAXU5RB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162643; c=relaxed/simple;
	bh=Nvl+APFUB5en559ZQEJgCl7Ibf3Pwlj/L8YOZcRoCYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6ZiCxCdyW4FeXk/7YRuGtNS2UNKKe2gjVDsb+WiHowKf40rjE8QLyMlJ9E/ttpLtlOTu4PSDWOsuc27R7CZdf91qgLfUNJCaTZ166mEXwoA8w/vJiJiUhUgHdqyKUMS6uyxkAZb7bFr/RbXgqHidfNgpftSn/0lVTrnfL/Fb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lal8//b+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2e88c6a6so4333060b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 15:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756162641; x=1756767441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No0PXOSlxr5gHLZibMa4NYjde5mWQl1xnGitNFzv0Ow=;
        b=Lal8//b+IEUCTqtGrjMqZT9fqtmmePnE07jCnHayETv8cat+U/uIjqdBeuw0WofUmK
         udgk29Rck4Lf0ybUthaGpquBGmzUiKNEDhGkxolh0C3xzZSZ96z5NP+Fro2S2H6YkANt
         dCsiatN7dF/9JheUMGicgAAiacTAPcB4hx7eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756162641; x=1756767441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No0PXOSlxr5gHLZibMa4NYjde5mWQl1xnGitNFzv0Ow=;
        b=kydXGGXyS1D46qRd1QZQH+oGEyBIbbMbpwi7COFKg77ISB4gJbEKk6m8l2r8oLxp7s
         1D/tJCfTnBBJthL3eKi6lILHtJBDHm8EhSxI5QbjEZQB1Ev59AdRyko8t8Z2R6HfKfOk
         ymN61/Szv4x4+aXk2uVL3iJSRZ1BHjUEJsf5n1g/Bq0qRmkL+eQ7US2waYqjHtDu7uAL
         DurUGv9ySoko8oXM/+u1HK5GWsx8JOO93WPk4cQHbqnh75M0Ji6R6luRGBDu6o0GYnoQ
         WBU+I3JRRxWN/8fATQK3v96McGYedWarf6arzvUrzXOnf5+dFnfsJ9oNAyaWx4866RYI
         FJSg==
X-Forwarded-Encrypted: i=1; AJvYcCXmyCH7sLkGSHnnf1IgzRCPnfQowvaouaFzhiQwqnk+ao+TF8fgeYvIozuU5Medi29DoIyzhK+u00pxw84u@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt606mWEIhC429Os1BaC+PYwOFGwlizmskYws1GRrjzxIvPU/W
	DPytTaQA+s42sjRV4bZZ2RN7wUwl+jWD++kaptEB/Jw15Msm76jdcHxh0xf3DFVdUg==
X-Gm-Gg: ASbGncuP9J1pV6IW8QAkj4yCiiM4l2GGsfWkUomCLWf1FR25RsXhuWGkAJuUfoxNjht
	7A+0pFJs/rTW2Ujv48EWJVJbZC68MCW1Y8dbFwkWOJxQEZZwqHsB7jft8hhDAAZD6uT2Xwzh+WK
	OMWt1h4/1+GYDvhyd9IFryYE7iUYJei4b/4oB5lromA65faScXRpFF2WE3ievT3NfR8zSQVkawM
	raq2yK2Xki4s9SLqRjpiymswYh6HovCmXac9LXpf7j0Zd1GyI74hHBoEsy1ZGBaOsg7E1Hmdkqs
	mPxDBOfMDGzmVJSll3EuXoPHDPYI697aB8QEwgSWwcPwzcYXnkeWe24Dk8kaC5OPZrrvNyH73gR
	t6tW1HQjno5NTU8UpyP9zehEf0/O4TGv8nAuOCwFOFXql0PC1xbJg0mdrm9NmGaBf6HAgQlzVdd
	keGn8=
X-Google-Smtp-Source: AGHT+IFOLQSe2Rtc0YNjSnBoRdF4ZZxObNbu4Py/ZXRegVrx2wgM6pGF9Y0MMS5NL60LCvJfl3yEmA==
X-Received: by 2002:a05:6a20:4320:b0:23f:fa6e:912c with SMTP id adf61e73a8af0-24340b8da90mr21448836637.2.1756162641441;
        Mon, 25 Aug 2025 15:57:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:230e:95:218f:e216])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b49d4ffc22esm6130554a12.34.2025.08.25.15.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 15:57:20 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS clocks on Herobrine
Date: Mon, 25 Aug 2025 15:55:57 -0700
Message-ID: <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
In-Reply-To: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since these two commits

  fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
  2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")

Herobrine systems fail to boot due to crashes like the following:

[    0.243171] Kernel panic - not syncing: Asynchronous SError Interrupt
[    0.243173] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0 #1 c5464041cff584ced692726af2c4400fa2bde1db
[    0.243178] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
[    0.243180] Call trace:
[    0.243182]  dump_backtrace+0x104/0x128
[    0.243194]  show_stack+0x24/0x38
[    0.243202]  __dump_stack+0x28/0x38
[    0.243208]  dump_stack_lvl+0x28/0xb8
[    0.243211]  dump_stack+0x18/0x30
[    0.243215]  panic+0x134/0x340
[    0.243219]  nmi_panic+0x48/0x98
[    0.243227]  arm64_serror_panic+0x6c/0x80
[    0.243245]  arm64_is_fatal_ras_serror+0xd8/0xe0
[    0.243261]  do_serror+0x5c/0xa8
[    0.243265]  el1h_64_error_handler+0x34/0x48
[    0.243272]  el1h_64_error+0x7c/0x80
[    0.243285]  regmap_mmio_read+0x5c/0xc0
[    0.243289]  _regmap_bus_reg_read+0x78/0xf8
[    0.243296]  regmap_update_bits_base+0xec/0x3a8
[    0.243300]  qcom_icc_rpmh_probe+0x2d4/0x490
[    0.243308]  platform_probe+0xb4/0xe0
[...]

Specifically, they fail in qcom_icc_set_qos() when trying to write the
QoS settings for qhm_qup1. Several of the previous nodes (qhm_qspi,
qhm_qup0, ...) seem to configure without crashing.

We suspect that the TZ firmware on these devices does not expose QoS
regions to Linux. The right solution here might involve deleting both
'clocks' and 'reg', but 'reg' would cause more problems. Linux is
already OK with a missing 'clocks', since pre-2b5004956aff DTBs need to
be supported, so we go with an easier solution.

Fixes: fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
Fixes: 2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Update notes about TZ firmware

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 2ba4ea60cb14..6237fc7a13ca 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -394,6 +394,16 @@ &vreg_l2c_1p8 {
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
+/* TZ firmware on these devices seems to not expose QoS regions to the OS. */
+&aggre1_noc {
+	/delete-property/ clocks;
+};
+
+/* TZ firmware on these devices seems to not expose QoS regions to the OS. */
+&aggre2_noc {
+	/delete-property/ clocks;
+};
+
 &edp_panel {
 	/* Our board provides power to the qcard for the eDP panel. */
 	power-supply = <&vreg_edp_3p3>;
-- 
2.51.0.261.g7ce5a0a67e-goog


