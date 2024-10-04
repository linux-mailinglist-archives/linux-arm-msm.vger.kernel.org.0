Return-Path: <linux-arm-msm+bounces-33090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D198FF52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 981E7B213FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9894144D01;
	Fri,  4 Oct 2024 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SzRlZEJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F113CFA5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728032808; cv=none; b=pnbt8fCq/KvEPcpB0/rVpY2n7BRCs1/EOwkLHY30zGDWc0xcdQslsGLLH3HMe/VIJE5pKU5JJIBGQaNJXA865j2hdGCVgd7jRMGjcnj/LWQ3uD1Xf3ifYNMw7qnwGJaECn2Y2R7QHDAvMXoa7ym1Hxa8TyHrOgsgA/PNBTtkIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728032808; c=relaxed/simple;
	bh=YcnxH6pwVZlWuJx4JlhC4U68Nd6Chk51DuZD9AleuV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kuiIao3/AzWGvJbnN6XewurmK1mH/AiiidPGAGU6uNsRUp7hU9X8KWYdqNjRWyDRAiEUc+Va7dnTcLM+egB2ekYaOpZfiTp1erdY4pBXZyNXZK3xfRWrws0TxSyCPII8YeNb1C5MwDwHKsgOAuymYP+Fg74dm2lJQfURa6yfw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SzRlZEJu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so1647326f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728032805; x=1728637605; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWXeQyRxHvPX0fhQbX5R25LT6MNkLrfMd1+Y6m5Df6I=;
        b=SzRlZEJuuNRB5IK+hvYQjT6kK31DeIx73e07FTPoUI7h+a/lWPMS6xvpnlRbYAxXre
         f2T7yhaSvrtTp9QuhkjCqJY2xKgHg+84txWn0sn0DSRMlMIFMdv/vS0wZ7Mywiv0ybRh
         dQLpgjZXxWdbG+mdzNfzib4+HCPYKAayprgnEYRGP+f5XBFWWkVDj9Ohnbf6vCLlhT74
         Z6ykmpJ91emTKkJdebSTh9k5wgjnYn00rwnBT/Sq1P890DiwbyEVzE74YS0DL76LLq7u
         rnyaljFJOMro6gmcau0g1omu1ReCEY7YRw4Z6ggpDmtD07eA8/bNO481tRzTUO8h+wPU
         svrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728032805; x=1728637605;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWXeQyRxHvPX0fhQbX5R25LT6MNkLrfMd1+Y6m5Df6I=;
        b=h4dsEny0oWOr6RwCYKLMe3ckLrpd/ia5kZQsQ/EujFKpvRZfIaO5HsxvC16usgOXTO
         GpkraJZMjPE6ZrGwNFKX9phMz6L4BMcjag5ht50W2kfKhqy/m9nuBkh/LYGRslCFBwqn
         4WPJmj5XJxzZfjGovqeoNEe0PYlJ0UaW9aj6IYDSQtmUf1ikS5Am7c0DlGfAKIDJuag7
         QAJ4CLkzFFfC11VzdHgScs12RsTohxlZ2QCE2MOpFgkUMTuwCpsDPJktuz4LF6Kpj6xD
         qde9DhH0zt1fJ55D6mclVHFG5DHH3oMyYIvkRc/FrQzFyiHoXCmKQXspA5bZFlwNKPWg
         KSOg==
X-Forwarded-Encrypted: i=1; AJvYcCWiNhR+nMHTRcMBrgEoQs7+OMUmpnIwXqv8Ftimn3sPN1lCAwoXClxkUPRvWvz8hXgbGzVkTXAbCY4rVzyN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdgvaw/Q7q4YBNTjSusQ1BnoN/swCxh9qCyK49tIg/1o7bRMdv
	I2i3koh097uwL+uniLBXu71Lcxus+C04aUzsE81I9nk8Vf4DREe+ty1NHF4Pjm8=
X-Google-Smtp-Source: AGHT+IGIFRhul/R6B8ZiDxLXa0zGSUWpMYsGl0icdU/9oUu0HqOT/5snNaObw85s33fzHKexS8gHEw==
X-Received: by 2002:adf:fe8a:0:b0:374:c8b7:63ec with SMTP id ffacd0b85a97d-37d0e73742fmr1815109f8f.21.1728032804886;
        Fri, 04 Oct 2024 02:06:44 -0700 (PDT)
Received: from [127.0.1.1] ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d081f7006sm2833945f8f.13.2024.10.04.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 02:06:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 04 Oct 2024 12:06:33 +0300
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
X-B4-Tracking: v=1; b=H4sIABiw/2YC/32NwQ6CQAxEf4X0bM12EVFP/ofhsAsFmhiW7BKCI
 fvvVj7A27yZznSHxFE4waPYIfIqScKkYE8FtKObBkbplMEaeyFjStyIb0YVdkvCXjZOOLfCV4f
 +3hPVGneVB+3PkY9c669GeZS0hPg5Xq30c49VU5X0Z3UltEhVXbJvHevZ8y2Ti+Ec4gBNzvkLd
 9wGRsMAAAA=
X-Change-ID: 20241003-x1e80100-dts-fixes-pcie6a-b9f1171e8d5b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=YcnxH6pwVZlWuJx4JlhC4U68Nd6Chk51DuZD9AleuV4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm/7Ad7B1YQMjMCcdawWM4HbT/w5V4iq0mlagDf
 8brgzkj7v2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZv+wHQAKCRAbX0TJAJUV
 VsVxEACIVzceQx5NX2x/r/fIgjQ7uAlpbUlmhCJwHuxBS3CIpVRGlDFb5HyZN+4DUzK5jAkdn6N
 Jma9TNklFqREMaATMET3RWHG+VJulVx/oSrWDTuz4L798OVqhvKUT9Fx0dc1rRQ8UF505y3lIvY
 qSKxjhoqDzSFafb3h9iFyRT38luNxhFojmOw8opexWh5BeHTkH5snazFgTCX8DlNpjKNXnaiUJ6
 y7sfPI5e9zBKVZ8QZtbkVp+SEQ+sFf6j1d9IGqIcO8LWpf1ccqLScVrTURKGyak2p1w4vnIdQHd
 JjoISQAubJc3+70qk3R2iBRHK0TPtBpliSiK4WtMgT0VayNPJlhtRcxr6739DgAISaE7uytgYgd
 88FeG3hzG7ydlrDnt5M9lzlXoADr6u/ZbVWPBkgV8G9HUI7+1F3X5GyrWetxMBqh/S7pNYUfSPc
 E+95TlZM6TG4cdTUVkiwGp+NlfBcIHxeMOz81nQO+r/Y64/5cCT32N3n0XZjhzqAD/evL4L88zo
 ztEMArIJjYdFBIFCVfx0qDR2A+uaQaC0sgtwMDyelFsn/5ijcq9tJcjI3zi0L7mliXkXpfU/JW2
 xxqu3OAHuWVwC14QGgryKmFDd/klaIPMyPNkuWhxdDROjF4CRU0yvRkmK+3xau7jlw3d09kg2Bp
 ojv4K2gSAqvnblg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PCIe 6a controller and PHY can be configured in 4-lanes mode or
2-lanes mode. For 4-lanes mode, it fetches the lanes provided by PCIe 6b.
For 2-lanes mode, PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2
lanes. Configure it in 4-lane mode and then each board can configure it
depending on the design. Both the QCP and CRD boards, currently upstream,
use PCIe 6a for NVMe in 4-lane mode. Mark the controller as 4-lane as
well. This is the last change needed in order to support NVMe with Gen4
4-lanes on all existing X Elite boards.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit message according to Johan's suggestions
- Dropped the clocks changes.
- Dropped the fixes tag as this relies on the Gen4 4-lanes stability
  patchset which has been only merged in 6.12, so backporting this patch
  would break NVMe support for all platforms.
- Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b5b8815eb41ec55e2e1e5bd878201..4ec712cb7a26d8fe434631cf15949524fd22c7d9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2931,7 +2931,7 @@ pcie6a: pci@1bf8000 {
 			dma-coherent;
 
 			linux,pci-domain = <6>;
-			num-lanes = <2>;
+			num-lanes = <4>;
 
 			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
@@ -2997,8 +2997,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 		};
 
 		pcie6a_phy: phy@1bfc000 {
-			compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy";
-			reg = <0 0x01bfc000 0 0x2000>;
+			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
+			reg = <0 0x01bfc000 0 0x2000>,
+			      <0 0x01bfe000 0 0x2000>;
 
 			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
@@ -3021,6 +3022,8 @@ pcie6a_phy: phy@1bfc000 {
 
 			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
 
+			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
+
 			#clock-cells = <0>;
 			clock-output-names = "pcie6a_pipe_clk";
 

---
base-commit: c02d24a5af66a9806922391493205a344749f2c4
change-id: 20241003-x1e80100-dts-fixes-pcie6a-b9f1171e8d5b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


