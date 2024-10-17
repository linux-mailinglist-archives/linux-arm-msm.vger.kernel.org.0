Return-Path: <linux-arm-msm+bounces-34793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8A9A2B49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C7D1F23B5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E67E1DFD99;
	Thu, 17 Oct 2024 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUv2pkaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC41DC07D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186987; cv=none; b=jziJpIgOTqYEltTCJse4pAS78RIOK8V1FxwvLTM4UJfzgAeH7vPH7K5BN7zqOEe6+yKIy+2X4v4RGR0u1zLIvuqyZyLInRG6Weq5H7xddJo5RzZpqa2RtbDrprRxxUOYyehL/ZoR1Ra2HlsHI0oUkjrjetgYz4UFK6cn7V/4NcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186987; c=relaxed/simple;
	bh=BoBjfw0fU/xy8FjiTHTpEHDtNOHCOcmc+T+HEPyrVxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mkNTCInlg63LIl3RDoMWon8OITN0CxUrprk3qQOeG2AudeefFqE9RmxcGrTWJ2bn5ZiUBYU0lQVTpzi85K9nqWLtnol9035dGHCzO67OsWlahQvXQtB3rcshB8DIU4kkGZvu94cU24AutJLmoAjpXGauz59jcwBoBDCquqiOvew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUv2pkaQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e8586b53so1975375e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729186979; x=1729791779; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aSUfPUctKuyVYotI8cvDlkFbLMA1IA5EpCMDOgbGlE=;
        b=RUv2pkaQzG4kiBfWgOpSQKGn8wO3g2nAWkNcoULzHCyOs70OZSJJNx7+jbBB/wLsna
         jACRHOqSxewXwfIOInm+9njOkUQI1U8n6bGHFRGAGV8aZeL3hGcnk7CTwyNw2ZWeOciN
         3Cvol+uPn6GO06DmBwPshkfFm9c23SYAYbZHOl7QReL1ZJ49jhBK7G1WHCwZB72rpsf0
         +0TSrU1E+xQTrI2bj3DuKbf8NWTx2dt6TMnv/78hZLLtG5/rw61cxcx43a6SFtC/fokG
         A4xgyUTkGTHVNhybXTwQesKCcj5E2DUeIJVpfUzzRr45fK3BQ0KDYzbOJKQ6bd31Ayhk
         uiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186979; x=1729791779;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aSUfPUctKuyVYotI8cvDlkFbLMA1IA5EpCMDOgbGlE=;
        b=bciXye/lA8MdZqrryhkqemx7UdjVmglGnEcmsRU/ATfaBpADJWaAUI14x1agN1BPdh
         uoA48ZboEHze5itVUNKwtHUL1rd0PgbkdjDwDSAHsvOh6Mf4ljyDbyjSc1XIu4OLZDlL
         Y/UWuKYlYTLZ/yz8u4N/pn9L5VbegXZUaH1dstDRV9zXAXFBhe+gR4JwXb9zGL8kGukR
         VF7P4pGKMmLBv65g08q+sqxOe772RTV8C2/sq8sKlMIaAr10LTw66ALMO/pQ2/OSRf7G
         lWESwtsl5K3/Mc1VoGj0hROE1QW65DICLEqSrXZQa6keY+kkOR1b5rPAYwTtbKrSqbTm
         77bQ==
X-Gm-Message-State: AOJu0YyhKiKE+7Xa0TlE24zTDSqcOgJV7ok0ZHgUuPcpqtxiHbOctK8y
	04go1L1PiEIlfWqPwiAVN8s5GRTfQTr6qEMCWdTiTasGmPhPoj+Aq13P6XUQ7sc=
X-Google-Smtp-Source: AGHT+IF9KKIW/DYFefPefzknNxsKitQDJlwcbCioVSRgFuiR55EP6VFEkcjHuU7Puj6K12qnGsd+4w==
X-Received: by 2002:a05:6512:3184:b0:539:fcf0:268e with SMTP id 2adb3069b0e04-53a0c6dae70mr1454586e87.14.1729186979187;
        Thu, 17 Oct 2024 10:42:59 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0000700bsm829835e87.204.2024.10.17.10.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 10:42:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 20:42:56 +0300
Subject: [PATCH] dt-bindings: phy: qcom: snps-eusb2: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-eusb2-v1-1-1cedd674ec64@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ9MEWcC/x3MMQqAMAxA0atIZgtNahG9ijhUTTWLSoMiSO9uc
 XzD/y8oJ2GFvnoh8S0qx16AdQXzFvaVjSzFQJYatNgaDYnQ2dPwpROZzrcxovORkKFEZ+Iozz8
 cxpw/EHLI0WAAAAA=
X-Change-ID: 20241017-sar2130p-eusb2-957ff135f21e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BoBjfw0fU/xy8FjiTHTpEHDtNOHCOcmc+T+HEPyrVxE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUygKNfypKjMR7XDJQUiq04vA630ffBe2jDF7
 v5eS2kYV5+JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFMoAAKCRAU23LtvoBl
 uBLHEAC/QDflh0ZFLAJT5MjcuUf1Nci4caRT7rDsV/qWRc2vA4a2i3hjPa4SPTs6HG0wjptJIv3
 ocuIOBwmB03dcId0JVX77rbgaO3bR6uO1eBFXiWS3KFtuENFMGAkUEUi3Kta6/YtF0JN0h3+9g1
 gb2guknqIjJI4a72qWDR3ue8tolOfGaEz6s8a/d88pb/VlYgC5KtZGyG1P24gpzQ5kULHOZoxrA
 Bs1c8dcEP8W7+66+9wYOiCoshhzrJ03mBUmIPCDfoLsBfPFj4GKFgQoNjBP9+Bql0Z9HrA7Thhx
 8mibC5CKd/7rS3v61fDbH+DQL/L3ThibWMnlZk42pCLQNlzFYc0KB6oPRM8bWX6ZUkm9YI1rQMS
 kHKluHWpqDmlUkdzhLudPty/HiIHLCz7LKc1yoVi0iOcU/zBT885wecvtg/AsoRoFre/wXhXPTo
 kcGUa0hDkA9fDbrmupLzRGXe/Ts+5egLw98Af9eiqqBuwtQSumxQK/LLL56ldVF6hnj+xAMwjBq
 go4a/eg/DybeWvvucrvl98J5IhNAsN5Cv7eiP5sl9/9Vz7nmfmPIy5fRXE9Lh01TVRZvEOYirIB
 UuvQ5Zc9c5jFVmhMu6rhrkpp9n8nq6FXxkFxgNV4qH64NNMxE00NPtT0XPlvM0btTaZyx1rlkah
 cgfM1bfiQV1nOiQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document the Synopsys eUSB2 PHY on the SAR2130P platform by using
the SM8550 as fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index b82f7f5731ed4a6879ffbdc1b970fdfe0557f944..142b3c8839d62d91377061ade3a7c400eb970609 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-eusb2-957ff135f21e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


