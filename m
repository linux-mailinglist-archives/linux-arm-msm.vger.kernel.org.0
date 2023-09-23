Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11417AC16A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 13:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjIWLu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 07:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjIWLuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 07:50:25 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9241D1AC
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 04:50:17 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so58357391fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 04:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695469816; x=1696074616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bX8G2i5J1ALZVJ03xHMbBXo1RYMNHbxXzPAX+U85OE=;
        b=K0m+vLUa/C7Xf/+YAzKhc6H3pkg/sDzr0qXZaV8BBkMyWOCG81/uTyMZsVPA91/tQ3
         UsCweKMYI0P2ORdI08MVMlyGXobeiKg4K/o51fpfBM17OvU8HMBqsrabFo1VjWAkP4Id
         XMLS+jabwehKPu6J9i6Cm8OL/OT9kz2XzJEf7fF3a0XdLdCH4nwwf/KR8xFaNvuG6Vp3
         1UbJ+JyxoOsM4qDLeHkJUqx3pb2siZPwtJ/eyIt1uHBnhgYxvhMytgDaRdgt9OaAMV3w
         bQT10DblOasvNNF5y/JbFkmtxdxWakNEqrXRytDDt7qAU0U6ufptzsdukb/fDcf/a/S2
         E3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695469816; x=1696074616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bX8G2i5J1ALZVJ03xHMbBXo1RYMNHbxXzPAX+U85OE=;
        b=LDxU+QlUu523k6fne1dfXhWiOdT44C/emMqxO4tDLezmWI+ciu4Qh8A4Be+tte9iCK
         xBrq/v8LluaH6cjIojvsV2TjyzcWq9y2Tqi1iG3yVwbKe98f5UVN+KW9Npx8cfmI27Ro
         jNH1FxpMgTrADDcLUcGRz0FfwxIrvdNn4RQcg1WycabL/NQdWAhFX1Txf4nU83CT+p3Q
         GpH3/T+LOR0DTIKBtVtlrD6idmbGGTDa/2aERaxaIBjUVSm4trDyatgqaWfhyyLfyBGa
         XocSYgcYK325AGmQleCiXNBDTZmw7YUzYhflrBA1HuTIw5XPJOX+KDwdwySa3rOfQCRZ
         NwaA==
X-Gm-Message-State: AOJu0YzoLUmIuvqYNXk/LesiCyt1nqmNwJOYqGvV5gZPJyP++Zc/iF6z
        IoOuQF39yIa8a+6iW7GK4e0wdw==
X-Google-Smtp-Source: AGHT+IFPgixQMTZBwhEQNanrBYrypYYVQy1y92nrJ8OITb8jeQ0HonezWs4Vxf8Fzb9n9BbvigDoeQ==
X-Received: by 2002:a2e:9091:0:b0:2bf:f497:52d6 with SMTP id l17-20020a2e9091000000b002bff49752d6mr1657463ljg.22.1695469815760;
        Sat, 23 Sep 2023 04:50:15 -0700 (PDT)
Received: from hackbox.lan ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a1709062a4f00b009ad8084e08asm3853310eje.0.2023.09.23.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 04:50:15 -0700 (PDT)
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
Subject: [RESEND v3 0/5] PM: domains: Add control for switching back and forth to HW control
Date:   Sat, 23 Sep 2023 14:50:03 +0300
Message-Id: <20230923115008.1698384-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just a resend of v3:
https://lore.kernel.org/lkml/20230823114528.3677667-1-abel.vesa@linaro.org/

Just added Ulf's R-b tag to the 2nd patch. No other changes.

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

