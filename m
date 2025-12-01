Return-Path: <linux-arm-msm+bounces-83911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC827C957A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9842D4E0577
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4F81339A4;
	Mon,  1 Dec 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TssZYJYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0222AD00
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551754; cv=none; b=Bo/BuqnG3EwUYu3Txp9hzvXrniOKkPxhj2yoDCtLFnvGdfCiKAQ+OgZhmnM4i/e8IZeKpjrb6iKpQYJjW6ZCFiAfCf5bn39uJUrGyn8EtRhxu4dx+lWEojdsZ+PtDx5CznRiBJou/UFAFYITPDJPiYGRSRKr34dLPLh2RfbZURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551754; c=relaxed/simple;
	bh=f2Gyeign6kwrMQ/XWX8ZeYYQxhP1TmsqHN5OiBoHeSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e90bnv1ty568jCVrSS288PWgsOiUD5ear4/Q+7PqT9us4nYj1nFHqp0uyQSeVL4S/Xdv3WIPLVA2/VkSgcrOHD6YAM9Aju/BvE1XlHMhUmjjgLGdj9GJUSm9sipktNQjBEFQr8AtrG74TWKf6KLQtY5kdQh3dgA0CM73xP7adDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TssZYJYi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477aa218f20so22747575e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551750; x=1765156550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
        b=TssZYJYizMT6Gk9386mnJGPe5jUu0iWlNDafH3R4+5oeNI+J5xGKWCwujEr5PWlECu
         HjwQ6ocV7gRjfFVWChy3rL9xXMYTEvSeZiEFO8y9Y+oUeDkR07cR5x/hqdOFktDNJN10
         nuZlDO08K5We19IjcLRc1chDWpMUpk9hbzw1s9h0SdyfVrwoH5oIBL/NbotAZ9Afb2Ea
         q/WERLhPOsY+OzqQyi3ZoehFZ7gvT2mjdkOs237U7VuS/Wyk/CDfr7+T8hOKp7Py77xT
         SIpez5eArBMKP+Rk+HKuLfJFZpi1lj5vYsEwRRzzFvHAnFFKTC8W/01CogWf8W91/epw
         DZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551750; x=1765156550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
        b=KF0ffLRMLcLU9glo9zM67KtI8/heaxcxT8vS+cmVBCCGTCdEpzk1PbvFfQIUaaPwX9
         K5281y0EFRk+cngkjccWMS5rqOS5wxdifsea01vI/CZRAP19O4bYEi1QxAk+++WtZuWJ
         gXQVHYGQAJo2XAruZA2i15m+6J9EU9xOywVhiY7D0olvfibv8GkFeRJeyzYSBBkAbi0N
         jOPvuM+fLFb7V/Koc4kMa193T21pOCJ2NOgh8HDX63l/bypXyll0aUo4dPFI78P0GPuE
         92T7rBXLavGPDXp+5Bwi3Bmk8eoBmM1G4q0gUlGpX4jNVJeE1eZ6XtE9iSmEhv1vxqsn
         LWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL1o8Wn22wgBexwkQjrlyaPDfp5jPPzoNLy7F44USlQRTokZmEDZ4RCMZrXq1OLUYYnz+QA5qVgYysLYzY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQLNQpD+029NWk1EzyyAgKcNxU465yBI7K6Fh94B5CEA4lINok
	FupL+ylDHiCS0RUwb6bgNR7/KCYQBShjhpULcTQfA/J0HmsbY5H+NPWk
X-Gm-Gg: ASbGnctTHXdnEtYv9JT5IVTiKKI8q0r0hm1na4pHKg74Rlylcw0pHeXDfvo9/qh+pmj
	IAIVGAs3wD0cPywgvsu+wPm3Iqsf2sA8099SCCu2HpjQ+ufA8A7TpjgpdUDomE6iLCxyH88DLXI
	rvYmnYZ/wmVHB/+I+LKBZzgvF2b3yKuoG0TM/HGAVrxH8xyFguGfCb8f4xTe3BtWo9uUo5zfEF/
	RgeJiz4cshAMygpLD6a34DohCRHOAEl4br6XcNSEKEbgQ0sCpwrZG0skUgdZ04JDvEKWiDPbpwv
	/oY8lnRMjawZ8VKtd+Awug1l0E6yVC/2vnoSwOb8YP5bJcgyo0RVBt7pPrVHIjWFU6IltQpbqvB
	6YI+uRCThdZEQIFhGoTgHUzo3zmVUr3jQoegS0DaWrNqYeYF7A1Udg0rDSy6Q4b9CXecD/14Jfq
	6VOx3rvLB6B/Ulk5zygYX9Bx1xMMLMt+EwrScM/mH4yyuUwtKo93aHIA==
X-Google-Smtp-Source: AGHT+IGHjRl74icUPwWh1aQ2xdTwSRRUQMAjgiSVanlvJksDJ6M0AluYsyZQkKBUguFBzPL4kDKIoQ==
X-Received: by 2002:a05:600c:3110:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-477c01b4b2amr432822595e9.16.1764551749507;
        Sun, 30 Nov 2025 17:15:49 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:49 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 0/8] Microsoft Surface Pro 11 support
Date: Mon,  1 Dec 2025 01:14:41 +0000
Message-ID: <20251201011457.17422-1-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series brings support for the X1E80100/X1P64100-based Microsoft
Surface Pro 11.

Patches 6 to 8 are included as RFC as we are unsure of how best to
achieve the required functionality, however the implementation is
functional.

v2:
  - Dropped ATNA30DW01 patch as it was merged.
  - Split device tree into x1e (OLED)/x1p (LCD) specific *.dts files and move common code into x1-microsoft-denali.dtsi (patch 4).
  - Device tree now enables higher external monitor refresh rates/resolutions (patch 4).
  - Device tree now enables partially working audio output; requires alsa-ucm-conf and audioreach-topology definitions in userspace (patch 4).
  - Replaced 'Work around bogus maximum link rate' with a quirk-based approach (patch 5).
  - Improve the commit message about the disable-rfkill property in response to feedback (patch 6).

Dale Whinham (5):
  firmware: qcom: scm: allow QSEECOM on Surface Pro 11
  platform/surface: aggregator_registry: Add Surface Pro 11
  arm64: dts: qcom: Add support for Surface Pro 11
  wifi: ath12k: Add support for disabling rfkill via devicetree
  arm64: dts: qcom: x1-microsoft-denali: Disable rfkill for wifi0

Jérôme de Bretagne (3):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
  drm/msm/dp: Add dpcd link_rate quirk for Surface Pro 11 OLED
  dt-bindings: wireless: ath12k: Add disable-rfkill property

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    | 1340 +++++++++++++++++
 .../qcom/x1e80100-microsoft-denali-oled.dts   |   20 +
 .../dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/display/drm_dp_helper.c       |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   14 +
 drivers/net/wireless/ath/ath12k/core.c        |    3 +
 .../surface/surface_aggregator_registry.c     |   18 +
 include/drm/display/drm_dp_helper.h           |    7 +
 12 files changed, 1429 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts

-- 
2.52.0


