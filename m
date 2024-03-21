Return-Path: <linux-arm-msm+bounces-14726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B08857FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FF81F21536
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736EF58AA6;
	Thu, 21 Mar 2024 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbRERg36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6F58AC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019842; cv=none; b=bWQWfpb5oQXnGfnVeJqBKwif5dya8ONzXxJ3K705fqgpG9iGLLMwbAZgnOeaRt8e/4sy4ACJdR8FodbXytkA/gnDhjq8jPY/JihoEStSl/n2WP1Z6PhdL5JvqlV4ct2Scqx0/w68YTZciiUfjR4Pn2XDEm4JPZAJ8ceMrk/m1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019842; c=relaxed/simple;
	bh=IZvlsFRd/io8/lLci8Xst/yB1RdYXUKGx4G/k54i+hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqssOyiPZcTwaEJxrt+oSGC6C0Y7BrNEpYylK6KnKGfbrGLBDhTkvnm61WgobUEFEQ8xjPm7WVO0YoD/DNPL1m00x2x/9LnsY7VHK0x0IRStdehfevUvz5+DBfR+jf57V6bE2HbaOVgejTp9Jxt5JQegOZlYM2/pPYY16FTcUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbRERg36; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e703e0e5deso650844b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019840; x=1711624640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeRBNhNilcculoc8WtFmkZK+yb1tJsGxMndVAL/yXVo=;
        b=jbRERg36C8RU39k8wzBWxlMG+MbLHQFhYvOtg953nfnrvOAnUMbq4cSgr9OGGSl4jf
         xQ2KIRQ3lFcw8lZNH0L3kIyV+gquq+s+R7DDDY8HROL6iPONxIJF6Sa2EYolJya7JfMX
         IjxvvIpfzmSaHna8AldRQAoyhWkXYym6WmelXFdtHQWeZf8mcDnAfaj122KOqGn72stc
         9YAnFI88cC78tdH5BXH9wbD1dXC70ekxxmSA0xL29kL2CTytquXOHffRvst0f04uQ1wz
         qwUSLDIzkTPAoDk+h+6ZMKTWMEX8W67ZlkxrSGg7VeA2qcg3XgKRwJlBDmdAPaxe+o3t
         Rwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019840; x=1711624640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeRBNhNilcculoc8WtFmkZK+yb1tJsGxMndVAL/yXVo=;
        b=lVC97JAcBXf+PM+NJjvl0PIxQG8MEfxKmfyI1NioBojj+xcB9FzGLRFHbhutyJHqR0
         BBPIRZF+UES4BSzx/LkldYAeVIHhO+3ecJdEYw5m98UfXAXPkuX05j+NHKdfS+DSBPlq
         t6OfYt6OHqSO/NHb+pkXtdlbbuc2vFH6q4K31fmcNOyeBOWWoU7ChtVsG+ojPRzXG62w
         JvQt1Wg4YlyE9CmQyR8h3ID0utFFnNneyTfBRGJ8cYV2duzY4tuyjL8qwgnEGA6nTH8t
         28qINJhBkqnrPqlu0cEBtNRW7Tqm90pn9/yrZzQzAYL4GuQZTSL3sJk4hmstG4n1hNxI
         Qvkg==
X-Gm-Message-State: AOJu0YwRmROkZ+D+ajE9eNk9Y7+A/vD3LxxLywgApQWYJQ/dOCejqbYt
	/ltJN91dnds5InNoAee9Q/ZjAysYrHE61XxFJQFmyW9r6b3RM2oRGpCnvexbgQ==
X-Google-Smtp-Source: AGHT+IEffEAigH/PN0iJa0d/yV4YXQxqT6AwF/OLWEDIyyi4+0CLO6A5MT/YUixuR9+sY8GlR0H8ug==
X-Received: by 2002:a05:6a00:1783:b0:6e6:13a6:9bd8 with SMTP id s3-20020a056a00178300b006e613a69bd8mr1956235pfg.34.1711019840259;
        Thu, 21 Mar 2024 04:17:20 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:30 +0530
Subject: [PATCH v2 10/21] arm64: dts: qcom: msm8998: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-10-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=IZvlsFRd/io8/lLci8Xst/yB1RdYXUKGx4G/k54i+hs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcLJsmmf1/3whfwiEfF7DlWSN0HkR8ykSM8d
 8Js69Ai596JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCwAKCRBVnxHm/pHO
 9SD1CACkmq967TLg2byz+bPC1qRq5tQ5qN/x+8wAbyH2Qau2L7reKq8mbk864MkENvJK2czjMjZ
 7IlV1b9CepvCAhkU0NvpYirVHypcwafP0gn2LJ34/iIBvUXZzirAQdK5tpJV4vbmXoyOcDV21fv
 YPmcTz5SqqRuUe1ZPIIj2OILkzhJOp9ZAxpIrNa+98F2r8OfQyjR6QPuxOy3eXDzbcCPpdnr3QE
 hFHOeGO+R8rjhvJhcurR6pS6C2sgS8YxWu/lOBs8lJxbM112uUt1pGm8HRDZj72vdQfUHiKE8my
 0385HqAvEbij53Hp3O3juZzObI1ahRA+bq3AQpB43EtqnLvv
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 4dfe2d09ac28..d795b2bbe133 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -972,6 +972,16 @@ pcie0: pcie@1c00000 {
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
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
 
 		pcie_phy: phy@1c06000 {

-- 
2.25.1


