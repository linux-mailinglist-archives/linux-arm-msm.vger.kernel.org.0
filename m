Return-Path: <linux-arm-msm+bounces-11978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D285CF07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D2D51C227D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD94339FC7;
	Wed, 21 Feb 2024 03:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzDbJDWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3D3DB92
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486972; cv=none; b=uqawQY8YY/KUOqgl3zUNVIav/JuWhFDTBwFWumwFQ2uywIA82dCbJuHzeHultydQ9MdgK4kmsaswYXXyUq5epNaSf4/MbARaQvtHU1Sqtqg9lOZk2Mxz8hnfUwaD6HAQq+nG77XtILlTqSc0RXNU9UvU51pfSIEuy3NlLf3Eb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486972; c=relaxed/simple;
	bh=jDg64Ik0UeMjNVKN8Lt1vwDujMwEItf+tImLYKnCcpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXKfD0sOFMrGSitQj3FAlU8PnvZ7297xW5BLRFtk/D4z8xqsTH0v9Na0MYUeV8yMxNNdB1NYwPrXEibBcxhtOjZ8ecXfg20yUmeE9YxwU2uPwI2p8ExjxxN4T0geNzJPtYmkIB27WM8iR+678u1BhYp+/RG4ZJ8e9A9FLMSft1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzDbJDWB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e22e63abf1so2491208b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486970; x=1709091770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goXGE62aTDjJWGtQFlKk05w6SrqRlxIF3IWaRHzZxUY=;
        b=zzDbJDWB4CuhrjI/LlI7wsj0oLcrEpQDWUqJxkL7ZoyOSBazWHPOVwT9XF94uINyqL
         /7XQyk5PRcrOLlq7sxKFaU9a1ekyWiW5nVtvoWtKQlFwC2cVC4NkwYb1CZOrZ5iIefO+
         HnYman38dPjbZtkeydvLdkIarodbcYplMcddvZ/ilpOgSgVbFoRZxk93sz4JLyGT+myA
         BREK/ZTeow1rwddkXFbFY8ekdSE18Q4xtsUbhRLqdZJpX3mMDF4Ou5TU/2mwMueb0eug
         KchvacdAclH6mXGJVXCcdb4lu9qZNkykFu0wpeyEQhrF052i5XWg01cmibU/+jJ9fhSB
         zYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486970; x=1709091770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goXGE62aTDjJWGtQFlKk05w6SrqRlxIF3IWaRHzZxUY=;
        b=tJr3QtImBvMTzPzJxttHILk7Xd7U/c4bqQjWVlQB44zoHOqJgsAwqbe0GVGQC/fwVL
         nPJ8G/dPFQPMOwEIW+GY6pUsV8Hk0YwlW6g067wjTOnioBMK5/mTEPiz03PE+dzVL+2y
         ny5oPR/485fXq7pY0Gn1Pbt1RFf7oQ8NxzVQ7uWGZGmdMi/Tg0TFsrPLubT69yIk4+lj
         /jIWAtyAzhT9EaDrAyUQ01/n/rSPy09xPh4pc6YnUSJe3Z4q3MvjZTy78G5APA59DVRT
         h+Cnqzvqk4r6PfKuw9PnfGb9aPtYRishwZIRKXhCnD9xJ7F41hf3G1juglnta7EvqhgJ
         8eGQ==
X-Gm-Message-State: AOJu0YwwLWMu7/3d9Wdpt3hWJ+AxtoNLIFn2g3vJ0rmmU0tgUogWS5KV
	/r6YblBmWzNvpm4ZLzwj3icmsu7nMyMnHQnN5GXbU64q2uYC46GT7iVqAKhw8A==
X-Google-Smtp-Source: AGHT+IFpAr1ugeExxwLzVfMgClNI2Gx6RNtKecP54l3Ex+lFKT6f6Y5VZx+4+OJ3dx4eioOiBkhLCQ==
X-Received: by 2002:aa7:8a14:0:b0:6e3:b7cb:b105 with SMTP id m20-20020aa78a14000000b006e3b7cbb105mr7508468pfa.18.1708486970564;
        Tue, 20 Feb 2024 19:42:50 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:58 +0530
Subject: [PATCH 12/21] arm64: dts: qcom: qcs404: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-12-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=jDg64Ik0UeMjNVKN8Lt1vwDujMwEItf+tImLYKnCcpk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEH7hIZBiIec6UUgHERD/6NP9kOLXzqs8Jy1
 nLB5FgjRmOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBwAKCRBVnxHm/pHO
 9SdNB/wJflbw26aWxnoD9uhZdf+K1AjI9Gb7X0IvA5TIM5Yh7f+uTDP2r9EHtuWrGRY2xVXOpZj
 DWyk2+HEZCT6j00SNk93ddI9zMZOhgQBtbAum/YZWtE/Imyp5XlxzYQEcY6Aej7PcEX5NccZ87u
 71DN63dhQFS167YY2VFpIBXIf0fZ8ztdfaAatDD2hjBWqCvVSzw6ks8ytThpRYu44hdSbIKuOCU
 t6AJDzebPvOB1bHrI74BJIN4Hb0arVy8i09AarvFqe3584elOuaM+T3+ba92scydniqJUByDelk
 wP2NtSKpQmuSHO+5Mx4kdnlEWuUMU/q3HHgHUG/5bZPF5eE9
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 2f2eeaf2e945..80308157fb03 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1500,6 +1500,16 @@ pcie: pcie@10000000 {
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
 	};
 

-- 
2.25.1


