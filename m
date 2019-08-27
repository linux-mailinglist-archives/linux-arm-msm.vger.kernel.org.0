Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E415A9E773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbfH0MOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:14:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45634 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbfH0MOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:14:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so12585838pgp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4wcazYDkpL0duARs99jL9aMnOJv1Px99rhHjbxqeKAs=;
        b=cIgfNMS9Y89X0ZTePhVRGhyzjprNxkg12d7CxOIay09vvWQ7pVobVStnxSO26gJvk1
         S/MIaLSZTP/FjdrAvjSMT/AoNgVnfKrpnivkArmqpkkQHyNW8K60XuBDXLQCZBJO9Swd
         9UApfN32eAlqF7F6IeEJeJ4e6X83cl82o7L93atoHWeyrSFIFn/3EWi+ZFAjHW2a93Xs
         3TTRv0kz8QSOr/TKs9TEIl9KIZ4Y/2FS5HX+DVwbL96YoErvDA/9xS1QEu5jcFvDkMII
         Ow2mykWpg05txO9FQ/potL4EJanVMLc9b9ACki9YjX0dqUHfitZM+n65CPiNfJ4KFqNt
         VymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4wcazYDkpL0duARs99jL9aMnOJv1Px99rhHjbxqeKAs=;
        b=Z5u/RLVkB2pIDvuz1UMGf/T9JpjR2veqYivMZ9udkYOv1k8xEjkph4OzfMPzpUEqBP
         ibm+OCQ3mX1E9Z6hFp+mMofyY+LhIz6akJQoJMqsg8HGBrqdgsZkHnKz5jhqW4NkEbMr
         bHTUy1r1+/m16JAbXOJKZftqcLXC/OLZ/Z9/jJ+LLn3Dg7sFjlwZ/bewgC0mLD/IbhB7
         A/ECfUNYOBgm8bSmYFCHszzEJhA/AJkqv1Hp4gSesIMWQxVA9azz5UW7W6OJ4f1t6iT9
         CvgM0VvVcnGjG1aa/Q4cnH7x4JcKDhXFiATGMYR7N6ow2vo0sKQeOJ/obeLIMx9ns4qM
         6ABg==
X-Gm-Message-State: APjAAAXR4DVTEKNxFj50F1s+c+dGJ9L2iRARHEYvUxmLoxilm0zQokyf
        /3jqoes8xup1xMl/Fk0ZyWke+Euu7hsaWg==
X-Google-Smtp-Source: APXvYqySuJMvr50yVLa9Q+m8dsjJ0euzRJ/Qgw6e9jts/v+QxNAsjYeS/M3MgQw692ynNmbMHDFf7Q==
X-Received: by 2002:a17:90a:a00b:: with SMTP id q11mr2396118pjp.91.1566908061427;
        Tue, 27 Aug 2019 05:14:21 -0700 (PDT)
Received: from localhost ([49.248.54.193])
        by smtp.gmail.com with ESMTPSA id d3sm3148595pjz.31.2019.08.27.05.14.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:14:20 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 00/15] thermal: qcom: tsens: Add interrupt support
Date:   Tue, 27 Aug 2019 17:43:56 +0530
Message-Id: <cover.1566907161.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

This series has been developed against qcs404 and sdm845 and then tested on
msm8916 and msm8974 (Thanks Brian). Testing on msm8998 would be appreciated since I don't
have hardware handy.

Amit Kucheria (15):
  drivers: thermal: tsens: Get rid of id field in tsens_sensor
  drivers: thermal: tsens: Simplify code flow in tsens_probe
  drivers: thermal: tsens: Add __func__ identifier to debug statements
  drivers: thermal: tsens: Add debugfs support
  arm: dts: msm8974: thermal: Add thermal zones for each sensor
  arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
  dt: thermal: tsens: Document interrupt support in tsens driver
  arm64: dts: sdm845: thermal: Add interrupt support
  arm64: dts: msm8996: thermal: Add interrupt support
  arm64: dts: msm8998: thermal: Add interrupt support
  arm64: dts: qcs404: thermal: Add interrupt support
  arm: dts: msm8974: thermal: Add interrupt support
  arm64: dts: msm8916: thermal: Add interrupt support
  drivers: thermal: tsens: Create function to return sign-extended
    temperature
  drivers: thermal: tsens: Add interrupt support

 .../bindings/thermal/qcom-tsens.txt           |   8 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 108 +++-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  26 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  60 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  82 +--
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  42 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  88 +--
 drivers/thermal/qcom/tsens-8960.c             |   4 +-
 drivers/thermal/qcom/tsens-common.c           | 528 ++++++++++++++++--
 drivers/thermal/qcom/tsens-v0_1.c             |  11 +
 drivers/thermal/qcom/tsens-v1.c               |  29 +
 drivers/thermal/qcom/tsens-v2.c               |  13 +
 drivers/thermal/qcom/tsens.c                  |  59 +-
 drivers/thermal/qcom/tsens.h                  | 288 ++++++++--
 14 files changed, 1089 insertions(+), 257 deletions(-)

-- 
2.17.1

