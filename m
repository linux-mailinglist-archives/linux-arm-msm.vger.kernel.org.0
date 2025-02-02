Return-Path: <linux-arm-msm+bounces-46668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BFA24DDB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4034E7A1B18
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 12:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A8A1D8E1E;
	Sun,  2 Feb 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yi4uvw1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B81D798E
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498572; cv=none; b=hw/kAZJK1d+crsZtGnSUVCZdwjwZF1qcI29WiDYULAIGAvLlB2E0nobxpq8HLMxqW8l5X+d26eOCsOzcaWvUBAF8q8R8crrUtStKLm5e8J7JTiyy0b58qTs90XJ111gZtjGqQddoYNA86AYvp/v9bnfiYgdpjm1G4L+AHpGLh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498572; c=relaxed/simple;
	bh=XL7ng8U88IdS02LpqkHkwAED27Q7ZWUI6j1I8zn2UOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fel95y+6ajewCIGepu7Ln3yHkIUCfawJ27issrxK9SWlov8uPT+iSXnNvzHvlUc/LHE0NSQ+dAYUp1uwvIiTQPYI/hV31GTG7589pTNvwJj5JJShkAWDppx5C8zdOZ5ZRHeND6ihV0TZMPlcaWAtRj+8DOprHtd/fIT4mZJ7X68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yi4uvw1h; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000dso3545861e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 04:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498568; x=1739103368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uDfHhxafnqOPaFWheOWVq1hqVSH+SO7a7CETbeXIaY=;
        b=yi4uvw1hfcswZ2VQxp3nDkBa55RPmjGgBYmwe+CA+jXBHXVVMdlbB/zKmnI8qd5Yqf
         gJuglgJbb9RGXJmeutypPMJ2/DhI89YmWj3cm25dA0UdudeLUEU+LMz/6xUCTRNOynqs
         9MAAW7LrziYzckbGCdFONcpTDNLb2GjjQcfyJKsfRud3CuUS1dM10DuJKFgSz7X48Eiw
         JW9n10g57JucPHyBQQFugKeuGv8kGAW2falBzNMprDEFSO/OWSC/VpiSk+WQllJIHuKx
         7ro3YmL3hYuFnAYr1ZdzfxcJ9Iyy+5y2V3+AdhGZ9/daqpBdW5Ll/h2DN1aDlrneqSzt
         /MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498568; x=1739103368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uDfHhxafnqOPaFWheOWVq1hqVSH+SO7a7CETbeXIaY=;
        b=NGRw2VPJG/PMZivsTEUd4Dzj+pTKJuAeKB0N6ryr3XOALRVEmmuXX2eogQac8L1rR8
         xSJKsAODAozRpUSALRcNYijYD3q1TdOqwmu9N2XazJP1jNy+QbNyMWgceaiXJFT9avIN
         QIv653ygepzUVLwYuqAbCr8Uju/XGDspmxwEDf3lNJ8evcu65UNLyS655BfPq+vvA7ph
         EPTYG4qmPEd/zBMPMKNfK9o3WB2BdlDz5vK4ChaHkU0dFnbVW8f3KNs+VUZ2eie2nXmn
         v5VblF6/QvxdxXIGgrAftoupoOgcvjThNIlTOD7TWhxU0Nd0jyWEQJijgW7ce0fu/CGY
         NiEg==
X-Forwarded-Encrypted: i=1; AJvYcCX24nuomybsLlFXp2sTbdkAFwAUTsyR6kQMghl62Q5h48fVmL8L0fCTz/pjooBe2fMRQDpc2kq3JyiD/EUP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzio4DRIKXjPULlmlKpJWHLfBD86YMlQdrv4GDpVunkXW9abuI0
	RJULkT8s8CshA+9oi6mNADOBYChLw0nQs2WLtRn5qbo+lrjDWZxW8ynbx1bASWc=
X-Gm-Gg: ASbGnctD0Q22gmG/wiWbq6ie1ZiH6/HoAnDANBzQwZC6Qwb0Aae1lqKQnd9bigfjS0A
	aNHSjB1Lf++Ql1tGWZtJgJBvw2FlI5WGLIFq5SD+XRGWSPBPKG6szsDWZkn0n0q9PqB4Kea/1Om
	w/q+Fg8YGo4Iepce94uBxDXYFLaUf3Sm23+yDWarqSC3MQ6Odb35kvU/rG15bUTJGrgmqxPaWw5
	TDe270xYcU5LWcjf+W+EnJd+q4Zm9Y+IuSgipnRm2nC8oRHkc30bbfkcKfGdcjjpkkhG/kYbNu6
	fw1odthclVqCl5wP5B2regE=
X-Google-Smtp-Source: AGHT+IGkAqb29ObwLsStliQ3X+p82fx7N71ujUtJWUx9Mh0vkbbBSuYVWVgq/RcqBea9q4sf1SX4og==
X-Received: by 2002:a05:6512:2344:b0:540:20eb:80c5 with SMTP id 2adb3069b0e04-543e4c2565fmr6341236e87.37.1738498568556;
        Sun, 02 Feb 2025 04:16:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:15:58 +0200
Subject: [PATCH v3 2/6] Bluetooth: qca: simplify WCN399x NVM loading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rb1-bt-v3-2-6797a4467ced@linaro.org>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
In-Reply-To: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XL7ng8U88IdS02LpqkHkwAED27Q7ZWUI6j1I8zn2UOs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IBLOuD4AebbL9VEvX8M3u7zFk8VAl9gGNdQ
 alwF5QoryyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAQAKCRCLPIo+Aiko
 1c7XB/9loxRdO1eIDrFUhixVzmgXgsB59i1s7L7w88DJXzg+vTbZ7lC5QDBnyZP6T+XNLr3SZ/0
 qA+mMVM1Gu36R1ereCfMUgQCm3kfd+KCkYq1lQCjew5UxQC19mSU6UXmRQ+9QaY3iK63cgaf1ua
 PahJOxwqmNyGBi8BilFp6nLftFFiLLQzGorraEs2Lum8LOd18X1sPV6fv66Fhbp2xuFa5WsHZbd
 wJujrE8PgFeOnjtxYLt8crEUMwl0y1/b2ULnMKZ8rmfpwW/scXcH8HJ0PnTZFRNp6vEWmKYQHk7
 0RBh2sM7fMqwb3wWlJVJ5f0EgRDT6DLHmaiCgGZi74ajIrv4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The WCN399x code has two separate cases for loading the NVM data. In
preparation to adding support for WCN3950, which also requires similar
quirk, split the "variant" to be specified explicitly and merge two
snprintfs into a single one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/btqca.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index cdf09d9a9ad27c080f27c5fe8d61d76085e1fd2c..7d6b02fe2040ff16d9d62de683571e1e1900fe85 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -785,6 +785,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   const char *firmware_name, const char *rampatch_name)
 {
 	struct qca_fw_config config = {};
+	const char *variant = "";
 	int err;
 	u8 rom_ver = 0;
 	u32 soc_ver;
@@ -883,13 +884,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN3990:
 		case QCA_WCN3991:
 		case QCA_WCN3998:
-			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID) {
-				snprintf(config.fwname, sizeof(config.fwname),
-					 "qca/crnv%02xu.bin", rom_ver);
-			} else {
-				snprintf(config.fwname, sizeof(config.fwname),
-					 "qca/crnv%02x.bin", rom_ver);
-			}
+			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID)
+				variant = "u";
+
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/crnv%02x%s.bin", rom_ver, variant);
 			break;
 		case QCA_WCN3988:
 			snprintf(config.fwname, sizeof(config.fwname),

-- 
2.39.5


