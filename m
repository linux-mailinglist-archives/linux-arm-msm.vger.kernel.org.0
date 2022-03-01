Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D614C83C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbiCAGPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiCAGPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:44 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE2A66200
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i11so25177812lfu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sU8qmTMKoXOI/8K1Qg71CzJ9WWwOfDi52Ddm0ZSLRcI=;
        b=rNXZ4TbW1E/hhABdnuqFEuvQpUGKPo/pwp5FE2NW25Y2OGwxKKLL3GdRoqOZENMkz+
         2Rc8LrSPOXk3mGbHiBLKn+fEEeRAXYteuBdJoKfD5fsfHr4aV3jL9IFN2Z12YymKMkG9
         tIA9lZax34d+NUSvsKgqi6W0sYWIOIRx7+oYDUwA7GI3+j2x7aO3XrpySPfoE7Xvo5wU
         PO07SvSiDqiEX1y8IQP1gfqJKIm6NZc4vEGY/YjPsPPs9VjLFtFBtZaruoQwV8DMkshs
         7+5r2MvG7ezJ2pQklkGQaAtumgnLNWk0WZZHC+Ch4s38pomi9FGG5aYpzn3a+eYg8uX4
         pweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sU8qmTMKoXOI/8K1Qg71CzJ9WWwOfDi52Ddm0ZSLRcI=;
        b=eoJ4U3j49UkV+8+SBYD8Ii5xcbrelCCrpTo2Wp/OXG/208fjkbc8Z79tI6dDJ9HF0e
         ueiYtuep7YIB35cOnxD0c1yTRxVPyU697B1kzblI5d05jkzWoVEvQXhf2W54jkanIgdQ
         UCGXSpD+zBZr0kYAbPprj5nH3KPvazzTldhv0LZ7HkdHxr/aKrc15faeSrdz7nNotbBz
         Ya5ZFEtt4Ecae5DUZzdq/TB1htJ9MN8ANayE8kwwaTfrjM7L5HWvKQIE2FGqhq2D5iZJ
         gb98TASAcCaOAWTihAd72FFtMY6L9qoOypPGCzE77aTwi58krjjuf+y2yvpgRy0M/lho
         PjYw==
X-Gm-Message-State: AOAM533UMPydOioOxr9PzFf2VuNMjTSLUNjhFwj6hieVQw8uXwD8XxM+
        JPviw9k3KiOibY20VaL2PJM1NA==
X-Google-Smtp-Source: ABdhPJxLaSICjbnNXfBVYivUIl9Dfj4BXY86uV3Be4Z2ZKQuPsIjzb5VIOA/Tadwp43gEWCJ0S6jJA==
X-Received: by 2002:a05:6512:481:b0:43d:f703:721e with SMTP id v1-20020a056512048100b0043df703721emr15055193lfq.55.1646115302007;
        Mon, 28 Feb 2022 22:15:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: qcom: sm8450: add PCIe devices
Date:   Tue,  1 Mar 2022 09:14:53 +0300
Message-Id: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
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

Add PCIe device tree nodes for Qualcomm SM8450. Enable PCIe devices on
SM8450 HDK and QRD boards.

Changes since
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=599422:

- Split from the driver patchset
- Remove interconnect nodes (will be added later in cooperation with
  driver changes)
- Add PCIe1 support
- Add SM8450-HDK changes


Dmitry Baryshkov (7):
  arm64: dts: qcom: sm8450: add PCIe0 PHY node
  arm64: dts: qcom: sm8450: add PCIe0 RC device
  arm64: dts: qcom: sm8450: add PCIe1 PHY node
  arm64: dts: qcom: sm8450: add PCIe1 root device
  arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
  arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
  arm64: dts: qcom: sm8450-hdk: add pcie nodes

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts |  21 ++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts |  10 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 274 +++++++++++++++++++++++-
 3 files changed, 303 insertions(+), 2 deletions(-)

-- 
2.34.1

