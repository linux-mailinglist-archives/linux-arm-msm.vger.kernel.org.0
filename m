Return-Path: <linux-arm-msm+bounces-47638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245EA315F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F77188A14C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E90D264FAD;
	Tue, 11 Feb 2025 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPjFL57Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE70264F87;
	Tue, 11 Feb 2025 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303399; cv=none; b=ofBPSvKV2bsjzeNfm2UJEw1yJrVC4AP6FBqJnBL4XRrPp7PwhfO/6hpO51w65h0YyY83z4z6Cd6shznwShKPVscVs5gslfFZY4sbJTffhOBsb2msCrt6ynzK6kCrrvpmE8jOdMkJ64AMBl02lVZDs4BOySG2OIBrIHOXAI2pIAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303399; c=relaxed/simple;
	bh=cq8tFrVCb1aNykoTeBLp4jJCOLuNEBV67VUCnzQLCbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXSCJXTBMUnSe2sbYkZpLN/ksZsP16rZ91qm6O+m6eH3on+rHZ8rj9zYzFIiNw8RIdzQ9vT7z0b1nBCF02snLNWA6RHf3ZlPA9xEfBnmr2+MtVaXuR/FS8VNGVzdISsSRhDiZeIRJpnkI18QpILSmnhrcJGGVHeObtb4MFvXP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPjFL57Y; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f7f03d7c0so63522975ad.3;
        Tue, 11 Feb 2025 11:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739303397; x=1739908197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRc9q2rCM8c4Zf10NeRDZN6MvWjsDikBmRDUWkMpqhU=;
        b=lPjFL57YtvwZijFNyuPN5a4wOkH3eSeAS78Tdl4vfx+QpLFwWLEeSXdoHZUweCDjo8
         tWOY9mPw0ON6MvHlJtoZNFuy0USBhoiXcW3NEVXFTKYK6193sd0J6IseGoGS6MQd/BF4
         2z0M47jVwhE8Den8T7vmZY9zv+ZY67nm731J5popqdWZubrkNsZiPkSG1vK7NIPQqAi0
         gMDH2lpgtCKYZE3O8ciPujhNSpgl3bPJUNP8ti8iSRPAmyEFbBA7nM+prPXJTLc1lpyb
         QRp/ijfGHtSj4KK1swQmF52CYEze9fj+fyoFKpLjDsxDWawHe7vjkTarjAPjS9C8uuH1
         +dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303397; x=1739908197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRc9q2rCM8c4Zf10NeRDZN6MvWjsDikBmRDUWkMpqhU=;
        b=kzEovHA4GJr9wzwAHK+qNNa+bKB4VaBkegTSPd9KhJw+dLUAaA5FonagbIoJ4vyYbU
         WrO6uV6VWmX8FHSEpgoX+X/BhyYbAtLJ03xSF01XnRsiO81My/IkVixjACszOtEI3M3p
         h2dLctMyTHCIBblZ6vAdecOmX87OayJOR0FoF5DfDBpSuk7yq2YrzRCG0v/2g6U1ABHS
         ic1JhmCBib97o48T25LJoHuWLWSkNi6+kqOs+vPFhaYjnUl21t/FB1Ka8RRotfvy4ez2
         eMPg+fkFTp6caR9WdZ7Bgw3PZJONEwFTrDAPT1ciElix+x72uNqehADW47qIRUvUWL0m
         OsSw==
X-Forwarded-Encrypted: i=1; AJvYcCWcof1RKOAlxZ+ocYvvZ6WElkoqIz4F4zEN7M2B2HdsnRd2czQElFDydTJvFJoCH6c6ip6fKjvPeFHs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NsE+LTK2abhQQGOVSYzNvBr7Cqvq1LWJy/+phzEVofEDmcee
	z0j7lRL5YvfoJr7JQAf5hgToX6oqeNsaSTZE5OrkVVTkfg1IHgq32d6U0S6b
X-Gm-Gg: ASbGnct9nIjotW5NTlRphJV85RqSRF7RVnaJF8EerWy7tdjN+kUpeFopN6sc8alCgRs
	xH2Iqtpk++gdLePszThz9eLrufNvnGhjx5ESGvCm9MCTkykhyEiAjJ8QGXn5FWUBf0bakhauuKn
	y02BsC0VolFDWoqBmYxbVcEOHBlMC3MYyZ2kX3GujPtakoY++uRP5AMXjJKYxm+owXDtCPAgCm5
	/1c0/eWuTA7B4EL1zx+e7GEaMf46DfhapuYir6LU0SlOA3yav4/1zzZWRdxQeYvPOcYFAISJAGZ
	7X/rYH03uFHoMZBaMg3dkGFWzepUhYILoET5ZQ==
X-Google-Smtp-Source: AGHT+IHBwvlBBi8gnYLx7KCMhmXG0U45LgQeEdQaeXpvcGWhEhZ4zSSjtYqi8+nWo1Mff2MyaLCvXg==
X-Received: by 2002:a17:902:ea02:b0:21f:135e:76bf with SMTP id d9443c01a7336-220bbb210abmr9098075ad.12.1739303396896;
        Tue, 11 Feb 2025 11:49:56 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e68bsm99815035ad.169.2025.02.11.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:49:56 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 3/3] arm64: boot: dts: pmi8998.dtsi: Add VBUS regulator
Date: Tue, 11 Feb 2025 11:49:16 -0800
Message-ID: <20250211194918.2517593-4-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the USB Type-C VBUS regulator to the
PMI8998 PMIC device tree.

Key changes:
- Defined the `usb-vbus-regulator` node for VBUS handling, enabling
  control over USB power delivery.

This addition enable USB Type-C VBUS support on sdm845 platforms.

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index cd3f0790fd42..8cb1d851b5a3 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -29,6 +29,12 @@ pmi8998_charger: charger@1000 {
 			status = "disabled";
 		};
 
+		pmi8998_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pmi8998-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.43.0


