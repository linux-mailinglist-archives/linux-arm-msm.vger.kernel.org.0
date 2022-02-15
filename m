Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E64B77D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242155AbiBOURF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 15:17:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240685AbiBOURC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 15:17:02 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF32EB15B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:41 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id a42so120292ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J0Xs7TtqexCoOX9+KTnU1s2OTtaFpBd3FN+L7Cqr9gA=;
        b=Hb6CAQPQ8hKPNdb/j+mCcV5LY7KOqEXKKK8rsdpoBzah1hJqGK7eFJ0nmbKNBEUEps
         NR4eWzwzCpQ5PTjjuNDIhZiOBkH8y5UfO33dhrut5qtRkiJyQd3iw4cMwiNrYP8Zma+L
         RLKLVJ3BqQmxqmvDCVJSz/y8af4CxLb45IsWvQCPB4lzv1ovv5h6zEOYIfB5jM5unHMl
         L4Cy0PtDMtfLYyJHQnjd3x8gLXjcV1i/hszfUZlSmFSvlrgL1sAmcVOtJx9KBdDIcIOD
         YZGGS6wOVi+cb9sHy9KiyeFTwQbeqMDZjpYX9UqtvSpW7e3zrRHONnV1lpUkDCkTmLkX
         mIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J0Xs7TtqexCoOX9+KTnU1s2OTtaFpBd3FN+L7Cqr9gA=;
        b=AWBnI2iqI5O8xfqFau7sQjzFksT7aEjYHsz9kgt/WewQ2SMKAqERgXahBQONsqrz3R
         NvvKyviwpSR1e+UIbyiRelQgsSRagi1FYeWgbwtRttDZYuWdx1lFd6mHSSkwOXCjsAWr
         VAMCRZf6NDWYwNmtlOZWKiMLtoYICpHJVx1rDns1gXKPZKTUqUubXAKv8hCZiFmuW5Dt
         wYb8I8c8K8Qj6mtkfrxOaCtltvyW8DaIYXFp1LkTRAhtnqVZjI/a1CdLoYSyPg5FOtGD
         Flkd5WlVNn7+l/ynDvxJsnehYMqxsBoAQ9cJ2Tpw1p7f6wUt+d7juwyDuVRdVBXPyWwA
         SbNQ==
X-Gm-Message-State: AOAM531GB9jWin6t/uqZkxKhirlodLz7NmOwl+HZgyeE/qmStJCT+7Il
        nIZdpRAYDUo1ZYCmZ6/roi0r8g==
X-Google-Smtp-Source: ABdhPJzPrT2NTd98ZyEgfxf/LXzrJMM4r2us2MvTVZoI8mR2oaPbUggo+Vc8VkV3Oek/WPL3MlMqvg==
X-Received: by 2002:a2e:8657:: with SMTP id i23mr483747ljj.343.1644956140310;
        Tue, 15 Feb 2022 12:15:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/5] sdm845 and msm8996 clock updates
Date:   Tue, 15 Feb 2022 23:15:34 +0300
Message-Id: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This is a dts (and bindings) counterpart for the
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=601612

sdm845.dtsi (camcc) and msm8996.dtsi (gcc) are updated to
use DT clock bindings rather than global clock output names.

Dmitry Baryshkov (5):
  dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
  dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
  arm64: dts: qcom: sdm845: add bi_tcxo to camcc
  arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
  arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1

 .../devicetree/bindings/clock/qcom,camcc.txt  | 18 -----
 .../bindings/clock/qcom,sdm845-camcc.yaml     | 65 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 16 +++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +
 4 files changed, 76 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
prerequisite-patch-id: faf41e7cd54deef9eb7db61dc3b1022c131e3b6a
prerequisite-patch-id: 6d2b8a35d8d003a3f0e1ac6c3dd40c3f60824575
prerequisite-patch-id: d3d408d274687adfa38281219a9cbf0165e10771
prerequisite-patch-id: 6bae15b7a39499c9202269cb6ab617ad855c1c8e
prerequisite-patch-id: 0798178208d922a9541cb8c6267010e5374ca7f1
prerequisite-patch-id: 4e9967e6ab4154f3dda3bd7528fb78f5e4b1fe3a
prerequisite-patch-id: 8a7d887e248c1c925f6f649a42a7e0a31c74d9ca
prerequisite-patch-id: b7d94b74783a451f5eae89bcf745e8268ee78250
prerequisite-patch-id: ab4650463050af807fdf5529e63c1ca8b4cd15f3
prerequisite-patch-id: 80b4fd161bba1eda9f0a6624ef694900e1bc1b20
prerequisite-patch-id: 8289d90134fd68beb3d7267e8b696d9f9367a41f
prerequisite-patch-id: fe3663dbfc680b17b3d888b928011ff75b7a876f
prerequisite-patch-id: f3221f3e2ff5348902d4a2a986d4592cb5220060
prerequisite-patch-id: 7cddd86bcdfd62280e2eda773ef261d231053f46
prerequisite-patch-id: 258763de211d1d1a721c4f56452598cb8ca97bf7
prerequisite-patch-id: 640ed205f402595dd9faa0e3fbaeb12402a700bb
-- 
2.34.1

