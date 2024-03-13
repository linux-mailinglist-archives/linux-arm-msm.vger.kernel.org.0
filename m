Return-Path: <linux-arm-msm+bounces-13964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9987A0D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 02:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B6F91C2095A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8A0AD54;
	Wed, 13 Mar 2024 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pWHgqB9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6E09475
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293534; cv=none; b=VTh9/QP6uTgs1ANU9ZFMhc7QWMNc0RyhJLha84z4XWb3/YFOkpu2eFFZaroiZ321cPJc6mLnCylfLXRp8PxWwlUkbPYXwU7zvleJ0Rhq2fWw0IC3PD6YolrvA/MGlacrt6YYbgz/7lOnx46Is7GZkSTzbDStCRb8JpXHk0FQFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293534; c=relaxed/simple;
	bh=//FySGpGO0cREpxIBRgWQHcXYczpTi+P/0BqU+2e7jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OPGy8sl2HzPy5mwtopGiuLKqPJpoK2Co1uieJjvTfnU5F4B7SBImf8if1p7G7InjKArIgan/ycipxvjpYWmU6OksqD/bXtKdXLPrcSlm3fIR6y2ZVD1kNGuHBoeLOtaMF1lWMbY51l0w6doGMCVCxVwIRh0p9Nlj/m3IA9F+cro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pWHgqB9l; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5131316693cso592580e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 18:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710293530; x=1710898330; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8sPYE3Id0q+F2jUUBdvOq5McORmYxZJSi+RmXz3jcFs=;
        b=pWHgqB9l1Rxh2v90H31/OwfKVNzYEYFII4GCEx3KlLKFMDksjU5wuqA9hUfbox5zjq
         Xphru8tLjNcjczIzHJo3EVltIPOOhjNnuNTznsxk60yDkt/br9jKTYWo5A+6UJULOjU1
         R6yYs9iY6RgGrloWfZnlaRapCAaOHjqn/Bzl7yU4TJQd4l6icJnDuMuKAKetAJQgjExj
         jeaIYwhpjyhAKi++3MJNWBGg+gZ2x9AiTRkV0ipCIaXLZQ7nI+CVhUVOkZbQ6wufF4rO
         FIzgrsMar/FuhgXeZY9LLeIgefHqlFRQtxdo5adoDYXGXGbqHE35l45R0e1FVhIsXl8o
         4MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710293530; x=1710898330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sPYE3Id0q+F2jUUBdvOq5McORmYxZJSi+RmXz3jcFs=;
        b=GpX64ctEay8qtqHsKZy4X4/icgFrqavu7rYqdky6ssv5YzQojeyHa5BmEbN72ilE9e
         DVmdstAeFop1CgNBZ0JYss/aTJVfzFU5yNpvmUXdKYcr5gwpefeaE7fh/oTuuHdXi6Ac
         9Lw+O89datgSRC4Y07rGA80wswQSw43VgcZiuhJWdD7a/UHEkQDg4+9dIK+DyRZpODjg
         nlh8UIDIJ9ZCRPJNlokBrcxBMIRdHOjwE87fB0aszcWB0aMYTyN36mmm4O187cbTfiC4
         C3X8E75q5c8tizgLd8TJkew9oo3l/xZxq27ZrkvM4McFRqUmAIQMFJTInbUgg7xs6MiU
         QJ0Q==
X-Gm-Message-State: AOJu0YxIgQTJvYk1pG1IwMaHdzJsWBywLtT0FbBtUV7wBNNJdzFkMj+s
	kDCWWm3pQsAhuMEPFfPGN1hEy9dFpQ88SabW5pjaLX7mljN/Y8rzREgQVmaZeyE=
X-Google-Smtp-Source: AGHT+IGcMHd0ja05EglgHFzq7r0543vjbIAQHy1i6YHfA3Cuvad23qiPx2RoN03pahiWztSlWOR+eQ==
X-Received: by 2002:ac2:5989:0:b0:512:f6a0:1311 with SMTP id w9-20020ac25989000000b00512f6a01311mr3778215lfn.47.1710293530441;
        Tue, 12 Mar 2024 18:32:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j15-20020ac2454f000000b00512ee143d25sm397690lfm.105.2024.03.12.18.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 18:32:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 03:32:09 +0200
Subject: [PATCH] arm64: dts: qcom: sm8350: Add interconnects to UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-sm8350-ufs-icc-v1-1-73fa2da99779@linaro.org>
X-B4-Tracking: v=1; b=H4sIABgC8WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0Nj3eJcC2NTA93StGLdzORkXYPUtBRzQ0tTQyNzYyWgpoKi1LTMCrC
 B0bG1tQCHzQWWYAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=//FySGpGO0cREpxIBRgWQHcXYczpTi+P/0BqU+2e7jM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8QIZ/meQUjWJ/xvTENY/0qfGGKQos+aYzhbmK
 SPysyFsKwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfECGQAKCRCLPIo+Aiko
 1SfkCACYBI5lJXoB+2H6/Io4DoaKqJfQdoqCMBAux0DoKv64akVfwrWERRy3p8fc5dY9v+i5or3
 HNlUTtBjrE+Rv42cG/HxAfsi9SpO0/aONH8GCb73dXbwmeFbxBgHIVVHxibVLO6VECKM6iyPVxf
 Hl+e4LfWxPyvqcgOlejqQk4kPZB+lPd1rrC7tbP35nnR5SOCJ3Xtq0TMJz5hsoMAhLy1UNeO85d
 /YuTFb+u1m97+4O/s2fwGmYKDp/1aOHOX2rqcx4d4GRGCvAEI8WMZYzePF2nPfiLNGaKvSOhDPE
 OO2cAdLoLRJCaLXW2jmoJ5cwbTjOqb4cSs1RShyblfHk4bzj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

To ensure that UFS doesn't get disconnected from NoC, add interconnect properties
to the UFS controller.

Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a5e7dbbd8c6c..a878f5ac5bb5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -1730,6 +1731,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
 			freq-table-hz =
 				<75000000 300000000>,
 				<0 0>,

---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240313-sm8350-ufs-icc-0efd71951273

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


