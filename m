Return-Path: <linux-arm-msm+bounces-14740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A4885840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2F381C21BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EEA59151;
	Thu, 21 Mar 2024 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuzGnQMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C158AC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020281; cv=none; b=d2zEqrg3qEbEQSlV5Cs+3iS2WIDTYtsQbhCjPOnvyTdEYzGlrci+gHew3FLgQ16JGqm0Y1tLTbvM9Ovwn5AXgY4fvhOO2xcrils0L99dqTxsuHXkSqZxY+1H4hO6z5ylKVHwrlkn19C+jh8kb705tqFIlwtCkUOD+TtvkWytScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020281; c=relaxed/simple;
	bh=JSxYNSwZyUXf+sG/uNBnaGpYsgIXqQ6uEzUtMXC11Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnfgXqHb19VvwOUxA5hLoGXps2Rbmi/Syzd36jIWtxi7Tklq/yl1xm6moXUa9cL5hX8enYVOrPo+ynfUqh7f+0WrLpFbKpc5BcgfcdvIwPdB+sUxlmk+SBMYIi7E1BTiOzx33q4OUCiDu5hVAb4LH/VyRONg6ZVtzaBgKXEssSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuzGnQMG; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789dbd9a6f1so65106585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020278; x=1711625078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DFL0n6uM1RWjK/gTquIUFnPYTmGA9Q/FVUWQCJfJOM=;
        b=VuzGnQMGmq37+3Bg8xQfZ8LOp1cOmkOwv4kAzkv52rlYe2aEWQIbhyJHfXh0MaLsLc
         lVsRVHbFBtVCu7s/6jYppAcLdUnPhSEM2O440W5r7OUMXE9akFRbM3IyBkKIPYUNWryI
         OFPOB+HQVelzDD5sjBboGLBdczbR57wcePRRypSbVw3lSvHUmZO9wovoEK7raMSZPe+H
         mYfE8vECW+ckzupTdieRkFVH2pQPsjPIfZGE/zmO9BjmciTCR4ktvlYSh3G2FY56+bJW
         YmG/OgrkzSdxDj7d2/djXxmfmV54R3CWq2Z5a0uoNq6ogqOSUaY7iv+eQeYTXUzObGVE
         LWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020278; x=1711625078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DFL0n6uM1RWjK/gTquIUFnPYTmGA9Q/FVUWQCJfJOM=;
        b=s3usCdJ4WUFzry9Isg+rJDWh5Attw8zLULK6ZLENwoKSNFkN1chX4S8417aFzvqEVL
         6SKqnjEkXyh+7bxneRS4rZuonbXw0h7+d55ryYPJ3lC7iFMmmDSFn3KQz0pevP5HYSuq
         vld30sDjrQHvOZOS3tRMasYAQR+BiNle1v8fIqcE8HfQsgVwWoDhwTxWSJskGs9KO9Jb
         26vv77ZU7uuEjUPBZIYI3qU4dKp+GValbcimtgjMMDMc2Kka1GpAKNJHRyM9+wpT7Wu3
         wrOSOFE/3PPlp052vDS7q6PO+FLJAj3ZeLBYtYDLu3fnhjh9+jdXMOY1fCwqsRN/Wslr
         COgA==
X-Gm-Message-State: AOJu0Yyakp0QsfVBB+w3sjqJAyV2Xbf2hdPwchfzzrCB6on5drg1q60K
	WIOdGcDPJ/pRKHfEboe2g4h7tAKdwGLxY8H8rua37wYCco83lSjWxOt3VZxQOt7bByN9ztqkJXQ
	=
X-Google-Smtp-Source: AGHT+IFnnfnUYQZH5pd7/YUgsJ4wox7bRd256T69ILjci7PbIhxOrPZftFdDT+qvcZ8eiYXZxjtzTA==
X-Received: by 2002:a05:6a21:195:b0:1a3:6b62:397f with SMTP id le21-20020a056a21019500b001a36b62397fmr2076350pzb.15.1711019805043;
        Thu, 21 Mar 2024 04:16:45 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:16:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:22 +0530
Subject: [PATCH v2 02/21] arm64: dts: qcom: sdm845: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-2-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=JSxYNSwZyUXf+sG/uNBnaGpYsgIXqQ6uEzUtMXC11Fc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcJALvhllgPxWyYG2RbYV7RcHMfPdLNxktb1
 PwME9FSf9SJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCQAKCRBVnxHm/pHO
 9Vc3CACfh0cbDFSipSCFGPlbj1SXAbaBC9s/ON4t358aRPbZ/l2XqcKBJ7mW6TyzlOfsWfev+GS
 ijBvvd98iL3tr5hQAw5HWyRMR3iNZCF0VtnJl1aXwZyLoJygs+5T0zttLZ1BFP3hpr3wik5bsGE
 f3PgB2fWPArDoVnCOxD1oPOV1XCDLWUMvFr5EhyRjg/nQwz3M6+7wotJ7Y3Z2iduVFGUk9FF3ye
 7kpqVLQZxZ5mvBe5iBu5XO9lXv6S7eZX8dpRTYNtFvnSw6E4D2x2hSzK/ZHCc5EVStQPnBKlu7T
 3eVdwj5xjwok+wcwtNvpbYSim4884p711N6X555225OA3+Df
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2f20be99ee7e..10de2bd46ffc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2375,6 +2375,16 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
@@ -2479,6 +2489,16 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_phy: phy@1c0a000 {

-- 
2.25.1


