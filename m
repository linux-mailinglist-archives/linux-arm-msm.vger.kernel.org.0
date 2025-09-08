Return-Path: <linux-arm-msm+bounces-72573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912DB48E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E821895881
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368E0309F15;
	Mon,  8 Sep 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fk+IPlEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29803081B2
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336669; cv=none; b=X17uTS5FMtyIQVSkm7PwZS7VY7PD6iVIUuc6cYWkz/LXkQhKbJf0xaBbNbDHlL/f5aGuf9p9sZrxnc4t4SV6v/UWMFghAOoDWYrtXmTBCpmOEMPQ1ZIEFzVhzPyn4+mLAHQz7CxqI2y5xJ4rEpB/ecLX3q+m7HyuxTNCrWG2a50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336669; c=relaxed/simple;
	bh=GJhPHTORzQeMZdAUCocINlbQeRuM3KT1od1O9w0/Xmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OwCMznr241fTONR+3m2GQmBcGn8WG0Eh+I4iRtNTt3sJiSoCSCfSx2I0wZ3EiyZauFdDOp9R3j7pyLlhdoIWg4vm3w7e4gfet3mryJsVZ9Ddrj+W9dwlpvA8yRtIW8JengYWdqrAVO3GltzzO89LOsCyLENTOSUpOTDHiz4HTYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fk+IPlEA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de56a042dso7370865e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336665; x=1757941465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+BmpLQdceYRG7RY6FfRDG60NShGiPldYqA/h5za8sM=;
        b=Fk+IPlEATsY0Hu1YlVRA9GsS7BBAkVWexpkvGxHP40I6lv4825TkAshKKVkd2i8bLb
         fnZMa2esbGmMXnV2XtFZ04yzTa7Kb0NioZl/7Cb5RJeRoxeUil6M7JubPAnK9p/tB4u3
         trfw4YEQqI2J1YVC6nHLIf0nV7MnYbjNL3CsaGudzU9Qo2kYJBEcpNRuKdx33NSzVC/b
         ScSukhs8t8yNRi9+gBOlaBhPILVLT+AF/+BqLfUl3oOcKgMMIFBLHALhGjeClVatHsVw
         p4c7efKskYni6gcvsus71t5xr7wZL50wpCmr2E5g8XV2iZAJeNgeOBy1ZEkdTlLk/UAU
         VkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336665; x=1757941465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+BmpLQdceYRG7RY6FfRDG60NShGiPldYqA/h5za8sM=;
        b=X99TD5x9FBWa8kuSz9pzf0hGBz91qqeWQw3Xd+5LMjvKCjnR5AM/hc9UC9m1lsZOlD
         oAQ+vCZPdWfT0wpuNC3ypI4wVyBFYsY25DWZDoy1owFb8erQMviU9l6O3ulgZeY/Fqsm
         B/RtKaQhC/9FLLGf4px3S2C6jkY2/Y7XiFDavZEIydoSQN1ArjFmcUk8JFKp8cCgHdqQ
         wU8DAa14DDJVwhHqbvkUZH284fChwesxDLaBG1Cq2yf3UC/G3haGZxrNhY+qgPsASSBO
         +8hxzdlO5woZjJVZ8TTyCGz9mMffkJdPUQEJLDwZEI6OEq9VSoLZuVipQqyTxmlW2Zld
         FX2g==
X-Forwarded-Encrypted: i=1; AJvYcCWhCSjFDvsOosoNse0mil2CVhyh2jReHB7RjIszUsd3kV3ahbGEDRhvha+Oo/Rfhxo0/jhBl76n82Ie/B50@vger.kernel.org
X-Gm-Message-State: AOJu0YzxttXwwgevQz5bMiEKMeMh3lDdN797qRxXblLqO0L4Yp4eRURk
	y+YNivxhU8cmJbBzV7/+qmbLZYoDBE1OoFAhxAUpqU4B3YyXinF8Oe1ZiUVR3VIFg5LgNXw/wcy
	qlSyO2bg=
X-Gm-Gg: ASbGncuPIulAjDeWZTWO1DXdHaHyM2GewmLgXQbHx6pPHSZ1ID4pfuQ5ptwcceXffj6
	Inxt5C21oS3CVea9fP0zJfV3z0aD0M1D8g7a9tGVRhUL+H0TfnbZKlpokAmcqZwPTdd/wm+vrJf
	mCjUWsJ5Y8+suAR87xvEDujlcfHop01B48zaERcr95IqlSLSZb2yFllF0/HOUh+TTFRqlJb/q/q
	e/lMbZ4KCo6l9pHMAlcMcBTUMkPV72tgs+07CzOYE2mf0Rv0pGeiXTfV9QnH4akW/ChlkyC5PgQ
	FY9eU+BAll7RIDTsSnQskE94Dn683PWC18OuPDbvWbJTt2VFzKlImIxMPjoX0oGer6KnExREf3Q
	G87en/lwz5j1sqWhwD+NVqixTPsjesh4azQgexY0/WkojUih3+TP+rA==
X-Google-Smtp-Source: AGHT+IGTXRp8nBogkgIlcEf9RUlMXZE1MYZ7qwfcb5uuGBnjJTSjf3Iluna5GLbfmKKFomw1sOdvFQ==
X-Received: by 2002:a05:600c:3b25:b0:45b:9a41:5d58 with SMTP id 5b1f17b1804b1-45dddea60cbmr64611275e9.4.1757336665015;
        Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:04:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/5] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output
Date: Mon, 08 Sep 2025 15:04:17 +0200
Message-Id: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHUvmgC/33NTQrCMBCG4auUrI1M0lYTV95DXOS3HdCmJCVUS
 u9u2o0I4vL9YJ5ZSHIRXSKXaiHRZUwYhhL1oSKmV0PnKNrShANvQXBGpzCioTNzAhgA7e0Taa1
 tq1ttuZUnUi7H6DzOu3q7l+4xTSG+9ieZbet/LzMK1LNGWdnU4IS4PnBQMRxD7MgGZv5BJPDfC
 N+QxhgPzp+l0l/Iuq5vVuxBq/wAAAA=
X-Change-ID: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GJhPHTORzQeMZdAUCocINlbQeRuM3KT1od1O9w0/Xmo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRVDMVGgxHzLejb7eBbyoFwp6E4YEQMRKPg72/U
 Rwjh/ruJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVQAKCRB33NvayMhJ0VxID/
 4wFkdgfYu9J7loTdKrRz5TqNDd63WB1xnl/W4hVSu2QdX9wb2jyH6rUY37phQY9rtVycGyJTzy4cnd
 bi2OjtCN2t5VD8MJF2QB6RTWRYeGqRu4Rturr3w/3WcTHwlJ854MSYrHL2hppI1f8bZyB6wqswekus
 xYvmd2waH5jU0iXp1rLwrCdBphUPyvJylV8oSUb3kyIcZjNbgmjUpIuBSZIkBekeYsesIh8s3Il5zg
 oRiIcBFWFJA8XLfk4Q+Rva2EWkGskG1obCzljpnJDspCLDirzii4iD19ShH59aTy7dJu36GdP7/Qsa
 ISdwycHc7lETEQ7dzSF14MzvjAzSB5fDCqhA7eny3MpxBperELbkHibfuDBClM4cT7u7wT4H0jwh0U
 EHwpwuOgpCH7CM4z4nqMmOKlwUy8hZursraRsi2sFYghdAKSJKOK95FakAnAYIcTDPRNDcNNdACV4j
 mMhQ4hD3ZW0YNJbhQ+PVu+9XT7Qw+eBcueBCBbTZJVj5Za25jgprIzt8y85t6nv6yz3nAkUAM8dNC0
 ACpUhXWFsEKTVcFO+3wmtS5pPNqWOww0dSqma3wv4kx1s0LeU/ZKSbdWR9fPnVjnLXQno4onht+nvJ
 f9JXE2dW/js9wgGCRf5Z3Ca4GV19HstrNjpQYFXQ7mQtwZDhH+hhVM9dOVCg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

We need be able to specify the lanes mapping to DisplayPort
and/or USB3 peripherals when not connected to a Type-C complex.

Add the documentation for data-lanes in the out endpoints amd
use those in the driver to setup the right PHY mode and
orientation.

Finally Add all the data routing in DT, disable mode switching and specify
the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Depends on:
- [1] https://lore.kernel.org/all/20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org/
- [2] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/
- [3] https://lore.kernel.org/all/20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Move the static lanes mapping in data-lanes in the out endpoints
	- new bindings
	- new drivewr implementation
	- new DT layout
- rebased on next, fixed simple bridge rebase
- added link frequencies for dp2
- Link to v2: https://lore.kernel.org/r/20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org

Changes in v2:
- Model the HDMI transceiver as a simple bridge
- Switch to a static lanes mapping property
- Link to v1: https://lore.kernel.org/r/20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document lanes mapping when not using in USB-C complex
      phy: qcom: qmp-combo: get the USB3 & DisplayPort lanes mapping from DT
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  59 ++++++++-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  82 +++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 132 +++++++++++++++++++--
 5 files changed, 270 insertions(+), 9 deletions(-)
---
base-commit: 947efd54a86984b5f7dee9cf18c1ee82ec0361a2
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


