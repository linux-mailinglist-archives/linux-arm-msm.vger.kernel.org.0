Return-Path: <linux-arm-msm+bounces-44003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C9A026F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EAF1885FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FC41DDC2D;
	Mon,  6 Jan 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLEsiTv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CCC1DDC2E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171084; cv=none; b=JZ49wwo+b9MSs0oukMcAiqMfLFY1fjv0FBdDjCZ2myxEbow4ZHN/xfYgv5F8IFSqcbYbW0rEbsren6LA1bAmNgUbjExXRmTeTl4DV5FPz1BRlNc8MWSAmOSxymOMIuHLWqBKNxZ5b90D6OUW9EPas+OpvNXFOmh7CivY+oh9TcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171084; c=relaxed/simple;
	bh=IzLjyqiZQYj0HolvNDwEGq9bzWMpH1csfdZOubbN4CY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SYwByEyD/fpY8yWzAtxvW1pAFRYjHURwN/knAWjcJmMmdEq8DmV7TSD3vc+GEgRkcqkPARL4zMR38IqomrQQomaWz5BAHzOild7iF9yR/gCY9zaWihiCKKYkq3VVdfwNtRjN+473/XUytM7Lkwb94Vk/LVS97oV2UDtbciSnryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLEsiTv0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436230de7a3so22460905e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171081; x=1736775881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMnwIoklKmOQ9k3BBN3w1reDAPPc+Np1bkPck8HODv8=;
        b=nLEsiTv0iLxLdXZwuRW/PRC2sIJ0D8DCgYgsAMD+C8bRVf94qhP9Z8iMduflxdGO5r
         fP+jJYSmkhNgexV5pR4yQcYsYPdNmTcv9O8HIuRCmOzyp5LtBFunUR3ii+7Stusgzbi0
         YMfluSbz1wYKtOh+GW/jbw/O11ZJwD4/oxtkya9jIQe+83YCkTCJNxdnifzoIXQAZVLd
         S2XiDAvD0o7R+GbosTbNhNx3CG6TLQ9txIfI5AgYr0O7fQmwP9dVWa2/3ulmaE2oMGrq
         GAwhk25nQjnfpThPV+8I8IhplYALs+G1hC3qrg46uam0f7y4C4CVJOVhtViHtXjRsSTC
         gIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171081; x=1736775881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMnwIoklKmOQ9k3BBN3w1reDAPPc+Np1bkPck8HODv8=;
        b=ZsJjDVZkEvdcXxX4yUNwZ+n4d4nKWPO4vGorABdln5cxoZhM2q5+50fRRdWpW+3IpQ
         /ZZzdDsbWI41W6Pbq6+G4iFSo+raHhjFq/m71I1NGCDHWei4jyd8/t4qHdYVvMXBxIgx
         gmlDEqup11aPvCaS6YMcQr06RkN+m20tYLpzfwpWqV7xOSAcPi9E0p55Wv6bdPiZmlBI
         WtQskoUrbH0b9L6rD5rEo0/xED+57/j89d7EsQhV6apIJ31Euy1lLLIQ5HJjHkvMJ85+
         Kg1KR+HM9S6uLQM9au/26HTCe23fCXABAHTKJZAFETrGaNPfbBITjbOw5KQREo0RvyRd
         S2Og==
X-Gm-Message-State: AOJu0YxvQz+cB/e+m+g/ug7bt+cfVcWaS6EYnO73psxTtoSUB6aj3j5u
	8QIS1NMQJyrpCLO37Drh9Qbg3o2J4YRlFrNgkhF1mR3q9Lx2F61IbQt0OFLkCv1SzzEgFGuPMBw
	0
X-Gm-Gg: ASbGncs382VZVNWaKrpTN+nD1o2JYiKeZAZOx11sFHcHpD+fSsO3CXsdmg/Wzc7CeWy
	B3w3bmBGZDT92qBYnfyNv2z0p7Gu4UrhTgp14wG4CYzjEGKI7ilfkg15SIlzlhzWALFj+v6xMQZ
	nTxoYoiLUJDgyWbgK3S9u4dgiyEoJ510Nd1f2buS8JEQGVgmSIHWMupHKqqbHhu4d70XMfeUom/
	0g7Ko7BZO5TdrwHU7Mz1EdP5bXt+92gw7t57RGWFZKYrYXy0aSNEM3NSHfd7NHIWhxSSV7E
X-Google-Smtp-Source: AGHT+IEXQzyXvJh87C4qYu7Ax5vz3+jmqOb6lMmmEshKHmHAav4FLPK3omE//aDu+k4UsNcOasv61g==
X-Received: by 2002:adf:9b83:0:b0:38a:4184:1239 with SMTP id ffacd0b85a97d-38a418412d5mr11223749f8f.10.1736171081048;
        Mon, 06 Jan 2025 05:44:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm47383151f8f.104.2025.01.06.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:44:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] clk: qcom: sm8750: Add sm8750-dispcc clock
 controller
Date: Mon, 06 Jan 2025 14:44:28 +0100
Message-Id: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzee2cC/13MzQoCIRSG4VsZzjrjKJpDq+4jZmH+zBwoHTSkG
 Lz3bKBNy/eD79mg+Ey+wHnYIPtKhVLsIQ4D2MXE2TNyvUGgkJwLxcpj1AqZo7JaywIGo28nGYx
 10D9r9oFeu3edei9Unim/d77y7/qTxj+pcoaMC9SojESu7OVO0eR0THmGqbX2ARN568KrAAAA
X-Change-ID: 20241125-sm8750-dispcc-f0fa7b64facd
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IzLjyqiZQYj0HolvNDwEGq9bzWMpH1csfdZOubbN4CY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne95BbwhkZoUPTZwRDH6P8tjnEWzo4z7vS6O7r
 +AIEX/2BTiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3veQQAKCRDBN2bmhouD
 1xd8D/98vuMER27s5/cr0rdd39XTxPqh2YSlg9Ybvb8cXrFN+jeQV/TvgF4ve0t52SKauCaT5Sc
 51gjdcMyNtcT5XPnfY9krIgClBvPl3BAXJuHwM2txKngbPe6L3Kz0A7s3ETUNwUIGvPlMbXUDnQ
 jnyYwRuxEUz6GAQ+aubhgWmJRotodmPzoGdGd9PPyc65CyPWdYpDkBv4e8RAMbM82rdiz0YfIR5
 tuudFNp//IgliJUaNSdm1e1CJEbXSyeVHH9rfRdnyK7p3sK+QPSAU/k1v7aMmypZqOlMhDjM6Es
 FdEh0p98uLW5GUZmNxITGloM6DAbY4GnIUrTM0Nj5rGhx2cGdJwUvJkDjkWEuAme83Qd+q0fV+q
 yZPXvDjMJ/cDvkALAF13UJRxWtGUB5qKYGPHyzCnQGXxt8jEj2eQ16L4w0VYwcEFN7HXaKAtDwa
 QHn2K6i2SORte35KSBhTfctNd8kU7jYgQqBh3LN1xOC/+Kch6UUFVoxA2Cm1pQJZzfT2QPknKnI
 HHcqSi4QQWopKNdJQetO+iySKhSBoD48FIXqz0RPQtAZdn8Bb9zqHTog8+jpt37twzXtgjwC673
 r3VSrA8McuCy9DkM3bBVc5NxBaTQx3DEF6cHlI+WnyAy3J1hIs+HU2VW/MSyOm5I8Kjmu9e3Zpy
 sMDhtoLYFZjo/fQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Display clock controller for SM8750.

Changes in v2:
- Implement feedback from Stephen - see individual patches changelog.
- Few cleanups found during testing/review - see individual patches changelog.
- Use clk_rcg2_shared_ops, where applicable.
- Link to v1: https://lore.kernel.org/r/20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org

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
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  165 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/dispcc-sm8750.c                   | 1963 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 ++
 7 files changed, 2260 insertions(+), 2 deletions(-)
---
base-commit: 3dc591aad724ed3578548c211cc3c368f6dc5947
change-id: 20241125-sm8750-dispcc-f0fa7b64facd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


