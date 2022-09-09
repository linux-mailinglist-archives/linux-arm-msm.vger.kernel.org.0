Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E07C5B35AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiIIKvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiIIKvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:51:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B431365FC
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:51:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f9so1279677lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9P4P4NeYVOVRgyZGoP5QO7DTNVbMV9xGGX3YySVUK0Q=;
        b=rdTvEovZYFsQDHX4gJjNSWUyb4yKDP/t3vArwLx7aVTBnJYtYjzaoj0e0uJLJvs+OW
         q4xaxvUYomxsrW2R0yoMO/JMYstRmnxxNE/huKkrBzElXzJoJpQUpWr1gjOkFQXmhxoI
         b3TWS9KUlcay5R7jLU/KGNtbX8OQxWb6HWzEpSpmSavNMfdgHmKwO+wvSUSDdc4RXPDl
         2CtNry6NuzOd6RIjLjkIWeZZCCbrv4L20/5UneDAVR7fSoyxXS8WLkNxqrnYovX9rafR
         mmbWjk6NfJnI5K5t41TnCR2TJLxDbzpn2ewcT3k8D8YDp0t81AEMYamQCC5lLt6zYufE
         oXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9P4P4NeYVOVRgyZGoP5QO7DTNVbMV9xGGX3YySVUK0Q=;
        b=CfXVNZrnPUE6cmw4EX7uFA9RdXcsdLEXjtLv4P8UqM7yCk2AtH/PCQSHseCFkNJejj
         KlGnHqZVL1FxnYYcI0LpFrPiXJrSQ2uMD6Y17/FBWM5uRcfz1qZyACypxv207nRdNzU7
         qL4Lnm/pxQjzK62VBrJ4y/cfVsygbnitG859ck8hfpA/Rmq1WT24qO7IO1TB29niW/TG
         E2UR4SfL3GGicQGj3N+OHP79JrRZeHu1DuNB4rPFnmt67w/JLRAr/azFt64FzeoHrklB
         2BpgEZSRqdNhf4FjFCx/VE1BgpCqoj8lGKmfe+WZcbDgUdFMZpAKZFogF4s1ktm7Zo78
         N7hw==
X-Gm-Message-State: ACgBeo0sGcR8JvoLxlb2hfb91lpT3jxgR4buTdDsheKVMz4i0hYM/8K+
        TyDHUGC5Xq8jZId19S0BR5mGow==
X-Google-Smtp-Source: AA6agR7KTGWz/c2Rj2WGOnD5G+pdgYEYPVOwhyy3JlAb55mrL/zrWRPBU7dffkFUygDAMpe0OnRA8A==
X-Received: by 2002:a05:6512:401e:b0:48f:ea0d:1171 with SMTP id br30-20020a056512401e00b0048fea0d1171mr4562883lfb.137.1662720697128;
        Fri, 09 Sep 2022 03:51:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] ARM: msm8660: change gcc to use parent_hws/data
Date:   Fri,  9 Sep 2022 13:51:31 +0300
Message-Id: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
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

Follow the trend and convert gcc-msm8660 to use parent_hws/parent_data

Changes since v1:
 - Added patch fixing clock node names for board fixed clocks.

Dmitry Baryshkov (5):
  dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for
    MSM8660
  clk: qcom: gcc-msm8660: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
  ARM: dts: qcom-msm8660: fix node names for fixed clocks

 .../bindings/clock/qcom,gcc-msm8660.yaml      |  54 +++
 .../bindings/clock/qcom,gcc-other.yaml        |   3 -
 arch/arm/boot/dts/qcom-msm8660.dtsi           |  11 +-
 drivers/clk/qcom/gcc-msm8660.c                | 330 +++++++++++-------
 4 files changed, 259 insertions(+), 139 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml

-- 
2.35.1

