Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D1174C805
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 22:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGIUNO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 16:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjGIUNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 16:13:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F991124
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 13:13:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so5420095e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 13:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688933590; x=1691525590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ron0+5y7QxRbvR5hTll373fKSIMPpb9IcaNbJK63G4c=;
        b=R113KJI9snP7n6Og+ow7prywmY5iLHcKrcYml8JUsJXDYxtOWuiPvGcaMgaazTELAv
         y4vbB/qt8GuzG42qqqWGOCOlb4YKwJaYmM+Vh9mMuW+RcUYAkyCaakDqk5LPwgmslEDt
         y3ZiKmqiU8U+islaRA2VhE419R4EHurOER52Sgwetx0YQ1K959/3Ia3QBCQhYYE10BFS
         4jI/R6Gp5v1cA+/XEKLK5uhVvqYBWlu0L5m8Ige2QfUlrS4jDVsl/Y0KnOqzuDKSCkcW
         4lwh7Fja/wc38bdpxGQXF237vTOVC4i8A5uYOB2JhUJlf/tNYGMxF9BiO6tTVB2dlEf2
         WtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688933590; x=1691525590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ron0+5y7QxRbvR5hTll373fKSIMPpb9IcaNbJK63G4c=;
        b=gnip8ZJK9L0HDc7YoDaNAfp7TotHJHBbW6lhfzcedd8HBtQq5o3nwJGOnm/yLujbzU
         v9JuXJQhvhvFFH2EN3/9h3wT/eoc/2rFVIs7fxdXPJz4/26BH+egjwzQNPAd9JAQauLO
         fmSi5Yl5P55vAeZSKFIWSHO4RDYcAqjdnntDvVeL7m3CoWBxcX0jaOtbMKnhn2etpZs3
         EcDo9x4bhdt/sEgnFa4nvR5ZX93TToinfvjRKt5jxiX606syJ0N8SO94q2obYuxTAyJr
         XB+gDSdIZ7VROTJw8dpQuBk49d1bZ1ADrZMEQD4dl+8TmwRL3jxliBoqOM7vL2Jmj0Lk
         S+7Q==
X-Gm-Message-State: ABy/qLZ54zq9S6nVBPc0I3ff2cDS832pGPl3Rg7JDHLfgv87HBStfxN2
        s9qnl6/+DIPXnO9bSVfGlc7qUw==
X-Google-Smtp-Source: APBJJlFeHV2isi+RpDaha/5xS5MHSwNJ0wHrgUNiEoitevfRCrXoxLksC97ebnt0CFpeuom/8TIu2A==
X-Received: by 2002:a05:6512:128a:b0:4f8:5ab0:68c4 with SMTP id u10-20020a056512128a00b004f85ab068c4mr9422974lfs.59.1688933590354;
        Sun, 09 Jul 2023 13:13:10 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id c12-20020ac2530c000000b004fb77d6cab3sm1420378lfh.261.2023.07.09.13.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 13:13:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: qcom-pmic-typec: enable DP support
Date:   Sun,  9 Jul 2023 23:13:07 +0300
Message-Id: <20230709201309.274306-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To enable DisplayPort on the platforms supported by qcom-pmic-typec
driver, we need to register a corresponding drm_bridge for this device
and also be able to send the OOB hotplug event to the corresponding DRM
connector. All this is implemented by [1], but there is no direct
dependency on that patchset.

[1] https://patchwork.freedesktop.org/series/120393/

Changes since v1:
- Properly handle CONFIG_DRM dependency. Disallow building DRM as a
  module if qcom-pmic-typec driver is built-in (Bryan).

Dmitry Baryshkov (2):
  usb: typec: altmodes/displayport: add support for embedded DP cases
  usb: typec: qcom-pmic-typec: register drm_bridge

 drivers/usb/typec/altmodes/displayport.c      |  5 ++-
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 39 +++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.39.2

