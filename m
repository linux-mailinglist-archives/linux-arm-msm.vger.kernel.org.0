Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2324CB973
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 09:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbiCCItX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 03:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiCCItX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 03:49:23 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06D4E1B62
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 00:48:37 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id c18so4983630ioc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkhZgYA/1qOi3W2uMLIGsfsxrZRgQn2BiaZgNLglVk0=;
        b=M0ezjdyrjpxEXpbLa8XmCe5TcR38bl/0Ga+yN9Pqt/XC+DK1HN60rS/o1hiifZvSFT
         47kBu0kK/MhEKAnNOruoXzPukiKGz35QKKXxMIOeEoIg8P48FFs57G9kS7DHRrFVFbHn
         Ef4lOsCqo0Ox8ZFYYWw/kvBH8QBQ81yRv3Hloir2SJKHGNSojn9EFGvR/mNPeANbOGsr
         q3S6krJltUOh6VrTH4WwclsYY9cosrRTMjhPF6ckE8ahyQbRQ24ZWoCrm6ID0IvIfq5n
         R/38ll9GQqCY7GFfoWkYBlLsK+Uit8hlu4IxJ6aARXn3k6ZsL6+Ov638hx8e6t4187ZW
         GmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkhZgYA/1qOi3W2uMLIGsfsxrZRgQn2BiaZgNLglVk0=;
        b=wJy/21Plr+pnsSEEkIS1gXV+KQVcs32Ciqfd7S7XbIARuZLrIuC6uaYw64302t3lgU
         BJFMPzHZZb0kMWWOVx2p5ZyVezTBmewkzHAAv3lKY4CqkavkblEpTAgbOb847J92AXXi
         pGXqRTdcaEFO3CWlWNtjUv9PmlwXC7PiBqYI2v4Psngk/2wE7dFiJfGsAAvql2oi++2Y
         DvtE+V5SFORTWzViINs7rEdooW11btNRHcbnOyslgXaqcg/4Ci1gpxyWooATe3AShuzD
         4fcjpmzCcg+rb0lnA/WQOAggBLxpvzmlvku0xCcdXXCifzuPrNzlXJBckJfw6y26n1dv
         zvTA==
X-Gm-Message-State: AOAM531qR8YUUmVYTsHKBVvuZMmah15F0YqQlBE1JN9+qKbWM59YcalH
        YRjFFuDp95rniPfSLg0Thvqe8yhHN/pc0Q==
X-Google-Smtp-Source: ABdhPJxRnkg1tkBRcs8xLRSbKg7O8Y2NzXOn2lh8XyLpEd0WwwpP1/qplz0Uz1GyMwWFpfLzUxnoMA==
X-Received: by 2002:a6b:4106:0:b0:5ec:2631:4047 with SMTP id n6-20020a6b4106000000b005ec26314047mr26589505ioa.65.1646297316771;
        Thu, 03 Mar 2022 00:48:36 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:36 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 0/6] Add ethernet support for Qualcomm SA8155p-ADP board
Date:   Thu,  3 Mar 2022 14:18:18 +0530
Message-Id: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Changes since v2:
-----------------
- v2 can be seen here: https://lore.kernel.org/linux-arm-msm/20220302110508.69053-1-bhupesh.sharma@linaro.org/T
- Fixed review comments from Dmitry - created a new [PATCH 2/6]
  to fix some identation issues with sm8150 gcc driver.

Changes since v1:
-----------------
- v1 can be seen here: https://lore.kernel.org/netdev/20220126221725.710167-1-bhupesh.sharma@linaro.org/t/
- Fixed review comments from Bjorn - broke the v1 series into two
  separate series - one each for 'net' tree and 'arm clock/dts' tree
  - so as to ease review of the same from the respective maintainers.
- This series is intended for the 'arm msm clock/dts' tree.
- Other changes:
  - Dropped [PATCH 7/8] from v1.
  - Added more background on the emac gdsc issue, requiring it to be in
    ALWAYS_ON state in [PATCH 5/5].
  - Collected Ack from Rob for [PATCH 1/5].
  - Broke down v1's [PATCH 3/8] into 3 separate patches (one each for emac,
    pci and ufs gdsc defines) - one of which is carried as [PATCH 2/5]
    in this series, which is used to enable emac GDSC.

The SA8155p-ADP board supports on-board ethernet (Gibabit Interface),
with support for both RGMII and RMII buses.

This patchset adds the support for the same.

Note that this patchset is based on an earlier sent patchset
for adding PDC controller support on SM8150 (see [1]).

[1]. https://lore.kernel.org/linux-arm-msm/20220226184028.111566-1-bhupesh.sharma@linaro.org/T/

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (3):
  clk: qcom: gcc: sm8150: Fix some identation issues
  clk: qcom: gcc: Add emac GDSC support for SM8150
  clk: qcom: gcc-sm8150: Use ALWAYS_ON flag as a workaround for emac
    gdsc

Vinod Koul (3):
  dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
  arm64: dts: qcom: sm8150: add ethernet node
  arm64: dts: qcom: sa8155p-adp: Enable ethernet node

 .../devicetree/bindings/net/qcom,ethqos.txt   |   4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      | 144 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  27 ++++
 drivers/clk/qcom/gcc-sm8150.c                 |  40 +++--
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |   1 +
 5 files changed, 203 insertions(+), 13 deletions(-)

-- 
2.35.1

