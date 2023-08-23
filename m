Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D55B7856F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 13:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbjHWLpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 07:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbjHWLpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 07:45:49 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB1DE5D
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:45:38 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fef5809999so21688055e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692791137; x=1693395937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYNMwPCVAxQo8Fju1tV2lSExHAZaHMk/4PNFZ6xjKKM=;
        b=GgjcvVcjWtf2v2e2WJ17My4zktiQjEepK5t1G84vS4+SO/CWiKMsE9BqGM8W1xqibT
         dU2MDa0GEHGyaOzpFTvGK3PEIIWyL+4olqF1FbXoUyjAAQ+tT4IM9K0wUanOtKf8GBiw
         ArZv4YbHHjwEdqEREh1szGQpizxr/xz+cjDw99e2fMwuYExUIVSOCwkxVT3TKdpeOEsE
         YghZAcAfKsSFqFHRrVQALuJEUgSMMoseqZyUbKQ3UJMdlhE500t6KErmgM6cGBg6NYxn
         yYQjpULVoNJMl/8l2eC0OZHYMJkJ/MScSMf18Dj4SRBusCCeoXaZQMkiSlv4dwhMvJFm
         OFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692791137; x=1693395937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYNMwPCVAxQo8Fju1tV2lSExHAZaHMk/4PNFZ6xjKKM=;
        b=K8zCZD9sFdjD7AzNOQVePi+/OQxT6UZ7utQIMTIu05AfhrmL7hkpt9zEz4fMHIi1Zs
         6l+ucIUfrk0CtqHamck43XPQ25e7h8FJ7J6pjaYWtinwxQ7UQ8Jn3kf3oJPjKuT8CwAa
         +ugKU1xcYkYhQFwWqq/YaczPwdeAM298Ydk/yBUFQkMIRGtOovFEgbWu8h2pm3j+3Oez
         PSWpJplZSSiZ6jyoOlM06sSmkSiRkBDEn0BtycnTYeoMgswLBP5sSeON+O+l5pwcWnmj
         auvLe6MCbzqdNh/IcQGmNGHaBKmxaPO+emWLOyGTD7GiyaYjZnYuJmODETLNzbzTk2tt
         iCeQ==
X-Gm-Message-State: AOJu0YyZhhXKKfQv95tz10G62KusYiv2jmOfjqqTMA8HvJf63yBUP3IS
        PEfWdPq4sr8qUIksDl5CI7niPA==
X-Google-Smtp-Source: AGHT+IF+iPZGP6zi4OdO/qFyRFpITH5Z5LemNkk6wP5uZU8gzhs4arjrMW+CSFMYI9biEocwo8WUyg==
X-Received: by 2002:a1c:7413:0:b0:400:2dc5:2006 with SMTP id p19-20020a1c7413000000b004002dc52006mr799179wmc.36.1692791136844;
        Wed, 23 Aug 2023 04:45:36 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bce12000000b003fbc0a49b57sm18503577wmc.6.2023.08.23.04.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:45:36 -0700 (PDT)
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
Subject: [PATCH v3 0/5]  PM: domains: Add control for switching back and forth to HW control
Date:   Wed, 23 Aug 2023 14:45:23 +0300
Message-Id: <20230823114528.3677667-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The v2 can be found here:
https://lore.kernel.org/lkml/20230816145741.1472721-1-abel.vesa@linaro.org/

Changes since v2:
 * 5th patch has been squashed in the 4th one

Further details about other changes are found in each patch.

Abel Vesa (1):
  PM: domains: Add the domain HW-managed mode to the summary

Jagadeesh Kona (3):
  clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
  clk: qcom: Use HW_CTRL_TRIGGER flag to switch video GDSC to HW mode
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

