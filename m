Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B1B50F9E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiDZKOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348565AbiDZKNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:13:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F43D229EE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c15so21152919ljr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA3PSG9S8RMpYvQYHUqOQZlj9sUgez8UvKaakxGaS30=;
        b=vMH/nkn7Ek8lu3EnkzNmkfAe84/udsNJViKYI/sG6o/Tn7he4dHiEgPoQ3bE1JhmS+
         GP2LOio+cfl4s+07nBIrglBPBxezm9iktGZuuJ1P3nK4pWgVaaDtLWJIsuE7V+UQyTFC
         EjgktGySqaEs9j7mweGYpsFTyMWdazhxNdFn0EdLu914KSxsJ5GE5Ed8P2CnieQi8rP6
         blqyfxN4zr3ob9bccoVgtp+2mTI0d8RfnUbXjx4dqUZ6sxXkuPDzvecpRtvEacgOia/R
         3P5/TZSW8qc3ZpegrQHsCpqWkljV/Jpl9s+x8LyqxSYpaKyA5gfaSH4/IvizVBYUEL6L
         NF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA3PSG9S8RMpYvQYHUqOQZlj9sUgez8UvKaakxGaS30=;
        b=3p4djynr9hq8NRX3vTeKSZFoK6Lr9W5wtX+NVWe9CajTDVewD2w8slJFkyhaI+xFAp
         nMMG7NABYcsdJQvB/VzZhb1DiQAtJJFP/aYVURiz7+Y6BJgs4SLJf9ixHG7DFo866DV6
         6jKyuurVHWfNrKsHXCyu0ND2qVVK4l/SJbb3NkL4E6WiR8OQRGfn7Et1P+qTpLvD904j
         WOBHcOIA+ae3dCdIfryfnHWjAdbcjkS6oSJ1KkMH/Rn3vT3LLUPvOoPi+rRmxI0XDPoW
         mUk19or7oKEiwHLoDpZYAvvDHQvkUHqRs4fUuEprXY3kpnSKd/N0GZgTu/kbR4TEdKer
         vzHQ==
X-Gm-Message-State: AOAM531lnrgr7OpcnX2/oFPNLmObzUmV6Sn1Z1EFwRov1IYCYlGmQKSQ
        9F7e4P7QYTkGpzETYyparweoWg==
X-Google-Smtp-Source: ABdhPJzXDvyrCttoYUsdXCn/FRtm9sEhujJ6qBuKmBTSL/i0RlcWq4Rke6jvS/oCzhr4ix4EY7abdA==
X-Received: by 2002:a05:651c:311:b0:23f:d9fc:9e89 with SMTP id a17-20020a05651c031100b0023fd9fc9e89mr13815822ljp.136.1650965771577;
        Tue, 26 Apr 2022 02:36:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512131700b004486c863c8esm1684232lfu.257.2022.04.26.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:36:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: clock: sourt out gcc-apq8064 compats
Date:   Tue, 26 Apr 2022 12:36:06 +0300
Message-Id: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Move qcom,gcc-apq8084 to clock/qcom,gcc-other.yaml as it follows a generic
bindings rather than qcom,gcc-apq8064 one. Also while we are at it, move
qcom,gcc-msm8960 in the other direction: from qcom,gcc-other.yaml to
qcom,gcc-apq8064.yaml as MSM8960 shares the design and the driver with
APQ8064 platform.

Changes since v1:
 - Split the msm8960 change into a separate patch
 - Remove qcom,gcc-msm8960 compat from qcom,gcc-other.yaml

Dmitry Baryshkov (2):
  dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back to
    gcc-other.yaml
  dt-bindings: clock/qcom,gcc-apq8064: move msm8960 compat from
    gcc-other.yaml

 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 8 ++++----
 .../devicetree/bindings/clock/qcom,gcc-other.yaml         | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.35.1

