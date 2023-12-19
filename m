Return-Path: <linux-arm-msm+bounces-5433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04F6818FE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 19:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0867A1F21CD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 18:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBE639854;
	Tue, 19 Dec 2023 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bugs0VXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B93986E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a233bf14cafso375828466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 10:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703011225; x=1703616025; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/gQiQWH7JuxpXrFn9B5r/At8SMbG3sR7gWj3r5CLYw=;
        b=Bugs0VXjxs0yhCw5/MTLAtk4DGaucclMll2anT98GONra0kjGFta97QxHthbLvwQTS
         7eAEBgKLcZ+VG6TGniQWNI1cjkdta7E2LgA9IPPGc+pbDYubMpVaolFY9OBjmToP05mR
         l5zZETthQhsEAzxahkC49bdY6+DK0t94Li9Epe7qii1k8/KynY+4gFq/jLdfTAI9D2iP
         7DR3h7N+srCfBEcFBME3mqiWgrI1qOTk6jQUSAQxjqcdn3JE1ZCl05iYvp8KkPE94+kA
         b5uNKVPnGNta1jn/xIDQScCeTzqmJhCbV0Q2GBA8aCZRyU3z8bFQ7Rn04eb//x6rD45d
         vMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703011225; x=1703616025;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/gQiQWH7JuxpXrFn9B5r/At8SMbG3sR7gWj3r5CLYw=;
        b=iTPanPkDi2PTE7I1gAfB3dTuWArmZs3htWwv6nkMhOSx60clCB/LpgaObAAbhhon6f
         VX2Pbx6kECMtLmSBY7T1ga3PY+zAiuJL8H18TzGSgpTcHe5QkqhLeUH9qKD8sya+LRF7
         z29RF2xaDq+yEFM9uPIL5eT5OEaJ/ZDwI+suKUDu69zhwsTiNKReu7Ad4bGj9iaOJHup
         lZnBjV9BtgUZVSr0YUP3Q4gOixNti5z+o+29UHFxIQct04RMRnR79Eiqb448F5bx81XM
         KLc9mYb9AoyxKzYCoV1jW7ZGPPDDvsbyjXvI+kwq05S1Az/bjMUhMdDkMTpnPKv7hbY4
         vd+A==
X-Gm-Message-State: AOJu0YzkAKwHFuzuBQYZ3o3QeuAuvCcrRk9UmaZYWH3ILMIy0l5BNJah
	wJ0SXRZdatF7adg2UGk5Pm0r8Q==
X-Google-Smtp-Source: AGHT+IFN0Wq3GO9sFZqOhd1zMh76nlTM85Xzb0hIHxWySnrpw4Kso1pdQGTmMUtwhbnl8tZ7nGiRrw==
X-Received: by 2002:a17:906:c412:b0:a23:46b8:e891 with SMTP id u18-20020a170906c41200b00a2346b8e891mr2184373ejz.90.1703011225521;
        Tue, 19 Dec 2023 10:40:25 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id ay10-20020a170906d28a00b00a2534aebc21sm885692ejb.40.2023.12.19.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:40:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Dec 2023 19:40:21 +0100
Subject: [PATCH] arm64: dts: qcom: sc8180x: Mark PCIe hosts cache-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-topic-8180_pcie_dmac-v1-1-5d00fc1b23fd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJTjgWUC/x2N0QqDMAwAf0XyvICtzNX9yhBp0zgDrpZ2GwPx3
 xd8vIPjdqhchCvcmx0Kf6XKlhTMpQFafHoySlQG29rOWDPge8tC6Ixrp0zCU3x5wjDEPvbXWyD
 XgabBV8ZQfKJF4/RZV5W58Cy/8/UYj+MPlY2kl3sAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703011224; l=1321;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0zpKJ2KX+QQMRWFA8hl5nFLTwfMulCamY0GMxO7qXek=;
 b=Qj3Xb9+cenGjye2I2z4xkpSlE+NYzXbQKxX+9Hm4Fa8lGrfeNUG+zsN5vnBXJUfm99hpHlpPb
 QxteWYh3CjnBp3jMKTYCdSZpNFYNcah1bj3Ztvw9pVc9F1ZIqOD7Qx5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The PCIe controllers on 8180 are cache-coherent. Mark them as such.

Fixes: d20b6c84f56a ("arm64: dts: qcom: sc8180x: Add PCIe instances")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index fe761d6d0dd3..61475e56cef3 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1751,6 +1751,7 @@ pcie0: pcie@1c00000 {
 
 			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -1847,6 +1848,7 @@ pcie3: pcie@1c08000 {
 
 			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -1944,6 +1946,7 @@ pcie1: pcie@1c10000 {
 
 			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
+			dma-coherent;
 
 			status = "disabled";
 		};
@@ -2041,6 +2044,7 @@ pcie2: pcie@1c18000 {
 
 			phys = <&pcie2_phy>;
 			phy-names = "pciephy";
+			dma-coherent;
 
 			status = "disabled";
 		};

---
base-commit: aa4db8324c4d0e67aa4670356df4e9fae14b4d37
change-id: 20231219-topic-8180_pcie_dmac-b9d6d657bc83

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


