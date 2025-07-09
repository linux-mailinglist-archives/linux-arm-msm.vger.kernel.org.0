Return-Path: <linux-arm-msm+bounces-64164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFFAFE545
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D73166C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC3A28B418;
	Wed,  9 Jul 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgUJHCHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8028AAFC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055793; cv=none; b=f8nrVS4bq5pcgg19qytkg2eIi5fZZepeMdkl8ZBTDnbWy2DA9nVsBAyO9z+sX3pSASt3RMGnETlFu9Yrav0jD+iz7C2WGQlSsjxVA8ziTUb46pmhP2zrlSa/gCdzyn6avBdQhIuA4T28kbcj0+xJDBFRhxCmFLuYUdwvDP2ahzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055793; c=relaxed/simple;
	bh=2xRrbDBqjLbzQMzAMm4L8u9VN2Mq2YBHHgTCE5yPM+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s36WvpFG7O6BSfI6dIoLtl2vLHxNGmerIXYs4ZdfhfAs3+E3/xE3/gTpxSOSnWto9eWYubD3DytH/TIqyW6A6LhoDdUEoOzWNXk3RBTE3ay+TyqtDYDgad7TJn7xtJTFVoXL6hLKUGBcS/LC1z6MNKyu6QQj9/3pVDCgDfqApZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgUJHCHO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso4106532f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055789; x=1752660589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhGPvC5ZmRo6MvYpiQ+hA4rJtB+6fwTj9VtUCIpUF0U=;
        b=kgUJHCHOZMU1tKLCB7CE1oinHT4J9BvOfm/OIl2GEkYbuPtvvBXxDvQRg6xEBQKtnF
         YrFm9uEBlA8R6VeLBJmhyvvfsP4GT1ynrt3ut0iWbqBDLBt1R0YOEKzrPNADqO7Awex5
         a7Dp/gGy9SFFZPwmir8kYShzEt0R+3HOkaEDuTU6P38U22EfRnnGPkoYX5mrsU24UGYp
         OrR6N3/e8P6SHORU/FtJ0zCrZYu1U7eaHa3B/BB5gF5KGDGXOVOFXZBrqiOZO6NHN93b
         b0DqP5uVgbIQR9pMPl9OEt948dSOclg6bTL3JArtdMxqVb9PmGqoEjMatsWUfstd+bI+
         6rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055789; x=1752660589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhGPvC5ZmRo6MvYpiQ+hA4rJtB+6fwTj9VtUCIpUF0U=;
        b=i45jlAYZipmOoOfuqqixRAnFcKGC+sIuFKxckbG7EFPcrTakZbUtJAcIDgXgLm6oEU
         Ww0bqxUBzyqim8p9hhj1zJZfDhBfQs84wx37j0Ab3nekzZWcbsB1UBJAif6SKnSyqEkb
         oH7EP4W6GYsPTCt4yLw3JWGpLp/gwI1yVo9lbJM03lD2iiZewnTTsV6eNUcCgHCi4AIR
         P81/DN1U9mOwV9Wahnp7wZy5krmRAb6iUKDijoY09NmaGheJ+/N+2P3A6OXEPvFWUMgm
         ZuCqkgt7wWa736d8unaKGm0T493Od9mUNW3ruT6JGaMT3N6K8Zp5OBssNw6vOTOha2eP
         I+ww==
X-Forwarded-Encrypted: i=1; AJvYcCUHmeDotc7TkOJjKP0vIA9us7elq5QIMvcYFwlKfaYk/YOOdqCIUEp0TtzM7eMcequ+Hsbcg7BxYnJXrPXY@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRskIpWc7PhFC4qimBktuk9gTG6mSikhkA7U4VcC+03hQXR/y
	O9XIwlcsl3OgqDj3wsj46uuRfPa08ddiJe5jJXChoFbeBV4b/4dPBAfql7MW8nnfMGQ=
X-Gm-Gg: ASbGnct3ODiDm8+1aNHJpZxDwpc8sVY1EM8++2LFnqsO1zb3lEzVXetf0QW6PJ5TrkS
	xDMvhggLox9lkBkNHIBDBMiX4FNOg6o+QOqat7z3z2MV6c/eNU/WOF/JZTrw1YqkMhHRKsuyX7C
	DW3cxci0WSz54Am/iXiMK6HOfxObhtr3f5fIaLB/XxhsI0hJ51b0+NhVYb3BgKie8Bx0wkC99mS
	BO1p/CXhzJmJMQkO04mIq2G4paKHW4HkbUGuWKqKNr6WSEQO6jbTJ+zXEN2MM7y0Z2s7hpVkwFi
	/1bMIwcwkDMki04nNfMAK1SISEdYlEsvyr1wFAIbgYn4dhhT5QKcHjFCfjXNzVLdGVBF/GJI10m
	Bng==
X-Google-Smtp-Source: AGHT+IH23Gs+RdsiqZF1i+ig4T8HqK1WkwzKsnAcCCYZOWWyRHXe5QspHefa+kIAw8XbM9oBGVkUIw==
X-Received: by 2002:a5d:6f1a:0:b0:3a6:d7e9:4309 with SMTP id ffacd0b85a97d-3b5e45380f3mr1416075f8f.29.1752055789438;
        Wed, 09 Jul 2025 03:09:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/6] clk: qcom: Add video clock controller and resets
 for X1E80100
Date: Wed, 09 Jul 2025 12:08:52 +0200
Message-Id: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQ/bmgC/23MywrCMBCF4VcpszaSizHqyveQLmoyaQekKRMJl
 ZJ3N3bt8j9wvg0yMmGGW7cBY6FMaW6hDx34aZhHFBRag5baSieVWBWKQgGT90LJqKLW1p3OBtp
 jYYy07tqjbz1Rfif+7HhRv/W/U5SQwl1sMFfzRCv1/UXzwOmYeIS+1voFWebgl6cAAAA=
X-Change-ID: 20250701-x1e-videocc-10f1f2257463
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

In preparation of adding iris (video acceleration) for Qualcomm X1E80100,
enable support for the video clock controller and additional needed reset
controls. Since iris in X1E is largely identical to SM8550, reuse the
existing videocc-sm8550 driver with slightly adjusted PLL frequencies and
adapt the reset definitions from the SM8550 GCC driver.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Fix commit message of PATCH 5/6 (reset definitions are just copied as-is
  from gcc-sm8550 actually) (Konrad)
- PATCH 6/6: Use GCC_VIDEO_AHB for videocc instead of
  GCC_QMIP_VIDEO_VCODEC_AHB_CLK (Konrad)
- Link to v1: https://lore.kernel.org/r/20250701-x1e-videocc-v1-0-785d393be502@linaro.org

---
Stephan Gerhold (6):
      dt-bindings: clock: qcom,sm8450-videocc: Document X1E80100 compatible
      clk: qcom: videocc-sm8550: Allow building without SM8550/SM8560 GCC
      clk: qcom: videocc-sm8550: Add separate frequency tables for X1E80100
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
      clk: qcom: gcc-x1e80100: Add missing video resets
      arm64: dts: qcom: x1e80100: Add videocc

 .../bindings/clock/qcom,sm8450-videocc.yaml        |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 15 +++++++++++
 drivers/clk/qcom/Kconfig                           |  3 +--
 drivers/clk/qcom/gcc-x1e80100.c                    |  2 ++
 drivers/clk/qcom/videocc-sm8550.c                  | 29 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  2 ++
 6 files changed, 50 insertions(+), 2 deletions(-)
---
base-commit: 0672fe83ed07387afb88653ab3b5dae4c84cf3ce
change-id: 20250701-x1e-videocc-10f1f2257463

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


