Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0FF3A7850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 09:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFOHv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 03:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhFOHvV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:21 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9954EC0613A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:17 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t17so10751808pga.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGWRVUlazvDnItAZtGGyEDeGtg0J5AyvblHx2w1qXWE=;
        b=cdpc0EQuXEuwUlrhmkjoKLMumoqgkNHwPdeVjIfON9XSIeeM4DEoj3i0Nd8pST61kl
         51gE8P3WnLkS1uI01dDdjHF+jjkDHT5dmxzocGjqLO9O3EkW2GSclGgL1YVkAv+8R+Z9
         PWbbXIIxT2EZPQrae4i+8E+YHtdR0SBDZabmFfWr4IFcTBi1WQGSJv+0JkxnJ4dri2vc
         rh+13qfJ22ldH+NeIKpWYHGWs7MPR8FTMS8ijkTVdpZAOfTRSTNlk1sH73Y/OGI/yENc
         9UgdFgiK4jsSFkHQhhFs2MO+n0UFxBSG0HQRxN2IZFMGfAGnB8ay5BnTlEQU99zsFFNg
         Gg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGWRVUlazvDnItAZtGGyEDeGtg0J5AyvblHx2w1qXWE=;
        b=gbBQ1QSVQFa1WmC65k6O7uzFtu8V7v/QlAgGKOhch4DoLdKpD2spWXHuV0lwxX9WWO
         kzT0Sf/23TGjdWG6E5+iFD7w3fE/hpzij4UnhLKtFLVSGxIjTk5KtALkSaL47atGAfNl
         o//TflLF0F/mhzREVcB6HvcVN9a02vu+q+n1462MTK0neSb0/iK/QUUAU0TyAA0iMFwR
         /YkTD+g8r2I1VMOjofkMhhHTzeNJw/8zRmtc2uDARy4D+UZuS1qwlKOTBXOFgwnTA+HF
         a2QpQX5uslbjkMPyH2qO1/Oj+AsOC3x5ZtL6FKoZJHDIz16gWRLbR2UADptRc8ve5P/i
         mCvw==
X-Gm-Message-State: AOAM532TXKR3Enr77p/wH0JAtTZGx/1OEteFHULbFYsZ7EDhUM8og0tm
        GxJN+jX0wl4v7Rcx7EZyVDAupxtfYQnMrA==
X-Google-Smtp-Source: ABdhPJxXhtar5jYrL2R4veqD7b36wBBgDGY5dRBtyonFJ2alU8qM6iv+FM2OSswLppu2LDmfEWwowA==
X-Received: by 2002:a63:515d:: with SMTP id r29mr20931165pgl.56.1623743356898;
        Tue, 15 Jun 2021 00:49:16 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:16 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 01/10] dt-bindings: qcom: rpmh-regulator: Add compatible for SA8155p-adp board pmic
Date:   Tue, 15 Jun 2021 13:15:34 +0530
Message-Id: <20210615074543.26700-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for pmm8155au pmic found on
the SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index e561a5b941e4..13dbc8e2fd85 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -55,6 +55,7 @@ properties:
       - qcom,pm8009-1-rpmh-regulators
       - qcom,pm8150-rpmh-regulators
       - qcom,pm8150l-rpmh-regulators
+      - qcom,pmm8155au-rpmh-regulators
       - qcom,pm8350-rpmh-regulators
       - qcom,pm8350c-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
-- 
2.31.1

