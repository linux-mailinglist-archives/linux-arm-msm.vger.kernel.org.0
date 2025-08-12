Return-Path: <linux-arm-msm+bounces-68723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E517B22371
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18FB37ABCD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF182E8E0E;
	Tue, 12 Aug 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn1syRau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C282EA159;
	Tue, 12 Aug 2025 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991669; cv=none; b=Qn7Ehgdt/5gDaP81mSkd8RinSOMnNa5hIxsd+Vr4txrUKFxVld1UzN/PwE2RqERt/T+Vo5zr2uu+2kNIf4jQGCW13s44o9DoivK2PTgK5Cl2JOFbUNQXAdAYRH53vJVUlWDVtuM/v9UBld9zdBsQz+jgb7HqLQ0gQ6uQJh+QLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991669; c=relaxed/simple;
	bh=WxdzXK3YAOTqW2iHzWH4C5OHmcVhF52Qve2iwP24ylw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0xBAlb/luM5T42Rp0rSXz5s0FYavUP+DZjUVsDHeLHEb2YeHeZqSk4eq2qNgxEuABUx7/O7OS3g8oUQTZlEi2Ss+BUEriVP46CS7zZv6wFkUJ5EzjlHDyXioIaleDZAmxKUXa4c12U3Wg5JovH+J4eLlj0tSENQGYcdJmRcZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn1syRau; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f02b6cd37so5514917a91.1;
        Tue, 12 Aug 2025 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754991667; x=1755596467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEPfsLZTWTVMFk6wTWa0w6a0o68+CFAgBUbGVWWCf4o=;
        b=Mn1syRaumYUTGHo8n/ngJjzoz4TCmWKXt16eDq2HvZqzECnbyjFTr0R7i16N7xd1Ux
         YY9Lr9N+21q553/LABCKMgLMs+H5lqvPMhSBvDRTaoj/p9zoe6ON/js4sNgY7hHuzYya
         WqXzyUSKq3rnppU5DKoQYSgnzPUuLPo170KHNvcTitCDWeMiD88iytEL4wLdCC1CEgWA
         TN4Fbf8Tjj+faZq5VegswtmqLTczvrkuCoO6EuZNyifIEYXPKEnimMs73szQ3cYebSfN
         MTpqtOSWNTSTA0aFAXwN7pYsan24P++IysaE/1zK8K2XxLUnmG3g1yedzeyfE69I7UxK
         WDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991667; x=1755596467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEPfsLZTWTVMFk6wTWa0w6a0o68+CFAgBUbGVWWCf4o=;
        b=rdqNZv4IVGc/edFa7FF5Gj5Bl1qiN6ewwPXPpzIFO+vWZ9LhH3EhzafszCNxqd2Epk
         PQGaHGxLTYgrxohcD0/HX4TMR7aT5Z8Ybi14u1K9Wf8JidRKRkxCD5BA/b15+UZOS/Af
         zmxLpDD1+szu1PFzEzo5AFVmsjKPV0dG4sxEXTSJhnKkFPD0lrJiUqFbjNGbEGd3Glh2
         BpX+UIZlV4L7jNKo6WFsTnAR6VhvFNth84YbvZ1BSD5g3HUjLLwDcU0oIJZFO9evS9jk
         ePN+8tDll0UVEx4UMDl/LxH/cVCX/ZvoODF/BHHCiDs5i1QnHziCmG4XbInN1PNWwlYP
         iKvg==
X-Forwarded-Encrypted: i=1; AJvYcCUf5gCE85ZaR0Ha28mEbTcKESQZqYZFhX3VIZy8pqWl/WenN3rRlqlUbtDV0+po3J6f9Dr2gzqhKUq0i0aE@vger.kernel.org, AJvYcCWMPY+KKQvEF5B0RspYEFs3Z5eXkPSg23eegTTLA90CPN5PJvlJttipY3YCU4fvzUIpiMKcnVV3kj+ZpRe+@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvAzGhgJNzzkHgjNrgsoSMubT9yt5WH/bkF70TcsBclvQBe/y
	tLj7tc3CKtTDBYwlgCQhdkdP86a0OvR0X8ucSLNib35qFJdG8fB90Dwo
X-Gm-Gg: ASbGnctg/O+vGS1U5qFTTOEtPJNZtccp8qSO/2Vdgw5puc5C1+n0t4vBsE+TR0ggAfm
	TyjXBKphTpzbhW0paVUelBkMX1sdNncohXzsVz2+AUAMeds/q/9pR3dU9qfgko0Pyn9MsVLm3xq
	8AoP/RxGEA6gHTD/9A0OzRzNlLMHdl/qlK4JMcKI9sLbpvhmACgLh87TEGKeDIY616O9yP8Op7W
	r+1XBgo08LIy5LhtrhG2N4GA/QHV0yozM9opWRYTjLeQCIpcqtKcAFfEczYRjoyxvoSA1wQE/aD
	lTJkYseiRzx/9VZtBPPNGoNMZ+8tV8/uCUyEyNN+Vzguss8PDouqZrvsRHfJsIvi9u38QxUlAYw
	25AE=
X-Google-Smtp-Source: AGHT+IFSam8qs8pH0AAmub/ZWPtzxlhPbSC5fqyUJI00dbs7zUjUF9TJpH/6wZBtpVOwDTzu5UMgcw==
X-Received: by 2002:a17:90b:2ecc:b0:312:639:a064 with SMTP id 98e67ed59e1d1-32183c460a2mr20130870a91.28.1754991667076;
        Tue, 12 Aug 2025 02:41:07 -0700 (PDT)
Received: from nuvole.lan ([2408:824c:a17:3f0::c83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm9676063a91.16.2025.08.12.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:41:06 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: fix override properties
Date: Tue, 12 Aug 2025 17:39:56 +0800
Message-ID: <20250812093957.32235-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

property "qcom,tune-usb2-preem" is for EUSB2_TUNE_USB2_PREEM
property "qcom,tune-usb2-amplitude" is for EUSB2_TUNE_IUSB2

The downstream correspondence is as follows:
EUSB2_TUNE_USB2_PREEM: Tx pre-emphasis tuning
EUSB2_TUNE_IUSB2: HS trasmit amplitude
EUSB2_TUNE_SQUELCH_U: Squelch detection threshold
EUSB2_TUNE_HSDISC: HS disconnect threshold
EUSB2_TUNE_EUSB_SLEW: slew rate

Fixes: 31bc94de7602 ("phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index d7493c229..3709fba42 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -127,13 +127,13 @@ static int eusb2_repeater_init(struct phy *phy)
 			     rptr->cfg->init_tbl[i].value);
 
 	/* Override registers from devicetree values */
-	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &val))
+	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, val);
 
 	if (!of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_HSDISC, val);
 
-	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
+	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
 
 	/* Wait for status OK */
-- 
2.50.1


