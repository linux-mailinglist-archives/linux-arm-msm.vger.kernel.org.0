Return-Path: <linux-arm-msm+bounces-21482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BB8D82EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344D3289F52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2E212D75A;
	Mon,  3 Jun 2024 12:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGkdIlS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5038812D745
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717419171; cv=none; b=jeHWg7UIPi52Rg140xj9KrlWMnFU72w+ht8cbtLJfBUObBoCHEXP/7FUTgfx09QFz7kWHndvdSdUR3OaihOykCxeoBjSOPZ9ImNYt0zDWzTGMYlaZDI+AQvWGi7E51rCgDNV4nmhmToVBn5RHrEBwdMQf83+EAOh2VpyOzR0oUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717419171; c=relaxed/simple;
	bh=7v9FKgUqKFbpR+fiy5xFQPfdqVj5LYeiTEIerHmnZCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Otn0cHnBw95f2+rc/rvEpdY0QSPSERvQP+eu9/3C/MIwc6UKCurx+9lnAHPL91ZRUR7iTHngA87zqtYrktxU1vd1YD/tj4PgqVpRgu7qix+1wIFCzpZB4xpAXY0XvYs2EfAiYnxI6wugLS0BBZevPwlsMYXuXxdEkb2h3hG0vvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGkdIlS0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b992fd796so1216969e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717419167; x=1718023967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTu5V8RnBUPKj0gRaqvuNUzSh+9gop4uU31wlbyxsg4=;
        b=EGkdIlS0I8XdDD3jNbZgR8rGXhjFZ4Vj04SA7gz2WayV8PvGGbLR1oyJhasptgWfcH
         H8cPOTBVG5MTlpn5p6s4AVwq2jvCnn4n4PdiR0PNTfD9XgWlILWXzbjF+K6JIbAvq6Rb
         lfDLidHFr4By/6MPWEZSBSn7HHa6iFlUgEX+oanMu7FPcZjWRS6eR8OVOWt+K9hFOSIB
         z9EfYcWNldxZxGZaEhFAJrFLzrwQUaSWYG+RMFe3JTiGULwa1P/Ct5p67vtPbMgVlUkz
         Pt/e/whwbEZ7nSNGvrIb28xgdS+Ekgo4lGzX70YJK/P7/PgmZkh6jqeEuUjP9wqJ4cOK
         7evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717419167; x=1718023967;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTu5V8RnBUPKj0gRaqvuNUzSh+9gop4uU31wlbyxsg4=;
        b=VIzmqAH77b2cHQhYEsBIh1uzC8Ymn8TTDnRPyKKCdFNAuapRIFHjSd31t3EnmiX+89
         ++l1Dklh2/zkE4aedp2T2pqzkTFaI6/spTxw6AsJS1iLFf1hVrYECwZ/Zoe1GnqWIEXH
         7Exq1sGNU0cMH55ZC0Dm2mzkb07UBHzaiKvp25HwGnT1dFCBIXVgy/Rkat3Wwt6lY3Bw
         oTIWTR5oidReub8kznqs/6gNBf8LKt30Gpponbk8q2z0nvxrDTUnJ/yXkVs0/LSBnxZK
         W/vzLIwcxbqn2yiR3flY5tdBNYWF8XYfCcxIfmmX/lDzIkvtujRmXoJ39oihkRPMzSIb
         rxfg==
X-Forwarded-Encrypted: i=1; AJvYcCXqj9RUAQB0Ph5tz1dS/1e7a8bd4OcrlCRr/OyaE2G9Sed+mWaXdyOETZ8UUb/XPShxnXpnjeVWsivLry7FfKEZdNC6U83ndqjQn4Z5GA==
X-Gm-Message-State: AOJu0YyIpjQ+aWhywivgTIVF3tzQp5jLRXF9MPtVlRzPzVfGslqA+888
	65Q6dRYwLEo/Svip86mPKv/bQ6MTdJzlE2X5PUSFGx2ttBcIwDO8tsVzWIxPdds+fmrTJgcvLCC
	a
X-Google-Smtp-Source: AGHT+IE1BEKoZRYDbW5hxVR1pX5u20qC6T3Vipt4QAhlPzMJacpQ0FKYnbjre5Sw+WPuPojCbFWiuQ==
X-Received: by 2002:a05:6512:3145:b0:52a:f859:fe4 with SMTP id 2adb3069b0e04-52b8958ba08mr5536679e87.7.1717419167248;
        Mon, 03 Jun 2024 05:52:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9a93d408sm295804e87.304.2024.06.03.05.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:52:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 15:51:49 +0300
Subject: [PATCH] arm64: defconfig: enable several Qualcomm interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-icc-msm8996-builtin-v1-1-3e3d1b0a78ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGS8XWYC/x3MTQqAIBBA4avErBsw++8q0aJ0rIGy0IogvHvS8
 lu894Inx+ShS15wdLPn3UZkaQJqGe1MyDoapJCFqESOrBRufmvatsLp4vVki0oaMk1dSp0ZiOX
 hyPDzX/shhA9ZdhGIZQAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7v9FKgUqKFbpR+fiy5xFQPfdqVj5LYeiTEIerHmnZCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXbyezRg2NvWoC/NVyWFt2Hij37OOgNDKwEMK6
 dH+jGLqhQmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZl28ngAKCRCLPIo+Aiko
 1SlhCACyo+rw+aQQ/5D9jp16CjycJtktp/q5cCsnW0GxjWkDu0sDvTxVmqBzM+xqGvuS4lTHBn8
 4zO25no5hGLgkei7dJluN9R7SXwQkMg9WDWEVM8CuDEPPISjgmN1C3hEP/DZAkvTQBIQ3lTRDFb
 sEW4sB48qBmToBC485tb6t38MqOHwBCc+eCeW9HXNRkHC72TnpitNQcy77V2FE4tYLscKFa1OLq
 2RvxoHZAn1oJWWz+WJXaZWiFNd6KyjBl03KS6fma8g7QpGvh9GKcEIeu+apSAEznmZ33JhXPxKM
 nbjj25IPZ93D99uVyeWbtwqI7UIZgPH62/NYohsxDu+/WEIM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable drivers for interconnects on Qualcomm MSM8996 (Dragonboard 820c)
and SM8150 (SM8150 HDK) to be built-in. Otherwise boot time issues are
observed on these platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9a467dec78b7..d4d0f8e05dce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1597,7 +1597,7 @@ CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8996=m
+CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
@@ -1610,7 +1610,7 @@ CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
 CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM8150=m
+CONFIG_INTERCONNECT_QCOM_SM8150=y
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y

---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240603-icc-msm8996-builtin-c2fef8752d1f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


