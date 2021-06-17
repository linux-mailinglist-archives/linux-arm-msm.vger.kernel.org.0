Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465883AAAB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhFQFTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhFQFTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:19:45 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50227C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:17:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x19so2306945pln.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGMTr7YGGFoZgeDMLbeSkUvHS85PZtWqOqc9pHvL3I4=;
        b=WwRzX0dTJ8oUULfRtohg3ikJtEaCI3dUZxPHVo0AhzfPjVveSGOvTjE/MoIgbBrQMh
         FEQ+9x5JoLBcqiYExdja0VdB87PVHETqqQeFE5oXgkpYdyQ+4KQztT0YwWQtr19XoH4y
         iCE3fXfFSAmyxizo8oa9pTXreKBGlV/J5ztOAw2aFWaqsWw0wH1G71lDKXxT9p3ERSLQ
         l4+5EZEXuk29/exf+SogLVHJAK4yrBTLEQVX+yavmcI57FWEP1RM4mZQ0jymvEWtZI7N
         eYZohPzKP6VsswLTlv/ulXupNiTjypW7HnzimF4WkiHoAB+Wm1kw08PvDeZYSaQyorWW
         /0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGMTr7YGGFoZgeDMLbeSkUvHS85PZtWqOqc9pHvL3I4=;
        b=PyJUu4r8EIRhOLuSf/2O5metNPD3RCz6aUo5biBnwHDk2SVBpDkboFa6Gdc1Y7A6RW
         hoeEvPXFfBZh7uO0RZ3BCWhqwD7XMUkF9BpKgvEmXIzBtPFUQnwzXWUDQL7+tnhEJZPC
         u2Sbv3iq4EXVHIvPG/3mPgD/JKiP842RJFEfqeV/5iU+vUzPRPWmmRX+NKamImda3S6T
         3F+954CfiMX1KSYjvkAteMFJJz7NB7mT7jgZXAAd/g/vSbOpuJrs3NCl4nbWTTVp8qXl
         zF4pUlFQcsiGGwc/TqUbAV3NJHmOhyFiFUpFTiAN+550p/vuu75SOlP7EAz9ABj519a9
         dz4Q==
X-Gm-Message-State: AOAM530H32jhrvWss9A8DXhIxZXt/8B+wE3lEsjzvtSnvaW6HGj7QXh8
        TjF9J1RCnNvtvrdmstJxiFCY9kKQQzAOIA==
X-Google-Smtp-Source: ABdhPJw0fzToV+OwzCzWXoJHSCBKNiIEx2uyMi+bjAaS0PSYEQMzQueXzHoj4ZT2bxEkUV3PhkvRNg==
X-Received: by 2002:a17:90a:5106:: with SMTP id t6mr6212572pjh.231.1623907057547;
        Wed, 16 Jun 2021 22:17:37 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id 188sm3900893pfz.146.2021.06.16.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:17:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/5] regulator: qcom,rpmh-regulator: Add support for pmic available on SA8155p-adp board
Date:   Thu, 17 Jun 2021 10:47:07 +0530
Message-Id: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2:
-----------------
- v2 series can be found here: https://lore.kernel.org/linux-arm-msm/20210615074543.26700-1-bhupesh.sharma@linaro.org/T/#m8303d27d561b30133992da88198abb78ea833e21 
- Addressed review comments from Bjorn and Mark.
- As per suggestion from Bjorn, seperated the patches in different
  patchsets (specific to each subsystem) to ease review and patch application.

Changes since v1:
-----------------
- v1 series can be found here: https://lore.kernel.org/linux-arm-msm/20210607113840.15435-1-bhupesh.sharma@linaro.org/T/#mc524fe82798d4c4fb75dd0333318955e0406ad18
- Addressed review comments from Bjorn and Vinod received on the v1
  series.

This series adds the regulator support code for SA8155p-adp board
which is based on Qualcomm snapdragon sa8155p SoC which in turn is
simiar to the sm8150 SoC. 

This board supports a new PMIC PMM8155AU.

While at it, also make some cosmetic changes to the regulator driver
and dt-bindings to make sure the compatibles are alphabetical and also
fix issues with extra comma(s) at the end of terminator line(s). 

Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (5):
  dt-bindings: regulator: qcom,rpmh-regulator: Arrange compatibles
    alphabetically
  dt-bindings: regulator: qcom,rpmh-regulator: Add compatible for
    SA8155p-adp board pmic
  regulator: qcom-rpmh: Cleanup terminator line commas
  regulator: qcom-rpmh: Add terminator at the end of pm7325x_vreg_data[]
    array
  regulator: qcom-rpmh: Add new regulator found on SA8155p adp board

 .../regulator/qcom,rpmh-regulator.yaml        | 17 ++---
 drivers/regulator/qcom-rpmh-regulator.c       | 62 +++++++++++++++----
 2 files changed, 59 insertions(+), 20 deletions(-)

-- 
2.31.1

