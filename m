Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111634EE8E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 09:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbiDAHQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 03:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242968AbiDAHQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 03:16:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC3362BDE
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 00:14:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu29so3328407lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnBP6UAqfunippljeGhmZmabtSWf7ZJZ32Tq/x1EpUQ=;
        b=OUJx2u7yvx/p3FI6sUmpjHacCZ4tEeyI5j27n+ipyjdxCRmm5ZWEvZuYX5slCYdHhR
         3WVhVYrUR+ME6XeACtjLPgsePRRaC26Y2eR8wWWAT1svE8vo/PrKcvKz/qZlhWIyqJf1
         c4RbNTiVTtl1sKQc/8SrVy+Eoix5qMKBBGxI42lnwy62AF4ilQ/CNkZOIVe4TyvlkSRo
         a3UG9Ew4Cpj2lOMZQeYHELs9YHE1gQcsVGmsKXnk3eqQi15iCm8odEtw5X/QOo+v+5Mx
         pL+PQd/R+5zj62+Fr7rr1mRBeXFt+9wGAD+6lu9hiYKtKRohMTcwFhmQVnlHl2ZS6h0V
         Y8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnBP6UAqfunippljeGhmZmabtSWf7ZJZ32Tq/x1EpUQ=;
        b=ZYudNF5ZbIMkU4wuRbywGA3CxOQYT5giFjB86/ndckCnJIjAJepV8olbOTsVjiG/dl
         2Z7pw/RFEfonIfRIFZyZWmP20fDyOvAz989E3sYbdQp91z53HN7qnXMN+ymih+lgx0WB
         EOwtJX2Zj6n5pljJyHm2VQYmcPMisly663c5Nu9GjnEaIyJhoCaV/4IVe+rh8IUJ8Z4m
         LKY0pbL/B/zzMNddwu6P/Zj+l5Wh0FmDfQ2jXvo5dNzZZjlexUSLhq7qU9NAtdjbH/KU
         gn7V0YpMvgOiZ9VLNhAGb2sQPL1KF9+/iMupSrvNFLZ25BoecEhDTQA1Q14elHId8nZa
         6gKQ==
X-Gm-Message-State: AOAM533yinqYhsdG3J2LhAaPdaOtVDqJnJVlHz6gfYscVQer0VtD2LuF
        0K8XInF9yfFbVZlvgUCwa4I3rA==
X-Google-Smtp-Source: ABdhPJxKn/U5PraRfORrptS3sBuVKaWSnCTuDGmbREm2jxpDEMz5XklKm5uih/JI1QhD5Qc4yEtFAw==
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id z3-20020a0565120c0300b0044779127e6bmr13137024lfu.508.1648797270255;
        Fri, 01 Apr 2022 00:14:30 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id x28-20020a19e01c000000b0044a3aca1c39sm152198lfg.255.2022.04.01.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 00:14:29 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 0/2] cpufreq: qcom-cpufreq-hw: Fixes to DCVS interrupt handling on EPSS
Date:   Fri,  1 Apr 2022 10:14:22 +0300
Message-Id: <20220401071424.2869057-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series contains of two critical fixes for QCOM EPSS cpufreq-hw
driver, the fixes correct runtime issues discovered on newer supported
QCOM platforms such as SM8250 and SM8450.

The changes are based on next-20220401 tag.

Changes from v1 to v2, thanks to Bjorn:
* added a check for pending interrupt status before its handling,
* added a comment about a replaced number in the code.

Vladimir Zapolskiy (2):
  cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
  cpufreq: qcom-cpufreq-hw: Fix throttle frequency value on EPSS platforms

 drivers/cpufreq/qcom-cpufreq-hw.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.33.0

