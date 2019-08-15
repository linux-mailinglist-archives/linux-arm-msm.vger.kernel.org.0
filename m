Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475CB8E1F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfHOAtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:12 -0400
Received: from onstation.org ([52.200.56.107]:44266 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbfHOAtM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 351503E95F;
        Thu, 15 Aug 2019 00:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830151;
        bh=PCy1j7MQudvJstVSVlYc4cRcJStkAE4OqJRndsZJOI0=;
        h=From:To:Cc:Subject:Date:From;
        b=q+P4dvnY8kCbSHP6/cQeJNcM49HQS1+tGPc+xTcR+NwY72Dg4KvVyK6FG5xTEo6OD
         Y0IU/xMhrkp5ILcJF73dQBeXzhK6vqkhotTJU3BhwoVHVXfT7SDH+vnJ/YUcDoyfct
         XVblgW3CGsQv/S/J6MMGbtBm1olh/8loyiE9N9b0=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external display
Date:   Wed, 14 Aug 2019 20:48:43 -0400
Message-Id: <20190815004854.19860-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series begins to add support for the external display over
HDMI that is supported on msm8974 SoCs. I'm testing this series on the
Nexus 5, and I'm able to communicate with the HDMI bridge via the
analogix-anx78xx driver, however the external display is not working
yet.

When I plug in the HDMI cable, the monitor detects that a device is
hooked up, but nothing is shown on the external monitor. The hot plug
detect GPIO (hpd-gpios) on the analogix-anx78xx bridge and MSM HDMI
drivers do not change state when the slimport adapter or HDMI cable is
plugged in or removed. I wonder if a regulator is not enabled somewhere?
I have a comment in patch 10 regarding 'hpd-gdsc-supply' that may
potentially be an issue.

I'm still digging in on this, however I'd appreciate any feedback if
anyone has time. Most of these patches are ready now, so I marked the
ones that aren't ready with 'PATCH RFC'.

I'm using an Analogix Semiconductor SP6001 SlimPort Micro-USB to 4K HDMI
Adapter to connect my phone to an external display via a standard HDMI
cable. This works just fine with the downstream MSM kernel using
Android.

Brian Masney (11):
  dt-bindings: drm/bridge: analogix-anx78xx: add new variants
  drm/bridge: analogix-anx78xx: add new variants
  drm/bridge: analogix-anx78xx: silence -EPROBE_DEFER warnings
  drm/bridge: analogix-anx78xx: convert to i2c_new_dummy_device
  drm/bridge: analogix-anx78xx: correct value of TX_P0
  drm/bridge: analogix-anx78xx: add support for avdd33 regulator
  ARM: qcom_defconfig: add CONFIG_DRM_ANALOGIX_ANX78XX
  drm/msm/hdmi: silence -EPROBE_DEFER warning
  ARM: dts: qcom: pm8941: add 5vs2 regulator node
  ARM: dts: qcom: msm8974: add HDMI nodes
  ARM: dts: qcom: msm8974-hammerhead: add support for external display

 .../bindings/display/bridge/anx7814.txt       |   6 +-
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 140 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  80 ++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi            |  10 ++
 arch/arm/configs/qcom_defconfig               |   1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c     |  60 +++++++-
 drivers/gpu/drm/bridge/analogix-anx78xx.h     |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           |   8 +-
 8 files changed, 295 insertions(+), 12 deletions(-)

-- 
2.21.0

