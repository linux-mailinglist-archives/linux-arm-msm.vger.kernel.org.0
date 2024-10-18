Return-Path: <linux-arm-msm+bounces-34981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC059A43E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C6C1F2463C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C234202F9C;
	Fri, 18 Oct 2024 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fodc9oqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617E1D1E64
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729269169; cv=none; b=VxqJCriUp8PYR5LqQxvNz4ahKU7UTMR+npzyg0ubxO7LU8K+0ByogbIH1fACpcwZTdauQI/P81cOqhp3RHkj0wfaDnX8l+/2geAN7yFZIV63PIg5+4y9q6uYe7Y+sYXwviGLmwGdLQnvuFMgnUy+Nw7SnmCwgB36UNrUoCPmiy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729269169; c=relaxed/simple;
	bh=3o4QDFKrPDpNAhxheUzF5R/l9bf3AcQKebu9incovWg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IDZwRamvbOhkfKahmwXVUqrymW67Q5zjSK0UigGDdUcq9HYaHXmKnTB5h3ZClX476eIxdxbn0d4ba8MHY2yl37v1/COqipTqeoM/lJfV0hFdk5MTmOJv4HVN+vgNLx1Y7g6PVmtDLvLxOlg745puLreJtUQ47yo6EZYpW1uiMX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fodc9oqE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fe02c386so3439189e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729269165; x=1729873965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BmTGXnzY5jB8k4DGJSiq353v0bV1bo9V9udHrhCqnA=;
        b=Fodc9oqEkVg4r20yhX3oDoIOic2eNde5DaK/3U/JjYx4Fme1Q/1sARmax+s1piBtbz
         hbQNaJDYm4NHkCG3F+6VUXHBjsKB8CwlMtFXh/MHz10/KkDepkczbFlPyUXd8ak14np0
         FkkiTobPE20PHBi3GAe6nG5egVyYEX3hawzguUru3f3uohgyULt4XfVKh/GUOqhSfnkq
         iYGBYFu/O2hAasGxbL18tCOVAztdwkRlcFUGTvhp/9ghHmaxwc9+7N9eHzFBw4ynctwD
         JOrHxrB8VejUszoDN5Dj4qjLR8p8nwF6yki7nG/eA0K5G15J8tIFyW+8kJPmTOVjBkn2
         PKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729269165; x=1729873965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BmTGXnzY5jB8k4DGJSiq353v0bV1bo9V9udHrhCqnA=;
        b=F0IF7XOCiy1aNslZxIzRY148amq0kobpr2JhjneNmLYDGoVReN2mR3SogocJEWfcJP
         UHZ0VypKOu4zMFtWgZv0bXrbaD2CyinTZjATauHR7DKuIobic0au6nWt/yslZ29+6iW9
         kHq5EfMIfEX9vj19O47moPQT3JJKuTdK1AnbBruxBZkR8oiSdZH4KZbi7HIvOUZWkMXF
         0gLHGUo4H93bFSGydV8Qw2deGNYPEqp2gL9D0vFisjNPngfjyh8RTDiseI4JXv/ASahJ
         9BmXn61/l2iiyadpsF9YOWE0EAJ32ZUXpTRoDl+WiA5Mo3sYEVVuVMITVFC+ynb7CoK0
         xN0g==
X-Gm-Message-State: AOJu0YzKX9yNBLzhrJ9o4fg1dSpcRevGDsYqFcc1Z4HpEqj6R1ytpwCN
	tIXrlT8nNWJPZpNQiktscBROCw2FeIofOIMTnD+ZsfuKaMo66TsPbP91wNwY7b8=
X-Google-Smtp-Source: AGHT+IG7PC32SVvGbLEi3pCb8TZVgwOscj2vz5d7Y8QvfioUU0UKKtplt9qULl6dz8ljd7Z4Y/7vqQ==
X-Received: by 2002:a05:6512:1292:b0:539:fbba:db71 with SMTP id 2adb3069b0e04-53a15b976a7mr1045248e87.26.1729269165450;
        Fri, 18 Oct 2024 09:32:45 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0b67sm259486e87.126.2024.10.18.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:32:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] soc: qcom: socinfo: add SoC IDs for SAR1130P and
 SAR2130P
Date: Fri, 18 Oct 2024 19:32:35 +0300
Message-Id: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKONEmcC/x3MTQqAIBBA4avErBNG+yG7SrQQG2s2Kg5EIN09a
 fkt3qsgVJgE1q5CoZuFU2zQfQf+cvEkxUczGDSjRr0occXoAbOS5DmGpKZlQmcxWD8P0LJcKPD
 zL7f9fT8JbA5IYgAAAA==
X-Change-ID: 20241018-sar2130p-socinfo-5850a90f9c63
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3o4QDFKrPDpNAhxheUzF5R/l9bf3AcQKebu9incovWg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEo2qZBxFX0F9ziFam8gm6weyQwfyVm0KlyLex
 MtzfpAvbUeJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxKNqgAKCRAU23LtvoBl
 uLwmEACkvC8+Q4gZ1o6sU6XngzOVSwGaZ/dvTO5YbIH1A0HcDUuXknedUffc8Vl9pONZ9xt3bSL
 nzq4kMEF4HlLKdF7scOckN8BNX1nv+0otkmNW4TNV2ls3FHjyzxC4qKG9Da5CTW7NTHp737w6dB
 kuOwep14XCS2M79xQsSKIeVBBHAp2D/zb3TPUt3hJmMN5v55sGyr1zTwz+K/6mMFWdsjjO2FAjF
 +f6iAjTvujKB46yPC+GJz8dqfqzfBXY9vScwIOyYaX/+oH9BX68RuV5a2nMngl3NZvnVu7NtAaU
 oX3X56uMF47SF8vC52fhuuPzDBo1sSpOKKlU9rwd4JmLZ4HPqggeJH54qcNZd15/WUEGmo+MA67
 +LfZqc1BgOu2fiWqXvwDUj1Q4ZSGFD0MtSzRnrbDk4zczntiZ4OFG13I26iTTMVnrtqSYau5rHf
 RMSydP41hFGeMOPorieJ5FRi23to3VJQOo7UhZ/HazJEDPJTwZ1jRhqVEJpqqs2j52BuI8vKS8X
 rmmkJ3BtHBsed6BOwN4VCOZGRgus/cb6mnNxKp65jmMMkajpWMrlivJzDtv7VF4wszTgPwjsJ8B
 UPArfQW+HCAW5Xnf+m8TsT3iugdBEer5SWRiPB5djGMT16jeDGqdJrj80nP1qdit378kuI7nUDk
 t3SLmtBBRGXE49Q==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add add SoC IDs for Qualcomm SAR1130P and SAR2130P platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SAR2130P and SAR1130P
      soc: qcom: socinfo: add SoC IDs for SAR1130P and SAR2130P

 drivers/soc/qcom/socinfo.c         | 2 ++
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241018-sar2130p-socinfo-5850a90f9c63

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


