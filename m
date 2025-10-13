Return-Path: <linux-arm-msm+bounces-76952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F865BD229A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDEB33B7B8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A1A2FB98B;
	Mon, 13 Oct 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFtoVdXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38F2FB607
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345752; cv=none; b=pMkzBodP1vpl2NdFdNsWjnr8VTA/m9OWsxogDuUZ1maTtzlwQdg/cbrrifSwYIOOrYhP68fJ2BkZ5VNegRB8LRut4CXIWDkAhpe/Djt1gE8rdRn4qm4dMgPOdcCSXcyqCkzQ5X8eBLaWyWnL+wbxlPzEQQOfvtxgCs3+0H4jf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345752; c=relaxed/simple;
	bh=iFT/OozDJej08K0ZYQ6paGGHopTw7UGpCn3mO5EhHdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lpO63uSJTdmNkrWrDHBIbg3T9L/G0dLH+nsq4SskC2/ZegRIbbjhegmP8LzsaQoPAisnZw7e9c00C5hQzYXdBAj5dWHYGuMNvB1SWPvBwhZGriLGfnGeTVTF3JyLa422voxOAoEitJ3hcEhzN+/fFh33N1wyGu+RZ5QUndg1v9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cFtoVdXv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ece1102998so2249252f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760345748; x=1760950548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvSaNIdltHgitU+Zv1Kp+cZ7gZkg+huS59K0fHVCRMc=;
        b=cFtoVdXvHtCGJbsbygDIs9vqmXm6t8M64EdOFBs2X9QmPvbQEL57TnGL1OhXde/Ii+
         fP9+3ZfdW9pHp/FkXKxEgQnOmNIBVArgYj5BJuId3ZgKfulnkWFn3+VnNSkxRoEl01R2
         sbuvGmw8GSo5Aw1oESU6OxVG3q1g9WC3neIAchR+hHv8BBMMtKkoRQp3n0NgsiV+tqZm
         z32Ta5m9o0tESYaqOzRp+3zqeD1ihvtXY0QmP1BJ4tsYS2V/QNa8xKbj1oca0ZCXKAWZ
         T2iUhH7oFITp3yhZwGx9V8BizadWVql3jRKpHSNPCRSqljdADJWHVRLaXZsksVrFq7mx
         sJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345748; x=1760950548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvSaNIdltHgitU+Zv1Kp+cZ7gZkg+huS59K0fHVCRMc=;
        b=SNRJbherz1J80ImlTZSg8NvJjVIkEzZNyyts4iBJF6J4+sK7YH7TxbMh1KY/wGublX
         hRVo17P0mX0MyX19bX6FIsL+Odmmq1vjvcD+iOVxadNSDAYQI0daKtNJ1h5N3nut+HIA
         nu1lC5tpq7p+tYkJa58ZxxN22FyWEA4rM4TPZn2SG1FUEHN34zLlNnIbOzRfcVhbJJOU
         wc41o+t0D0e1QpQZSFHHfxiQG+jsv+pFnpggDBiPy/tGKpPYkRpzHZaBBwU4hv+5MgE/
         vx+LcPByb4IkpqZs3jblqtLoJsLw04NAlHrLS7AtDW9MSeic+6KpRqZTvAARKKHQI2rc
         DG9g==
X-Forwarded-Encrypted: i=1; AJvYcCV3QtAXxusnZyKLqUu53dYrA+GNLJ7odvTht05WDANopWaeAZrRyJJLWTMajb98+sfEC9KyqSWOwkD7z4Le@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNqiBkDfdl/zqU4TxpmPuaZL/NfmNirKyPmwe5zPeSJO0TnvF
	D1nJy9/Gw0lbC7E+va7U4+GhvXLBIrcBe/pvSxfLj+M/rrpZl9naFBkz9JtFrWFM814=
X-Gm-Gg: ASbGnctdDS3Hj1hQczNfI3sk9dmP4ijHrUPg3qIZEFHrZqADsaxeat4++XLB1MiCaGS
	iFXB1GY5/wxetDgmADpVulFhKDPvyiru0X54xpbMtj5kE94r42zMiSopNzEJXonsRkqds34ZHoy
	H0rA2//53bSgZ3mgVkbgGGAcrZW22yWd0Aj/RUjSN4Jn7wkfjCJNkcyV6LFWvF7sobfx3mtLBF0
	G1vUlfBQOLNa5IBmA9zfAKcyIGjYpsiLfaQgcx5myaVHreCT4Mc7w39YwkvPbf4HlFtE3EYpqIM
	1Lfh+iFTVTZAxoQpQJQFYzUPR6C84fk0iZVWThgH8zaU025/O4h7I0f/LNA8u8xI5AyNB7rIvrG
	b+jn3VKDaNqs/+MoLZNP61a6JKK9OjGn6eMZ7SPhMmwL4tzeVL35USIyM4gSsWLHOxURXCQ9mSJ
	CU
X-Google-Smtp-Source: AGHT+IGDof18NxLQwGrjqbDhgpVa8OKhE7xFuXEXV3NYc6AlkT4WDiH1ifDsXp5P4tO+IetP9eHxlw==
X-Received: by 2002:a05:6000:26c9:b0:411:3c14:3aa1 with SMTP id ffacd0b85a97d-42666abb42cmr12619906f8f.3.1760345747737;
        Mon, 13 Oct 2025 01:55:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b99fsm180016185e9.3.2025.10.13.01.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:55:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/3] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output
Date: Mon, 13 Oct 2025 10:55:43 +0200
Message-Id: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI++7GgC/43R3W7CIBQH8FcxXA/DZ0u92nssu+Dj1JJYUai1i
 /HdBzVxOptlV+RA+HH4nwtKED0ktFldUITRJx/2uajeVsh2er8F7F2uESNMEsUoHsLBWzxRUIQ
 SgjvXe8yNk0Yax1xToXzzEKH106x+fOa682kI8Wt+ZKRl929vpJjglgrtGsEJKPW+83sdwzrEL
 SrgyH6QhrBlhBVEWNsSaOtGmxeEPyJqGeEZsZIb0jJjWfuKiAeEk2VEZERVmgpQmgttXxB5R/K
 lahmRpZN8yil1snH1E3K9pR7heMojHG7RI6MTYBv63g+b1VitqcLR0jKhHlLS83A3q1/Ppl5NM
 ifnJ3zsD/iUjOBuXnE6+8F2JVmKORMNSEoJ5U+h/AsvcO7LBKx3u3DGfXBw12nRXd1ADbpSTDx
 /9PoNlT5VHLMCAAA=
X-Change-ID: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iFT/OozDJej08K0ZYQ6paGGHopTw7UGpCn3mO5EhHdo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo7L6RwUOCjlkVrjvrZkbKX7Jl7iUH4ylwGg0JIvYE
 mmU/I8KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOy+kQAKCRB33NvayMhJ0SibEA
 C7gsOK1jG2mTU7PwyG+PsarxK0iRu9mFGLDQmjTpRKD8zFSL4XtJBDzulG2PCSTG7IGr3ky/WzxkrQ
 R/Y9iicxB2F+VxTKEVR3+ntoeSR3BPbpR7D2aBmp4zTJ3Gkeb11pQAM83GdWTwarVj6pzFWvy5Q0GJ
 mbMRsNdVhrMNqslBudDW3aPyuP9tKZJhCaIT8QWNLfQiyatFFHUdwR+dpOhomo0owKf0iGqCt+y+kQ
 fFnqdSPIVqTOITbX2Xa9BXAWJa2EmnVn2KUi7Xy4PFroYDlgazt4MMeYbGRZsIwPAwtsB52nxqSvwX
 1djpiFVIQ8fGRWpqwbSmDcxrloPcnp2aq1eT4rPYFhOdVIuBII9E/3dmXZj4d5ricTCDSxJcHOHC+u
 BfKfhrD4Ek9AepbuuU9VPqztM76n5QOrP6VhrZPdUpu4rWOScUL0LgsPisysXcBAP/jXtcOl3bcgSh
 d/peQB1ZLCf9f7bPjlu8yYa3307m7Pt/Q2k01Z7lT2u48OLMuEQEdiGaq3pvHzvgoFUiL3RaDtn/Zt
 1aMRhU1VoeUb6M2UC8GbdwTkaK+WwRvKf+vbvXjN58+W+HTYev1jVKe/caWBLnGpY0j5A9r5Xuijis
 0VeQBeipWYm82ugOxeDxJWEYI/HALyqnaM4pnHxAvtj60N8s0HuDSWt+eJFg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 1/2 DP + 2 USB3
- 1/2/4 DP
- 2 USB3

We need be able to specify the lanes mapping to DisplayPort
and/or USB3 peripherals when not connected to a Type-C complex.

Add the documentation for data-lanes in the out endpoints amd
use those in the driver to setup the right PHY mode and
orientation.

Finally Add all the data routing in DT, disable mode switching and specify
the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Depends on reviewed patches:
- [1] https://lore.kernel.org/all/20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org/
- [2] https://lore.kernel.org/all/20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Switched to __free(device_node)
- Fixed to min_t, added review tags
- Link to v5: https://lore.kernel.org/r/20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org

Changes in v5:
- Fixed bindings tab
- Add comment about exlusivity of the static lanes mapping
- Fixed the single lane phy entries
- Switched to of_property_present()
- Moved the ss2 nodes after ss1 in DT
- Link to v4: https://lore.kernel.org/r/20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org

Changes in v4:
- Add definition for single lane DP
- Fix lanes mapping for DP in bindings and driver
- Add documentation on how to interpret the data-lanes numbers
- Rewrite driver support for be simpler and split into helpers
- Rebase DT on next and drop phy.h include, and use proper mapping
- Link to v3: https://lore.kernel.org/r/20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org

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
Neil Armstrong (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document lanes mapping when not using in USB-C complex
      phy: qcom: qmp-combo: get the USB3 & DisplayPort lanes mapping from DT
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  69 +++++++++-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  81 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 142 +++++++++++++++++++--
 3 files changed, 283 insertions(+), 9 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
prerequisite-message-id: 20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org
prerequisite-patch-id: ad3fb0361c07d03ca6247cf99c52e99aa59bb6c5
prerequisite-message-id: 20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org
prerequisite-patch-id: af47681ced84695a53fb14ded948fda01bc980a7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


