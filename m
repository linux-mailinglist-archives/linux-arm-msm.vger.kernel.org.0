Return-Path: <linux-arm-msm+bounces-16722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829BD89B507
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 03:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3C091C209A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107FF4A2F;
	Mon,  8 Apr 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpAWew1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35047FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712538263; cv=none; b=UZaVeYmbyv3SIvHJQYKJML7KfIQr6B5jQ8Sj91fVZ64EmZmeXW6KtqJMQwkcXRDw284CketHUk5yQZ6yT7X5wv6TKFJ+zSEo6JnLrL8VKXmjyz5XmAEk2bD/DGzgIBfMJBQdkVF2cqYvbn1t/Mav+tRbsm9kIB3pHxRXQHaHIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712538263; c=relaxed/simple;
	bh=s33RZGEgwzC1Gzmvtyej0nFCi4RDWjdOM+NcM4qSbic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLPx4ngNK0XgSDIZ8YqN0Gd1dsMVD8g0qb0yZeXjBtgOak8s8jBgV+pgXr4y2vBNa4r44mAAmdaEwrXUocElgrQQir4HeDAsHdaWcHybDF9BQJSwenAgjnqvILxHWZjU9uKk5XuQpLQZ+myanCB7qy3LOCj7hZ9nghW7Cv4Rl3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpAWew1r; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d0161e13so4186780e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712538259; x=1713143059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTHBa3/xySk1w4WlhRSYrG1ip6R3tbTiUm7wjb7zoMA=;
        b=tpAWew1rIDKSRcGeTGxN+GPfcGKvELuglzbaciDshzQQNChExeMAzSV5tWYqFsR4ak
         DxLWHmpRghDcztSPd5rOCWC08UMi7UGsupqf+OpYHObmUKrnKaAvj6j0/kKel9J0ltJZ
         Z9SDZ2e/kbVZgwEfjEvW4Jrb6+af332Hvw0SIpeELLLfk+YYM7b+9R/n1pSsIT/8bJ8y
         q274vFcseRYwNl086PU4wbb5dGm7RM++o96+3u/V/UceCe5qrNoECWLz7j17l/KSbrXK
         BZ7eQcRon+nvuieqGN3V2qkS7NPuIVIRqd/BcRpcB1Xz3WCYWStbDoeFCQs1WgezW8ze
         vh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712538259; x=1713143059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTHBa3/xySk1w4WlhRSYrG1ip6R3tbTiUm7wjb7zoMA=;
        b=Qfygu4BHNYyeByg4ZeQGzjeiAP3X+OVPUyeLtjhtjCMRBG11ato3mRXlvDap9Kpukc
         mfYtvLxF1pxpigLKaXRcjnQkIz/41l5TgKftKrFCmii3kjEKd39oJcqX3Ul1DWAMBGMz
         Z4I9RXzjyd+av7pUILztlJ7P88Y2v0DT+BEK0ohEg/Dwv393Zg/nwPiU5ORD0QR4bIrE
         RNcLT8oO8Z0rPXSerDWzQZeynJE4iofVwafJRDo9UREbS6LIoLFWNCI7tKQTpPv2t0WV
         UEgZ5YSZTjztjSTghgN+g4LlLj55zlh1SHxGHy0Kb48CCiTpBPP3pLolmUu/s7TRaodn
         SoZw==
X-Forwarded-Encrypted: i=1; AJvYcCUBls7PKD39q/t24gQUu+hkAgs0JaXWGBP3nLevlq3Nc2QTLB3e0WGXwnm5TVuUKgZE6l4FNgXVn9AizAHFwfguzo/6PZQg0iRqLus3VQ==
X-Gm-Message-State: AOJu0Yzhck1xz5KYqKX8CwHs+QZvpJ3v8MrM2a1csBV8ZYLvt3DSAzHu
	o6R2Q/tyQXg/WJN3ZIhlRW9GuaYhuZww1ZDB3Z5EzsTVI4S0YCFs4sVJQk9tN80=
X-Google-Smtp-Source: AGHT+IH3u3/B0zIlKOQ4GKAMsNk1tEk5PZcdbk/YMayNB5gDSCrQerWl4ZS9DMtinyQHyAq2WQrpzA==
X-Received: by 2002:ac2:4db2:0:b0:515:d31f:ce2b with SMTP id h18-20020ac24db2000000b00515d31fce2bmr5347091lfe.15.1712538259082;
        Sun, 07 Apr 2024 18:04:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m29-20020a19435d000000b00516dc765e00sm674034lfj.7.2024.04.07.18.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 18:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 04:04:15 +0300
Subject: [PATCH 1/3] usb: typec: ucsi_glink: enable the
 UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-qcom-ucsi-fixes-bis-v1-1-716c145ca4b1@linaro.org>
References: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
In-Reply-To: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=s33RZGEgwzC1Gzmvtyej0nFCi4RDWjdOM+NcM4qSbic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE0KRQyOhFT8nKM/JhWE4LGLevh22hkfK04kTP
 +vTscL+29yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNCkQAKCRCLPIo+Aiko
 1UvCB/9066B/QSH+M7g/mfZocsMcOrqBmesJjVaxV9PD7qYSB2X2/8gsXpJTu9VA/AlOlJkjoOu
 SToK54Oot+nOCU0OJq/aHXjg/t3iZZ1qmfM5N/HQVouMfyy3Uze4ubPQ6aus9KSADxbBUpl+u6K
 QOPbxc2LaEAjYfaqKYwrzHHCzDfL2tbuSyqWhhac1pSi71VqvfrOZCVTP5iFIV4g19aqp9awDAd
 1pW9gEP9e2fnyt9bXeSYe0itvqfKBiYYbvll0P1VqiE8VlYfpsbHFTf+a/RF06UeQ7cpNo5cI8A
 1Amszwfqi5CUD3PpEZ10NnKM/64lUNeEa8u8OuTb+HdQyh1Q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the UCSI_DELAY_DEVICE_PDOS quirk on Qualcomm QCM6490. This
platform also doesn't correctly handle reading PD capabilities until PD
partner is connected.

Fixes: 5da727f75823 ("usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index ef00a6563c88..9bd80a2218e4 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -316,7 +316,7 @@ static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_P
 static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
-	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },

-- 
2.39.2


