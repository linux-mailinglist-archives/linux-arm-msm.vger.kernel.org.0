Return-Path: <linux-arm-msm+bounces-94903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIztODZ/pWl1CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:14:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F701D81F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198343077E4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE97366567;
	Mon,  2 Mar 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMhExMgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F91365A17
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453545; cv=none; b=JjaqmE+0qd9FVtAlIaoYstEssr5HLXs4somxaWJmKGZYJuPgOGXv9uiAu9L4srK/xo1zyhX8d0F2Xs3iycaicwyvCzEkvTECGnWqmCfX0nHrERRM1cF2sEGK3X45LMY6JkpAveb44LAoGyw9kY7xVeKj2SbiqRy1Qw9BKjAup4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453545; c=relaxed/simple;
	bh=W81JHwo98DtnUdaW8I4ravA3RNHN4XNWcIrZGDKOXHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bgACSnsn6kX8C9Si01oo+210x0/0yOKNZKaThdG0hjbESyj55qF5n7E5eNcb+cP71Lw8gpcRE/mT8rTeZ4F2kcGgDri6DQ442yWzlsFJV9IzIaRp5RKAooFOqTw0ktkIbyN8CLbWK0xa44PhktvthPOwWH9tKcRMXneNEvduu7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMhExMgU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8274a3db5e3so1869104b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772453544; x=1773058344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfF4tOiVLItjb1gfwcr8m37Aukq7zsbax8v7AQsNoAw=;
        b=WMhExMgUBwwdjH2XtpPrVTKBDFrz9JR2FjtzyLebDs6uN2Bw+WDjkGgdgtW87RqaIo
         K6MvIQsujv2ylEb4BVOJQ6xc1NmU3rfQ6+bMlzlToCaHRA8l8JcOFuZ9etQ1BXbMhLcr
         qKCCm4VSqcvqHkvid8J7LK/ZbyNpxG9qcCeLQuy19mV37Hhb7NBSpcCUx4jIpEwnm6Ro
         FOynA1YDfeDVqAriyy56D5dOmRvATIMK9rM9B6JUY+ER4ykE0bU4vIb/3qC2TfaKcxOI
         /ga+hu+b9saev2INh1oTQpEzNbwNXS4qyp3ngzPDuKdEKuC5Z1LqLWbEi8mZhqKuUNbn
         jXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772453544; x=1773058344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfF4tOiVLItjb1gfwcr8m37Aukq7zsbax8v7AQsNoAw=;
        b=B0xeMgznYK5l+3r0pqJ8wcR4HePnZOg4htAr3MgtyC01NTy2PiQg4ug7qw+OiYNNW/
         /WTwi+kW6oeeqTCOKoZDXuVGCUgKZ4rj0TF/cXtvE/qvHIhP5W0afHDZYoFLRSKX1FBe
         2ScBllO1ExTJBr7Su6Cws8GCIz0uOO4TjrxgPwjJPWFHsmKkj5E+odX9cM1JX0b7ZeCH
         oLa9pdP3wLBBLbjCX4bdPIImu9N3i84ffgBp0XYCEDH4lUHIRXu+GaTKzL7wOJitW9eG
         IQqxmi9CGlejxGY+xagMK1ozyJqvsUQ6/hxfBeehZgTuH/shMaIgnPItkO5pBYnWGf7q
         45Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVjaCAFJ9sf98a1/SiFe55HGRSoU+588S3Pn13R5Iu65vkerdfG6dJBFYWkjLgU41SeZtVKdpPyBhB8sXgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZvPAEknRVNdfBWnJqSRnLpgL7fEYfN/lYIxjlv1mZFrOQLTx
	niFrnVPKTK5T52WtnpbIDAE5bIOw+q2EaTJ5hNHAPNuY97eCZtaaOwHi
X-Gm-Gg: ATEYQzyDpE8belh5invd+McMj9owZ9XPoeTquYGLdQ1JgpBer8nlSGFhA87a05QzTjT
	fKR6EyClaKhZKN/FhqJENxpcesN764825xNbwm8xA500mTCX6u35hiDxhjsNCOvPNgihxiDEwn/
	C+iuWUwikCPPYKB0c2SPWA+hkZTPtyRC4AvGRqT0vU0i3cjJp95ZY0IikF4oowRI81+62kfbM0I
	sjY4iUpFOpCJMOSFQmb4TeFeJFHVCeg/aDc4Qrom+nK0g//EKoSxzhcpBTmY6/RqbBfOWooGyn6
	ANNyaoSXsvlBBLcI2HDbVS9EJmZBCHWvfQ6JONSMu7ZI4zDnG1b9T7yV+/JmroLbmL47jbWrWan
	ui015QE1ipomfwTyEVzzJa3y2bjaq1PYJOJ5XkErVwjOjyI+rKaEYlCTfcB3UM1LEqhXUstybfd
	lnKTWDFa9OuguXvne7T4HPAMvjqyIwtLFVJy4n0dWAFXJf3war
X-Received: by 2002:a05:6a21:6f0a:b0:38d:ebdc:3555 with SMTP id adf61e73a8af0-395c3b3deadmr10834753637.66.1772453543562;
        Mon, 02 Mar 2026 04:12:23 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm11454177a12.30.2026.03.02.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:12:22 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v15 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Mon,  2 Mar 2026 17:41:58 +0530
Message-Id: <20260302121159.1938694-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302121159.1938694-1-tessolveupstream@gmail.com>
References: <20260302121159.1938694-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94903-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88e2000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 51F701D81F5
X-Rspamd-Action: no action

The USB PHY nodes has inconsistent labels as 'usb_1_hsphy'
and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
This patch renames them to follow a consistent naming
scheme.

No functional changes, only label renaming.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..6a052667f096 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -662,7 +662,7 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
-&usb_hsphy_2 {
+&usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..f69a40fb8e28 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4417,7 +4417,7 @@ usb_1_hsphy: phy@88e2000 {
 			status = "disabled";
 		};
 
-		usb_hsphy_2: phy@88e3000 {
+		usb_2_hsphy: phy@88e3000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x088e3000 0x0 0x180>;
 
@@ -4600,7 +4600,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0xe0 0x0>;
 				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>;
 
-				phys = <&usb_hsphy_2>;
+				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
 
 				snps,dis_u2_susphy_quirk;
-- 
2.34.1


