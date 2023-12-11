Return-Path: <linux-arm-msm+bounces-4247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5680D3AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0428C281AF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F47A4D5B3;
	Mon, 11 Dec 2023 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/HElSps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C736DBD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:24:22 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6cecb004339so2361049b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702315462; x=1702920262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIO4WNjR5xVb+yTIblaWghN44VQDB2yiwlWnOskO7lQ=;
        b=X/HElSpsabf/JSNO5yuoYy7tmRFjNqnSfKB8lq23BvtLoaEbQ/DnSu50VHbA6BR06L
         zs4lopBJYqqozWHk4ZG7iIlZrboP4B/mbUauspaHlcXlE+edktmPncm1OwbnRIIeoAsB
         diaiK3kW3ZaDM8K5hpS1RA3CGqLVhPN4IIkSUQIGc0OrEmvHqe5trqyaCcRu7L1f+/5l
         IngXVePIRNX/D6PflAUXWB/KYxx0aHl4MH3j0D0LvyQQOF547Bdv24qJ+xepqhgQJTQy
         t7uk1+1HopMXTp5RN36HOFsjz/cPsOVtUsh1YpjagZsaDtsvuqVbuClbln1kfwPDVgLC
         FVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315462; x=1702920262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIO4WNjR5xVb+yTIblaWghN44VQDB2yiwlWnOskO7lQ=;
        b=OX5Iz/M2vXoCoVQMk9A08PHsyzz3/A/bhAnfNNCMJJNndYVzIG+cbqN07pVorMs21U
         gT2tbNA7gUnAdENLRy4kroY2Wus9z9sV7P4rdAWFYEhmIzaN623pn29s9Q1z9EW/jT0Q
         7rw9mDAEKZ1DVYpEmC75ryR/DjQ0G4CVeey+6Cf+sR5T4JuD3T2u7kIytlnbH4F+HUJF
         /y/t/kBHHoeNgdHrMx92Mwl+0wCANtGipT/k2GFx+j9PWS2xAmR2fv9RnotSG51/SEMo
         Hj4ocLGKnURtHg7VjLJuOTQdpF0JOCsziu3mTrGrXHw3oUWAlGrBo0fHdfYhhUiantco
         SOFA==
X-Gm-Message-State: AOJu0Ywl6yjlS8ieB7DRBg2JqtSonbbt7/iq5mJoCs0uG0AA9fwg5irv
	hoeVkJd6iZdW2BqIUsYG+EIp
X-Google-Smtp-Source: AGHT+IF/o7tMygudcvDEgvWVGduVd5AMvlcE/EGogBR8ckxyLh/FBo/ByXUkDPmqNZldCt3kozHQaA==
X-Received: by 2002:a05:6a00:1b57:b0:6ce:f78d:b376 with SMTP id o23-20020a056a001b5700b006cef78db376mr1612136pfv.7.1702315462108;
        Mon, 11 Dec 2023 09:24:22 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:103d:670f:7d18:86fe:2cd9:84f3])
        by smtp.gmail.com with ESMTPSA id r21-20020aa78b95000000b006cef5c09ca3sm4495255pfd.147.2023.12.11.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:24:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom-sdx55: Fix the base address of PCIe PHY
Date: Mon, 11 Dec 2023 22:54:11 +0530
Message-Id: <20231211172411.141289-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While convering the binding to new format, serdes address specified in the
old binding was used as the base address. This causes a boot hang as the
driver tries to access memory region outside of the specified address. Fix
it!

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: stable@vger.kernel.org # 6.6
Fixes: bb56cff4ac03 ("ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 2aa5089a8513..a88f186fcf03 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -436,9 +436,9 @@ pcie_ep: pcie-ep@1c00000 {
 			status = "disabled";
 		};
 
-		pcie_phy: phy@1c07000 {
+		pcie_phy: phy@1c06000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
-			reg = <0x01c07000 0x2000>;
+			reg = <0x01c06000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
2.25.1


