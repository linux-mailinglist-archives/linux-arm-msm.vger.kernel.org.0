Return-Path: <linux-arm-msm+bounces-14737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9119885839
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD14A1C21C48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3D958AA3;
	Thu, 21 Mar 2024 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+aaQwka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959A5823A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020252; cv=none; b=uPck71C0N51GH/6JxC6UZ2/iak1bwuqcSV4p78unkPhtZ4j/q1vPhL968VKACCv0CmLW4FbEsmN+gjQmTpDK05a/uRKU06MZmfsl24fpbKn30/V6ofyIh4KHO1mihjowkLIhtI85zxRpyfSpxXWV4mpHW0fQNhidvq5GGq6Qkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020252; c=relaxed/simple;
	bh=KMWylqW711t7MACsRbN1TvhF6nbAcTz/VLJbxkHR4gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8XKe2VHHC7vIHqybFxJGnrW4KuDcq4QRR6B2sIANMkV+v8EzxkNX1kbZ13r2s93Rxtb+x4hVI1JfRtdQpb2iF13mfBs+mtnn9zriAC8m6mCaO3pMycEIzwXWHyh55yzXsWyW63x/ZJKwX+SAGijWXb6qAVgS98hkhIuWN8hd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+aaQwka; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e675db6fbaso456276a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020249; x=1711625049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYDoji15P5HsiN/P0wTyX60zAfAmG6vlj4lO2mZaCqk=;
        b=P+aaQwkaJ+Tp7M6wPVi9T+ocd07Q461/7i3OJDDnHKEg4RTjVaSH2Q7TSEKWtCW8/U
         Csyvn4wFSM0Cqk7xcHm9i5WjdK52jgZOZh103Iss84rmjozels05CDBVi9c5E728rFdu
         sdOx9NKgfZv1SDEaSY6/Ocw2Eihc43XGetN7T76HpPUVHexx1gVFEWNFXjhYodsV+9F2
         ETYjR+Rdc78FF+sPghq0Ebnlb0gEmoJdVqXerB5FJFIvfW+dRoXNlysW+gjSDycxaTR8
         orCu1+I2B/d1cIgt2GGF6YhaVNZlwEPnZVQIQVxnX5C9yOEZ+1hdiQPXLhKL2F8q6nv8
         RQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020249; x=1711625049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYDoji15P5HsiN/P0wTyX60zAfAmG6vlj4lO2mZaCqk=;
        b=djmz5l1mMqhcp6zruasYqHRHNh0QlbCHZYQMcE/Ieu336k6YzFSb4U8qo10ibUs5Yx
         ZCSumeud9u0igZRGIAsHVubSj6lXsTuGunfC+Yf4SoQ535MfcsAn5J8t7i7BJQaV2bWM
         zjaLj6PP2km1WksJOXbwAONqpXvPIMti0JBD/hMqpAk4rmG5oTEefy4HOpa1lmRPrrBC
         mm56I0ozQfIJvNODaIG1dlxEZbJF+Od1VNFbdqXBZa5PF0lNsPgu2u3gX2YQRJGnoQaQ
         y+/Td+fCNatSbUEJWf7RzB6dILpqTKbltk0ikOcuP/wyBId7Gd/pRP51QiehTYG68/XO
         zN1Q==
X-Gm-Message-State: AOJu0YyuT8mJWPrjJnPWF+8IqXnrCCowfLehqpdgwCsjfzHmcLb8IJ2S
	kUc0aiDgEAbvaqaBxlrOdv2Ogv+RkHLTwESnotZQ4bDWI64IDg26r4fMGrUn90ZsspTbEyt7QiU
	=
X-Google-Smtp-Source: AGHT+IEPtkF9qX1leYPHNRDsFpttA8FXZ0PmY8cLC2e9jIid7J3TwoC8DsN/sCK7Xx/HgMkb1KyXkQ==
X-Received: by 2002:a05:6a20:1582:b0:1a3:64e1:b6d with SMTP id h2-20020a056a20158200b001a364e10b6dmr10529382pzj.46.1711019852932;
        Thu, 21 Mar 2024 04:17:32 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:32 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:33 +0530
Subject: [PATCH v2 13/21] arm64: dts: qcom: sc8180x: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-13-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=KMWylqW711t7MACsRbN1TvhF6nbAcTz/VLJbxkHR4gI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcMSC6ZcFxTragSwKQJPd9VtucfQCSDZDiMq
 0b5lht1HT2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXDAAKCRBVnxHm/pHO
 9dz2B/4zFUeB8rvtM8DzqBQbkRT4yKNFxGHi9RQpnuQYpw3H0Fov8cSnLGpDWf3zAm0ABaWuQ8u
 NitXa72HXSjRF/bxpamNtgy8nKgiRMCDbihGnAhjE8dV4AF623fSqLdEs2lzan0FFIE0LJ3C/UC
 sXH/e+NA8EVwgbYBhXRcBMkV5uS8oZEV8rlnwBcTZ5gKnWoehT56HCm/wXEAJIN+4I4MefHhbcu
 CMgssacecJIjBQDYJIfRlogjrJ4vn619b3iS0juhFtJ9pNUb947AaKoQ+7BRo7i14Uc5b7ey67n
 8f8vkhufueWHl+NKrCQbLucTx1cZgWgRvrwv20v0kpjIJGoQ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..322ead0389c9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1777,6 +1777,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
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
@@ -1888,6 +1898,16 @@ pcie3: pcie@1c08000 {
 			dma-coherent;
 
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
 
 		pcie3_phy: phy@1c0c000 {
@@ -2000,6 +2020,16 @@ pcie1: pcie@1c10000 {
 			dma-coherent;
 
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
 
 		pcie1_phy: phy@1c16000 {
@@ -2112,6 +2142,16 @@ pcie2: pcie@1c18000 {
 			dma-coherent;
 
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
 
 		pcie2_phy: phy@1c1c000 {

-- 
2.25.1


