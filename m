Return-Path: <linux-arm-msm+bounces-111246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJdCKC6tIWpPLAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0664C6420F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:51:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=LqJck30X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B86D327BCD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55309481677;
	Thu,  4 Jun 2026 16:24:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952A481A9C;
	Thu,  4 Jun 2026 16:23:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590244; cv=none; b=pJBaz4L/dz0RF37IO4+m+DlGYmHJC83gyCEpdx+xfrzdKy/t4POM0iWF4DUe+Da9lg+sKKOTigBqstwntdrVFR2FPr3kTIJM2s8nRxzcPdyoK77ZqlYf6OrYWUwtrQNNZ7H3XIuYszzpE11bh32s2t6IV3eyP8QaEYaCctewxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590244; c=relaxed/simple;
	bh=p46v2XARJvar7HCClZnX9Uqnta8yPEevrh1TJ8+/0Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoS/IkMXfb1pPHp1npS4IBFTDoXVEheeusHhbdGqhGyR85HAaHhdRoAhf4UU8H3kUy8ZAl3m1DO8SkZu4XB2yrugI6YS5YLwhURdn/s1fykMKefLXvVa4IC2GRN4eUJ+vhlW+vMif8UQ7zsBBFK5MB85oCoW1QWJbR+2QEeP6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=LqJck30X; arc=none smtp.client-ip=136.144.136.8
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gWVHs6wjGzY75P3;
	Thu,  4 Jun 2026 18:23:53 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4gWVHs2qcDz2pRDjv;
	Thu,  4 Jun 2026 18:23:53 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	andersson@kernel.org,
	lumag@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH v2 1/1] phy: qcom: usb-hs: program MSM8x60 vendor ULPI registers on power-on
Date: Thu,  4 Jun 2026 18:23:52 +0200
Message-ID: <20260604162352.569269-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604162352.569269-1-github.com@herrie.org>
References: <20260604162352.569269-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780590233; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=Y7wjYK4HK7OtMQzsSYJSaSoZLF/ROvJ75O2qVQ+vuQ0=;
 b=LqJck30XQs85yXynRbQD5/Y7hMXahNVbGVT/dV9Y7wDQ40cHcWysaVx6t/Z1cGvGvWst2z
 TxlY4V5kzQquXYyMLpKA9YlIkgdfrj6buE9LpHs578+P8X8gBMR+l1+qANX6dcRAD9F5fQ
 ldCsm0gviwSy2eD2AuhhjQsRcS9vfSO8uFXune2+L+Cg5w0uTSkaU6sm7NDomq4PFpxjmE
 vR/KUurnFcEmLJQBDXMeOpTHIJo/r8iPDLCTfFqVYsuIpeacC1RzixJ0J9Zanszd4tQon5
 v/lC0GfdyPk90nToWNy09lwbdfOyqafX5fmmOKxIeHpkHqs4gPFuoFvGcnCQQw==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-111246-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:lumag@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[herrie.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0664C6420F2

The MSM8x60-class PHY needs three vendor-register tweaks for stable
USB operation, which the legacy msm_otg driver used to drive from
board platform data:

  - reg 0x32 bits [5:4] = 11b: pre-emphasis level set to 20%
    (Qualcomm reference setting, identical across every MSM8x60
    reference board, HP TouchPad and the HTC MSM8660 ports).
  - reg 0x36 bits 1, 2 set: CDR auto-reset and SE1 gating disabled
    (also identical across every MSM8x60 board surveyed).
  - reg 0x32 bits [3:0] = 5: HS driver slope.  This is the only
    board-specific value; the HP TouchPad uses 5 (matches the
    .hsdrvslope = 0x05 from the legacy mach-msm board file), while
    HTC MSM8660 ports use 1.  Since the TouchPad is the only in-tree
    consumer, the value is hardcoded here with a note; a
    per-compatible override can be introduced when a second
    MSM8x60 board lands.

The writes live behind a runtime flag that only matches
"qcom,usb-hs-phy-msm8660" so the existing MSM8226/8916/8960/8974
consumers are untouched.  They are issued *after* reset_control_reset()
so the values survive the register restore the reset performs.

Note: HTC's MSM8660 vendor kernels additionally write 0x0C to reg
0x31.  The HP TouchPad webOS kernel does not touch that register
and USB is stable without it, so those bits are omitted here until
documentation is available to explain what they control.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..80508885a5b0 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -20,6 +20,28 @@
 # define ULPI_MISC_A_VBUSVLDEXTSEL	BIT(1)
 # define ULPI_MISC_A_VBUSVLDEXT		BIT(0)
 
+/*
+ * Raw ULPI vendor-register addresses programmed at probe time for the
+ * MSM8x60 / APQ8060 PHY variant.  These are NOT under
+ * ULPI_EXT_VENDOR_SPECIFIC; they live in the standard ULPI vendor
+ * range (0x30-0x3f) and are addressed directly.
+ */
+#define ULPI_MSM_CONFIG_REG3		0x32
+# define ULPI_MSM_HSDRVSLOPE_MASK	GENMASK(3, 0)
+# define ULPI_MSM_PRE_EMPHASIS_MASK	GENMASK(5, 4)
+# define ULPI_MSM_PRE_EMPHASIS_20PCT	(3 << 4)
+#define ULPI_MSM_DIGOUT_CTRL		0x36
+# define ULPI_MSM_CDR_AUTORESET		BIT(1)
+# define ULPI_MSM_SE1_GATE		BIT(2)
+
+/*
+ * Per-board HS driver slope.  Currently only the HP TouchPad (the only
+ * MSM8x60-class consumer that depends on this PHY initialisation) is in
+ * tree; HTC MSM8660 ports historically used a value of 1 here, so when
+ * those boards are added a per-compatible override will be needed.
+ */
+#define ULPI_MSM_HSDRVSLOPE_TENDERLOIN	0x05
+
 
 struct ulpi_seq {
 	u8 addr;
@@ -37,6 +59,7 @@ struct qcom_usb_hs_phy {
 	struct ulpi_seq *init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
+	bool msm8x60_init;
 };
 
 static int qcom_usb_hs_phy_set_mode(struct phy *phy,
@@ -105,6 +128,54 @@ qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long event,
 	return ulpi_write(uphy->ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
 }
 
+/*
+ * Apply the fixed MSM8x60-class vendor-register initialisation that the
+ * legacy msm_otg driver used to drive from board platform data.  The PHY
+ * has just been reset by reset_control_reset() in qcom_usb_hs_phy_power_on(),
+ * so the registers are at their POR defaults and an RMW preserves any
+ * reserved bits the silicon expects.
+ *
+ *   - reg 0x32 [5:4] pre-emphasis = 20% (Qualcomm reference setting,
+ *     identical across MSM8x60 reference boards, HP TouchPad and HTC).
+ *   - reg 0x32 [3:0] HS driver slope = 5 (HP TouchPad value; HTC's
+ *     MSM8660 boards used 1.  This is the only board-specific bit and
+ *     is hardcoded for now since the TouchPad is the only in-tree
+ *     consumer; a per-compatible override can be added when a second
+ *     board lands.)
+ *   - reg 0x36 [2:1] CDR auto-reset and SE1 gating disabled (matches
+ *     every MSM8x60 reference board and HP/HTC vendor kernels).
+ *
+ * Note: HTC MSM8660 vendor kernels additionally write 0x0C to reg 0x31.
+ * The HP TouchPad webOS kernel does not touch that register and USB is
+ * stable without it, so we omit those bits until documentation is
+ * available to explain what they control.
+ */
+static int qcom_usb_hs_phy_msm8x60_init(struct qcom_usb_hs_phy *uphy)
+{
+	struct ulpi *ulpi = uphy->ulpi;
+	int reg32, reg36, ret;
+
+	reg32 = ulpi_read(ulpi, ULPI_MSM_CONFIG_REG3);
+	if (reg32 < 0)
+		return reg32;
+
+	reg32 &= ~(ULPI_MSM_PRE_EMPHASIS_MASK | ULPI_MSM_HSDRVSLOPE_MASK);
+	reg32 |= ULPI_MSM_PRE_EMPHASIS_20PCT;
+	reg32 |= ULPI_MSM_HSDRVSLOPE_TENDERLOIN & ULPI_MSM_HSDRVSLOPE_MASK;
+
+	ret = ulpi_write(ulpi, ULPI_MSM_CONFIG_REG3, reg32);
+	if (ret)
+		return ret;
+
+	reg36 = ulpi_read(ulpi, ULPI_MSM_DIGOUT_CTRL);
+	if (reg36 < 0)
+		return reg36;
+
+	reg36 |= ULPI_MSM_CDR_AUTORESET | ULPI_MSM_SE1_GATE;
+
+	return ulpi_write(ulpi, ULPI_MSM_DIGOUT_CTRL, reg36);
+}
+
 static int qcom_usb_hs_phy_power_on(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
@@ -154,6 +225,12 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 			goto err_ulpi;
 	}
 
+	if (uphy->msm8x60_init) {
+		ret = qcom_usb_hs_phy_msm8x60_init(uphy);
+		if (ret)
+			goto err_ulpi;
+	}
+
 	if (uphy->vbus_edev) {
 		state = extcon_get_state(uphy->vbus_edev, EXTCON_USB);
 		/* setup initial state */
@@ -214,6 +291,8 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 		return -ENOMEM;
 	ulpi_set_drvdata(ulpi, uphy);
 	uphy->ulpi = ulpi;
+	uphy->msm8x60_init = of_device_is_compatible(ulpi->dev.of_node,
+						     "qcom,usb-hs-phy-msm8660");
 
 	size = of_property_count_u8_elems(ulpi->dev.of_node, "qcom,init-seq");
 	if (size < 0)
-- 
2.43.0


