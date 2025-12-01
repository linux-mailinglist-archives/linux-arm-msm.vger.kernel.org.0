Return-Path: <linux-arm-msm+bounces-84006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7BC987F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B2B54E043A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC53735975;
	Mon,  1 Dec 2025 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3b7rkPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29169224B04
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609753; cv=none; b=bKClEh1GAU+PTnzTzdPBRTe7eV0j7kMNe8ald7ocs5y5s9tOLOtnjrmsC07Z4zGdMp3uRIqLOU4YGWoB5ANV2ybWnQCHVJUkSbFxACvPTFZ6i9Ju5xUi0OQxmaSqLq7Wqsy2qpQChlprimliGxSG5cCwZfWhmWXl7zwcSv7LCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609753; c=relaxed/simple;
	bh=lgvjcqtaGhq3tWC52NRhGhdGV2AfWQbv6vCNqECLqpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lscgOrweGolH+1RdUHK1trz1CzQanCagbpncmY7fqr33ueyhERROwQb6+SvG0YELO/JftDoqpNA7gUsIKdfHPNhBfSYNiGZpg2NzIe9KcYz4kOsiCIxU/xfuyMd2GQXLLlUMdHNmyjsS72xILTJHPYAmKLTDXFKQWs6lR7nglN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3b7rkPa; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29812589890so52997505ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764609751; x=1765214551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYX129SJ+ny4asWr1yTdngoIEO7mFWo7Le9OoCt6DBg=;
        b=T3b7rkPa4aoJzb60HLiC1DUpZbgaaS3IxGrfmmNbZvdUaKalmpHooZU2bntlUqNIqO
         p/AGCrZO7ANRGAryOU9Q8yG6EyimLoLeJ4YNXGcloV/3J+Tap0+RG3deY7/L06aK/h+0
         UKSdD9vxAKghmKV+NqYT9e+wmxbFZL7eL8jbxZsKhF4ZkMVcPQw6F5M/Q/yW+wOi9kBa
         XAVYTioJCukFF/iNLjdKgZX7tzMtRNf7WCRlIWTC5HXEpfhM/WFeWDfaf3CLQ4eok2HD
         OvurddXxutrd7eeErgrfcDclarSZfSfQY2Xsdo6RWN/SofKq7gOoOMPBBwjjhzVoVqT2
         Xf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609751; x=1765214551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYX129SJ+ny4asWr1yTdngoIEO7mFWo7Le9OoCt6DBg=;
        b=Di8M8Vu5vy3VroS+a+n0urCLW8DYSwE61zCECv0YVifuJZoQjKnl5JHRTGWBhzxsKG
         q0dxtw35rCzCKEQpvT5iO/SKtB4kj8B3grKYuu1H24swGWkns8QGnhHffz12cSOwMmI9
         dHAcF0nyKaob+Opk4WmnZkt6tHBANNWqRya0zC9K4RNnt6gO1Vxm5AbYg8Ez77kYtzfx
         oGhPxZ6T5DvL72+fFHq9TZQhlsXh2jwgz1Gf7GWSyvMXa/HhN5xsdl6rRhx28ZlfqVbN
         D0ePdmB0w/tTfFMPZW9urnMkPLt5hUVZMg/GyjWBlzRL6B4tg4Kg8R2TVEXky4Z61ef9
         enDg==
X-Forwarded-Encrypted: i=1; AJvYcCWGQGK3y1re84HFDUnno7KfmrH4/M3OVvRl+bTIzcl0OkqgXOUzNNSYozeHTR1js23gPUAaYFjOpu8CIVh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7g+nsrGCy6zesBPNZfCF6Qz7bNWCe3KNsL2yyeG6AAcwdoKV
	i95NX5DnwkJlnlRvh3NWvDTsjTRkQg3nCs2DRGDJOaki3GhaENn9cPuk
X-Gm-Gg: ASbGncsLde9ejozTZ7Sztqqq57Lfj0MypHcH9HXgmit3GpUSA3QZLkg31lytfSK9njE
	Mlsg5/B6UWy5FV1RbbQClX5HRH+kvHV1gBPr+0AXM37iij+wnV9y/sm0jWYiI25YhRH4kne5b8n
	AT94CUwT3fOZqb3sKvmHifcaAVGRozmy7ilfw6hqrfuu32SDHViHvGTA9fVSCd3jy1Qb3oQiTkH
	mybrlmcp4B83nITFPqv80JKcHud8cZOSlpYcXwaoTEo0ClsE6/dVZaR9Q2Y9wv18LUrnTYnzXzs
	TCdTbrTCne0E/usi9PQxNqNCnep3QF1iPNAG/k/UAu0JJQoow8idyQD9muv8licgtXpKPOC+bGd
	o+YERlBKLQsO1DFiE1N8K8tdZhVE1BRIjSkn8eoR58ZIehHkUr19q75xqO+rVVwHhZGy26LhySV
	p0rtMx5KUQ1cW8EO44QPAdLxv0xtmvKAueQ9iA
X-Google-Smtp-Source: AGHT+IH4HDzsnkVq+NQckf8T5kiyyEPQ2mKO8GjZg56jEEZ3xOy39fNBP71SZI9A4Y01ZgoGKF9Nhw==
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29b6be8cb2dmr429364275ad.1.1764609751120;
        Mon, 01 Dec 2025 09:22:31 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44270dsm129876935ad.34.2025.12.01.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 09:22:30 -0800 (PST)
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
Subject: [PATCH v9 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Mon,  1 Dec 2025 22:52:20 +0530
Message-Id: <20251201172222.3764933-1-tessolveupstream@gmail.com>
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
	
Changes in v9:
 - The updates in the following patch url is taken care in this
   patch series.
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Ignore v8 patch
 
Changes in v8:
 - This patch series depends on the below url
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Moved the contents of `talos-evk-cb.dtsi` to `talos-evk.dtsi`
   which will describe all the standard configuration of the EVK.
 - Introduced 'talos-evk-lvds-auo,g133han01.dtso' which has overlay
   to disable HDMI and adds the LVDS-related on top of the base
   dts file. (suggested by Bjorn)
 - Ethernet and Wi-Fi/BT are not (yet) supported.
 - Updated commit message.
 - No functional change in bindings file.

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
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 +++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 447 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 137 ++++++
 5 files changed, 719 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


