Return-Path: <linux-arm-msm+bounces-11933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49C85CAC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF14F1C21491
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C08152E19;
	Tue, 20 Feb 2024 22:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOZOn5yP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D21C151CCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468359; cv=none; b=EuaTvFFqWL6l9YHcjn/Ox1iKgjH+M3stEv6WiOmz90PV4SFBTKb0TiqnnT7dEvvuWfWEwSJhHcJNVR6p1keaPtG5xd4WnY12vk5SkbWmUnUrAOYpKlKX5UetxmoVSDPeZPgw2ufAs6K56wgxTn8Hq1ajRynEfkWzyLs2ixyDZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468359; c=relaxed/simple;
	bh=QyOIt1OC5aenbMAqQ9ERC+S6ru7SsMKlT+Crdyg/cfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GTW75pQgQLVO1HRKdDR/xSt2IxFR0ZbklX9lIHx3PmuCZSK3LM43S/Yf9bdpAfIxTewxNSmp+X2vDglGeoxkxA3WmVgUS4UT8SqsK2A7Ic7xfmdWJPf4s52GLn6BVFyXJJLyRdGsEXsssjyOJHWSMEazQgbI2KWpf52ey5g3NkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOZOn5yP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512ab55fde6so4455149e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708468356; x=1709073156; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgtT6PN9/vb4CvMjcc7BrErQ70vOwDGBazNSNfsIIvg=;
        b=TOZOn5yPOz9Yk3SQg9Lt05o7SCsqffvXdMXSY4+OylN7hQdUPeKb90LxoXqdSX0wu/
         VBziEPptSkfOfbTW3ukR47Vm5gO5WSvAYFsLfx/f7zweDq8DC9HdN/0fYYYoU9Jwb4GG
         f0q6AAqAte9RcF94wjQ+PYZA20QqP9aMTeR/KJg3++DCRuokBwoefKraVILZ77vbtaO3
         3CfCzZ0Y9vq923LMdjxjBjgdhyjd+hSq3WTYnHxts838fav/4yT6+bVItcRburbt2c3e
         f5saz8ScqEAJga3vV7PphxYxRQY8brgEmx/TGKZM3Km6Bd1h3FW1ZzIVLYIm1trVCTbE
         3TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708468356; x=1709073156;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgtT6PN9/vb4CvMjcc7BrErQ70vOwDGBazNSNfsIIvg=;
        b=LlbhAZ9xwf3V5KMnRlPTFL6vcifs439U59UviZSBh0O5MNxgP3GrLby4jUtfRz6+UX
         DLgA4orSgroZOzh6WBVlr3h+wUlXMqZPJCCRiHQlr7bgBaYmUzzjLwT21iOi3HRr7jgG
         m8eL3Lynrxe3LAF25nfuNMwCboWn45YGCer4fZqUFtvUfo1J6YdF+onBu6urDENCvsXT
         JABbVFxOeu39X16Bi81f+jnUUgW2ZLZPB83cSW9/FO3F99UUKikMJiW25uZoo0pMvbYV
         j11uzD2/3BapSK8LekqtdQxaQU8pPxGoE0Fy9tg68RnFKBlj+G9i0zjhMGY484Jie+rD
         WkDw==
X-Gm-Message-State: AOJu0YyOxrDQ5NKgikRhnZtzz3/70+KLizdLWGuXGSNo6Jj3gppH8Mb7
	yBaBQSqEW+lPYc3bSc+wIiCwLrb0P2ykl9efQqhpf7tiayCfxmNP+gKpbxSQMx0=
X-Google-Smtp-Source: AGHT+IFtD5Mt7FFgm9jcoyrumPfMVtw/5l1TfI3A5+sL3d8mAIT0Qj17L/JAC9OGI8lX3OYu+IFXjQ==
X-Received: by 2002:ac2:5e89:0:b0:512:bc0f:b9d6 with SMTP id b9-20020ac25e89000000b00512bc0fb9d6mr3528507lfq.47.1708468355566;
        Tue, 20 Feb 2024 14:32:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g10-20020a0565123b8a00b00512b36ee2c2sm915968lfv.65.2024.02.20.14.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:32:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:32:34 +0200
Subject: [PATCH] arm64: dts: qcom: msm8916: drop dtbTool-specific
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-msm8916-drop-compats-v1-1-71acdab14738@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIEo1WUC/x3MQQqAIBBA0avErBtQkbKuEi2kppqFKU5EIN09a
 fkW/xcQykwCY1Mg083C8azQbQPL4c+dkNdqMMpYZYzGIMENusM1x4RLDMlfgv3WKee9dYN1UNO
 UaePn307z+37my6RZZgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QyOIt1OC5aenbMAqQ9ERC+S6ru7SsMKlT+Crdyg/cfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1SiCXqTH2iE3BwcffLxaUmrWah6isegO5dvo3
 BPV2jsh4iCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdUoggAKCRCLPIo+Aiko
 1T2lB/sEpMuP7te6sozIKHa8PSxnnGBERKeRJW3QtiKInmGCocoh1Ji9xfCmIGTnEt+Ky9Hxa5O
 JurJpI6nnNSsCvtZmBSXPyJvDBE+J7DU8zlFx2qa5mPz0tkoJ+k9O3GMou+xoyKcT5c6S9W8YxK
 qO6y1WIVt3gBkISLkZ54SASTOdlRwKgtOzkbsFnyK6EsUtLWR/N7nRwIMBiM2UVeW1HWUACDxjf
 4BOsIiHziUJHu4cSzda1rmL12ChW0H7Dbr++YOB/ojt/cZp1e4hypp+XEfo9WPmOiGzaETve/iz
 oj994kk2/ZX1PQBwYbpjMKjfkFL59CKXbjOMlWBwNv3Uiwx5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop two board compatibles that were used by the skales dtbTool to index
device tree blobs. It was required to boot those devices with the
original bootloader, however all users should have switched to the
lk2nd bootloader by now.

Suggested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 3a3e794c022f..7f0c2c1b8a94 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "Longcheer L8150";
-	compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";
+	compatible = "longcheer,l8150", "qcom,msm8916";
 	chassis-type = "handset";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index ac527a3a0826..c11a845e91bb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM 8916 MTP";
-	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
+	compatible = "qcom,msm8916-mtp", "qcom,msm8916";
 	chassis-type = "handset";
 
 	aliases {

---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20240221-msm8916-drop-compats-7f608aa48948

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


