Return-Path: <linux-arm-msm+bounces-84955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19277CB478A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A260302A942
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E0236A8B;
	Thu, 11 Dec 2025 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hqh4jXO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65926C3BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417717; cv=none; b=l+/BhsWsWxjGCBmizbhKfzBUSMF52YlG6mFb8LNd/V7mgDpvJX3s6ey9Z0cfZbIHstrEUVJWrJ3OuL25Rxf9eQCs1C20e4KlQA47T35/yOBUzU6ant7NlRkX9H+saolhNYNWCaLgT/rrNaJ2RXVQe9eU5mhUoD1uR+n6QXnHJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417717; c=relaxed/simple;
	bh=W7itVJ+K14uYFBw/EUtnTnjPguwCYou1lMyufwwD4OA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oO6Kvac/EHO49oGPIxXxZAs8J5IBXduiZn1N+Ii7Gg/JmVqvN14xIef7FaGvI774lfWz3M6G4rYuf/6tgPebo76kplanaUcnkbYoyFBO4t3DfCzWxd7zAKSEHQWCQ+cg/LOp76mt/R48VbMpO/g0I5A43Kv7WHPAyHsNf6NCsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hqh4jXO+; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b25ed53fcbso70729985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417713; x=1766022513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xorHG1t1xysFuaNwpnhl3h/uUznlPWobnDCKy8/sHEM=;
        b=Hqh4jXO+JFx5fUN1ooPNvLEM1eQIfrcW53Zn8eyIi05/WHB3enpUB0Dg8S6PnuLoj1
         vk9ipCdM4U3W540daMm0vT07DfSXagH+cNdli/9EqXXdU9+fCWVgs58WHcHXkUtrVXFw
         X+UJGZ4KE8zcU53/uYii5ob5I5TwWUo3SX9tPgOBzZh7XKcOTjSbh5KmIuI3Kt4pc/Kt
         nyyzD65Xp2UyCWuWdA7kIGdfJRLjC+ZH7xQ4YjZQflAtvJIa/f504aU/HtQ+SdRI1+78
         BOlQCctXcvdPJJ2BqSqJMxJMoNr+wEybXTByR5LHUpgfC7XzK6Zuv/WpMCa9oFaq7z2m
         KtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417713; x=1766022513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xorHG1t1xysFuaNwpnhl3h/uUznlPWobnDCKy8/sHEM=;
        b=pgKnHLAO7ZAMy4OWh0uPnLOnxL0VRFjFZEJv5LqBwip3DrVW7izhZW1oX4n5CU5A/1
         KRRReWmKK3D08Jnq+1ENRlatuBKHG7gIxSzgI4Xii5pbzvLV7c0QVbmMfHsv658MHhiL
         isWvvPde6hUPKfcscUBOxjY+pLHDUaw6dcvPOv4aMyjthAFWr0MgTxD533cmCPGTcdFC
         Y2S8KLT8XT6516DZ5vgUj/eB6W6wvcR/7li738ldKMQkY+H+5Zm605uSImaISPbFhWE6
         hLA0vmx5tx1/woDRgiStOScRrEwJ/8/ovFwbMERL9DSxBJrSEl0c3+MuFY1+p1T25p7T
         uI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSuh12h07x14vK167q2FyVTZ2+/AGAMcepYHp++QbUrT1KhINR+kgZY41Z3F9HkyL0GvHZLe9ym8TMSDao@vger.kernel.org
X-Gm-Message-State: AOJu0YzfjvaFCd9udNnMq1UcpIhK7WE5icWBPB26QpTYtthZozPw4Ta8
	bc1SeP7WUYsFspyLW+5h/NXNlC8pdxpbi6iMr9hzRG0Lv2ZjnMMB0XyE
X-Gm-Gg: ASbGnctyxqvOy7n3DroYrsfZ7j8AHm5w7cDyuytxypkrfR+PET5NH6FplIImBQx/3Br
	ZPiM906gt7Ktzl1k0MRQVpWpt7/9WJLUj5cSa/nyV36BA93rjGMgeN4uMhttSMQiK+3t5M/MzVs
	g7/y2BdPwJZjwnkAOzxf5bbU0KMI5yDY2z+xDHCG/6chfS4CMtrw0xFWcFMmr0d00e0+1gOQrzA
	fHbuvHjmo31xYsfQ/Qfa9pUvOhxPa1O8LuhXc4z8v5DoX2blqEf4akT0lIw6THIQqjCSYZiv72O
	mR9h81bhOiAITIfP6GDUiK2dukbVeNcmg/WlNQIKMP3dxC9clefjJkouO2myMCjYbzpqTgv677i
	E2sBmdewi5Ico+vor+fVIP1IHL+im1QpW92v8D2WhnP5rnCfqIGhwRUuEtdjs1EYlSwQPRMNI0m
	CdY1vf4/XOopcqWQ==
X-Google-Smtp-Source: AGHT+IEFRhR/wmzVTpBzyyVmjBrTDUOZN3dcOw/2LuUaDfS8IFMUqc329O7ZcHcPKQxmBIuolezEqQ==
X-Received: by 2002:a05:620a:170e:b0:88f:561:d956 with SMTP id af79cd13be357-8ba38a75a85mr597748885a.13.1765417713620;
        Wed, 10 Dec 2025 17:48:33 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4cd34sm91518285a.47.2025.12.10.17.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:48:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/5] media: i2c: IMX355 for the Pixel 3a
Date: Wed, 10 Dec 2025 20:48:41 -0500
Message-ID: <20251211014846.16602-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (5):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  arm64: dts: qcom: sdm670: remove camss endpoint nodes
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 119 ++++++++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  33 +++--
 drivers/media/i2c/imx355.c                    | 118 +++++++++++++++--
 4 files changed, 357 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.52.0


