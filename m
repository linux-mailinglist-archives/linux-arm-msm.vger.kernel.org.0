Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B00D5F86AC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Oct 2022 20:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJHSkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Oct 2022 14:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiJHSkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Oct 2022 14:40:04 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B631A059
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Oct 2022 11:40:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id iv17so4620804wmb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Oct 2022 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qH5NNc/K0QTO3Py3yp57L7/2aPQOFrGVLYf3wX60PU=;
        b=x9OnQu1YUs++g+yzHHJu1hlyaupBkGIAtoSLehwpZd5W2/4411EMAdxXi7V/ikIo38
         KMeNQgHIUMEjJkIcK0AUzi2s5JqiI4Ag/bY5bIrnDHUfu/nXhas6pCw5aStJIqk+meP6
         6ZWfVib8m6KLVs0jc2zkVNR1zu8SDCCF9BqdwxD6XfUnPZGeMp4i8Kd6bsO6t1U4ADZN
         XRtFd0w5tPJp/Uhen7MA3IISygVwRNaKjqJQp0gYd+XGjmLUNO1as7/nfbeDLB1MHBsr
         YKtCWRsiL0JuI7qpqyUcaxWTcWVFwggA35qUqA3ZhEwbKVSbKsgEFprtEnR9Y/zEB94/
         NTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qH5NNc/K0QTO3Py3yp57L7/2aPQOFrGVLYf3wX60PU=;
        b=nI6HN0qafGyKFSSrp/qFkFtc1MEtSp+ZwDIxcAaIguBvi3xFX8lGfy6OHw6RFwVEtc
         sOaEoEmCQ/cnq1C4zPcrS9fqkGojASLjQla499S+r00wyyFZ0flurgSpF770Wp5IQr0t
         umt1KGDXChj0ueszmaNyMYrdb5BO9xSbAgJ3i17+p2BVJQ/fSJgT38ziQh92gsclh6V0
         d4MY0Ko3BUI7P4Sa0Ptn+BA1sXQk0Yfchwk/FoQZ6ucQm9VydlOR8c+H3pVEwp8V2MAg
         Z3d37hIWbSZK8fFxQmgunathEYbA5wmrC4h6FCIFP36xm3BBiROW+kK3yzU7DhQ2zXH2
         oo5A==
X-Gm-Message-State: ACrzQf0Zyco0VaCLosXkZw+sGIIn/SzNGqygtcH/Qf8FIb99mPuvFYDN
        k6DXDmMGitZY5HiBbDEDqVBQc0N4ayBkwg==
X-Google-Smtp-Source: AMsMyM5dqqudgJzWOQqhaHjNuofbSHEK3Y5wvff8htUxlmCqARQqHg6R2UBA7Xx19CIcKp9JyIr18Q==
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id h21-20020a05600c351500b003b4a0fac4e1mr7275771wmq.191.1665254398468;
        Sat, 08 Oct 2022 11:39:58 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b003b4ff30e566sm28325194wms.3.2022.10.08.11.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 11:39:57 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v6 0/2] power: supply: introduce support for the Qualcomm smb2 charger
Date:   Sat,  8 Oct 2022 19:37:50 +0100
Message-Id: <20221008183753.249514-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a driver for the Qualcomm PMI8998/PM660 Switch-Mode Battery Charger.
This is the second generation SMB charger, and replaces the previous
SMBB hardware found in older PMICs.

This driver provides basic support for initialising the hardware,
configuring the USB input current limit and reporting information about
the state of the charger. Features like type-c dual role support and OTG
switching will be added in future patches.

This patch series depends on my previous series adding support for
the Round Robin ADC which is used for reading the USB voltage and
current, it is currently queued in linux-next, and can be found here:
https://lore.kernel.org/linux-arm-msm/20220429220904.137297-1-caleb.connolly@linaro.org/
This has now been merged

Changes since v5:
 * Rework IRQ initialisation to support per-IRQ configuration
 * Add support waking up the device on cable plug/unplug
   * This fixes a bug where when attaching/detaching a cable while
     in suspend, userspace wouldn't reflect the new state.
     Thanks Joel for catching this.

Changes since v4:
 * Fix typo when setting FAST_CHARGE_CURRENT_CFG - the OnePlus 6 now charges
   properly!
 * Limited charge current to 1A until we better understand the thermal
   protection features and how to use them.
 * Address Sebastian's comments (thanks for your patience with this)
 * re-run clang-format

Changes since v3:
 * Drop DTS patches, to be sent in a future series
 * Add POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT so that the charger will
   be exposed as a cooling device,
   see https://lore.kernel.org/linux-pm/164f2458-fb66-f238-7143-bdbe1e200870@linaro.org
 * Run clang-format and prevent it from breaking the formatting of the
   defines
 * Apply Sebastian's suggested fixes

Changes since v2:
 * Use devm_delayed_work_autocancel
 * Minor driver fixes
 * Pick up Krzysztof's R-b on the DT patch

Changes since v1:
 * Rename the driver to pmi8998_charger
 * Drop unnecessary (and very broken) mutex
 * Rework the driver based on feedback to v1
 * Fix some minor bugs and improve Automatic Input Current Limit support

Caleb Connolly (2):
  power: supply: add Qualcomm PMI8998 SMB2 Charger driver
  dt-bindings: power: supply: qcom,pmi8998-charger: add bindings for
    smb2 driver

 .../power/supply/qcom,pmi8998-charger.yaml    |   82 ++
 drivers/power/supply/Kconfig                  |   16 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/qcom_pmi8998_charger.c   | 1090 +++++++++++++++++
 4 files changed, 1189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 create mode 100644 drivers/power/supply/qcom_pmi8998_charger.c

-- 
2.38.0

