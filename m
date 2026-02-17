Return-Path: <linux-arm-msm+bounces-93112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAT/AZRFlGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:40:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A612214AF0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278D63064E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90092326957;
	Tue, 17 Feb 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yquk+dV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3B326948
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324690; cv=none; b=W2IoFKqsQAfpjLGESgKmWrCsQTEg1la0ywljsBHzGviN8DhIpkDqXf79B928IqhkAHeePrT0fUighy8ecMFxc0taucx9xmISnNd90I2pIW+j25/U42YUP0O008jdPbKL7tr8VYFcNyBT875N5AieqScXdBKfou4ON5l5YznV28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324690; c=relaxed/simple;
	bh=Tpg7zSRy62+j7kpS0ZdgFhzUVtTCoi/LUR1IuhM9Pos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QtAKA+6XtYqOyotQBEJ2XzmoJdeF7796f4Kh4GtDl+oXTqOH1VVoBRWj55XN5OJJ8zQwdzN8qPmhQb802lAgq6+FLpZ7O7owbm1yrw0rEMJYD7ULQTP4q+WqriE2I4avz6eT3cYyuPC9wgFuoNZ8RfCs+BHZz4EpTk6xhHTlH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yquk+dV9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaecf9c325so28872205ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324688; x=1771929488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seDpjvldkVh4x8HmY2iZCQm4/m99ewrE6bkyICaW74A=;
        b=Yquk+dV9Z7UDH9D00u0iDNqogbqC3uL10N5bBMNSYpeNWvlgUBnUhme08wM/c4+NmK
         rG7AQPLmmvJ09KysG4kPCYxAjEVVwfgF8zjFYzTsOSdBqqm37zH4a116XJy6rzG4OK2i
         JtUWP7JTOECxFNkl3KP5cAD5wms8JySE4pxHZp87NhQHvL8YwvrpOrF5PxDcDxexY1jD
         g9bWpmfBWGrKgAG7ycaIpXkTa1wSZ3Qh7LvCTJD4eS75D3/Ji119X93JQ/DLXb0Zqrl4
         U7kGQqgRYBP/aeo+gyHrlOYK6w64B5J1/blwInBlGHGlcRMxh+zAXHT3QKf2NSc4F5sS
         iXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324688; x=1771929488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=seDpjvldkVh4x8HmY2iZCQm4/m99ewrE6bkyICaW74A=;
        b=Yuq9CW8tF61ygk15jhwseIp+QARrLFOSMjPleHXekga0exwyfM/4ce6i4MPdE98Uix
         96NnlKWp8/OjG1OWvktPzhBqgSKMPEn3dmH0xIWXzq/qOWucicQ1vWYxSK3/LjUxNoQa
         q1FMjUgcBeSun9VD6Erw8zNrKGHhttamt0mznQyCaq7XMj0jslo1b5e6U19keo3kKM4Q
         y2ckE46KaG6n/jTpwjapLQtD9w8SAOfndfxPusCdSRvFgi1PhXY6qf3Jg34p2+ecfhfx
         1tUOsVpCnBTi9GQ5IwcypBmMx89Ty/MPymok8Mxxt1YLt7hDbYVFsmJgGoszyKcCOWMM
         6wpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTAc407KfxZn1/p8AWsT1lbcSDn9Ul9gXa/tgtXdWpmHCXGwKLp4zWRcx6ZTqT8uF/Dl6faYHGQFecuXy5@vger.kernel.org
X-Gm-Message-State: AOJu0YwH0NId38/PirLJFbM6aHJRvD7wxcDMLTBhavG/eOagsetjXorK
	/U9qVPbNSoKXRJK0qLfYd87hNjs8bc8gcRYaVsWW6xODbLzCqqR9c/x8
X-Gm-Gg: AZuq6aLQUs7vFn5FIAZn1+9B1llFEh82H82NLnebPAfKToyAc1u5D0Sp+HOsB/NSSAv
	e1SsbBMmF0Z3dVcAOlWPuOJolR60RawrvZUA7XdOfv98HgwiQt3STKLJeePSEznIHv0KZSnHkNb
	Bsk01tZ/Jft5lQmg+qhOcK75xESSqrv+FN9Nzesaz8U9hNs3Gu1TdFosSfjgdAAzufQhl4FSO/5
	bOp9qm4b4UZIhfKoGYFc8dgk7JwkG/6ARUyVHk+oTflnLq7B4pIE7nBFxCObFe48oORrFOZcBXJ
	zG/k8FNSguLwBsTBc31unJ3rSdw9O/h/mGsWqNI1XChX33MM4BUH08EGAR/fCacHVDeF1iILs7R
	IYGROQF824z0Q8SsRrnJl3xDw/o0dyFXCpgzes4TDkLChoRE8IXZB5J6Ew/VqJ16m3PuFAlkAYY
	kjwzKPcGXQtxyGItZj5FOgLZ8rnCW7j9SRLxQOolbXtHD/lO37
X-Received: by 2002:a17:902:e84d:b0:2a9:616c:1716 with SMTP id d9443c01a7336-2acba48df66mr115760535ad.26.1771324688214;
        Tue, 17 Feb 2026 02:38:08 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa21dsm94337205ad.12.2026.02.17.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:38:07 -0800 (PST)
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
Subject: [PATCH v14 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Tue, 17 Feb 2026 16:07:48 +0530
Message-Id: <20260217103749.1249718-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217103749.1249718-1-tessolveupstream@gmail.com>
References: <20260217103749.1249718-1-tessolveupstream@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93112-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,88e3000:email,qualcomm.com:email]
X-Rspamd-Queue-Id: A612214AF0A
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
index be67eb173046..a5f763cf1a55 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -632,7 +632,7 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
-&usb_hsphy_2 {
+&usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..cb32bfe732fb 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4319,7 +4319,7 @@ usb_1_hsphy: phy@88e2000 {
 			status = "disabled";
 		};
 
-		usb_hsphy_2: phy@88e3000 {
+		usb_2_hsphy: phy@88e3000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x088e3000 0x0 0x180>;
 
@@ -4476,7 +4476,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0xe0 0x0>;
 				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;
 
-				phys = <&usb_hsphy_2>;
+				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
 
 				snps,dis_u2_susphy_quirk;
-- 
2.34.1


