Return-Path: <linux-arm-msm+bounces-47761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2997A3272B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 14:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 862E11625B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D31520C486;
	Wed, 12 Feb 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaSzHUhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9B20A5C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367110; cv=none; b=G2oF+qAdp0GTcOgMqDw+OL6OXceMjS3zL4+y5ZMDO5wnsv4sbQGSFQBaGsX5tObvTckxcVM+ymUSyEs+nqEL6jzFBxMAjzbFDdBngwXhqLN3BZjFguc1y6gmtvpfteWyHuLckVJoHHiRknk2f7GZ6yJJPDKvV4x4DFn7+BCOn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367110; c=relaxed/simple;
	bh=/rglsDZ8GhTlMGveE5GmqoA3xjI9/VvzmsZ19VBJr68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qmmy5f6VfT7OKlGtAtWMwU2lEvjcygjdDKQLcHOGUVTnjbChRyI6CXipFtGkXsBtmz3s02uE5Jq0rs1T9/xUznQMoDLathHH9GJQW4nWi7CO6zbZueXCbIJSBEfAwqjtrFKu7M80dZmSMF4uN0fi30TJJQuLQFoF2O68FH8qufE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaSzHUhi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so30728025e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 05:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739367107; x=1739971907; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFWT2l6cxEZTfYGYKoEDAUV31A6KjbPriRcF6pko/3w=;
        b=gaSzHUhiLSwWo1z8RkqDjTFdE+DXqJ7LaA01E8tbeLXMDuxKXlmZsTZZ7ZX3nwcxiW
         ou+XuqJ9xlfITUom/A5E0Ph0yuUBAxcjtAKCIxKUgd9YYHFgXujTqaMeAm8Paz9uwWnQ
         Ijy5I3ynyPpztNkf/6gLYe7kaKOBtBYFJ5JXQMBn2g4++DbQlA9zs3GTU5YSuPfPnto0
         SjNFt1sV60GVjCrCleaDbxrkOeuj8ZKwdLuzEMP5Fg8BVMVQaXuMHGFTlMwWdgcWc1xB
         CojtdUokF8pghHA6XAB2lQrOR44+vm4kjrpUYOnzd8QnY+lVYelh7pdLq6UyPMz+Uo2A
         IAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367107; x=1739971907;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWT2l6cxEZTfYGYKoEDAUV31A6KjbPriRcF6pko/3w=;
        b=wkr+hphTJ60y99nib/+4QHyd8xIW6VkU2UAN6h1D4ad9tYy4RcGU/UBn+dawIv7Xx+
         B3wO/oPo4tFc48KNZQ0zOzUGDBiamfT9ppODPB1JBfJrmMbZE5uiBPqwTPqHy8NZzRAO
         TYvhvQCaFgqysT7Euw7HRZQPq8e80a6388E9OuFUg8azfk4Jd3Gkl3cP2GD8/hYrXfeI
         frG/OOGYLQIreaE/3DUe5yUl2FJQsBbrgsFFlxRQzAo7VSbXjqk+2l4b+Jgy8zSw3VfW
         d10u/ZISVV+sIu9MqTqFl9YxQp9Tpf1A+t5xRVk4amd3yADpIVwGKlVJ2Hi7TJ/51rLk
         g+Zg==
X-Gm-Message-State: AOJu0YwJF6KcOgz9PY1I9kfOSsUl27Cjocv79xKLAQ82IsKd5xM1jqXY
	jp9U1SLDwTf32BUN4d3HH2lJLXBJzhPU3XkEzPSQtdvvSp1T/rvoUaFY5m1jjlE=
X-Gm-Gg: ASbGncsGQe3Rs6b+0B/ZbFU9g4+TJVMFL6CKgerqDRkJPghWJ7jTWoQ147wSC7syarW
	WVtADlBgcuaoWv+ItimyEDtHYj7Rg9hcHGEvUwilwJvOZVXJ/X6J9X8WJzhfmMhcPSSAMVBqZho
	Sn5wYfLv44pl4QQC0U9DnLmHW7hh995KEvv9vUcky68/flezgXppx1O3RU9vdzZyGbhpjeF5diY
	qIZlvDfBc8CsJ1KobFYZ6oCmq+GagoqKBTFOs13qMybqGhL1ccw+N/Bx2N9/Hcj/CbJUQ/gAk1W
	gLVnE6wLTMRjFyk=
X-Google-Smtp-Source: AGHT+IFVOqbGYSS3Hx83KOIZ/HJCQpIBPSu9Isb/2wOaOqV+ymw9h/1gRJeQeolHZDgcMwYOU81Wtw==
X-Received: by 2002:a05:600c:34c1:b0:439:44eb:2d81 with SMTP id 5b1f17b1804b1-439581768c7mr32596585e9.15.1739367106675;
        Wed, 12 Feb 2025 05:31:46 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f1f27e612sm1141985f8f.93.2025.02.12.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:31:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 12 Feb 2025 15:31:36 +0200
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Add the watchdog device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-x1e80100-add-watchdog-v2-1-a73897f0dad5@linaro.org>
X-B4-Tracking: v=1; b=H4sIALiirGcC/4WNQQqDMBBFryKz7pSZWI105T2Ki2BGHSimJGIt4
 t2beoEu34P//g5JokqCe7FDlFWThjmDuRTQT24eBdVnBkOmIkM1biwNMRE67/Htln7yYcTBNVJ
 6U3pbE+TtK8qg29l9dJknTUuIn/Nm5Z/9V1wZGa3lm62YeuNt+9TZxXANcYTuOI4v8bJTjbsAA
 AA=
X-Change-ID: 20250206-x1e80100-add-watchdog-fa8e3d23d760
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=YO147nEgujsniEgzEicBnXRIY4pIl05vu7cN499arDo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnrKK7rt0IB9n5YCfAXlrrkeaaQp0jVF5xsRG/b
 AiZ3NWXB+eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6yiuwAKCRAbX0TJAJUV
 Vu2READFfWmbXv831VqQUURkUB+zQNL5ZwQptawHo6j+mU4WH3tm/+COL05Qo8DfOMG31HAKDbf
 NPdkurr9SEL7tWjonJGqeIWEI7t5rBvsf+cd+aNap9SdpzCfPf4JsYT4NBXW18ZDo3sWgmX2EXm
 kQ5uW3JjA5SpMCEm+kld7qTIF/5mup/GJuHVHxkB9Kt4qR5JNvCcXrq4l7FDX2cPkvN4+q9fkxw
 U0O+ymP6s+7vHa48cXGMn9eHVjLkxcyXPmHoQOAa7CPyyfG7IvsIEM0aZsJeHE+T8PWc6lfjYgV
 sXuhwKFnGZETZQuj/ffrnAmy4Avjshk3Y29kSaoP3A/TCpoNH6jDf2b9ESL9l0CzhofP95njJI1
 QSS8gY67tglLNLzJXhbpCpFHGb3jjVJ3AtntDFTpR2bXbjiu/IQnLZQeHYwjKkAipcxgtJDNfRt
 3Paa5pZggXnCtR5srT+ThkAI4jMkvLPtTyx3mnvlsb9D6CyoTOmq9xKsYKl73hs/f4jH1PaI0gC
 +RIU+fI5beSkrCZVsDqg0OGvoOygyHn4LqKN4Aq4Ym7yXRWBui1G14RG3RR9iUWe8baoHd5HDxZ
 6DDQUNoXXwTCpNzKtYcac6/Qde03cTguSL5R316yuuTu46NmofQEKTYDx4L4mLl1P9PFryLhKGj
 U8YuLPmE6LOrTZw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

The X Elite implements Server Base System Architecture (SBSA) specification
compliant generic watchdog.

Describe it.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Moved the node in proper place based on address, as Johan suggested.
- Picked up Konrad's R-b tag.
- Link to v1: https://lore.kernel.org/r/20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..766f1f996baa8a0f78485431ca46f484e0facaec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8142,6 +8142,13 @@ frame@1780d000 {
 			};
 		};
 
+		watchdog@1c840000 {
+			compatible = "arm,sbsa-gwdt";
+			reg = <0 0x1c840000 0 0x1000>,
+			      <0 0x1c850000 0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pmu@24091000 {
 			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;

---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250206-x1e80100-add-watchdog-fa8e3d23d760

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


