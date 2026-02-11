Return-Path: <linux-arm-msm+bounces-92562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Pn0HRQFjGkeewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:27:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 238CB12131C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDAF8308E4B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 04:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778D2353EFF;
	Wed, 11 Feb 2026 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FE+974th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC8353EE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770783956; cv=none; b=oBExEQUGkseo95DdP37CDXTsfelO6BMPhpAOp038+S10jrnSKtWGuAj7MbF7D+ma274BFuxTHm+/KNwUnco9v4lGtNbpKSrlu4kJCNLcGnYHt/cLHZxR9CfGVwvH9bxa6GmVN5bGWcHVPkI+MaaFEsmw4EYjxtPFXD0eaun5O3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770783956; c=relaxed/simple;
	bh=Lc8AP/F7goFEe9y/c7w/iEuBq53oiIANFFJwNlrCXPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MADnOIsRWifxSQtEc5ZJd/+uCCU9ttM9Q1fW/nXpUgyOcEafTJbK9AWTOV0pnISSE+6LSKaXeAqTHvkzvssqA03a9e89jj/wvmsulpsS7woqOuvyC8sb3OTqaf9Oqmi1hhNoE9sdTWgod+JXZSIqe1xY2MsXW6O55jiYpdnzW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FE+974th; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aad1bb5058so17528065ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 20:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770783954; x=1771388754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4LhOgJf104IDgtgTCJUFudf8xlA6PPDYvmEI+/p5+w=;
        b=FE+974thoohvdf/b5ojU+McTAICjGsjgpRagbVcFDVcl+WM0meiuOdtkNo4MUsHAt9
         rCw/AiGv6XV9PBoF+z6FEiogV/21rmd1XSrFRZjKuzw5R4Ll5Fqp54M5LYqZg/9k5Rtn
         HF9VvfwqLmTpCx+tf+RJTrhKxUwU0++dVbnjaqCtzEVx2a6XWh9wmQRjoValRM4QFU7e
         omnBaYYyc8GlX0NzeiHGKqQ1+TB9Xl5CRN5YEmxT+Lk8b0pH/N5E3Ki5n5+W98jq5rOL
         K8fP9rXC87gw6dDhHb/BigNzVm1XeA0KSwWleMmRrArgBMOfpteQj3ITnnyxZI3k7BjJ
         ZhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770783954; x=1771388754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4LhOgJf104IDgtgTCJUFudf8xlA6PPDYvmEI+/p5+w=;
        b=WbLi6YUARSG+u4+I6MyKq0VKgEs+EXSBkJdEkdL66ZgxHGloetMQnc7deRdg5rYSNZ
         GoSuue41gPWyqiSpf5gZFz4o8UWXgQ44TH6RLbokTt08vwCI5Na/v0X9tLjMawaBeTNG
         Tu0uQOVZdFnGeIUzQpYUfuME9cJdE8k2v3dxenAi4XZWe7YjNe+GqWid0EILSU/XoyGX
         /GAnn4xPTQSHQXcf5I/DylVL+YestUQA9yUlz1KmVPhXQwo1PteMPW4UxBjMmrvfcCL6
         3oC+m1Hup1qvhZMinVS44NIGMVk5LVmIn4sc0a0q+HergBPqJTcTd7yHp74xZ8vzhaXN
         8HDw==
X-Forwarded-Encrypted: i=1; AJvYcCUq46/jB8L3fS++8fW2H/tpD3VXIa08HmtlKGZAwg+5Yotq+JUcb+mFtRjGq9GiO05YynMIiP1sbUO2sFPn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06W4GUFOhZz+a1qh3IQeeACz3mZOJPVE7N9hRb/DOf9AUUVOV
	PioN23yn+yyHsp2JfeqhtlhiYPr88DU3ZblLXwmJ+3CyFAkx6meTEo8D
X-Gm-Gg: AZuq6aKrrmyw4EuXCh1/uitQPbh/vpjh6XfWuUx68igmLwAR5SpF9synrDng2KrYhBp
	A/o9ISMLJbtT2PIz/K0SCYWLp0WV/XQ+LTe4mMjLrLBpbrFEU4Imqg0edfqy8FBaSrKcizFojDQ
	cxeUdiU2pwYz6ps865CMJ8SyJm/iS0y0MGT5fhqzEo8nWzMAzidKbY0h6lhdTz18oQThXONzJay
	QbcPP3yBVo1qUeNEz7p2sGFD6a6wnPwtOx7xQRDZw1Da6Pf2HslAgKUKMgOLVgpVp3Sz/sXMwZe
	ZyNEkKw8XB/AS1SQGhmaoD32DaxTd/IV4ZAggCSQVq8MZxYqZQbI+Z8Na1xR3jotID/aaXpWgyM
	pmeuU2Wix16lZK2GsFq3nUk3zDEj8l6URV1Sh6iKK9e+gs+a6iXUqzk9LpUVnUnd4a2/mkpmKTt
	Tcb7WWFchAI9C2YBtEkvpNxRFdX+F6yj/VYOvP60C9ZwTlp/nb
X-Received: by 2002:a17:902:ce8c:b0:2a9:451d:a69 with SMTP id d9443c01a7336-2a951670d58mr149461325ad.10.1770783954516;
        Tue, 10 Feb 2026 20:25:54 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996617dsm8413545ad.47.2026.02.10.20.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:25:54 -0800 (PST)
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
Subject: [PATCH v13 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Wed, 11 Feb 2026 09:55:33 +0530
Message-Id: <20260211042534.162007-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211042534.162007-1-tessolveupstream@gmail.com>
References: <20260211042534.162007-1-tessolveupstream@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-92562-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_PROHIBIT(0.00)[1.23.142.104:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 238CB12131C
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
index be67eb173046..0ca6b50a6de1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -609,7 +609,7 @@ bluetooth {
 	};
 };
 
-&usb_1_hsphy {
+&usb_hsphy_1 {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..c7dc507a50b5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
 			#interconnect-cells = <1>;
 		};
 
-		usb_1_hsphy: phy@88e2000 {
+		usb_hsphy_1: phy@88e2000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x88e2000 0x0 0x180>;
 
@@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x140 0x0>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 
-				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 
 				snps,dis-u1-entry-quirk;
-- 
2.34.1


