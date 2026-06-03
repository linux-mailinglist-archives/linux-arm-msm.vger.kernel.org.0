Return-Path: <linux-arm-msm+bounces-110901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y8j/DX3AH2qqpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:49:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000016345FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:49:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=C7VYHWeP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 907BB30264A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4893ED5DA;
	Wed,  3 Jun 2026 05:48:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F739061C;
	Wed,  3 Jun 2026 05:48:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465704; cv=none; b=R+1K8Pizl+6ednhx5lVzqetlkAC3ZMbftb/ODoTuzScFKvR7+MgShrSnsoz5deDPS3axJsh1CRpjMtanJ0qiEO9SMRMmjBPw77gF4s7sUS7HR4m+BSSHaPyFePA7iv/YH1Ew6OOImh/uMv7qKkdeafIv4MvorALbgrMAvb8PBZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465704; c=relaxed/simple;
	bh=ykalU1Cs2DBKaoqPX4Nq3Q2kxCDwHauZFAJf1UvW6zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sshe2LipxbyO1YQMVCXb69Ts9LDFAxh/MCZ0wM94Ex9AdIKpUTzTIu7dAN3hPn49JT0Z/PYxgSDkKnCJc4o+C+IrMursb0D89JDwZmFZ8aNqutdfVxOAJajrx8o2bSdHelL6DtA8Hq8KaX4VVQQsikt7vH3DODmD6DsLqAnzKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=C7VYHWeP; arc=none smtp.client-ip=136.144.136.2
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4gVcDq3bmWz1F91M;
	Wed,  3 Jun 2026 07:48:11 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission13.mail.transip.nl (Postfix) with ESMTPA id 4gVcDp6Lwlz3fCxJ9;
	Wed,  3 Jun 2026 07:48:10 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 2/2] phy: qcom: usb-hs: honour qcom,vendor-init-seq raw ULPI writes
Date: Wed,  3 Jun 2026 07:48:09 +0200
Message-ID: <20260603054809.565723-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603054809.565723-1-github.com@herrie.org>
References: <20260603054809.565723-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465691; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=TeiTuwVhVKftRrV6+G+q9/smgsdKSE0BphnxQrsrj1M=;
 b=C7VYHWeP3I+csH5AK6hVkaktFn76kPUyW+7dFUuQ7nZM7PZB+J8zq5MIXyOy3z2ErADvxZ
 pW2E7ToUZE4v2Y16GTzumsFy0v/U45Y8IQ51rkja+WBA8J9B6FuBd9AMocuSroO42cY4hj
 XQ6UxpLcJbAzum0plW0hr2qas1dXkWCgPNwWILs2cz0uivlemnIQXwGQJr9/T2jzgoyD2b
 yDwgGAZySuU4Q3i/hVgSyBqj8uU/L77e3vymozznJG1Wc/E9kwEe3jWaSwMDSCnWKo5n+8
 0fIISwmEKJDRaD6XPMFyfmViKWpA1xuoDpNTS0fwYI+AQJDgwdPAqePMTdEUHA==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	URIBL_MULTI_FAIL(0.00)[herrie.org:server fail,sto.lore.kernel.org:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-110901-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 000016345FC

Add support for the optional qcom,vendor-init-seq DT property: a
list of u8 (addr, val) pairs written verbatim to raw ULPI register
addresses, rather than to ULPI_EXT_VENDOR_SPECIFIC + addr like the
existing qcom,init-seq sequence reaches. This lets boards reach the
standard vendor register range 0x30-0x3F where MSM8x60-era hardware
keeps pre-emphasis level / HS driver slope / CDR auto-reset, etc.

The new sequence is applied AFTER reset_control_reset() in
qcom_usb_hs_phy_power_on() so the values survive the register
restore the reset performs. The pre-existing qcom,init-seq is left
applied BEFORE the reset to preserve current behaviour for the
APQ8064/MSM8916 boards that already depend on it; an earlier review flagged
this ordering as a likely pre-existing bug, but blindly reordering
established behaviour for those boards is out of scope for this
patch and would risk regressing them.

While at it, harden the parse logic shared between qcom,init-seq
and qcom,vendor-init-seq:

  - Reject an odd byte count up-front rather than silently dropping
    the trailing byte and producing a half-pair the rest of the
    driver cannot describe.
  - Reject more than 32 bytes (the binding's maxItems) rather than
    making an unbounded devm_kmalloc_array() allocation driven by
    an untrusted-shaped DT property.

Factor the duplicated parse-and-allocate sequence into
qcom_usb_hs_phy_parse_init_seq() so both properties get the same
validation. The validation also fixes the pre-existing same bugs in
the qcom,init-seq parse path uniformly with the new property.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 109 ++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..89fbe8f8d001 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -35,6 +35,13 @@ struct qcom_usb_hs_phy {
 	struct regulator *v3p3;
 	struct reset_control *reset;
 	struct ulpi_seq *init_seq;
+	/*
+	 * Optional sequence of writes targeting raw ULPI addresses (no
+	 * ULPI_EXT_VENDOR_SPECIFIC base added). Populated from the
+	 * "qcom,vendor-init-seq" DT property. Applied after PHY reset
+	 * so the values survive the reset that follows init_seq writes.
+	 */
+	struct ulpi_seq *vendor_init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
 };
@@ -154,6 +161,19 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 			goto err_ulpi;
 	}
 
+	/*
+	 * Apply board-specific raw-address ULPI writes after the PHY reset
+	 * so they survive register restore. Used to reach the standard
+	 * vendor range 0x30-0x3F which qcom,init-seq (above) cannot —
+	 * pre-emphasis level / HS driver slope / CDR auto-reset etc. live
+	 * there on MSM8660-class hardware.
+	 */
+	for (seq = uphy->vendor_init_seq; seq->addr; seq++) {
+		ret = ulpi_write(ulpi, seq->addr, seq->val);
+		if (ret)
+			goto err_ulpi;
+	}
+
 	if (uphy->vbus_edev) {
 		state = extcon_get_state(uphy->vbus_edev, EXTCON_USB);
 		/* setup initial state */
@@ -199,6 +219,59 @@ static const struct phy_ops qcom_usb_hs_phy_ops = {
 	.owner = THIS_MODULE,
 };
 
+/*
+ * The binding caps both qcom,init-seq and qcom,vendor-init-seq at
+ * maxItems: 32 (addr, val) pairs, i.e. 64 bytes total. Enforce that
+ * limit here so a malformed DT cannot drive an unbounded
+ * devm_kmalloc_array() and so the misconfiguration is visible at
+ * probe time instead of silently truncated.
+ */
+#define QCOM_USB_HS_PHY_INIT_SEQ_MAX_PAIRS	32
+#define QCOM_USB_HS_PHY_INIT_SEQ_MAX_BYTES	\
+	(QCOM_USB_HS_PHY_INIT_SEQ_MAX_PAIRS * 2)
+
+static int qcom_usb_hs_phy_parse_init_seq(struct ulpi *ulpi,
+					  const char *propname,
+					  struct ulpi_seq **out)
+{
+	struct ulpi_seq *seq;
+	int size;
+
+	size = of_property_count_u8_elems(ulpi->dev.of_node, propname);
+	if (size < 0)
+		size = 0;
+	if (size > QCOM_USB_HS_PHY_INIT_SEQ_MAX_BYTES) {
+		dev_err(&ulpi->dev,
+			"%s: %d bytes exceeds %d-byte maximum\n",
+			propname, size, QCOM_USB_HS_PHY_INIT_SEQ_MAX_BYTES);
+		return -EINVAL;
+	}
+	if (size % 2) {
+		dev_err(&ulpi->dev,
+			"%s: %d bytes is not a whole number of (addr, val) pairs\n",
+			propname, size);
+		return -EINVAL;
+	}
+
+	seq = devm_kmalloc_array(&ulpi->dev, (size / 2) + 1, sizeof(*seq),
+				 GFP_KERNEL);
+	if (!seq)
+		return -ENOMEM;
+
+	if (size) {
+		int ret = of_property_read_u8_array(ulpi->dev.of_node,
+						    propname, (u8 *)seq, size);
+		if (ret)
+			return ret;
+	}
+	/* NUL-terminate so the power_on loop's seq->addr-as-sentinel works. */
+	seq[size / 2].addr = 0;
+	seq[size / 2].val = 0;
+
+	*out = seq;
+	return 0;
+}
+
 static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 {
 	struct qcom_usb_hs_phy *uphy;
@@ -206,7 +279,6 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	struct clk *clk;
 	struct regulator *reg;
 	struct reset_control *reset;
-	int size;
 	int ret;
 
 	uphy = devm_kzalloc(&ulpi->dev, sizeof(*uphy), GFP_KERNEL);
@@ -215,19 +287,20 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	ulpi_set_drvdata(ulpi, uphy);
 	uphy->ulpi = ulpi;
 
-	size = of_property_count_u8_elems(ulpi->dev.of_node, "qcom,init-seq");
-	if (size < 0)
-		size = 0;
-	uphy->init_seq = devm_kmalloc_array(&ulpi->dev, (size / 2) + 1,
-					   sizeof(*uphy->init_seq), GFP_KERNEL);
-	if (!uphy->init_seq)
-		return -ENOMEM;
-	ret = of_property_read_u8_array(ulpi->dev.of_node, "qcom,init-seq",
-					(u8 *)uphy->init_seq, size);
-	if (ret && size)
+	ret = qcom_usb_hs_phy_parse_init_seq(ulpi, "qcom,init-seq",
+					     &uphy->init_seq);
+	if (ret)
+		return ret;
+	/*
+	 * Optional raw-address vendor init sequence — same encoding as
+	 * qcom,init-seq (u8 addr/val pairs) but each pair is written to
+	 * the raw ULPI address rather than to ULPI_EXT_VENDOR_SPECIFIC +
+	 * addr. Lets boards reach the standard vendor range 0x30-0x3F.
+	 */
+	ret = qcom_usb_hs_phy_parse_init_seq(ulpi, "qcom,vendor-init-seq",
+					     &uphy->vendor_init_seq);
+	if (ret)
 		return ret;
-	/* NUL terminate */
-	uphy->init_seq[size / 2].addr = uphy->init_seq[size / 2].val = 0;
 
 	uphy->ref_clk = clk = devm_clk_get(&ulpi->dev, "ref");
 	if (IS_ERR(clk))
@@ -245,12 +318,10 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	uphy->reset = reset = devm_reset_control_get(&ulpi->dev, "por");
-	if (IS_ERR(reset)) {
-		if (PTR_ERR(reset) == -EPROBE_DEFER)
-			return PTR_ERR(reset);
-		uphy->reset = NULL;
-	}
+	uphy->reset = reset = devm_reset_control_get_optional_exclusive(&ulpi->dev, "por");
+	if (IS_ERR(reset))
+		return dev_err_probe(&ulpi->dev, PTR_ERR(reset),
+				     "failed to get reset control\n");
 
 	uphy->phy = devm_phy_create(&ulpi->dev, ulpi->dev.of_node,
 				    &qcom_usb_hs_phy_ops);
-- 
2.43.0


