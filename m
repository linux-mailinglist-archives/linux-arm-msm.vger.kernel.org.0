Return-Path: <linux-arm-msm+bounces-14736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D9885835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401282812B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC33058229;
	Thu, 21 Mar 2024 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXganhnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1958228
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020232; cv=none; b=SLrTzq7h+l5H1gtNvd2CL502Rgiug7IF7wgnMr8Ou0Abvjtv/oxRR9H0rAY/rLgufip5D6mWBL7lAyHYooYbWjATDk7Yl1Yxe7FC7NabRfaogQ6jSrh0TTR/AdKj6sJwTMJAMYYOxR+9mi39l93aqffmcTjXuiuHUFXR5a6Ps7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020232; c=relaxed/simple;
	bh=KNeD+vKdGb0VsxLi94lHL3FMc2wc0erCYkHOY9W++kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfqWD4ZNQ+klr442I9HDo0WNokVAOpq0HCcAVyWCAzssggr5XIt+f1ONidZHHgRbqNvo7XlQbJh+IhAZjalfEqhr9UlWYeEUT32yoq+7Q0jXNmhbEsOvdMcAIFxQEj2UpIcv/DcCJaPqLG4FippDwjbtbkY29+COUJJXPsP7YSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXganhnL; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36699481c87so3063535ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020230; x=1711625030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdGCislf8Z9IpFRDf38hi8y6611+4ZWnhEYMybrgvL4=;
        b=IXganhnLioFSImkzhHL2n5o5jhoyDhu1KsWF9nc1E5Pu7wJ7YbcwuLG6XnJE7u6Tly
         69HGO7B4VsnXL9LJPF0sjuIxhX6jw+Gueo3S31OH3BKa60WEw5I2hAIXWVwZ5exGBSqL
         jFHLFon/j7hefTqH3D2V2o+r7Z/5/g4A15EVwcX3TxnFepnufMfCY0kzc+502AabV8+y
         ASMz8aWug01xzrgeTfGNy0XrLX8DIuhZENKcl6jKZuG9NMiajD/QhM3v7xFAGiPyfIz5
         s6436ky2TN3R5P8BiL4JO6fi2m5ggZfkwWzYmAnf9h4YXWpPGKa346Tco0gopAYrtBQG
         3bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020230; x=1711625030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdGCislf8Z9IpFRDf38hi8y6611+4ZWnhEYMybrgvL4=;
        b=FRidbDa2ZoIGVevaGiVnL/SeVta11MQ1c0z8KFy1oZVUJNY3t5iLkdNhH6pkCbWAF5
         IDohTa49Knmyu2To4NQUyGrSp8A5HYGWra5LIcw8hjPITSH5bgrsPTQXW5RUHIxGj+H/
         Vw/em3y+BCQ0Hq8htjoE+lVqtmrLaOnFCHEAMO52ADqg9jG9+PufGMXAEyYKPShKuMBM
         wbmK5Wm1M4PxPgXbYGjpYe0rmcW5OoKDKmuZ14+B9IHjK5OX+5KjQO78UzmQYKWBEV0d
         OSazKapEjf0EX7Kpu+JXdO7FNnRsIOyudCMVZ9MVSVm1cdN8GdI61czuV4ef2yLWaKh7
         oAuA==
X-Gm-Message-State: AOJu0Yy51pJZX6OVdOm2neGekARGaR0QTuwwgc+yJSq4HE6S8GxOlw7j
	x3xGD/vJiX742IxyA1O7P3O49piF4fTghNuDxYjquGng/GzEr4We4n6dqvhsRmrqoBGn8nh+Ers
	=
X-Google-Smtp-Source: AGHT+IF9qzDmCq6Cfjt+O35esUzJjLmKrVk8XAC3uDwrfhYsw0kCjKLisExS/p4pkJ+5NW88EKIt5g==
X-Received: by 2002:a05:6a21:788b:b0:1a3:560c:15d8 with SMTP id bf11-20020a056a21788b00b001a3560c15d8mr10026041pzc.41.1711019885906;
        Thu, 21 Mar 2024 04:18:05 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:18:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:41 +0530
Subject: [PATCH v2 21/21] arm64: dts: qcom: sm8650: Use "pcie" as the node
 name instead of "pci"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-21-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=KNeD+vKdGb0VsxLi94lHL3FMc2wc0erCYkHOY9W++kM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcOt5g9OhdxNj7ZCCVnTArwicbr9rHOF6gMC
 qIo2lm7M7GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXDgAKCRBVnxHm/pHO
 9QmaB/0RLvPezplRmiQXA/s6eUVGa8xi/W+sbYaUbH4LZ7tzCSqnYcEF+3BQkLm7Y7NJkX5FHMX
 Va7jaGmDNdL9uVRyxOijf2BKPkQj3OpsKHK2G0NfnhGJd3xTUVw5xb2WYB9oHOtPua6RfcOP/1q
 bu3eywAhZH791vfGn7P78IoY23GhoJAO2GjVUGYiBMi/wK9VQehp+ydNZqYaUfLYXWJFvwNPV3c
 jCEzgpKyz8j41K8ymON5E2zX3YQKF6Co8cvd31rP2/R3LnLtalj/xVJvBOOS1JkfOGpughduZ8a
 0blJ63nQSuQ4/5+jQQ+EH3kLp+GUlJjdK8kQ96ORUh3gMPti
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Qcom SoCs doesn't support legacy PCI, but only PCIe. So use the correct
node name for the controller instances.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 06d2b6432ab1..b25fefd6a786 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2208,7 +2208,7 @@ rng: rng@10c3000 {
 			reg = <0 0x010c3000 0 0x1000>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
 			reg = <0 0x01c00000 0 0x3000>,
@@ -2337,7 +2337,7 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c08000 {
+		pcie1: pcie@1c08000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
 			reg = <0 0x01c08000 0 0x3000>,

-- 
2.25.1


