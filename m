Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871BCCDA38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 03:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfJGBpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Oct 2019 21:45:22 -0400
Received: from onstation.org ([52.200.56.107]:32998 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbfJGBpW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Oct 2019 21:45:22 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D22D93E993;
        Mon,  7 Oct 2019 01:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570412721;
        bh=2LFYD1AbGmqiPuHcwwZO5b7nowKRrVSD+MvHYSK0LXw=;
        h=From:To:Cc:Subject:Date:From;
        b=cZey47tp1WKt/0iGdl5Ym462saWPW/DMHEgcki0YsqTp+o4/1AqpwfSfN8Ujv7vQy
         m/mR3NGN0yq9puJCU5gVXNbckacCqNZ9aCqWzzi8WQZAi22vGpMgh8YAOtWSYd8J69
         51HZMu4MN5aNJvLtaMbPn9RIfsjm5S66Gw9sYBnY=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca
Subject: [PATCH RFC v2 0/5] drm/msm: external HDMI support for Nexus 5 phone
Date:   Sun,  6 Oct 2019 21:45:04 -0400
Message-Id: <20191007014509.25180-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I am using an Analogix SP6001 SlimPort Micro-USB to 4K HDMI Adapter to
connect my Nexus 5 phone to an external display. The external display is
not fully working yet however I think I'm close. When I plug the cable
into the phone, the interrupt for the hot plug detect GPIO for the HDMI
bridge (Analogix ANX7808) fires and anx78xx_handle_common_int_4() shows
that the interrupt status bit is set to SP_HPD_ESYNC_ERR.

The second hot plug detect pin (for qcom,hdmi-tx-8974 for the MSM
KMS/DRM driver) does not fire, and the clocks are not configured via
msm_hdmi_phy_pll_init(). I suspect that this is the issue that I need to
solve next.

I verified in the downstream MSM sources that IRQ 8 on the mdss is the
correct IRQ number for hdmi-tx. Here's the relevant line from
/proc/interrupts showing that no interrupts are triggered:
93: 0 0 0 0 mdss 8 Edge hdmi_isr.

I'm going to continue digging through the code but I'd appreciate any
suggestions for things to check. I assume that the IRQs for both hot
plug detect pins should fire when I plug the cable in. Unfortunately,
the display doesn't work for me with the downstream kernel and I only
have access to a running downstream kernel over the serial console.

High-level changes since v1:
- Hot plug detect interrupt now working properly on HDMI bridge
- Introduce msm8974 PLL support

I've held back some cosmetic changes to the drivers and only included
the necessary changes required to get this functional. This requires
the following patch I sent out on 2019-09-22 to analogix-anx78xx that
corrects an i2c address:
https://lore.kernel.org/lkml/20190922175940.5311-1-masneyb@onstation.org/

Brian Masney (5):
  drm/bridge: analogix-anx78xx: add support for avdd33 regulator
  drm/msm/hdmi: add msm8974 PLL support
  ARM: dts: qcom: pm8941: add 5vs2 regulator node
  ARM: dts: qcom: msm8974: add HDMI nodes
  ARM: dts: qcom: msm8974-hammerhead: add support for external display

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 142 ++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  78 ++
 arch/arm/boot/dts/qcom-pm8941.dtsi            |  10 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c     |  33 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h               |   6 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c      | 684 ++++++++++++++++++
 8 files changed, 957 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c

-- 
2.21.0

