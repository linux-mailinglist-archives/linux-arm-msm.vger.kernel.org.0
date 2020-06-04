Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34261EDACE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 03:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgFDBxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 21:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgFDBxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 21:53:19 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6F0C03E96D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 18:53:19 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i16so3945486qtr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 18:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/aBGpswVv6maZErzhj2cA/GWvid14/WP8iAXA5RYds=;
        b=SwblQzt1kdFZTiYHtpL/Nk56Df7+NKanGfHYdrba6r5nkmLI2W+4j5HEJoqExqwKQA
         +/+svgVr/wuzXCmJxU453OMsaz5fIgO9/jvlV8ZKpzaPiHy/VPR0l3iazpjoO14TWH1A
         6o3LT0+BWDZT992O3QbToU8Yi1jG/koloy93t98E3/Babcre2hUoY4fww4BEMapbYBbc
         RmHxca4z8bvbm6jV8UQIplrDSxG18wG65ATDlxg0K31fHy2THw+ZlZdphSS4CQVIklzk
         m4IUARo673EJE+w6BuiQLuDqABDL5f8E4KpDgpZwvtbd8KS4A87qHPav/CQnG6dp2TSX
         SIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/aBGpswVv6maZErzhj2cA/GWvid14/WP8iAXA5RYds=;
        b=qSP6YRzpgocaJgaK6jgb7YdPo6Qj/n7zXTR3mf4scsWv2Oo57JC3Nnch+Vt/usM/CF
         fQqZdMXKSN9k7xscIAmblzSCzoyBDvVOgOzlZoXmUhDDqgKkgg25UVAUoHWRXP6+EtFi
         LKWImj0/IQ+XZyDdkuYrKBnLVCsrY5bPgbVAq7NSy9zZDCI/26au4H4OqIgh5vpvh6aD
         F0VZqx8YsccnU6t9JgtLl8ZCltLiaRSTclNinjcum/scl19wrZ9rcHmM+qr1UDvkVIco
         iYLpmj/22W4NdRdvdloD4t5Jb6pgfJoF9mnjnfNeJAD7RcDe9TBHyhMpNI0BcwbbgRHi
         cyyQ==
X-Gm-Message-State: AOAM532g+FgEoZ3LCx3RiXFCjSNALCZE5uFLKhQQ6T2JCWMGIGjRA8ro
        JV7UhT6/a8+rlYiFPLCFpOedOw==
X-Google-Smtp-Source: ABdhPJxU4I7156wWSx5mqMyLRAIQwcHPNU2/djok6WgOiwwRGEOWvkEwUL42FKnhamdNogtdPGEMfQ==
X-Received: by 2002:ac8:108b:: with SMTP id a11mr2337950qtj.173.1591235598781;
        Wed, 03 Jun 2020 18:53:18 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id t74sm2986439qka.21.2020.06.03.18.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 18:53:18 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Introduce Power domain based warming device driver
Date:   Wed,  3 Jun 2020 21:53:11 -0400
Message-Id: <20200604015317.31389-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain resources modeled as a generic power domain in linux kernel can be
used to warm up the SoC (mx power domain on sdm845) if the temperature
falls below certain threshold. These power domains can be considered as
thermal warming devices.  (opposite of thermal cooling devices).

In kernel, these warming devices can be modeled as a thermal cooling
device. Since linux kernel today has no instance of a resource modeled as
a power domain acting as a thermal warming device, a generic power domain
based thermal warming device driver that can be used pan-Socs is the
approach taken in this patch series. Since thermal warming devices can be
thought of as the mirror opposite of thermal cooling devices, this patch
series re-uses thermal cooling device framework. To use these power
domains as warming devices require further tweaks in the thermal framework
which are out of scope of this patch series. These tweaks have been posted
as a separate series[1].

The first patch in this series extends the genpd framework to export out
the performance states of a power domain so that when a power domain is
modeled as a cooling device, the number of possible states and current
state of the cooling device can be retrieved from the genpd framework.

The second patch implements the newly added genpd callback for Qualcomm
RPMH power domain driver which hosts the mx power domain.

The third patch introduces a new cooling device register API that allows
a parent to be specified for the cooling device.

The fourth patch introduces the generic power domain warming device
driver.

The fifth patch extends Qualcomm RPMh power controller driver to register
mx power domain as a thermal warming device in the kernel.

The sixth patch describes the dt binding extensions for mx power domain to
be a thermal warming device.

The seventh patch introduces the DT entreis for sdm845 to register mx
power domain as a thermal warming device.

v1->v2:
	- Rename the patch series from "qcom: Model RPMH power domains as
	  thermal cooling devices" to "Introduce Power domain based
	  thermal warming devices" as it is more appropriate.
	- Introduce a new patch(patch 3) describing the dt-bindings for
	  generic power domain warming device.
	- Patch specific changes mentioned in respective patches.

v2->v3:
	- Changed power domain warming device from a virtual device node
	  entry in DT to being a subnode of power domain controller
	  binding following Rob's review comments.
	- Implemented Ulf's review comments.
	- The changes above introduced two new patches (patch 3 and 4)
v3->v4:
	- Dropped late_init hook in cooling device ops. Instead introduced
	  a new cooling device register API that allows to define a parent
	  for the cooling device.
	- Patch specific changes mentioned in respective patches. 

v4->v5:
	- Dropped the patch that introduced the cooling device register
	  API with parent as per review comments from Ulf. 
	- Patch specific changes mentioned in respective patches.

v5->v6:
	- Rebased to latest kernel
	- Few other fixes identified in the review process mentioned in
	  respective patches

1. https://lkml.org/lkml/2019/9/18/1180

Thara Gopinath (6):
  PM/Domains: Add support for retrieving genpd performance states
    information
  soc: qcom: rpmhpd: Introduce function to retrieve power domain
    performance state count
  thermal: Add generic power domain warming device driver.
  soc: qcom: Extend RPMh power controller driver to register warming
    devices.
  dt-bindings: power: Extend RPMh power controller binding to describe
    thermal warming device
  arm64: dts: qcom: Indicate rpmhpd hosts a power domain that can be
    used as a warming device.

 .../devicetree/bindings/power/qcom,rpmpd.yaml |   3 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   1 +
 drivers/base/power/domain.c                   |  37 ++++
 drivers/soc/qcom/rpmhpd.c                     |  25 ++-
 drivers/thermal/Kconfig                       |  10 ++
 drivers/thermal/Makefile                      |   4 +
 drivers/thermal/pd_warming.c                  | 169 ++++++++++++++++++
 include/linux/pd_warming.h                    |  29 +++
 include/linux/pm_domain.h                     |  13 ++
 9 files changed, 290 insertions(+), 1 deletion(-)
 create mode 100644 drivers/thermal/pd_warming.c
 create mode 100644 include/linux/pd_warming.h

-- 
2.20.1

