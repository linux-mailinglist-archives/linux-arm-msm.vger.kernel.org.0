Return-Path: <linux-arm-msm+bounces-11312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA97857A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC636B227A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 10:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B5F12E78;
	Fri, 16 Feb 2024 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyQ9a418"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCB200B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708079103; cv=none; b=ZF5xc7vW7b2FWV6Ax4RfvD6LAXhZ/V0DVxAVjhTMOL7OvTCLYtCE6wOfpGvDVn4EDmlR7W+Zu03DnsRnriDDCfCD5G6zqvcWB9agJVtORz+F6YCgG2U9vXvq8kLx/5NuMcHdLDqLvBvwDqYjF97j7r0XdhwKHCA/Rml5EbYjgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708079103; c=relaxed/simple;
	bh=RdNpeE3d+oW3k9ivrv9Mt8CvCnEdyMVqc1Bql/ZN4PY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eZglw1tBSUvqs6ZfLjazJePdb6dBFUovU1WTpaDBbwX2xjIgn3Bpa4/P91km3zzyaH2niE9TAvTsOcLKlsdQP22NV3GIU611zhM/AvVFxPoit4PULtFml6DjZPaXWboEeQudYQGJ336nGzhSo4UGSUi21AIlMDmBFWjsQx3o6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyQ9a418; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d11c55d7f2so26716891fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 02:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708079099; x=1708683899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uwpxzD7wxs4tMFhIUi84X6jUwWhqp/NQm+0nfPH8IA=;
        b=wyQ9a418g3CohbFDjygafaUoTgmJDWSDeV9qgCfE9x8+oSyXJcZf7m1g91Nn8ch1Ip
         X6stMmSo+9/0PHIpU38v2l3eqb6BAmwIzuNfgN1Mc/VGYVLaoDkbP3fHXEaEW/G9xTzo
         eY9F17RgD1c/lBqLjkhO6UOwHwWzuy27RIQR7VP8KuRrb1mibLf2T7Oqbo+cz9Rkmcec
         cXhHMfub5KbnnVdWEtB+2zanjTE5d0L+urEL1Ejuy6uflW4LA20bbosBBdtOFYFx3WUz
         lWZPTKlUmx47/2UhgXonq2cTPiB4nwFFywf1kIQxSWTUxlYh4Mi/cQq1hmC977T4G9uq
         tlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708079099; x=1708683899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uwpxzD7wxs4tMFhIUi84X6jUwWhqp/NQm+0nfPH8IA=;
        b=h9Hhyq8t5nxusEnR6TRmoI02PgGjWiBVPdDl1o9jitx5NYwmmu+R6ap5Xw7RqwBKqv
         56KABvKWV6t7ygIIpt/otIZKNt4mxuCTQmkqr1NxcXbCJzeNK5TS1yPx/R+gB2MPtKmB
         R5J51lJdPdJdvWx+GbMvWedJmWNo9xEYwdzhlVDxKYNO6yMNb7Kt4La0Y3hLn7NlAG4E
         PZhj0DP04igxGqIkH94sOnSgbqyeg9MReAZ7UoWf25Ah68IyFcfq3lwTJHk1YLiLdWns
         /3nc4KmyKePCGb59ohSIDoKci3+M4QkHI6c9rGBWh64X/jrPpR0BJxCuiDvsADCQcoxj
         LTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUHIWWX5GbqOhl2ntOqYJBsz2tyNNfKMnL2/KTzvFRJ/4I2bzM9yI/JKfKD+uSs3bU1QPiGHAdC6Dw+yWcnM1HNdXPT+5tVKDfbfYl7IA==
X-Gm-Message-State: AOJu0YxLl74nwU307VFTnSXQwRVOQTpraYem8DxsfF1fZjJK4ARzorAH
	uYBavsma/KQwGYsPEQXwWj+Xk5PZrzLaI8ds7gtmaaTTMa6fRayPip+aEg8Kv0AVu4Rs2YkGwdY
	z
X-Google-Smtp-Source: AGHT+IGoZm/xp1G/OD/8Sl4FoiC95cUmkntuMFrDr7Qmfp/kfCwUeNUTxLGICD5tmQBANj3SLO1Z1Q==
X-Received: by 2002:a17:906:7196:b0:a3c:7fcc:3967 with SMTP id h22-20020a170906719600b00a3c7fcc3967mr3430139ejk.40.1708079078897;
        Fri, 16 Feb 2024 02:24:38 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id hw12-20020a170907a0cc00b00a3d5d8ff745sm1438580ejc.144.2024.02.16.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:24:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: correct Kconfig name
Date: Fri, 16 Feb 2024 11:24:35 +0100
Message-Id: <20240216102435.89867-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use proper model name in SM8650 LPASS pin controller Kconfig entry.

Cc: <stable@vger.kernel.org>
Fixes: c4e47673853f ("pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index e0f2829c15d6..24619e80b2cc 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -125,7 +125,7 @@ config PINCTRL_SM8550_LPASS_LPI
 	  platform.
 
 config PINCTRL_SM8650_LPASS_LPI
-	tristate "Qualcomm Technologies Inc SM8550 LPASS LPI pin controller driver"
+	tristate "Qualcomm Technologies Inc SM8650 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_LPASS_LPI
 	help
-- 
2.34.1


