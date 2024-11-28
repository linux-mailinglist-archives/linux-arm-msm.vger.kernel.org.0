Return-Path: <linux-arm-msm+bounces-39471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A10E9DBA17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 209F0281A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 15:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BF11B6CE2;
	Thu, 28 Nov 2024 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgMQRqBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B819D06A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806499; cv=none; b=O1tiGKt+BnbQhI0vaC+SawswAPGV94Ynkvcr0ksIe2Xfk94kWerNHF7Ksv2GAsis6icX4nz2cAsdNasdusaAz8qQKCKHZC38TyzXOGSNn5LSxc6vDiVwy99hyXhQcocdWvBG+NzOIEyus1l2C4ocrNyB/P4wpYh0sdw1FGRBCUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806499; c=relaxed/simple;
	bh=CZ6F7nqLC3Ppmtpbab+Dy2ETBIdeM8z83VBVqimbS5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=baNg1czQHOCBIuzIKXzk6Y0iyJgDA/IH1zoZTlgPJQTbdNHW8b33/2pPpKL70gqk23LSpHyhtzNCpSyRjS4UctslCq96ZOLSRq2I6EZS62eMniHddKv2/7Yolf/UcT7FrPBt5s6f0O4n08yrfbq6wgXHMpTCdnTs/LqBO1+UXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgMQRqBT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385db79aafbso1977f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732806496; x=1733411296; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnZyDPBfm5l/EP/tG0UaARM56VhvQaqB17GitPL9u0g=;
        b=MgMQRqBTbHSnHz65CvrOxC1k9K7aIo0JNJK6et8xrxP9/sToDe+w8rXRzc246Z12AA
         g0uyvHcESA7WlGUTqGvmIH4ZTq+/oDJv90n3CRdZPjcy7FTvF6XazJKPMM2FpntqOqrV
         VJ4UIA4uL2h1ElaW6BeIOEYROu3wkJYiSgHKamfmrEFoeSe+NJMZLHbAkF/I9K2lgqfl
         1U24Ic2aVnc14XOHae7rbmv3Dij4PYcJ0N49KmUuBa6fMVwZPbAUTUT3iBph/xJfgNhv
         BtjCV7iHb8lEva/i7Onp72Z1gVerC80Lnf8X31luYGOt9CK+2CvvRiRxAPXrvZ47238f
         7Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806496; x=1733411296;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnZyDPBfm5l/EP/tG0UaARM56VhvQaqB17GitPL9u0g=;
        b=nH5Z6oAZa38VgvD3oSPkczjHkhe5NVNVabQN7klG/5a1jeQ4Ck+PyVuDFpaudAV/88
         RU/LURmrB58Il/6np1+G99/spJXkEtHZDCJbt5+louzEQcNaaDr5TaC6WI3HNNlxqEk7
         EEPts0+cI5E7Mv+MGz3dONE+9IXRJ1REDk150hy1zHTCaSFuGraqBO5KkYxssKbVxnHE
         XXkhZmjFHl4IH0FTJAdUhOr6qEqCVrmW++Em3uejiQabV33ImrMAHkJYgK8KRB6Wd5qn
         aX3ieJKYp0Mk8uCX5WP6lTfHNb9lp/WOvOCK2tz3PM41dE9qh8S+U1q30idu+Hhub4VS
         1RFw==
X-Gm-Message-State: AOJu0YzSwO5DcqC2RygeOMVWy5Yb5VcGuj/552S57DVW5PiP2mrrLdwx
	uVEippAsrLsK6GDDrykumNtd3Eqw8Dsrmr9riQuaSuypqZyNo8bkooOaP71Zm90=
X-Gm-Gg: ASbGncv3e0HgRzy7+6PC2ZmCcZdK/megDUTj0eErtC1cwMz4cI92vkBRouvZdhm0Aei
	AdqsKybd6YJXy8IXbdGoQulGZNkfmj6+Vuoj4/pspkzeN0f5OUsbLicIpdd444UgMyxnMAf/4Ul
	yiiMmulm4k5CxzX/y+mDvVQE8hYHP6lRmzdCQxsCmvyxvt1vBfNs610HQB0ZMIG56uJXNhDXYqy
	mJ+ybLpyexU3u6lzf7pVMxnz4VvOuX3KJGaQg1RkzO1ow5+FN7m1bQC8XC09yX4
X-Google-Smtp-Source: AGHT+IH0F/SgQRnJQccJB15pgwsxTAk2sPvb84dHeuiTIlcEPKTfPH4i0ZSHzGkFw4IcGv6Ldbkl8g==
X-Received: by 2002:a05:6000:154c:b0:382:4e71:1a0f with SMTP id ffacd0b85a97d-385c6ebb203mr2554289f8f.7.1732806488992;
        Thu, 28 Nov 2024 07:08:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd7fc33sm1828291f8f.94.2024.11.28.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:08:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] clk: qcom: sm8750: Add sm8750-dispcc clock controller
Date: Thu, 28 Nov 2024 16:07:58 +0100
Message-Id: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6HSGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNT3eJcC3NTA92UzOKC5GTdNIO0RPMkM5O0xOQUJaCegqLUtMwKsHn
 RsbW1AKJmVCBfAAAA
X-Change-ID: 20241125-sm8750-dispcc-f0fa7b64facd
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CZ6F7nqLC3Ppmtpbab+Dy2ETBIdeM8z83VBVqimbS5E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnSIdR1orKpaaLqfpdyBOkxr/V/WxoTayfM2sPp
 FMQjutqeFKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ0iHUQAKCRDBN2bmhouD
 100sD/9VJ9Hrx0e5+jwp0shsOpC/+TmO86/seL3ejD5yWFsqb//gmsyi4fLxC2LkJp4HAN9EZvX
 9/iUtWUprPEWrbrUbv3hRiX/cuyfAYEDJrQ9zHFnIzt30iHohqccwluldTaaVOXJ+TXTveSFSyW
 P8Hf1cQxY6C1h7TtynYkA+w0dn6FrD/tgMf8vtoOfO5+BvWtyMeL2CoHp3Yeu+kjQECKelSWY8d
 yZxOUdcbtP1+mu9rIXPwjZWaC3nWMfh7k4Ii5O5oE/w1WnO28cGujvXeIlXeJLKcPzi7qITQw2c
 soNaLUHRvp3SaFAL07KaUVNCAA0JhMEX5FjIQl1vhnnPfpTB/+ArjtD2VFshszRD6hHdp1JwFu4
 G2C6xNIa36CSmi5/X/NoP3Qc/VukKzAgY72n8j5zVMObLNMTzIycurTMJrRYfO19nX+BqsACOwS
 1oo0V/AXN1u1E/toICMcY3rHP7TlI+0Aoevyzvmu+8M4vx+deTkoI3mf0qkZ0QxcGnzqh87r1wm
 ra65O75WRh2pOYBMfXDA2Xh2o4l5QDe4Sv3FBCJJdouaqlR5pCK0zXb/qmcICNAn3xuNhMhX1Dv
 s+e2faQgqAfoARaEIOt2S4tGcznL7cSNO1DxmDqRgB8CheNDk9ZFfODYLSa5ICM51IoNvhlcZKV
 xGuGv+BUlybTkog==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Display clock controller for SM8750.

Dependency:
1. Taycan PLL and rest of clocks: "clks: qcom: Introduce clks for
   SM8750"
   https://lore.kernel.org/r/20241112002807.2804021-4-quic_molvera@quicinc.com

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      clk: qcom: clk-alpha-pll: Add Pongo PLL
      clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  159 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/dispcc-sm8750.c                   | 1960 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 ++
 7 files changed, 2249 insertions(+), 3 deletions(-)
---
base-commit: 7ef660da3b85122a66ede26d65ec33f65981d378
change-id: 20241125-sm8750-dispcc-f0fa7b64facd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


