Return-Path: <linux-arm-msm+bounces-17298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3CE8A2118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C850B21655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273B63BBDF;
	Thu, 11 Apr 2024 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVaB5bcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752363BBC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712872144; cv=none; b=JzNsdlxgECsKGVZe8mdmdkrZBI4dCv8blgP5pGSq1gisQEb3d1dNEc/DSpwyhzPeZUoy65OXbjoJKjbNUUt3wozrJWl15wpMZ1DySIEzOplBwIvxKoAI3Vpk0Lm7TKRACUDkdpyQc31GLx3hTWGcRB3DvyV6yVYHcQQ53KajA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712872144; c=relaxed/simple;
	bh=E/yVWTwVFPP5DvA8MP/rXAZgv8UI29M4PMyVXNQrUf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WFKsCLbpFGjaYgQDEe+EZegI5Pc2olDnxMblx6Zv8fhZtDIcNU/yLhdMgJURrBQe0xch2HKgEcrcL6qFyvlq6K/lYH0J0mjsjKpsj9waGWySCqi4CD1vL/azjrnW5LCWwy/mex0n+OHpVWIjnQU2+T3oXanx8gwT2RL3oTebtuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVaB5bcU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d4d80d00so376589e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712872140; x=1713476940; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wU4pX8kZZHPRJnMOf0wCIETc2Kr41qCYwqid2curQuI=;
        b=fVaB5bcU3KvtxaAkZfj99jG2JkleBXEW99bYpmjy7V7HXq+Q6BkTGP0JNc447OB8jZ
         eVIVuh29acePkd1HcFOWj7cMN1MagAd1Hd9N90s73a9cc/WFhQLOf0+oB9c6p5ullhjR
         Te5O5tgJT2eKZFRfniXOmIiOiqQqWDMFqGmz/aop14bJ1roQuY7/oaP2PbQ9TGVoQb3z
         HlBM4BDbOjD3wDmF3y0XTAepkMmcVajunRi299VRCo35NFi+FTrwSLtGpKUBgjouZvS8
         Yu141mn8TP/E77mH2UD3Kt01MY26i1CBrhSVEELHGpRs+m2vjZWa5qHbpoJvjfBeVGDM
         ufFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712872140; x=1713476940;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU4pX8kZZHPRJnMOf0wCIETc2Kr41qCYwqid2curQuI=;
        b=aP6PnfoWS517P7DpGEyveh/tXxbDxIAjlKLbaXW1VmskvjTnPq8if6xyJtP1PfAYjY
         bkWEZ7viiQLV1/l2T5I73TGhG6SyfxlnNjC3yly1tnvLGsQSZXBeaYsecxT7jHaWPDaB
         Oc+84WXsMh8WxCDdtNi8TtHWkl9Bz8WgHY16Hx5c2c3ZqbzLaS0tvLQfWcEE90B13fVN
         Ml9pW80dlEPUwnEA6CzmT5fcNWmD4aRKIwDwMJg4nS/aleloKpcselEmzB6xC2WvAgAI
         CBVK9YsTcxxQwFuBnpVERH9JRKpquX1YWpvfRGklnAx/tY57hUY8DOus+HtssMhfupqv
         6sDw==
X-Gm-Message-State: AOJu0YwMyECZqdfJvEvxJ5E1YJQTdPzsJG/LjQJlsnCQpDb1WgCpxfBj
	BbQORlHatRyvbkYHZwzV5xHb/ll5j6NONf/pus7nai+1rKG2KMh1kzQhSZiyUwc9eETSSOZuqOF
	u
X-Google-Smtp-Source: AGHT+IGPCEbslEbq7ZBrXYP7lazis0E8Y1K7vtaVtKmKUBukwSSR7F8cZisrboU4X0OPq+nh2dRNng==
X-Received: by 2002:ac2:5931:0:b0:515:99f6:2ca4 with SMTP id v17-20020ac25931000000b0051599f62ca4mr595238lfi.36.1712872140517;
        Thu, 11 Apr 2024 14:49:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y7-20020a056512044700b005178e88b4adsm316983lfk.86.2024.04.11.14.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:49:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 00:48:59 +0300
Subject: [PATCH v2] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-enable-sm6115-icc-v2-1-12a35d5d4acd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMpaGGYC/32NQQ7CIBBFr9LM2jFAilJX3sN0AXRoJ6nQgGk0T
 e8u9gAu30v++xsUykwFbs0GmVYunGIFdWrATzaOhDxUBiVUK1rRIUXrZsLyvEipkb3HqxNOeGE
 GqxzU3ZIp8PtoPvrKE5dXyp/jYpU/+6+2SpToguna4LTVRt9njjanc8oj9Pu+fwFrWEHLswAAA
 A==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E/yVWTwVFPP5DvA8MP/rXAZgv8UI29M4PMyVXNQrUf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmGFrLZKgK8TZco8Ri/WLXXaAZIWu5MF1jkaz2V
 sbt4+WIxx+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhhaywAKCRCLPIo+Aiko
 1b90B/948bt3I6muiyhH0rpDB+4an6TIRYVEcp7J9O+ikxLe+Y/3dK3gVPUJVrGP9UISA4fV/sL
 iAVu63hxnge6A4RdSnS2Wh3ZJ4tGdg+nSCXR6TJe3ZJn1Qpg/gsO8lgAatlPp2J68Co6LUrxuZY
 q12C6R0VzGzrrXIy0SmL65TasveEyrCocnz360LyR6lR7YEGksVA61yZA4zqNFNSVcyE4pJDwdu
 NuPxCxFV2iQ7BWnQmAY2dQAfI3xkwHvUL2TUZIUqBKc6FTQ+CXi28+x6kQA7yoAZl06rrlZOzh+
 50c+tQ2yQgsSCZjkBxVb1+EONPFlp3pZhF1b+Kq5SfIkt/v4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CONFIG_INTERCONNECT_QCOM_SM6115 as built-in to enable the
interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
Building as built-in is required as on this platform interconnects are
required to bring up the console.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Change it to be built-in (Bjorn)
- Link to v1: https://lore.kernel.org/r/20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9957e126e32d..30e7598bd131 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1600,6 +1600,7 @@ CONFIG_INTERCONNECT_QCOM_SC8180X=y
 CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
+CONFIG_INTERCONNECT_QCOM_SM6115=y
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=m

---
base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
change-id: 20240409-enable-sm6115-icc-7b0b0c08da2b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


