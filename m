Return-Path: <linux-arm-msm+bounces-82448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E2C6D7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A33C72D667
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65793002A7;
	Wed, 19 Nov 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhisBWhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E332FD1B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541950; cv=none; b=qdNjay5agi8+20DWqqWTkxLm1wToT2RNKrfb8If4j9J5LUFtXIos6itygLPNvYoivvUOgNSio6I+RMroLzKgp7L99/tdViCrCLbLmgFONWwa3zq06d12IzUPWnELozTW9WMz3hE6q+bed/TIUgWStmrN+vc052iB/gwywHk0V/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541950; c=relaxed/simple;
	bh=TXuhYGsW55IISOwAX0hINh3nofc7z+3ojcxWvdtoRek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fb9R0ZNSA9Do6U4cPiFEjxT2f/wmgX2/5phzwqYo7bA5s+JA+n0xQMzvd3g9P6w/Hc+tfxKi3v08/UwwhHUsPnoZXyG5eMu8uZa558/UpVVHXFKw0Aiz6qJmkm1rmaLP6bNX++e6RXEVX7/o91mmhGnaozAQAymuaV31zzLqS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhisBWhE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c7869704so4822002f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541945; x=1764146745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3GucV+GzoG4WyLANsgiY2XfGGlIy+gJfrdoUBjs0Ww=;
        b=LhisBWhElQa1o2QZOG3G5jfJSkOllZa7vZvFY2nD31fqs42X1hc488nyHxyl5V1g6H
         mOuwjKxd7wtBaK+r/s00Kj0aws5BoV4vIxJhqUyt/vEzaMrQDOqchTlAKfTTmTTJ47Vb
         eCX0MVl0pA+ddUZpk6uagV2ekxPOVxodMLbRZ9QIpa0y2AA2lc8WFL8N8H9xeO6pSJfv
         6nt+KIMOJ/UhV3tKMXEJ2bdLiqYLXqasCYqewkgTMfJL6mHhRAwgmdfYyXklRjVpk3za
         I0mL3rapTceTg9648J5cYeJuii01AJQAsTxOOPglFWFW50LrO87De+2zmT7teaE1EiHB
         DTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541945; x=1764146745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3GucV+GzoG4WyLANsgiY2XfGGlIy+gJfrdoUBjs0Ww=;
        b=sNcCqBwOzzRi9JsySKyPa4NwsMVyoidgJOSM+ep7Hxo1qjQXhoYvGYgH+TEhxrvUAk
         q+qvnbNLAGFvzCrmqvaBOqLCK2Osv3U0xdCv6PsPor1ctvkqaVniL0GIp2XX4zP2T9ny
         vs0w2inDAD0joR5Ym2miXKMsNxw8n2l1QM3gXbmoCcC7AewQLcM3CR6UfT6YwKSZszmr
         rz5eBbH5tDnt9MKCfMPFVGu2zge3Y3nXn/OhMeh2jvkL8jyEw4JW4qyVQj05ZS5ATI/8
         uLQxCYA98gmC4Ls9DjaeRF5gld/Ql3JtIZ5ztZ/IqY5YQ+tWMujfvCowPNhkRtZjyez/
         4pmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJlkMXikkc5cvFE3vsDNu/LPjo5pQrYMEF6VhWAAAAQuF1kZlS5zY7gVJrFv9mYwJvXqbz5FcSxCvjzEWR@vger.kernel.org
X-Gm-Message-State: AOJu0Yygq8I+kfzHDiycmYNnqrNinAALIFKpg/251TqoOwqA4bDkQwrR
	PG1IOSrC7OwiTVTt2vKcD2wt4ANE9H+QiHWE+k8t+AiUvcCeKFdqYtCHDvlC6RLKO9I=
X-Gm-Gg: ASbGncuF/5cGBStdIAW2dqPKDvzuQ9FOo6+bCwgkGz7KPBO6tk10wtB6Kx04uYPVoSk
	KaaPTAW28el40j6xoViN54bKCiPXB4uqdsHUVRbJzMWz4vTzH2sBCq4Zdz9JwhQsKJLXSvixehH
	ulUhQMIIwkIp8BnaiW+G/7gi6y1xzA+T2XF66huZPVzQuJynkNfFw2IOeZfg77yoFgvmoigTCJY
	iUkeYjcWZMc3TE7UgQhFao1p0NUm4oOj0NhdcCz0r0LebSwSDVsekjxPJGQXB5vYatGnZ4Hm0mI
	l692G810nyq3TEAjloC9Q8R9NI+oAoqFn9nBrVbp1OVE9xZnoRCchPYTT9WM/E3N30eD+9FSYrw
	wb1D8oGCJSl7u/Q4m3/gzXB17Oahf3/T3pc5UCvnnb/OjmEdqSCdl8s8asZ03RVAwwiwLysed2J
	Lvq6Wb/ymDLcUc2o5qIolys5tvptiv1+yebjbaOLKHu/v9d0ZQSBLM
X-Google-Smtp-Source: AGHT+IG4Gv3cm9hV53MWodUTfGOGPmkC5Ip7TMWoRz7vtoZP8JZ7tgzPXUhPB/bP42Xqla588Cy9Yg==
X-Received: by 2002:a05:6000:2909:b0:429:d66b:507f with SMTP id ffacd0b85a97d-42b5939111dmr19492885f8f.48.1763541944528;
        Wed, 19 Nov 2025 00:45:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm38132306f8f.26.2025.11.19.00.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:45:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v7 0/3] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add
 support for HDMI output
Date: Wed, 19 Nov 2025 09:45:39 +0100
Message-Id: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALODHWkC/33SS07DMBAG4KtUXmM0fsZmxT1QF342liAuThoVV
 bk7TkEQFIvlP9Z8Y2nmhsZQUhjR0+GGSpjTmPJQQ/dwQK43wyng5GtGFKgARQme8jk5fCVBAQH
 AvX9LmFkvrLCeei1R7TyXENP1rr4ca+7TOOXycR8yk7X6vzcTDDgSbrzmDIJSz69pMCU/5nJCK
 zjTX0QDbSN0RbhzEULstLE7hG0R1UZYRZxgFiK1jsY9wjcIgzbCK6KkITwow7hxO0T8ILVJthG
 x/qS+MkK80L7bIXKDENZGZEWY0U7FToD08g+yfK2uhPdLvYPpe3/L8gmmTTMdJQIAAA==
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
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TXuhYGsW55IISOwAX0hINh3nofc7z+3ojcxWvdtoRek=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpHYO1U8ojRWdv78LxWJ9eYS08dukYx1P4RMCSAkrC
 ibKx3M2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaR2DtQAKCRB33NvayMhJ0VE9EA
 CVGIvcK2g0ddWKb0+iPh+T4WJK8x6lUVCl3zAI7fKh1LMi6c1xdHJNkWj9T9K4rA7NmvZyltEK9KWo
 bzN5+qkh5kkhGly8L3wELBfQBa8oMcFv8YjzwmYU6iqczQ2OxEkqG3bk82WUWAp6b7h8+YE5UZvhZv
 RJKp29IlxRt6awl1KOjsdERyM81F3zBm5VkdwP8PEdO2cDCY2d6K0Nbif1ihTx9TaV9GK6/qeBt5xa
 Y0auTfTeGxPyBzw8rSsUslHeS3kPPYlp0pOPfCnyP+iJu7SnLl4f/A8QJQpsri1fFETrvMbQYA3zeX
 Iu2lD4FwSdQkCXraV1gEMFN6j4ptokn2igg+SWENqbPAV6X3ypJXUgyCz9KJnTMrUOnkApW+m3OEnR
 Xy70o2HWTM9PYwhxWKHxyMH82VuA4a4iUob/60aOOZKGblGEohF2WNqB2NzmXSWjNBn7MefwPZEKSj
 br59xaVlSr32qxYllmq/3Jhr300Q8yQwn9h4K3c4HNVAymuVIEVLU6ogxIYaPEwS+E6L+dgXeBgio7
 yhZHgWMgCnrWdvusstfQbrx6gFB5Oq23GwamUoVT+aLHotWKZjOZWCvJVoT5MeyDz2sqMSb/DjPS/b
 gVbQH8vbbcfxmgc9itT2X+sX+YRc9IUG6Z5cQdbrg4Opv6fVA2viazMmtKKw==
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

All dependencies were merged on -next.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Rebased on -next, all dependencies are merged
- Link to v6: https://lore.kernel.org/r/20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org

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
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


