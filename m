Return-Path: <linux-arm-msm+bounces-82307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBDC698CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 75C0C34EA24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276AC329E46;
	Tue, 18 Nov 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvCLIprv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC631DDA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471308; cv=none; b=oFOnC7GzTPxdAOru18RMvGPVYumzN0c3v48LzIqU0g7fXQgIyGdYv64Uor+sqXPkqLrDHQDROKAoQc369syZ1v5KhYd37jUtXZv2iZFkzuoa0uHHzqzoD1NVA6CTb1NZg+ALGEMudC/SgfvJAtMBlFw9DVSupRxqeVswHvfhogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471308; c=relaxed/simple;
	bh=RFRdBg8IaA1igAwGNwMks2DAT6+TNTmuvMGxWSCPlQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NyZWbi5KEhu0wSbbaiy+MTI0BncN1HNXJQUIDIPwd0re7IWCQ3wsa1JG/ctBoPNogq6DzRuHFbQvKGlLyX1xN9PQUAdpsvuiSSqMi5IClLBamA0iYjdrKy9fZWV/dbgwShNAUXJof1zcWmBLTigNqCFK8BpZJZb+KfuBPP4OWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvCLIprv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2957850c63bso56682885ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763471306; x=1764076106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1DKvnta57aRsdgYcL3LcZo2teXfOgJkxV4FGL2LoE4=;
        b=QvCLIprvM5p0CoBBhj5xc0Z9Hz/pJWKVnEWlIy5rbP2sUM9Nhy5s9VdEd56yZVDc6J
         GKCu6XeC5lfNDsneOavs90jNEn1PjDVXP15Hkze7blZw6fC7nidarH78eZmVqZPofzV9
         QULb2ywEWuQOsblPuU7LtB203338zwKHv21/l8gs1wbYqBmsIpWsBfJfif7apvPXsU7i
         eKM5bM1BdSorZCTmCZ+v6V2Wyn89RDULNBwlOzmT4eMQYIQVKmMHuvV+Yt6ZWyYmrXA2
         /eno0KknpTTbqrxcuXtK+2a7kY2yX6rnrRuZ+U320s5eMC/DiMuSa8QtMt7JivXrggDZ
         mVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471306; x=1764076106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1DKvnta57aRsdgYcL3LcZo2teXfOgJkxV4FGL2LoE4=;
        b=s8ibH5e+ih8P/acQSgOF99z0O39FOifzuN3IuDQIn6aMMfUWmoagwOtifNONJ4GRpK
         2DaxcR9qInV59rhnbdlh2KzdNQa+ZI8lcIu/vkujfEgyGTw/jo011jLx79eRKGt1LFmj
         /92h1vEZXkoMTj+OeUeV4k5okUiUN3cLVkX6by9KRN0qxL5a9T19f36sDckWTE+6lUfP
         kbT6IPVgXssiQp7FQMgdjtjpcSYGV4xy5G44R9A+JYD5AgC0y8uODc5Z2GEa3R4uVGLe
         ARSxv1TdLmfhAzL49GTYLJ0vhON57YB9KZtyeLZHD0i8k1P2dYAUbKyquTlpIof1Q/QR
         8iFA==
X-Forwarded-Encrypted: i=1; AJvYcCWz5IYCWi00wyo6Ih2G0VqtY/ODHMeRtmq+EVjn4EdPQMHtFo7VV3TtaWG2e8pB25469ZAJHjQKf0q5oPqx@vger.kernel.org
X-Gm-Message-State: AOJu0YztHYAs/UpWEMFzHh3JBWHS5m1qxc8tRLfOg581XQeOaJ9pVP+E
	PvTGML0R1JxB7fxghYr/FcmMBd+zCNNeXgyku8DoOSd+PpFU7zFBB2Ku7LLkfQ==
X-Gm-Gg: ASbGncsf/6GYKjHclvdj+bi6YQtJKWpr0fSRQ1djlcmbsp/IAIyNbNh5P4FZDhcCuL+
	DXkOvY6ZCE3VWNvK6eF0L6cWaTdcWwxfUacJeYt4g/O4rnUrlbQmlmVpGSbqFlY4j1qmrj5/sJa
	NqEv+c7/VawiOyZsACXodlEMh7GDKpl8LqcYa7uIWUXxn+S/fEf9rYBSeSFJ/u+l5+QwapLRGsq
	ZXmpW7iO+qUFqBND+oouycHzi9CFce/Q0BFonJCwqbGRA2z3MNPWANOnCu6+KjxHfzgNitt/d2N
	q7mbhNztzLVCrDCO59b3Z4/OUQPy9v/8ZRK6eLiEcUj5rPGMgjHzAcvYdJ0GWUW18vRuM9AsDf9
	fFn3rY/EzZm5wdvdLcIsclQ4DuUWDaQJCgHM3NwHAQSVGwNU4yIwfUkapGlQA9llOJDVfZosG89
	qaGz/y8GjKyCf8POSLcA+zD4tcrZXtEfBekzJjt6/DN7eX7A0=
X-Google-Smtp-Source: AGHT+IFaCF03PYoynNln9pVFOkSlXNT38wzbS2en5CwK1zytsQsL3yaeTJP/a+AiM/2MTYXq4aNNEA==
X-Received: by 2002:a17:903:8c3:b0:297:c079:4c32 with SMTP id d9443c01a7336-299f5515373mr40266735ad.11.1763471305706;
        Tue, 18 Nov 2025 05:08:25 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1088sm175143235ad.57.2025.11.18.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:08:25 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v7 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC support 
Date: Tue, 18 Nov 2025 18:38:12 +0530
Message-Id: <20251118130814.3554333-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the second patch adds the corresponding DTS
files for the platform.

Note:
USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected the switching cannot be handled from SW.
Hence from SW Host-only mode is supported on Linux boot up.

Changes in v7:
 - Added i2c clock frequency for i2c5 node.
 - Moved adv7535 controller section to talos-evk.dts file.
 - Reorder the usb nodes.
 - GPI_DMA nodes added in the device tree files.
 - No functional change in bindings file.

Changes in v6:
 - Clarified description of `talos-evk-cb.dtsi` to explain that it 
   defines common carrier board interfaces shared between HDMI and 
   LVDS variants, And It’s a single carrier board. HDMI and LVDS 
   share the same DSI interface, and only one can be active at a 
   time depending on a DIP switch.
 - Added missing newlines before 'status' and between the last property
   and subnode (suggested by Konrad).
 - Updated commit messages for clarity.

Changes in v5:
 - Updated commit message. (suggested by Krzysztof)
 - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
   Krzysztof)
 - Introduced talos-evk-cb.dtsi, which has common carrier board
   interfaces.
 - No functional change in bindings file.

Changes in v4:
 - Updated product name to full form per Krzysztof’s feedback in
   dt-binding comment.
 - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
 - Add DP connector node and MDSS DisplayPort controller.
 - Added USB note in the cover letter for maintainers' awareness.

Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and 
   added a DTS comment.
 - No functional change in bindings file.

Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
 - Fixed subject and commit message to use imperative mood.

Thanks,
Sudarshan

Sudarshan Shetty (2):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi    |  56 +++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 447 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        |  94 ++++
 5 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


