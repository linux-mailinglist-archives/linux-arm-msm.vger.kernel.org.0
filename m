Return-Path: <linux-arm-msm+bounces-11969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6785CEE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519741C2255C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DCC3B2A1;
	Wed, 21 Feb 2024 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LThdpo/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC33B198
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486941; cv=none; b=ZnPO+tAmoj9kwPu9QnxFyBqO6xF91+i4pBHz2PNQ5n9KbBbPLmmH02HToHM+7mLB4qkNJZ+guITvZWHQZ6a4MDvk4sexMi/CkHhT3/5fzd5sUDqfHpFJW2c/chZARYcwkPFm42/6mSH3HrjrYzSA+OcfK/SxfrGBNzL5aBUM81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486941; c=relaxed/simple;
	bh=6OdqvnqpDIHcssx6HxD8cVyF7xhLIDSsl6jVQmAddoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWQhMbyFtL1FjctX5fB1RVhya2WQCmK9+/tZ0vzGTabehD4OdIk18Of9P/yGP1KgyNp95tN11OTRMpmFnBEilnbUAZslisJZY+N2jAkVcIWye18z19nwifuadXhFbBCP6eyUYt8DQ6QC4SI9XEu3Xg8t8ppHK3XAEqST5RbmNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LThdpo/0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e34d12404eso2893000b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486939; x=1709091739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DC+RBD8xa7z5+jHNAaczlNmwqvhjSg3R2s5n3RctooI=;
        b=LThdpo/0MqTj1tPiQWMd845noICP765O1jdq0ZCZhnkldJvjdyMpn0+vHY7pbXYXaZ
         4tUBClDSdj88aWf/8EaRZfnZrl5wOQWIThW64NmsLlgtumb6vVH1Ke5GtuKVSmeYMD2L
         78H2sEzBrG0+FZbmBMVOQ/5C2wPfMMTcDM7lTRhTMpeUUIDgPMLNkqVrvm+yQYnSQxiA
         gqmluaeNmlINCU/z1Nv6BNbeQec/vjPFMr27NU1wjGmRO4AymeeGaiuIziNS7YPHJutK
         6bskOTCFpYrcjnSH+Ik4qwRlv1l0SFfLTUP2qXB3nhgsOMzM4i7U4NYWaUXvScoPyohN
         JYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486939; x=1709091739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DC+RBD8xa7z5+jHNAaczlNmwqvhjSg3R2s5n3RctooI=;
        b=T9P+i19ySwkwWsOlRj1JQ+P7m1sxX/3Y59LTTLUO7TqAL4dp6Kc6xCuXpI9IE89PlZ
         +lGCD87mTp/uXDhiWiszTYe1uM0npyR6xZPlN1tmgA6HWDb4Eo+27qcETuWpOdxU/Meo
         UHq0kEW9cymGXnFeanJfyIETAg1klD/B48yYNurT7n6+ATHzQHyaR9Bu8B8I8EYIbtVE
         K3VxhvcwdfnGYNl1lU9sAnTeWbnlqVp3UFrOdc6M+f59dpLEA9sV6u1eIBls4JNl1coQ
         CVgK1Mnik654Wm/c6t/dDKEe+qhf06UR2R46OC4ioBpBQD1aL+vSp4J3si3guXyxpr6l
         M98w==
X-Gm-Message-State: AOJu0YxXiarU2n1hjGYYSjPSTAMxLnZst6lMs4rFszC69OdeFffBq/+H
	KF0W0nWHnJ3QwxiA06JypnXIhWRJt1WSSgf2n3bsFufh8DCCfTMSigmCIGTBxwjRxwumEsUyE3A
	=
X-Google-Smtp-Source: AGHT+IFa/xMO2wZNDRqa9l+Q9k9ekWwfTiDa5AaMSSMxyD0ucqUjwfaI0Euu6YN4Bucul6tAbB/FYQ==
X-Received: by 2002:a05:6a00:6a09:b0:6e4:8fbe:cb33 with SMTP id hy9-20020a056a006a0900b006e48fbecb33mr305615pfb.29.1708486939057;
        Tue, 20 Feb 2024 19:42:19 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:49 +0530
Subject: [PATCH 03/21] arm64: dts: qcom: sm8150: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-3-6c6df0f9450d@linaro.org>
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=6OdqvnqpDIHcssx6HxD8cVyF7xhLIDSsl6jVQmAddoI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEFZAe/t1aSotuopKDU6sQYhZIGV3GKq6Tmj
 7VLGBm9mouJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBQAKCRBVnxHm/pHO
 9TLYB/4lqxmDMuLB+j6HDWQjpGOBFU2Xy79ijVi9yBtEwqT41Hulx9Q6TAWQzcVAVZGQZl4YPU4
 wz9du3QN0nFvLPIjrUyOilzChk4URG9+aEvYt0VXpHX6uLZCB586Fq9+XigjqvVdAS5URuPiGjy
 hYLecLcic4antYMeZMUxujwK4EjWXhuSFL4Y1MeQHlYCa8PGctbzEzCe3T/5hxfRXKOggK24NEw
 MFQFhmo78dXD8ii92olMhSKvtp9bCZoGoaPAWFPs2qzOnyAg7Co++KH2zZKzuhAeIgbZOzz9mpx
 7eWHkU2EOhhtfUh/I3sC1oyYqc0W8i9g7tVznc9yPM2xtVfT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 761a6757dc26..c9c46ccecb69 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1885,6 +1885,16 @@ pcie0: pcie@1c00000 {
 			pinctrl-0 = <&pcie0_default_state>;
 
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
@@ -1979,6 +1989,16 @@ pcie1: pcie@1c08000 {
 			pinctrl-0 = <&pcie1_default_state>;
 
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
 
 		pcie1_phy: phy@1c0e000 {

-- 
2.25.1


