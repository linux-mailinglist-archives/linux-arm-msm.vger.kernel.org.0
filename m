Return-Path: <linux-arm-msm+bounces-21062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6718D4717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818B7B21A87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 08:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302CC14C584;
	Thu, 30 May 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWadpy/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339EDDA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717057921; cv=none; b=J2LYUIUv7WEqig5CJur39jim6wHGkXYEnKxHFsD1M05osIjnj16ivgRWqt7kxd7S7BrWoDZ5XdHZAE3o9P1cbU/gvQbG7Y2BdeXxlf9G76k8KsgGc631+VZundES/VzQQG4B2oSLFaOoytz//WNUsSep/oFMpURvPa7ZIf7vJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717057921; c=relaxed/simple;
	bh=zx0h85PqHrjH54orh/R1otbPITvp+AT6gJ83ZcfIsFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cDv49wkJwn1K8UdJXkvRWdTPwIc2hvXg1+LcEdCeBNUicx8+hV3QgosguYsUsv4pO5bTvgfCJlFqQ+RoK54D1ok/r1tvU6h8oGTqKxcY9OCqdGaipFqTETA8VA++Qy6/o5SbJoDBH6Q2mXMfu5McToCmLSVeKvCU0iyEFoJhQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWadpy/A; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5295eb47b48so654939e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 01:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717057917; x=1717662717; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIcxVFAiZUnKpA9brQ93nCR4QvMzGm/NAKU+gCXBoX4=;
        b=GWadpy/AIfmMcx0ErltSHFwy9XqBZmwll5e7YlTzGaqakUHFJQl2wyVF5WENr9+xp6
         vcc/mYCLv2AYW+of5AwTYHuKecr1qX3QjvBS78iDR8vZYAAFOzY1si/Ybx4B+vOfKh4K
         fRdTZvAnN90dIF7SolGfRdi2mwTcZZNx4BRqGJu+92JQqzKbbnpC4BnFibGK/UVNVy5L
         xwQn/BQwgRyZTkp9P/nF/3f5fqIy9mDLAw26QerSgvT/xw74JQ57u6apIeWJmwkWsceC
         GFz7slMGLNrHJ72mPpaHDtZFnarifjWgV/dDoyWXTEmykTfAfz9TWqYz73Vps8zxpIma
         w7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717057917; x=1717662717;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIcxVFAiZUnKpA9brQ93nCR4QvMzGm/NAKU+gCXBoX4=;
        b=gKnMueIvG4Uc2ogvK2e4tZ5jE1k/9HwjOGJAEPq/8qNEYKztG+wBb0aMrtWgkXKmri
         3BEOW1WIahirBQf1kv24jP03VBB9ewL9AyOwITOmAe+ThLI3WGRaEpW1pP/9aS9GWxa3
         Aqyqn6tUe7aPjuu9FP0xFDyWsjDMU6n51gJUSHc1x2fhaTOPm3MmqmDX7fpVLB8w5+qA
         Azcm9iLIeebib5P/FeXfBpp1qZr95qTstoluqkaH53zkhPddEistcZIq44P+yhu7jBTB
         Y8dxTVV5YMZEZ2Wc9NWGKEcSxwPf3iU2+jRHEQy9oPaEqAlnoTJRWbBfGWK/JMMmjpaq
         X81A==
X-Forwarded-Encrypted: i=1; AJvYcCU/MUgms4d5985eqA8WpzAgx2Tlr6MjwDag8bgi7unv+7yy4mGN9kQflCAVmppvlJPGgfC/hUjqWTfnIHJtkWuTWF01k/uEKWkAd/QY6Q==
X-Gm-Message-State: AOJu0Yz+yodxStsyvW4mDYSlMTz4jww+xV2BRUT2yGAc+eil3Q43aGi2
	M3SbPum79Z/YcqViMfj26iy4DLxS2HyOS80AtUCSGncGfAHiNi1mp+1ZJQOoMPKDoHPdJlWHbOz
	K
X-Google-Smtp-Source: AGHT+IHUxlXefm468NXPEedHeDnm6rlUtKYG/Jjlyow52jwYk9UYPeQkShIK/HH5OUbf7fgKZJi/ng==
X-Received: by 2002:ac2:43d3:0:b0:52b:5131:5986 with SMTP id 2adb3069b0e04-52b7d428401mr883724e87.25.1717057917563;
        Thu, 30 May 2024 01:31:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e887a6csm1486594e87.24.2024.05.30.01.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 11:31:56 +0300
Subject: [PATCH] arm64: dts: qcom: sm8650-hdk: remove redundant properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-sm8650-hdk-redundant-v1-1-c39c2ae65f3b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHs5WGYC/x3MTQ5AMBBA4avIrE0yaP1dRSxEBxNR0iKSxt01l
 t/ivQCenbCHNgng+BYvu43I0gTGZbAzo5hoyClXpAtCv9WlJlzMio7NZc1gTyRSdcOK9TRWENP
 D8STPv+369/0AXxZ8zGYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zx0h85PqHrjH54orh/R1otbPITvp+AT6gJ83ZcfIsFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWDl8cLKINaBgPU3cSzz6zjfDmudmkgcPRLtU2
 hI7O7eoQNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlg5fAAKCRCLPIo+Aiko
 1f/YB/9zK2IzTdPUroic0hW+8I1SgL/u4ScZn7NZT2oJhGUWWLYmuCPQ9gU0qd+u8IzAMZlWpw/
 quJzgzmHZTU96NBI1OToMXMCC1lMP26AGzL/b0EMY9wajTQSg9RlRtWjwyoB9CKy+W5qyZkbfDt
 sxdJsUYukgzJf5XLoAfd0+3doDwRv72t02HGjFPiaF2HNnfZ0+glbdSw93d094g8pkff0ETqB/N
 4bEHTnFWz1yaYZhe9e9oQQh8YvLMUshd1gC5TwAR8V9L6b46M03+lRK6q5+3Mx1aud1ZP9XU6TP
 OxYN00wOx5OpcFi/8BcEeaYCU4b9bP3CvDyJor8Wib9CiqJM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The coomits 65931e59e039 ("arm64: dts: qcom: sm8650: move USB graph to
the SoC dtsi") and fbb22a182267 ("arm64: dts: qcom: sm8650: move PHY's
orientation-switch to SoC dtsi") have moved some of the properties from
the board DT files to the sm8650.dtsi. As the patch for sm8650 HDK
predates those commits, it still had those properties inside.

Drop these duplicate proerties from the sm8650-hdk.dts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 7f2dbada63b5..182864a3b6bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -881,7 +881,6 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
-	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
 &pcie0 {
@@ -1220,10 +1219,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1i_0p88>;
 	vdda12-supply = <&vreg_l3i_1p2>;
@@ -1237,23 +1232,13 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3i_1p2>;
 	vdda-pll-supply = <&vreg_l3g_0p91>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 
-&usb_dp_qmpphy_dp_in {
-	remote-endpoint = <&mdss_dp0_out>;
-};
-
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
-&usb_dp_qmpphy_usb_ss_in {
-	remote-endpoint = <&usb_1_dwc3_ss>;
-};
-
 &xo_board {
 	clock-frequency = <76800000>;
 };

---
base-commit: efd5091e445509a76b0cdece7b189121ed6df673
change-id: 20240530-sm8650-hdk-redundant-00489e4e5fc7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


