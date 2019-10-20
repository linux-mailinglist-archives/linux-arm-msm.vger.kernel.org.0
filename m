Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76EEEDDF06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfJTPHx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:07:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41586 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfJTPHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:07:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so11015099wrm.8;
        Sun, 20 Oct 2019 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/PY01YAZe86FZyavgKKO/B0ToEJlUrGgoVEF+v/kIE=;
        b=Ql0yEAGUswEw+VX8DWntqx64QzyvIZ0dHrSJARfgI2/BNNP7vwGywAeQR8jHNPV1tC
         MRCBU9hZzts7HcyptNq/vQBxGcf5+oZZ0YzzHR5wnWbVmOwCGzODFHlGCIaUpNpv0a9T
         gwa7Qi0am8PKlb0FijiIel4EOayLHV6LtkuNTDOVJCMMOowCJfBwKLh+1GkxI/ALBWrH
         Bn76G7DPx1cZ2Bpcjcv1Ae7FZt71H6VXpNyLfrwtAeEpzqO5pRTW8rg13HL9AiS4PSDd
         zfEQVE4Lv4RocM1QT2RPgt1xHxCwHyq1n9tna7RZMiGShUEazz2SAEluZB5nUdkYFPNF
         5urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/PY01YAZe86FZyavgKKO/B0ToEJlUrGgoVEF+v/kIE=;
        b=f1cO24UDmLfmP1Y9DW7IlbgWpDVYeAIuQtZRDZD3vd0J+79IGoYkzM5DlCgDqmk+RL
         0Xih8ifRR+WrELGIB4h+YhA4QtO6IHPZnozO1ER2xKPzDEIcGlfu//Vx3dFEGoyILcvW
         1XjXsw5O4sO2cGjhDy9YCx6zteJXXkAXan72mkuIp131r9id9g1XiA3cWUSQ0io2jQw1
         caetOYn9gl/W9Uqib34rag5wbAu1763hnxGH0ZL7nwQtfvJpBno4mV3nMHqBVpxP1hjH
         cI2ieB7UDWCOOdZYg/soQnHXM4PtIGsnvhaUXRoN4aBEcdOAJkf1HlMg6IfFFvUqezA6
         DCzA==
X-Gm-Message-State: APjAAAU/ohDrAJRb5H6sLzldUVjmYuIekBb+is+UQ25dAloUlbByy6UY
        tlDMXGDpZc8guVlwlnjSFJeJRnFEeQI=
X-Google-Smtp-Source: APXvYqwPV9dRxLprJOpi7HNt+dWX0JdUrpBRsM6dHWGHTEULG2VjtdeV6WlxaBEkaKspUP+3W5LfWw==
X-Received: by 2002:adf:e9c7:: with SMTP id l7mr16054960wrn.57.1571584069804;
        Sun, 20 Oct 2019 08:07:49 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.07.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:07:49 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 0/5] MSM8976/56 Sony Xperia Loire (X/XCompact) smartphones
Date:   Sun, 20 Oct 2019 17:07:41 +0200
Message-Id: <20191020150746.64114-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Here it all comes together.

This patch series enables support for MSM8976 and MSM8956 with all
the extra functionality that has been tested and sent upstream and
also adds support for the Sony Xperia Loire platform, including two
devices in the Loire project: the Xperia X (Suzu) and the Xperia
X Compact (Kugo).

That's only a subset of what I actually have in my hat.. I didn't
feel like sending the entire thing because the rest is not perfectly
clean yet (even if working, and we all know that "works != clean").

As for my entire local stuff, here I can successfully boot Android 10
with nice display and 3d on both smartphones.

So, this is composed of:
- A main device-tree for the MSM8976/56 SoC (*)
- Standard configuration for the PM/PMI8950 and PM8004, which are
  found on all (from what I know) MSM8976 and 8956 boards, since
  that seems to be the recommended hardware configuration from qcom
- A main device-tree for the Sony Xperia Loire project (**)
- Device specific device-trees for Loire Kugo and Loire Suzu. (***)

(*) The MSM8956 SoC is a "broken" MSM8976. It has got two *disabled*
    BIG cores and you can't preventively know which ones are enabled
    and which ones are not: there you only know that you've got two.
    So, you can get any combination of disabled cores (relative to
    cluster 1, it can be 0,1 or 1,2 or 2,3 or 0,3 or 1,3.. etc) on
    the chip that you own.
    After many trials on (various) downstream kernels and a number of
    devices, I have concluded that the only way to get both the enabled
    big cores up is to actually declare all four and let Linux error
    out on the disabled cores (and - of course - never use them), mostly
    because there doesn't seem to be any register that can be read for
    that purpose... may sound stupid, but ... eh :)

(**) The Sony Xperia Loire platform is composed of 3 devices with their
     specific region variants, specifically, two MSM8956 smartphones
     (Suzu, Kugo) and one APQ8056 smart projector (Blanc). All these
     devices reuse the same base board design, so I thought that it is
     just better to create a common DT for all of them, hence avoiding
     a whole lot of code duplication.
     P.S.: I don't know if I'll ever try to upstream the SmartLoire
           APQ8056 Xperia Touch projector. I hope to have time to do
           it as it's a great device and I really want to but, as of
           now, I can't make any promise about that specific device.

(***) These DTs are now very light, but they will contain some
      more nodes as I get more components upstreamed. For example, the
      X Compact (Kugo) smartphone has Type-C through the FUSB301 chip,
      which resides on i2c, a RGBC-IR sensor and a VL53L0 ToF, while X
      (Suzu) has just MicroUSB and none of these sensors.
      These devices also are of a different form factor, so they've got
      different displays but connected to the same power rails anyway.

AngeloGioacchino Del Regno (5):
  dt-bindings: iio: spmi-vadc: Add definitions for USB DP/DM VADCs
  arm64: dts: pm8004: Add SPMI regulator and add phandles to lsids
  arm64: dts: qcom: Add configuration for PM8950 and PMI8950 peripherals
  arm64: dts: qcom: Add MSM8976 SoC support dts files
  arm64: dts: qcom: Add Sony Xperia (Loire) X and X Compact support

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/msm8956-sony-xperia-loire-kugo.dts   |   74 +
 .../qcom/msm8956-sony-xperia-loire-suzu.dts   |   21 +
 .../dts/qcom/msm8956-sony-xperia-loire.dtsi   |  659 +++++
 arch/arm64/boot/dts/qcom/msm8976-pins.dtsi    | 2119 +++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi         | 1714 +++++++++++++
 arch/arm64/boot/dts/qcom/pm8004.dtsi          |   10 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi          |  187 ++
 arch/arm64/boot/dts/qcom/pmi8950.dtsi         |   98 +
 include/dt-bindings/iio/qcom,spmi-vadc.h      |    3 +
 10 files changed, 4885 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi

-- 
2.21.0

