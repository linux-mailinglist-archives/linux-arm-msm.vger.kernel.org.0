Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748456D326C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 17:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjDAPti (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 11:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjDAPti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 11:49:38 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181411EFDF
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 08:49:37 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id z19so24192218plo.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680364176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjzqAIl3Ts8TC3ttDK2ZT2hJcqB0556wUOjFhbTFVHk=;
        b=sz+//GCQble51W2h9V617r6lA89aaFxg4pwpEBjvE5HHUXcczloBvNjygUk7YDYKS1
         60022mHnrlzmBD/ivX7hbzZlkUTE3M9RK3y5UvOnWrpxMKODnhJLK9NOdUxqif9vBLV5
         0a1+0mVZEgrgI+CFc8iEKSN2bIWK/xu6XlxqgnbzX18ktgiefq3PvqqNIGeotZA64VUl
         SOQZz1duxZ6Dztn3RDs8F5NeduhX9YhFEXr5/xbBJd0RJ5mNe3pdFROPcj/eGMyK22+I
         zuItZiIpmYGhYC4JMsFUGzehq2dyjMxDcXtNOJ1dHdaAItwjgl6KK5zr2cXxf5noUD4U
         gctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680364176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjzqAIl3Ts8TC3ttDK2ZT2hJcqB0556wUOjFhbTFVHk=;
        b=sfp/dNC3bqLhEfsZWs2cnciTW1fcNsxUL4DFpIXTYLAirwvDL9QZt9D2riT/nYI6D7
         Y4cRBRzk/8rcCpcptEisRfq3VdyTiD9Zo468NHNB3E7PBtu9VN7tQq150gZzp8p4R5fC
         kFNkly1UUBDOTvX/MuiXULidNsPA88+VT9d3/AQAuUk+eULIWvLGZ+X6/KvFlOzdTapX
         MX5pja1ivUcekO4gDqGg8pFVJ8vNcxTjLg/mt51ICUvWSUnu46UVodWQ0yiZIjOi01J6
         jjUPPq8l9VPvzGFpLf6I6Rp6h+Ftw7QkCNN4R5QxNP7hsaQ+KYbaaGc/0hIkOpM1d1b/
         U/YQ==
X-Gm-Message-State: AO0yUKU/a4e+jl+GtR3b6OTNI7AIoq42ZDIDlOB0PYydEEudry4hAtB4
        UjfrOGZgmh/wet23LJrXo1Zd6ZpSvphttpfyKe0=
X-Google-Smtp-Source: AK7set8kv0KcICPLpF1MhNDL7vJZJ/C4KBEDUEDtb2DBefxDPtBOxVAW6qa/A/JtWZg6Yoec8sSQYQ==
X-Received: by 2002:a05:6a20:1b18:b0:da:368e:7c73 with SMTP id ch24-20020a056a201b1800b000da368e7c73mr25768054pzb.37.1680364175845;
        Sat, 01 Apr 2023 08:49:35 -0700 (PDT)
Received: from localhost.localdomain ([223.233.66.184])
        by smtp.gmail.com with ESMTPSA id 65-20020a630444000000b0050fb4181e8bsm3385367pge.40.2023.04.01.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 08:49:35 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 0/2] Enable USB SS qmp phy for Qualcomm SM6115 SoC
Date:   Sat,  1 Apr 2023 21:17:23 +0530
Message-Id: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
-----------------
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20221215094532.589291-4-bhupesh.sharma@linaro.org/
- Fixed v4 as per the downstream driver code: https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296
- As per the downstream code, the qmp phy on this SoC is similar to the
  SM8150 qmp phy and is indeed not a qmp-dp combo phy.

This patchset adds the support for USB SS qmp phy for Qualcomm SM6115
SoC.

Bhupesh Sharma (2):
  dt-bindings: phy: qcom,qmp-usb: Fix phy subnode for SM6115 & QCM2290
    USB3 PHY
  arm64: dts: qcom: sm6115: Add USB SS qmp phy node

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        |  4 +--
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 36 +++++++++++++++++--
 .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.38.1

