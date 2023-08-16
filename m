Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED0977E452
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 16:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343846AbjHPO6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 10:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343851AbjHPO5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 10:57:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C33269F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 07:57:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9936b3d0286so931199966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692197870; x=1692802670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIQG2DiKif0iuRguAVDSpo28maNi/+e2Wh3y0OW3ETY=;
        b=JAhXsXlZCZLyqm3g9Os4EymAcm/sNnLBrHr70bHU7WReDU2kCeo0ccKEFZX0vwjhQ3
         rGhFhsrvJq/vHmUVDVyQA/uPp/5TaDE2Qz9uiIeHUQtsNf2uhIuzW/dpWMigsZudI9Vg
         7Q0XBVSpTKxeJsSv4TyhWzbMtlrXJDAp2+La2MAXl47nSgotZCbKk9/FbRhyNySTAXGl
         k2tycdhlQxKSGw6Arx90ZQjj6SecxT1pqpQ1G21UI1jdfQGacClDoGlcks2F3YNJjQjo
         eB1xSpS4s0YNSYLpCU+NnVcJ+XHCouCwJMm1AUqOMZ1gGdcwKwfilrk0n6BNpHhpjBm9
         WBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197870; x=1692802670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIQG2DiKif0iuRguAVDSpo28maNi/+e2Wh3y0OW3ETY=;
        b=RjcXQiCWIi8S0RxSsk6I5vuQsYbS1NQjK+sNjchAb1rcFuqzy90aw2Xx5EaLSYfCN4
         amevTQzNIlVGZ7tvRWQqWBRQ4VRc3OKfPOk2A5+LyY63PuKbXSrerMqf7r30fVnX+sT5
         6fOZnpeoTKaCHySBjcg/4puu4rJLmA6Bs0Fr3XLTLj3dgN6oqDBZA78PCVlNdrHelWMl
         37B2W0JGll0R/UFmvleE+MnYbt+mAtZ4mI28Oug2kojF1FLufcPnZ07RV7e49+lJdnpW
         ywD8HmAe7ZxWdU0kLMOj+nbXF9wr75lXKmXqZAApHPcPd6k2ydtrRYaIQhLQcgGpI91B
         7/Mg==
X-Gm-Message-State: AOJu0Yxir8Fx0vIDNajeWJxAhVQ4hUu3dHZRAm/iWqhA7/CzRPHYCO6c
        wSlQsoBmjpEWkN3hSWrb15Zyxg==
X-Google-Smtp-Source: AGHT+IFcKm59rZ2xvqc5dn0ecwLhmzoC3eXfnItV2uaIIwaTEUFAFOMvqtp735pgK7t/8GXSTTWHsg==
X-Received: by 2002:a17:906:3287:b0:99b:f534:9bb6 with SMTP id 7-20020a170906328700b0099bf5349bb6mr1550926ejw.9.1692197869878;
        Wed, 16 Aug 2023 07:57:49 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id f16-20020a170906561000b00992076f4a01sm8610403ejq.190.2023.08.16.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:57:49 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@qti.qualcomm.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/6] PM: domains: Add control for switching back and forth to HW control
Date:   Wed, 16 Aug 2023 17:57:35 +0300
Message-Id: <20230816145741.1472721-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The v1 (and the back story) can be found here:
https://lore.kernel.org/all/20230628105652.1670316-1-abel.vesa@linaro.org/

Changes since v1:
 * patch for printing domain HW-managed mode in the summary
 * patch that adds one consumer (venus)
 * patch for gdsc with new (different) flag
 * patch for videocc GDSC provider to update flags

Abel Vesa (1):
  PM: domains: Add the domain HW-managed mode to the summary

Jagadeesh Kona (4):
  clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
  clk: qcom: Use HW_CTRL_TRIGGER flag to switch video GDSC to HW mode
  clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER instead of HW_CTRL for
    GDSC
  venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode

Ulf Hansson (1):
  PM: domains: Allow devices attached to genpd to be managed by HW

 drivers/base/power/domain.c                   | 84 ++++++++++++++++++-
 drivers/clk/qcom/gdsc.c                       | 32 +++++++
 drivers/clk/qcom/gdsc.h                       |  1 +
 drivers/clk/qcom/videocc-sc7180.c             |  2 +-
 drivers/clk/qcom/videocc-sc7280.c             |  2 +-
 drivers/clk/qcom/videocc-sdm845.c             |  4 +-
 drivers/clk/qcom/videocc-sm8250.c             |  4 +-
 drivers/clk/qcom/videocc-sm8550.c             |  4 +-
 drivers/media/platform/qcom/venus/core.c      |  4 +
 drivers/media/platform/qcom/venus/core.h      |  1 +
 .../media/platform/qcom/venus/pm_helpers.c    | 47 +++++------
 include/linux/pm_domain.h                     | 17 ++++
 12 files changed, 165 insertions(+), 37 deletions(-)

-- 
2.34.1

