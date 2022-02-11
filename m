Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8524B2F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344580AbiBKVUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiBKVUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:20 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5560C59
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:17 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id i19so4789030wmq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sK+iZIeFYsho6wXig8bR/ouaBY7CWBpbd4Iy6btTNyc=;
        b=CqCqBUFBKZ5aQf5ylZxRwSx81lfbWA9T7Oy0HnPVLp9ddliKlQGDVvVbEfy48C8nx/
         d1LSD95XLVu5GIYWtzD6wYyGzBrh4l2An2UgQiy1beteWGrzo07Wv7QrMZ64aqMA1jQ4
         qboWyU2T3+HE2zg2Fed6xGrJ3YSfQYwWVC7RE97UKzd6pDFGZaMaz45vPICe3AcbuXiB
         fRYJ1YuPhQudMGWHAYENaW9ac2cpIJxNb7Z9wpARMdrXJHbwpBJtdCN9NRESxvMxaCS/
         y2utMdQzSjeRb6OsPhx2nrX8Z+YwqgYB6R81eGcZQg0quJCNGyTODVuIVH8aoSEt1+wS
         YdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sK+iZIeFYsho6wXig8bR/ouaBY7CWBpbd4Iy6btTNyc=;
        b=YZMxvItoSxW65xG52f1OYsxO8nSWMXNA+Z2sO8LQW/qmADwt9XPp3y3zu1XSveU2SG
         0EaV9ctiRNBUhaqZupdRVCQsuPTVWqX3kWKgmVrSe4NaW4PxMUMYwi+27M8EUfavNm6a
         y44T5wqfNG6TUe6Nwg4nAHhz+LT/foke2dxgHE3M5T96MIj5uvtoouSn889toerrB5Iu
         tff4SGDlcsre49EYiEvS9cJl3pqjVlchP035844u8KFnXG2VWt7ZatQv3G7ya9gmlfZb
         zuvXliE0IeQT1jmZU4S9ysnwEfKbLkMkqQH1YdcS/FFMCTTazByvOOeyq+T3wFvriwns
         Mmug==
X-Gm-Message-State: AOAM532aew5Zxz/zlHs2LQqmoHwEJu+PKXcVWi4jwMi5hO3UFONhhJl2
        WJMY4x7y/ROKy0mKDgqhCSe57A==
X-Google-Smtp-Source: ABdhPJy9WB0mTcadBd9almNsRJtP+XYitxUwoSljKM9RMwBmo6wh5lnb2gqaYAiXLhf65drXeNaJew==
X-Received: by 2002:a05:600c:1912:: with SMTP id j18mr1827573wmq.134.1644614416522;
        Fri, 11 Feb 2022 13:20:16 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:16 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v4 0/8] iio: adc: introduce Qualcomm SPMI Round Robin ADC
Date:   Fri, 11 Feb 2022 21:19:51 +0000
Message-Id: <20220211211959.502514-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RRADC is responsible for reading data about the current and
voltage from the USB or DC in jacks, it can also read the battery
ID (resistence) and some temperatures. It is found on the PMI8998 and
PM660 Qualcomm PMICs.

The RRADC has to calibrate some ADC values based on which chip fab
the PMIC was produced in, to facilitate this the patches
("mfd: qcom-spmi-pmic: expose the PMIC revid information to clients")
and ("mfd: qcom-spmi-pmic: read fab id on supported PMICs")
expose the PMIC revision information and fab_id as a struct and register
them as driver data in the Qualcomm SPMI PMIC driver so that it can be
read by the RRADC.

Changes since v3:
 * Split PMIC patch in two, rework to support function drivers on a
   sibling USID
 * Completely rework RRADC driver to make use of the modern IIO
   framework. This required re-arranging a lot of the equations and
   results in some lost precision, where relevant I've left comments to
   explain this. I don't think any of it is significant enough to
   justify doing post-processing in driver.
	Thanks a lot Jonathan and John Stultz for helping me out with
	this :)

Changes since v2:
 * Add missing include (thanks kernel test robot :D)
 * Rework some confusing function return values, specifically
   rradc_read_status_in_cont_mode and rradc_prepare_batt_id_conversion
   both of which didn't correctly handle "ret". This also bought up an
   issue as the previous implementation didn't actually wait for the
   channel to be ready. It doesn't seem like that's strictly necessary
   (same data is reported if I wait for the status to be good or not)
   but I've included it anyway for good measure.

Changes since v1:
 * Rework the RRADC driver based on Jonathan's feedback
 * Pick up Rob's reviewed by for the dt-binding patch.


Caleb Connolly (8):
  mfd: qcom-spmi-pmic: expose the PMIC revid information to clients
  mfd: qcom-spmi-pmic: read fab id on supported PMICs
  dt-bindings: iio: adc: document qcom-spmi-rradc
  iio: adc: qcom-spmi-rradc: introduce round robin adc
  arm64: dts: qcom: pmi8998: add rradc node
  arm64: dts: qcom: sdm845-oneplus: enable rradc
  arm64: dts: qcom: sdm845-db845c: enable rradc
  arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc

 .../bindings/iio/adc/qcom,spmi-rradc.yaml     |   54 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |    8 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |    4 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |    4 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |    4 +
 drivers/iio/adc/Kconfig                       |   13 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/qcom-spmi-rradc.c             | 1014 +++++++++++++++++
 drivers/mfd/qcom-spmi-pmic.c                  |  159 ++-
 include/soc/qcom/qcom-spmi-pmic.h             |   61 +
 10 files changed, 1265 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
 create mode 100644 drivers/iio/adc/qcom-spmi-rradc.c
 create mode 100644 include/soc/qcom/qcom-spmi-pmic.h

-- 
2.35.1

