Return-Path: <linux-arm-msm+bounces-44260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF5A04FA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77BD8163F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC2019F11E;
	Wed,  8 Jan 2025 01:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SoJsMj/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399015FD13
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 01:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299731; cv=none; b=bf2UiixsQS5v5JOO07E2/sMkrlNnnsXdcXrhwDvcSfZnAXZFqNqz31GQtB8ZVY6Ud5m//uZ8KjGNcZFIYADMpPv1NQTZ4tIcD3Hx9vgow746SJJyxpHC3pxOTYDhILcrATJpb1UscF60VBG1bV8kHcUvUuiZFC15ogX3TloEWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299731; c=relaxed/simple;
	bh=bqg0+FMlOKL/Oya+KGSPfGQW2exu4yfKcdmsG6B/3po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t0nwVFkT48X+Gj/sd7J+d92Tc7johUbz0l2YD80Gd7u1Tqa5eSJ9YazBxC0/ARJSa4Os4aM1qBftU9z9b90r/PCPMCCNMjAsQW1wvWyGbmjJrtgGigPZI4kEBRZerc5qpebvNJ7nXgnUMFJ82Vuy3r+fFwB6MZWGZOmrc3wROpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SoJsMj/E; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso18812850a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299729; x=1736904529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqd+1cGHPrlBvYanevBgNpqOS63DSGTtWvcDTpfRh2k=;
        b=SoJsMj/E9Poy8wUJbkJREedDQHgP2F1wxEPLniI/k2wp3yE1pceISNAmzXcVfuXvK5
         9BRfHYhK60g9yqeak5OBgywz7qnRB25adOeuLBBiTzuSrfUDnPTlJ9A5SDxZx1pgOZO4
         5pMYyaVVHcg8MSluakLdO5pDb17PinNeuRpXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299729; x=1736904529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqd+1cGHPrlBvYanevBgNpqOS63DSGTtWvcDTpfRh2k=;
        b=KrkGq627zXWf4vkPOGUCgs61SUcaQRJVKIiKWLX8Mq5+9TfSYRQhD7SsKEh48vgRe6
         CiWSWezKbDHWECMr8BycE14Kme90WZhHPtxtv8CiA/Kbh+d+ywV5+b7b0uq8JaSafMp3
         uQgGNxYFE4gyjz2wCdTKlnWjc+TCSnVPB8NsYfHNuN/QTUtVGN7nX/2e1brwdUt92uzr
         4wgVdK4EutrWd9onKlaQV5k1IyAaUN9WoaaQiu3VjF3LfcOVNwqE6ZAcUUOssvEbNXb8
         5YO25uISWp9sRmzvgz23qSB32CjKkWIuZ7JT9yZIFmh/dmj9XhIIm8sBk1CV9OwL4oiP
         Wi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe9ER9kyqe7iiyBWuCzhINyEqAHOCeikzmSe4QInCJUg3e8u878zpr9E7pM5ExX5lyZCaE1ilhFDuvPM8m@vger.kernel.org
X-Gm-Message-State: AOJu0YytcoUbSv/sdP4jlX1fSIEoVA3lbPeqY66G47ZQHJ/OR+Q99n8w
	qbSJdx//Mtu7vAcH8Gjibjl8G8kJLyXns0oA7a+fxeG6OviFt+rWc+GmbziV3g==
X-Gm-Gg: ASbGnctmi8HicduCn6fOeW+z6b2BRebzxO8rmQrD6X0uYjjJRkGwkFrXzUN8S7IUfXJ
	P/vIGITsFl1cJMBrP2sDMD6mA/ohecGFUZjXnZLT0wS8L62AYdaJqAc1yMEpOm2RD0c83rPUcXW
	AEJ4S6LIkQJGvLJIz7GyUzOR0yuva3javM2bzUTTpxYhZQZ593QFUAN8wKypXNSbgl2SEewQPx0
	1cl2t+lPF2I9yDOfS3I78mN3/crVGVlwVwX6zJQVdwzrGzLyRJc0EmlR/mMXvbPWKDpGQQdnJxO
	b2Kug7+9wjwyYgHZKGwM
X-Google-Smtp-Source: AGHT+IGLMAn658p03PrE1F/SvBkX0kJr3VIC8TJvPQU2lqUj87YfRHHuWKXhHHpqPyBEZ+g+tphMPA==
X-Received: by 2002:a17:90b:5448:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2f548f1c430mr1421193a91.27.1736299729083;
        Tue, 07 Jan 2025 17:28:49 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f54a2d43dcsm225080a91.38.2025.01.07.17.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:48 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 0/6] qcom: Add an SoC PM driver for sc7180 using PM domains
Date: Tue,  7 Jan 2025 17:28:37 -0800
Message-ID: <20250108012846.3275443-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements an SoC PM driver for Qualcomm's SC7180 SoC that
creates devices for the nodes that make up the soc node and attaches PM
domains to those devices before the devices are added to the platform
bus. The overall plan is to remove power management logic from various
platform drivers and consolidate it into this SoC PM driver using PM
domains. This series isn't there yet, as I haven't had the time to do
much beyond this starting part.

This is a followup to my presentation at OSSEU in 2024[1]. I'm sending
it out so that the early pieces can land while we work through the PM
domain parts which I worry is going to get annoying rather quickly.

TODO:
 * Populate more child devices and attach more pm domains to test out
   more stuff
 * Set power state of PM domains to match on/off state of resources like
   clks, regulators, etc.
 * Investigate setting runtime PM state of devices before they're added
   to platform bus
 * Remove PM code from drivers using the platform_data non-NULL trick
 * Make multiple domains? Perhaps clk domain, regulator domain,
   interconnect domain, etc?
 * Provide a way for runtime active devices out of boot to be powered
   down when a driver isn't attached

[1] https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google

Stephen Boyd (6):
  bus: Extract simple-bus into self-contained driver
  dt-bindings: bus: Add qcom,soc-sc7180 SoC
  bus: Add basic sc7180 bus driver
  of: Extract alloc/add functions from of_platform_device_create_pdata()
  bus: qcom-sc7180: Attach pm domain to watchdog device
  arm64: dts: qcom: sc7180: Add SoC specific compatible to soc node

 .../bindings/bus/qcom,soc-sc7180.yaml         |  76 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 drivers/bus/Kconfig                           |  26 +++
 drivers/bus/Makefile                          |   6 +
 drivers/bus/qcom/Kconfig                      |  16 ++
 drivers/bus/qcom/Makefile                     |   3 +
 drivers/bus/qcom/qcom-sc7180.c                | 173 ++++++++++++++++++
 drivers/bus/simple-bus.c                      |  79 ++++++++
 drivers/bus/simple-pm-bus.c                   |   2 +
 drivers/of/platform.c                         | 130 +++++++++++--
 include/linux/of_platform.h                   |  14 ++
 11 files changed, 511 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml
 create mode 100644 drivers/bus/qcom/Kconfig
 create mode 100644 drivers/bus/qcom/Makefile
 create mode 100644 drivers/bus/qcom/qcom-sc7180.c
 create mode 100644 drivers/bus/simple-bus.c


base-commit: 3c48780d48df029cf9d5f42b8971663e6fb975ae
-- 
https://chromeos.dev


