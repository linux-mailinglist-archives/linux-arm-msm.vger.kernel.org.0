Return-Path: <linux-arm-msm+bounces-3563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AB80715F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD58DB20E43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C233BB53;
	Wed,  6 Dec 2023 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qi+zFd1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C124D45
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 05:56:08 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so2760906a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 05:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701870968; x=1702475768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmeVczC6Kot8sni16e+Ayovssumb8h1f89h2BntZbU8=;
        b=qi+zFd1pKs4/92DpWwD/AyAMTPXgXLHYFxbn4IXjI+2TBbNGiqQEkf5C+6BJQuc1AU
         kTvTJMToI54hNRMOb/0J6uw0jjU28rYmzck9b4wF/xRvAPWAeraO69xJPnolUA+O6Cn9
         C5p8qhPujKhTTv77mVU8JKH4/yrDlA6NnOzJz84Q8JVpxjtrd7aVYO9fpTRIENXmz3vX
         yEnYJwOU2+t+xvblSGALLUX29pG5ZDUdspXxlXcd5gb30mgG34rB/OZf3FHpg7mHfigl
         N5nHcluF3q0upTw9WIkYsNZC94QIA79CaRSsu7ZnX+UzIWH9yEXDb3COjUu4QDX5v/8o
         WtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870968; x=1702475768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmeVczC6Kot8sni16e+Ayovssumb8h1f89h2BntZbU8=;
        b=Y3+S9lGiSJTfcIhVSQkPJLS0gDJRIqdSYeXBprHbhTw1m/nMm4qP29w5kSaYbXRKLo
         Dt6AUcy56294u7AGiIwGlNpjTjzK3i6wvGxdCm84sSyx6igt/+V85KwT7YpydSwR22aZ
         5Z1fB2cPwEyVKqpERY4slRday2EJZShkn4+umgZgsabaXmMvYST+68yGkEOF4zQSrbgT
         j1lNVpGGArbteb6XcSKLRBp+GnOdG5A8otEZiNEKwGTo51OOUYAcPtRYZeF/zl3dEwzU
         IoL6nIjNItqEwkqlj25PDfLCKMUwzLa5iHls0OBXkm6kFhGS+2TOvqfFRfaaYpWp6AVP
         8I1w==
X-Gm-Message-State: AOJu0YzZZddGyMJcrAY5cF0NhOxLrXw09RVbUFFqqKhhOa0BhE2ODovQ
	eRBAjqQgXp9dGKtbTen5s+us
X-Google-Smtp-Source: AGHT+IEMtc+F14NCFOrDcgQa9/dMsC3lwjS1LLoH43LSGscYSP/Z2ZlNqN8F20DLDUreWf1jJt7lIg==
X-Received: by 2002:a05:6a20:e124:b0:18f:c3ea:2904 with SMTP id kr36-20020a056a20e12400b0018fc3ea2904mr662700pzb.33.1701870968130;
        Wed, 06 Dec 2023 05:56:08 -0800 (PST)
Received: from localhost.localdomain ([117.202.188.104])
        by smtp.gmail.com with ESMTPSA id n38-20020a056a000d6600b006ce91cdb1c4sm1366056pfv.188.2023.12.06.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	konrad.dybcio@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add missing space between node name and braces
Date: Wed,  6 Dec 2023 19:25:40 +0530
Message-Id: <20231206135540.17068-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206135540.17068-1-manivannan.sadhasivam@linaro.org>
References: <20231206135540.17068-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing space between node name and braces to match the style.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index d73fc3983709..8ba6785038fa 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2409,7 +2409,7 @@ arch_timer: timer {
 			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	pcie0: pcie@1c00000{
+	pcie0: pcie@1c00000 {
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c00000 0x0 0x3000>,
 		      <0x0 0x40000000 0x0 0xf20>,
@@ -2509,7 +2509,7 @@ pcie0_phy: phy@1c04000 {
 		status = "disabled";
 	};
 
-	pcie1: pcie@1c10000{
+	pcie1: pcie@1c10000 {
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c10000 0x0 0x3000>,
 		      <0x0 0x60000000 0x0 0xf20>,
-- 
2.25.1


