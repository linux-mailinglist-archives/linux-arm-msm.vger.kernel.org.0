Return-Path: <linux-arm-msm+bounces-33685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F76996807
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64931F23122
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2049190499;
	Wed,  9 Oct 2024 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7MQGR69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FA18FDCE
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472055; cv=none; b=IV1Kwt2NxuKxcPQS2RsSX9ettxSpQcaE2u6AqqJnkps867Cndo9wJ5ijDwULdGWp8dRlErmEryDAeyRcxFQFI5+mIugyTt3ib7NpXNQJDFppJeTb+ZBxWSpriOfN7AbeZPoYEUtXNSD0YztiwPxjH95NLjQ9qBELqLKU+PYz1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472055; c=relaxed/simple;
	bh=ii6GfROU9ArrFjcWdpR1qIu/SeG4G9OZDXuOJJXuIU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ealjZhJ6BWQi14gp38ysmoRupcErgUBy/Ze/5OfnCTf4OEb7woxRpXE81mra1uKgYpPVsKZLCw+T6SsLZlQBcoEJ401LzcULM4533ZXLVDMi/GIP0OMHrEW2f7Wsa5/NQP31AyL8ubrETkBz2Unvf4ojD6RttbOhZeFbXVaDl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7MQGR69; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9952ea05c5so487501266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472052; x=1729076852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qC5xZXHruBUTfMPlyF7fUtQuDa89P4OUqC7YMxKyj+g=;
        b=D7MQGR69PCvSdiNKXzHbVmoEiEXxWrPSSdnV8Z6vKccWTLLWArnHL8JNxNt9TXsEnj
         pIgQUjfi9Q/abLhkxVey2ZoxNOVUbTy39xBkze1uL6XJgfgqoRGCSw+2Blv+JxJhFmM0
         lxbuy1GcXoirSvvA8cfyBQ+Md5Gsc99aoO4LHX5hRPvjXjx5b4M++ffAH48LeO7IIBaU
         VMXQNUZk/L+efOmBKQ+FS2R/cMP8sIptwa+D9bInmmMhLdm4xS+Fh2fxdXP+xAkOWu9w
         MvA7/bafQfpQRolZ238I+CEccZ0ldj5D+Rh87yccCiejWc3yAUO8oO2xjIacxrYiPMZG
         JK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472052; x=1729076852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qC5xZXHruBUTfMPlyF7fUtQuDa89P4OUqC7YMxKyj+g=;
        b=v/6omMZdhl3+DnwuZya+idBGzaIQmB72TjMr+0NhrRC47tGugXDCj16XBiJdYsbgv6
         dZlvPDZZzvKOP3Io46fa71C6SIyemqiUC8DcQ1u7Pb2nPCj9hoX2uykDZErC8m0F7Ira
         WcmrFBhBjwgfOgu7WMn2egTTzV53CrzQo2iQw478Yv3fM7Og1nMIrH28YZ+2IjWOHF36
         YHWPcsuVa1FA76cO1z0Ev0ctnXn2NlqYM6QxUAeLP1Ae9EE8I8apm5d9anvC/NqMq1hM
         WjEc7LwZlM23ybdZiNle5wwTXFxIm+hiCdMzBA2XKkZlO9nfZrDclwKC7hYFVXk48EhF
         jWtA==
X-Forwarded-Encrypted: i=1; AJvYcCUfdGE7DBAH/f74bTJrBrDCDi3WSQDbVOGnoF18zCy4Ic2BweJ4mtbYFperzWo4yFu5TI66C6DRigQ3g7vt@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjgMJ6DA5gVpMtvDCNExyorr9CF3axiXGkX+8qBCa1A/cVwnn
	PvcshTc5BKYY9q5IklPlfDLujsf7Piu483vFuynGBJWYOCgFClxFbDG5zoKjzLQ/lOpSn0f7cVh
	o
X-Google-Smtp-Source: AGHT+IGhVpiLHwqHc0CC0SliGgvD5yURBzLT+qTi/vHuNL2ufLFKFmwTrP+FPEtGv/VEq7sYbPQUTA==
X-Received: by 2002:a17:907:e654:b0:a99:585a:42a9 with SMTP id a640c23a62f3a-a998d117cb5mr181447166b.9.1728472052033;
        Wed, 09 Oct 2024 04:07:32 -0700 (PDT)
Received: from [127.0.1.1] ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e787eecsm635551766b.125.2024.10.09.04.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:07:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 09 Oct 2024 14:07:23 +0300
Subject: [PATCH v3] arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-x1e80100-dts-fixes-pcie6a-v3-1-14a1163e691b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOpjBmcC/33NzQ6CMAwH8FchO1uzbsypJ9/DeBjQwRIDZCMLh
 vDuFg4mXrj1349fF5EoBkriXiwiUg4pDD0HfSpE3bm+JQgNZ6GkKlFKDTPSVXIFzZTAh5kSjHW
 gi4Pq5hEtjxtTCb4fI+1zPn++OHchTUP87K8ybt1dlUbjgZoRFKCxmqraEa893qF3cTgPsRUbm
 9WPYqA8ohgC7fzNe+uMs/hHrev6BWQbnegOAQAA
X-Change-ID: 20241003-x1e80100-dts-fixes-pcie6a-b9f1171e8d5b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable+noautosel@kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2808; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ii6GfROU9ArrFjcWdpR1qIu/SeG4G9OZDXuOJJXuIU4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnBmPsd17EksgNHsxvLDT/1tOvJuFbgytOOAarn
 l8Y0fSNG+OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwZj7AAKCRAbX0TJAJUV
 Vmf3D/wPMZaogmU6Ff48lf1t2IP2Q6tuSUBLQgoKPxyPdxrEau4qKDzRFUw4mCfjDQrZFSa7Drz
 /T4VAcV2QnMFAcUmpmdJQXRL3OmGmrUog2Ii77Loc/UaRMEPVQrLnREwiOvoUx5D1kDlI9GjOmg
 +FnJBaufmiLB8s35ihNuju6C1LN9GXdYPHTgJ6hbCxHw8RxFDn/dbUy1p84L8Ia+1w2NiU9sV6R
 1WSYHmKNu8pntJfkTN5jiAzD3qlmbYqFeUsGDyhv3rv3EVqO+C4om6+yLhQe4RYDwBHF3dPOLqB
 eT1mHic42ZUv0IM6KBRp8t9QZsh6U2HWDtM81ggWOBUO2i/Vm8Pv44IDO0EVcLGKX5iIVPbPG58
 mg6vLjJJtx0JRelAq/Nijzv3rWoSPrVJfANV8opj3W13bE1pRFj3j0lJKUlO/0jhr3AUAed42Md
 gPVhRAfAEvzN0H0UDYYwxqu7z1+yiClO7K6rno8UUTVKlg0DpqzyNQnXN8sFMsBMUyFSuv/T32h
 M1Fzqb62LiWbreWA8CrrOaTv1qEiWqJF7cy3h2JbJhFMX6vyO4QmUHfAA1tXzSaen0CZEM3uj1B
 PCxslJulb5GPMpknGgXrP+bKEig4rBNrYuwAjJsNZCbnH8+mfWIJdAmAIpjjlcTIKXfTvFUWwyA
 PgmRc8ANIKpmWXg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Fix the description and compatible for PCIe 6a, as it is in fact a
4-lanes controller and PHY, but it can also be used in 2-lanes mode. For
4-lanes mode, it uses the lanes provided by PCIe 6b. For 2-lanes mode,
PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2 lanes. The number
of lanes in which the PHY should be configured depends on a TCSR register
value on each individual board.

Cc: stable+noautosel@kernel.org # Depends on pcie-qcom 16.0 GT/s support
Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Re-worded the commit message once more to suggest a fix w.r.t
  lanes.
- Added back fixes tag and CC stable but with noautosel reason
- Picked up Konrad's R-b tag.
- Link to v2: https://lore.kernel.org/r/20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org

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


