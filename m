Return-Path: <linux-arm-msm+bounces-86973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70909CE9BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87DEE303E007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E571D5CD4;
	Tue, 30 Dec 2025 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM648Vtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214B1F419F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099787; cv=none; b=Kok3od3aoebzjLGjEmTnSEutCeIWAYoHZEXatcDO7pG15z18ybm1/S/fXyF40lSHSGqh9yAOKibyNL6oUJ3HFx0STswrc6ZdiDdMoAIdniEKu42frIHSpXJQaoAxHoLXsk+kiiot62RhmGtq6ctSgC/ZjfMZneOnnUUDOfSk0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099787; c=relaxed/simple;
	bh=6r394Mob+LFtOCTx4lU6FqOwIvBs+3MsnOMfI5H9QuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SMlywvBh5goAm4B76cu7Y5UFM301HvIYW6dGlN0R0SIfC1KqEyfGZ7T+QL9YFyN3EM5gZ7DMZjwlwt9zbhoizCx+VQAxlVIgzNVQaQtIUPtyevt97hvQzmjEAWmYdE8XiCPt+W8hdnWpCe3d/nTyRDk+hsD5b5RJbbMAfFpTPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM648Vtk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d6f647e2so160867945ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767099784; x=1767704584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vox6ENm+gIpnhQ84fERZMe8xO7tsinJqsSZTolOWNow=;
        b=NM648VtkZr3JefgSqkhHEkOJjRze5kwR5dchh+z6fNnBRV0ar10jQ5G1cy2F4jpNkA
         5jhP73FfuXRq1UHFdl2KL+SgK+gfeRlWSO887JA8sipngyJgnWGupdWBoiTCNYxg2kkP
         RljG2U8VCniMEoN7ZkZZ01BylxyX06O+Pqt8b8kHcbIKnSE1cLah9zanHkaU8axSi1X3
         ftNOPW0WZ1bpil6Rv9GOCTTRgJeozN0m9PqSf7QFSo9bd7cx1CruRQKWqjrg6gtPyFCI
         72NKvPzs7GU+39VwmG24niKI9Py81EfjgsAc9GN9NlYl5qfZfq8huj2/FyX0U+lkehDu
         z+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767099784; x=1767704584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vox6ENm+gIpnhQ84fERZMe8xO7tsinJqsSZTolOWNow=;
        b=QybAZu/teHbieylb+lz0swM5tX7Fq83r96n12oiKwKU+NlrGv3nj4xBNnVvqco/eWc
         yDjK3bJHjF5NQUYmwb2FZgY2MqwuHVzws+ZpaaU+g0JQCIFwldi1UxB1NSPkZ60L+HVG
         Z5CD0tzHsL4iqEXkrI2bUH7lDjzxU0jEeeGe3M5STsJss2PyyycvjBNRGUEXt8Kq+4iR
         kR6YkXvix3ke0/X8TpIEFsrr2nfaEZjs/4hGy6bjDqBaOPrrTFrHrChiN7GcAK0n+K38
         qOQIUhSPHFRm2b24h1Qki/xP7ZFE2HSR05//CRY7jkBRaVNI5dtvWVrgwCLRLaRdxajp
         UEzg==
X-Forwarded-Encrypted: i=1; AJvYcCUewr1zOV/qD462wqQKfJ2roNU1ClP0cYm54Cd/d/MpbbtIBDFBLppgtKGC9izCxXLB7TQ85uMnABenodgI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvlfzd/NRzOv+cSnMAEkWD+NSWipmTSeQw6Ri5sIKl6PpW+WYz
	AtQlHJznzrdTTxETvF+pT+ozcXmHUbnk6Kmse04FZ1iin16StiG4r2un
X-Gm-Gg: AY/fxX4MRcRi/BGvBZ5vHV46q/CBohF5MJAlBG8VSKg+lDdV7opKqRIabZ+sa5pBFUF
	MBQ2YbquHqR2/0EXMVGCaQ+3ZG7EnVYS55HS2C+dRumulC89ujftjuS6QQTiCEPDjDgEdh9DHEx
	o7MmImci+9RluuyNqgS82sZzYEl4eU2Xxwk0ubASmARbq+hr4ZOKYeFRC4/8+qKCFB5pSeEK2DY
	Lk0g9Pu0zo+UFZCZSSLOXJiNd16c5IngLt/3mc9gyqCsdA+wS4B+hXCa8yvC7pPMKOa/ssciEed
	a+Nr7ExLAJ5eTH3hfABdCFzlqJ8kyPv+GKE8Jnhdrv913q2DTPaSYJkkXsTrtQxwWpxAke7dn0m
	vy687/LPkLCKX2JxldYaJ1lnBCznxiSbrrTecHP9/xA+zOtaJv3meVAtOmVCrXWBK24PO1zBaKx
	OqRaABQNuKwcBvJMkVwugd3UImA5nWTCymuDp3
X-Google-Smtp-Source: AGHT+IEmsUfFk2CP/8VKsETWeBeKMQzF4JOLdPx5EH5QkeKX14htBdHD4xT5x9prCI1Ww5C9okvutQ==
X-Received: by 2002:a17:903:3b86:b0:26d:d860:3dae with SMTP id d9443c01a7336-2a2f2206639mr313744175ad.3.1767099784535;
        Tue, 30 Dec 2025 05:03:04 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm296003075ad.87.2025.12.30.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:03:03 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v10 4/5] arm64: dts: qcom: talos: Fix inconsistent USB PHY node naming
Date: Tue, 30 Dec 2025 18:32:26 +0530
Message-Id: <20251230130227.3503590-5-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230130227.3503590-1-tessolveupstream@gmail.com>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
and 'usb_hsphy_2'. This patch renames them to follow
a consistent naming scheme.

No functional changes, only label renaming.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


