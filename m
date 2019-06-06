Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5696369A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 04:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfFFCAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 22:00:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33379 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFFCAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 22:00:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id x15so483715pfq.0;
        Wed, 05 Jun 2019 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=x7qwOsCUljcPtS0zwGfT/F7OR260b2vj2I2Z3hV+0Vw=;
        b=A9qObc4i5vO0woGJ3cg3uISuB5bxnGAL/+ozW+EhdwWNA31g3TMfQIeiD5NULF0cA2
         XYZKt9Jel0pAbExfDGszMRiWtFxOpGfUZdzBnjShNA3K+lfXeNSH6udRdX4+puQDg2Y3
         4HSQpALDaGVvKEKK2Q4DCpxqaNlx8q8f/AlKyRGLaqveYSPvXZC8oE3oNSHS2Hk2CGnh
         p9SnF9IXb0e4J7wrfzdmPNULuKTVJg32mDvQFvYY7krDNRSOIu4cONvhSRc4KkUsAOxj
         F0C9aaJ/XPNJmEbCyy10tF+mMPxNlNPvj2B/tzf8ZVFX2a67suPLpO5ksNbmU4VFxdPX
         x9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x7qwOsCUljcPtS0zwGfT/F7OR260b2vj2I2Z3hV+0Vw=;
        b=W7eqkk5JUNtAW2wUmL+wb/i/zXcKdTR1FvIM22+tKU4vk9mxqSxGPJTftEI19pW+Hf
         fV4nTd0EPvDS1SnLEaytcSvw4sZRRtfd2J6nTYF/I1fgI4M5dbsc56s9B3NL0h+YZnAE
         XNo3Gq79coTax+xjbW+kMUtVBNhq/wPcPk1V6kSeOcaPohamw6+Fw0mvivz30LJpEL4U
         jZmMyqeRfImN5oQxoDnbsW49jAJDPTiiK8Q9vI48O3HppTJyWHSyu2xWkROeDcTTBwiS
         VS5Zf6iplcqmp5T3yCYf+7jwm5BnCNKh2nDjjJTNIh70b1rE08otSKy3/TUUytYPCvhO
         E0Uw==
X-Gm-Message-State: APjAAAWZt4lD+14jNZhlami1UGTmssTyPM6NP9MukW4PXbQZ4946H+ar
        J1FRGVrdrsqQct6YP2KNvcg=
X-Google-Smtp-Source: APXvYqyPmqa7lqmty0IqA8/OiwgJIYtWHbs/vn7I7gtRg48rBH4l7U9lXE5gPHXIQWvvzkHtLfXb+w==
X-Received: by 2002:a63:de53:: with SMTP id y19mr884162pgi.166.1559786416299;
        Wed, 05 Jun 2019 19:00:16 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id k14sm185234pga.5.2019.06.05.19.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 19:00:15 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        marc.w.gonzalez@free.fr, jcrouse@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/3] MSM8998 GPUCC Support
Date:   Wed,  5 Jun 2019 18:58:44 -0700
Message-Id: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Adreno GPU on MSM8998 has its own clock controller, which is a
dependency for bringing up the GPU.  This series gets the gpucc all in
place as another step on the road to getting the GPU enabled.

v2:
-drop desd code

Jeffrey Hugo (3):
  dt-bindings: clock: Document gpucc for msm8998
  clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
  arm64: dts: qcom: msm8998: Add gpucc node

 .../devicetree/bindings/clock/qcom,gpucc.txt  |   4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  15 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-msm8998.c              | 364 ++++++++++++++++++
 .../dt-bindings/clock/qcom,gpucc-msm8998.h    |  29 ++
 6 files changed, 420 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/gpucc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-msm8998.h

-- 
2.17.1

