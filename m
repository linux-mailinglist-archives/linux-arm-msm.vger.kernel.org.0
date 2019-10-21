Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CE6DE994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfJUKfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:35:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40732 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbfJUKfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:35:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id 15so2200235pgt.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=v5rSAq2borwkfdHAyZMADzr7MniIhk00515PFzb4hhs=;
        b=qNCGI/YFahR+e+ynFc4x6ppds1OgEZc/KVjTCu/G9Rfk2zBv6ffdW8NjL3KKoCa7hx
         nKTV+6WosWRgpFq0H/GVKTHPFTpC23IxGh5uTNTx1gehiLHnfJKbgo9spmNmrWV8KX+i
         9zKH4p7xyjOjiGjzfkpdXLNW4Qsx8vBlwE6e1du1LTQE8UPQMVt2JM6FLajol4MkkBs7
         vQv+eCgAuyKxsRWSPxePcELmZOlgF2XB0SpGvF8mdFatArXeHCsIGeOVT2+ppkF65jWJ
         gmXA2yuygVrS+uvwCWqkMEksJfB2h0Eh1K7OnSBE4Vd6Q83oyifcOzE6PjznoSLJneGF
         u1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v5rSAq2borwkfdHAyZMADzr7MniIhk00515PFzb4hhs=;
        b=SgwHRFReD6SZT4HHJmXAkIL/Ej0EtJUoc/WK2Y42D+vc9BS+bnMEE/rKZzmbpPcOFC
         oBvUHgxgsEN1K6KVSggriJvJm5p1/nodHaV+rEaoHHwKmCDl2v/hg+9W5CnieDlCVIzy
         v1nHXn07DNZkqrC9Lv8f/T368dFFE4rKZmA8hU2ZLQx72bQYQMZSauMzaeB0ku6i+DPk
         1xMW5WMxVQyh9w4eT/0s0ZdsBKIlQ0GS5GKbPyr45nySsMorEisdPQEtdJSS0M9QBuJf
         xy6BcBFhC3VjqBOVKUOs25spihwZKdBglmaQLkgvjcLdjbKueifdsZvUaPKlqCic0zSj
         /agQ==
X-Gm-Message-State: APjAAAWJxJOdQsER+P0/+jg7rrNu/kzT6+a0WlD0xKx9kjl3nTboMC1F
        q9yy3WQMSJpn6ygKbT59un5BDw==
X-Google-Smtp-Source: APXvYqwS1rliMo/RIgidg2INxRP2DpDCXVKjrkCgeOeyh0IAjfJKjPgEHgBuaTYwuYuj33lXEDVIOA==
X-Received: by 2002:a63:e00e:: with SMTP id e14mr25438983pgh.146.1571654142113;
        Mon, 21 Oct 2019 03:35:42 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id w65sm16716070pfb.106.2019.10.21.03.35.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:35:41 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v6 00/15] thermal: qcom: tsens: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:19 +0530
Message-Id: <cover.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Daniel, only patch 15 needs to be changed in the tree being submitted
to linux-next. But here is the entire series for completeness.

Hi Thermal and MSM maintainers,

I believe this series is now ready to be merged. The DT bindings and driver
changes should go through the thermal tree and the changes to the DT files
themselves should go through the MSM tree. There is no hard ordering
dependency because we're adding a new property to the driver. It would help
to soak in linux-next for a few weeks to catch anything on kernelci.org.

1-4, 7, 14, 15 => thermal tree
5, 6, 8-13 => msm tree

Regards,
Amit

Changes since v5:
- Julia found a missing put_device() call in the success path of
  tsens_register() while baking in linux-next. A single line change to
  allow the error and success path to use the call to put_device(). Thanks
  Julia and LKP.

Changes since v4:
- Change to of-thermal core[1] to force interrupts w/o changing polling-delay DT
  parameter
- Corresponding changes to DT files to remove the hunks setting the values
  to 0
- Collected reviews and acks

Changes since v3:
- Fix up the YAML definitions based on Rob's review

Changes since v2:
- Addressed Stephen's review comment
- Moved the dt-bindings to yaml (This throws up some new warnings in various QCOM
devicetrees. I'll send out a separate series to fix them up)
- Collected reviews and acks
- Added the dt-bindings to MAINTAINERS

Changes since v1:
- Collected reviews and acks
- Addressed Stephen's review comments (hopefully I got them all).
- Completely removed critical interrupt infrastructure from this series.
  Will post that separately.
- Fixed a bug in sign-extension of temperature.
- Fixed DT bindings to use the name of the interrupt e.g. "uplow" and use
  platform_get_irq_byname().

Add interrupt support to TSENS. The first 6 patches are general fixes and
cleanups to the driver before interrupt support is introduced.

[1] https://lore.kernel.org/linux-arm-msm/1b53ef537203e629328285b4597a09e4a586d688.1571181041.git.amit.kucheria@linaro.org/

Amit Kucheria (15):
  drivers: thermal: tsens: Get rid of id field in tsens_sensor
  drivers: thermal: tsens: Simplify code flow in tsens_probe
  drivers: thermal: tsens: Add __func__ identifier to debug statements
  drivers: thermal: tsens: Add debugfs support
  arm: dts: msm8974: thermal: Add thermal zones for each sensor
  arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
  dt-bindings: thermal: tsens: Convert over to a yaml schema
  arm64: dts: sdm845: thermal: Add interrupt support
  arm64: dts: msm8996: thermal: Add interrupt support
  arm64: dts: msm8998: thermal: Add interrupt support
  arm64: dts: qcs404: thermal: Add interrupt support
  arm: dts: msm8974: thermal: Add interrupt support
  arm64: dts: msm8916: thermal: Add interrupt support
  drivers: thermal: tsens: Create function to return sign-extended
    temperature
  drivers: thermal: tsens: Add interrupt support

 .../bindings/thermal/qcom-tsens.txt           |  55 --
 .../bindings/thermal/qcom-tsens.yaml          | 168 ++++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  92 +++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |   2 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +
 drivers/thermal/qcom/tsens-8960.c             |   4 +-
 drivers/thermal/qcom/tsens-common.c           | 529 ++++++++++++++++--
 drivers/thermal/qcom/tsens-v0_1.c             |  11 +
 drivers/thermal/qcom/tsens-v1.c               |  29 +
 drivers/thermal/qcom/tsens-v2.c               |  13 +
 drivers/thermal/qcom/tsens.c                  |  59 +-
 drivers/thermal/qcom/tsens.h                  | 286 ++++++++--
 16 files changed, 1102 insertions(+), 167 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml

-- 
2.17.1

