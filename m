Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051952039EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 16:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgFVOtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 10:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgFVOtt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 10:49:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400BBC061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 07:49:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i12so8267390pju.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stp1IX1mmPHX1rj5/nK/QmlVoQRLEAbDl7LJG7bMgaI=;
        b=ZEhxfi1u8JLhx/tPQ4f98TQ5H60Fp9wuN8Fi1Fd4NTr8i9+lHYLOtLwz38YlAIHkU3
         yh5ikvQmAqvgM6OgWb8L/1RRuxC/NVmHWc+Oxj1FXxDdqO4u22ERLPIvzbf94nYlqOx6
         hgO4IpDZDbDAMebXoHJ90eH73wg6srMYDio0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stp1IX1mmPHX1rj5/nK/QmlVoQRLEAbDl7LJG7bMgaI=;
        b=VlRCTDDSE+Zf43nkgxkYFZZejGHuwKr4VyHqu6LYUp5KuvsFB3Aiwp19A8OxkpLjpQ
         3vdGbxpgkir5Ht754pRajaAkDBQzhc7+GkTowbuv8itHUHRIIwiyo8Z/mdTWyseIAYhQ
         a1WC+UTUvAUQ8n0XbKzJ1aZ9Rgzmsgh0mh+S0XQgDBRWpQKOpNWqGVcxB9Abys9FokcH
         4cFvZTzADi81CXZmHniKVhiYOGpEGjOltMmzAqTM9gonnMADHcSXGT0X9ibg9ygEJqab
         j1LzRLfr0F3z9mnNgQaS+OILWVejPuQL1CKHGhXy4S1cwlKhCtpMKdFT++BQmfoQ1IMV
         nWlA==
X-Gm-Message-State: AOAM530SWkDi8JSTXucLCxdvR2Etl+3MnCxhP3XM+9P4Jtl0Zp2DDAIU
        kmMHzfhVr9S3PN+1JTieHWEpMw==
X-Google-Smtp-Source: ABdhPJyEjVbfdxq0yEtd5ulcNWM0zz+5gEFUT1RwYiu/sTfqIRJRmjV+RUTXtuN1p300nEZ5DpNmmA==
X-Received: by 2002:a17:90a:65c5:: with SMTP id i5mr18651602pjs.155.1592837388727;
        Mon, 22 Jun 2020 07:49:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 77sm13903018pfu.139.2020.06.22.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:49:48 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mturney@codeaurora.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        rnayak@codeaurora.org, dhavalp@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sparate@codeaurora.org,
        linux-arm-msm@vger.kernel.org, mkurumel@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] nvmem: qfprom: Patches for fuse blowing on Qualcomm SoCs
Date:   Mon, 22 Jun 2020 07:49:25 -0700
Message-Id: <20200622144929.230498-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


This series enables blowing of fuses on Qualcomm SoCs by extending the
existing qfprom driver with write support.

A few notes:
- Though I don't have any firsthand knowledge of it, it's my
  understanding that these changes could be used on any Qualcomm SoC.
  However, it's likely not very useful on most boards because the
  bootloader protects against this.  Thus the write support here is
  likely only useful with a cooperating bootloader.
- Blowing fuses is truly a one-way process.  If you mess around with
  this and do something wrong you could irreparably brick your chip.
  You have been warned.

Versions 1 and 2 of this series were posted by Ravi Kumar Bokka.  I
posted version 3 containing my changes / fixups with his consent.  I
have left authorship as Ravi but added my own Signed-off-by.

Version 4 is a minor spin over version 3.

Changes in v4:
- Maintainer now listed as Srinivas.
- Example under "soc" to get #address-cells and #size-cells.
- Clock name is "core", not "sec".
- Example under "soc" to get #address-cells and #size-cells.
- Only get clock/regulator if all address ranges are provided.
- Don't use optional version of clk_get now.
- Clock name is "core", not "sec".
- Cleaned up error message if couldn't get clock.
- Fixed up minor version mask.
- Use GENMASK to generate masks.
- Clock name is "core", not "sec".

Changes in v3:
- Split conversion to yaml into separate patch new in v3.
- Use 'const' for compatible instead of a 1-entry enum.
- Changed filename to match compatible string.
- Add #address-cells and #size-cells to list of properties.
- Fixed up example.
- Add an extra reg range (at 0x6000 offset for SoCs checked)
- Define two options for reg: 1 item or 4 items.
- No reg-names.
- Add "clocks" and "clock-names" to list of properties.
- Clock is now "sec", not "secclk".
- Add "vcc-supply" to list of properties.
- Fixed up example.
- Don't provide "reset" value for things; just save/restore.
- Use the major/minor version read from 0x6000.
- Reading should still read "corrected", not "raw".
- Added a sysfs knob to allow you to read "raw" instead of "corrected"
- Simplified the SoC data structure.
- No need for quite so many levels of abstraction for clocks/regulator.
- Don't set regulator voltage.  Rely on device tree to make sure it's right.
- Properly undo things in the case of failure.
- Don't just keep enabling the regulator over and over again.
- Enable / disable the clock each time
- Polling every 100 us but timing out in 10 us didn't make sense; swap.
- No reason for 100 us to be SoC specific.
- No need for reg-names.
- We shouldn't be creating two separate nvmem devices.
- Name is now 'efuse' to match what schema checker wants.
- Reorganized ranges to match driver/bindings changes.
- Added 4th range as per driver/binding changes.
- No more reg-names as per driver/binding changes.
- Clock name is now just "sec" as per driver/binding changes.

Ravi Kumar Bokka (4):
  dt-bindings: nvmem: qfprom: Convert to yaml
  dt-bindings: nvmem: Add properties needed for blowing fuses
  nvmem: qfprom: Add fuse blowing support
  arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing

 .../bindings/nvmem/qcom,qfprom.yaml           |  96 ++++++
 .../devicetree/bindings/nvmem/qfprom.txt      |  35 --
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |   4 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  10 +-
 drivers/nvmem/qfprom.c                        | 314 +++++++++++++++++-
 5 files changed, 411 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt

-- 
2.27.0.111.gc72c7da667-goog

