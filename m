Return-Path: <linux-arm-msm+bounces-36016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D763A9B1952
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49996B20EDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9A878685;
	Sat, 26 Oct 2024 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWGig5sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3A2AD0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957422; cv=none; b=BucwYpxnZzo6P1TBsDJenpB4om/VIzfvKidguUT2Os6uQEdjWRfPpUugoOmhh5O2bpjNN5/TUQtJtYHlK2RSbCcvXHP/6JVuXgcnoPOFWetF1ipPCc1WWaDAuFNqiKlBD1tFxtNadKxIYzQdHbPvutyOWIPJq862CJcIyfZw6DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957422; c=relaxed/simple;
	bh=rdD604U1PckSRQxKib0Oiw8A+oC+Pz13Qo2uEptx32E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ea11GYXkqE+XyVFCdeZYP3hIY3SPcnLNwFoIpSKH/0HUSifzKl3LnJALOeCT6F98q9X3hcEmCXbooSxRWno01LtDA//mTcAeMsyGwNbHiTUQQdul8vIGytZOfrG+0JnzF3Fd+Q1bnw5nYLPwVKoXNgMWyE95dN5wYaXUDYqOqJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWGig5sq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e63c8678so3079066e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957418; x=1730562218; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4W0Dvb3sM0fEB/9PtaaFfaFbFlR2Sm9xrgJxrKHS/M=;
        b=zWGig5sqiSITZFJPYX5e4G39NFP4aZH1Texxr7M/Ym0cdaSJZyodNyngOKgb719/Cs
         hhXS5FQ5Wj7CguA5fq8ymAGMJIwqttd73vofkin6aRrCs79SleussWYpLK7nkcft2h4y
         kJ9alWDpsgQKr4Flh9j1jWNW2YNv4KXENLzmK7jX4Dy1DKes251pQ3tsQ6tEN7SKN/lH
         B8QCZxPM+B6Vl9D61k9pwA4b2YG2Iky2hO/ZNwTnMaggvRXvF+kxdvAGet9JKD7s95tb
         /tty9qGag1kC+4ZPoGzaT6plkucwtLsAfliCrJ1+Ia6wRT1aMNyDgaPNcNQp7ogfvWZ6
         Twqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957418; x=1730562218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4W0Dvb3sM0fEB/9PtaaFfaFbFlR2Sm9xrgJxrKHS/M=;
        b=E45HwXKwgG/On4J6tzawH+Ju75yv2UQZue7IxvrbOfP52KaiMkcp31j7fzYRmCDsJz
         hbINJ8/pudpk4meyZZxU67quhMUdmuT5bvK//3Iinj7clsK5KIRi/0SdhBKH0riMVou9
         0lZZQHN6HLm9vFwFCDJGMPNCSpwG+pURe38vbE+OctM0hRiwxxNIj1jHycmMn2/OV/Wm
         8w7X/EsJvCqnpsD6Tq5zx6/F5301pGPBNp7Aq+xCbrE/wo7ygEOMGz0qWqrCfEoXX/XK
         PciFJIW46bSD+9gwPahbUdmQh/kUXTFkJs+XRyDglAMnaLq4wBwAuAzp6Dr6bOWzFwlz
         cgtQ==
X-Gm-Message-State: AOJu0Yx+4ghUlZxt0oAUGRXLKn2k8RR12yUzt753ZwwZjgTgVQBhVO99
	PdSxPl4xZGESiEStjUihRB1EuGE8ukXZbAXJ5r+5JINhNz/AhQZ66PHqEMK4SpI=
X-Google-Smtp-Source: AGHT+IFDb6clG/TiKRcsP3iXXceskgIk9ZEnE39cmES2qo/Gt526e+DMhqoXjQWIoI7NIcUPqmZ87A==
X-Received: by 2002:a05:6512:12d1:b0:535:3dae:a14b with SMTP id 2adb3069b0e04-53b348c2eb3mr976460e87.2.1729957418170;
        Sat, 26 Oct 2024 08:43:38 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a47asm534934e87.1.2024.10.26.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:43:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] soc: qcom: llcc: add support for SAR2130P and
 SAR1130P platforms
Date: Sat, 26 Oct 2024 18:43:30 +0300
Message-Id: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIOHWcC/13MQQqDMBCF4atI1k2ZjInBrnqP0oUkowbEyKSEF
 vHujUKh7fI9+L9VJOJASVyqVTDlkEKcy6hPlXBjNw8kgy9bIKBWoKxMHaOqYZHT5JwEh41qrLX
 OkyjNwtSH5+Hd7mWPIT0ivw4+q/39SO2flJUEqQlaaGoPusfrFOaO4znyIHYq41eO5j/Hklttj
 HcaqDW/+bZtb+rtMrrqAAAA
X-Change-ID: 20241017-sar2130p-llcc-0c2616777cde
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rdD604U1PckSRQxKib0Oiw8A+oC+Pz13Qo2uEptx32E=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ4n/TMbq2cxxTiKGdc1bl7HFF+TczENAciAt
 1vvvNmXLB2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0OJwAKCRAU23LtvoBl
 uIMED/0csRGpfmoyMxyY8At10nGeLtER7C7UJQZyF3eRRb+qh+rq/KkN3GVbFboMXdtMVyDTTkX
 E1P7zN1IGrr9DEB2C8I7vlANut52nKVyeJR9Zs8j5YSAtMn+LG51l0jTCZn+EkUYZTEuaMHvQ/T
 Jfhdn3dgRXuR6sTs43L6QB6vJ7u1mMmmBdjjJx1xpOTSBa4925ARqp69Be8UaYKJpgeRyahD535
 ZaE8TBr/UgpmZKZiNSzcblQSRplqkDJp+js1oyuKHo+jkHd13C28fhkDrCj9OZdRR8slaiCL1PK
 MXUDMtdZJ9zHPKf+QFXdgWhglybP9if2rmA1BRjUl2UteBH1b3aVsoWQEoMRy2+Z5grJ+kBJiBq
 5c9p8h0qQm+DgsO1zSMURU+fUTYzq5IHIbYpHi6nCH9oE5SGmnPNfh6FJVVslj9agQ5kFV9JziZ
 a3u3MDycp+EPPqbKOMBbo3HYxTDO9uHbisY7+/mJtHYSYaUyrsdMPFfHjxFn5UQs0ODBaiX3x8r
 u7TMr8ZAP8jWUelVbIj9xrkCK75fLyK6sIMiLhcNk7p5CIeTHMZnH+9OyaFmpbqULLNIG+S+MZj
 jccmKBgq+kwjcgXJmXO8067sBLqZK64M9KOwGBKlkcJef29yUaLHy7nUTeNbL9e12Q3UFjE3Fb6
 gXnX0XxhVW/61RA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for LLCC programming on Qualcomm SAR2130P and SAR1130P
platforms. These platforms require few additional quirks in order to be
handled properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Use decimal numbers for bit shift values (instead of hex) (Konrad)
- Link to v2: https://lore.kernel.org/r/20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org

Changes in v2:
- Added max_cap_shift and num_banks to struct qcom_llcc_config (Konrad)
- Link to v1: https://lore.kernel.org/r/20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org

---
Dmitry Baryshkov (3):
      dt-bindings: cache: qcom,llcc: document SAR2130P and SAR1130P
      soc: qcom: llcc: use deciman integers for bit shift values
      soc: qcom: llcc: add support for SAR2130P and SAR1130P

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  28 ++
 drivers/soc/qcom/llcc-qcom.c                       | 472 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |  12 +
 3 files changed, 500 insertions(+), 12 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241017-sar2130p-llcc-0c2616777cde

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


