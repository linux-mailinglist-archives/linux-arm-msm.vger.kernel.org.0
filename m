Return-Path: <linux-arm-msm+bounces-44165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F1A0453B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0CE21652BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C977F1F0E2A;
	Tue,  7 Jan 2025 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUFTapTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B311F2364
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265305; cv=none; b=QJKVNNKmYuNNSjWMfjmWDAG8SkYDAGApS3PIT4nFZs0ZF8CaArgLYlXbhAfhYkqQuacMG6Fl4nHRMNrSl5oa+CtvYXiIxAc0VHXMfxd6/yDyA9jS0uE1U5QBQZyCFtNgSdQ9yQWVjQdq9rr7tc+EezHPZsFpOR2D0UjkZcCTt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265305; c=relaxed/simple;
	bh=uqoqvoKmFB2tRQTqRpN2ag1j6jpMK0csd+ij6uUbmG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9U71JoN/YIzVmYDmpTm632Z7DMEO1nAujMiVHgVMKpocTY8DQFjf4+DgUVNEDFe2Ge+a1JfZGMj7ytg2BY2Xna1W6sN6KrWk+h8UM5EkxQ4pRfdDHqSPgABwVonbkQ06ZvZpeq7ARRIpAqoYKemtXFwhj1zkj2OFl4mbUjC0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUFTapTM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so2928071a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736265301; x=1736870101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CgUvYvSp0BduVGWR3V9DgbFsyF8U78WfkiGfAOGdOHk=;
        b=hUFTapTM5je4CrKyQq7LlvNIUkmRd1BmKUbEExPv7T/5BhNlc/i3qJ/2oKgLGKQ95E
         2/vR38IeBMIcxlD6VXaIVVyh3RS9m0oOR7Zt+sx1SfeszK2yTLMycB0ghPIc0ZOAP670
         3Co5JIq4dMcgV5gkafF4GVYxN6Q5EJxFWmcYgM0ojl7g/6wQtgSWxgdzs60gKfsrqhUM
         +G9NlDmQmx4+sbvdXo0pSqqGJi5/6OGGp349RiRXmF3YJDHog66Av25K6Zm5Ako/9tut
         dYSE/p9a77A3dNBCQPSxD16UScb+yk+HzZ2YBmswqQTwuL6mKPVaNFo1OTL8ICWhXILU
         eWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265301; x=1736870101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgUvYvSp0BduVGWR3V9DgbFsyF8U78WfkiGfAOGdOHk=;
        b=nAkRMJQ7YJ8O88Rsbjw35IjILwMVsg/RrrOcAtRn8GnNDLI80A8NJwWSVDqHR4Cy3O
         Wp5F/dI7pSY9PD2b6ilk8w/VNc5lv7CWD/eQhuD0SioXUB0sCS3qC4sgi1jnkiKKnfw/
         IFQpyIPi+PBa68qixnZSudX3sZSPEOB3Wvwr4WQ3FjUo5zSAFMNuVcGGHxJEjUw1RWfe
         O/VnJDiHZBcJKW1Qg+JBbWvxLczwkhYSN4moaWWAFHxJ9/zBmnFZjxv0ElfTY9S4/6iQ
         naT/GsNDUaWakfevAtf4WNnXHEpd67SxYHms9hBKjRkRvZ7U1p3KrXbg29BxzeS44tD4
         DwhA==
X-Forwarded-Encrypted: i=1; AJvYcCVjp+ykJPrTi1DFt+8a18tnG8D+/KX1Y3KDkXJtyL1jVDRTT2Te6JYXk1KYzr4PXdeVcfJ/rhedjNlwPiCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfxTk+BGY6LN0bYFo40Z4bQqonHeAzKA1OSC4cWuoM/SzFbGv
	hLxEamI4VtLkOYKlkdhgoWjZ7om7gQb0nmx65/TeYAAmfel2TN0BOzYvho2KHLM=
X-Gm-Gg: ASbGncsKJzl2jRSHH6/egIVSsYqXe0NEPyq+52jLCZuH+NJuFTyBmwsxUCOZGjQ1eU0
	+9PHEvCLGExLKMJq+aMzXzua06rCwnqYhbUtuSktbVKCO7gVb+ir7QgSxrqyha3h8T64uFlZS+U
	jUKLc0dIjUKyT1pthaaFwLi4vevyL/M9IqRVmKd6aZdPD6zZhGa8KgyygTh8GlA2fUz8FimmPab
	IcuOGzcaGrmGLnu60O10CNJsvZa56b/9MhpvOTKNZs3GOiHcrTdKP9lERrBV5qQ05mR/ak=
X-Google-Smtp-Source: AGHT+IFBaDp/lDcAkpYy+VPGXJhfgYL+aIL9TmOH1dilFLPNhZZpm1mm6pgyJJIBLUu8ogzE/QWJLw==
X-Received: by 2002:a05:6402:274e:b0:5d0:d183:cc11 with SMTP id 4fb4d7f45d1cf-5d81dd6422amr20371921a12.2.1736265300755;
        Tue, 07 Jan 2025 07:55:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d848b5c19dsm21949611a12.11.2025.01.07.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:54:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	neil.armstrong@linaro.org
Subject: [PATCH v2] arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers
Date: Tue,  7 Jan 2025 16:54:52 +0100
Message-ID: <20250107155452.389154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable necessary drivers for booting Qualcomm SM8750 based boards like
MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
pinctrl drivers are considered necessary for early boot debugging, e.g.
via serial console, thus make them built-in.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2:
- Drop unrelated CONFIG_SA_DISPCC_8775P change (Neil)

Cc: neil.armstrong@linaro.org
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5e88321aa603..22ec898062a8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
@@ -1369,12 +1370,14 @@ CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
+CONFIG_SM_DISPCC_8750=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_GCC_8650=y
+CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
@@ -1384,6 +1387,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
@@ -1667,6 +1671,7 @@ CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
 CONFIG_INTERCONNECT_QCOM_SM8650=y
+CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
-- 
2.43.0


