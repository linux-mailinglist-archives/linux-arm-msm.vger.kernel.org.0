Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB75538F43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 12:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343582AbiEaKwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 06:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbiEaKwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 06:52:01 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F0C48898
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 03:51:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b8so8990657edf.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+aAYlhBaoqcFmdU6C9Gx84E9qMJBIbqGLgTA0/mSl4=;
        b=pwIV2cacZ4ygg//TwNYbRKiQjUBGzgJXtzcat0O1FUmk1LRXTQlUJc6YLXXq5TAeVn
         XTCERPOuIAUvyA1fsx/lioJV542cqtv6JlHCeTPnTmWtkvMqpvUNnDfn0Nn7mnVzj2kN
         2V7sQohQUnjdNW6Y0rM64nPDNwRlpqtkcahLIXo/vWcujgCoxDuG7MYyY1LbTXnUCT/g
         RwhPdpNiD3G44Ta4qb/1IKHQ5Ve1UePVPf/Fq3m871Uf1efZ3z/zrq7rBnrfJ2e3ETSO
         qfWsPGcPhc31ZKBeBSaPCp6wfmp3PQDAY3ob04CrCAty60UOsIVAlXrhkiHVyKRxzsHK
         uWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+aAYlhBaoqcFmdU6C9Gx84E9qMJBIbqGLgTA0/mSl4=;
        b=I02NOH4mWEwIF2hTeXBsI75RMBy4wX5dyxJxeoS15kWQ18RpQx4Ki4bHjGHiGkzV7e
         ySVG/bWpl9DVwhe6F7MKt74HKGFbW1qJzZZYImN9EFklJWkM3lsCx4Mt9AOAvilaSZkP
         0t2gmQ2oW9igEVz9q1C6DrvKWib8yjiAR7rIQkszkwRTH9dDMK6d4NUjTpKQENM6uiiT
         Pr7fHedam7/KfaAynW1q4VsLtC8cooFNQqDwhaafuyN6E2EkJ0jfDk3rF7VC93s7nE8Q
         h4DXTVw7PnRCm+OezhL7HWUp2B8Sor6qTXvH/Or8EtHcf0kPD8CG2bP5POzTkrmb8C1E
         qCsA==
X-Gm-Message-State: AOAM5317AoatZAZyX+UUSBDtZx0MyjLKHiZEZqnMoq+7o1FzAc5tEPPe
        uLJRQOYhXXQlbxU3AtB3dLW7uQ==
X-Google-Smtp-Source: ABdhPJw6rnERzo76jayiAAFVyPq+buvlnElOKXK3el57Jti5fQow9ZL3T4gzpxQSRGCHCDm5L/IYNg==
X-Received: by 2002:a05:6402:2741:b0:41f:69dc:9bcd with SMTP id z1-20020a056402274100b0041f69dc9bcdmr63412100edd.239.1653994316871;
        Tue, 31 May 2022 03:51:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q3-20020a50aa83000000b0042dc513ced8sm5117441edc.30.2022.05.31.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:51:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] soc/arm64: qcom: Add initial version of bwmon
Date:   Tue, 31 May 2022 12:51:33 +0200
Message-Id: <20220531105137.110050-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Changes since v2
================
1. Spent a lot of time on benchmarking and learning the BWMON behavior.
2. Drop PM/OPP patch - applied.
3. Patch #1: drop opp-avg-kBps.
4. Patch #2: Add several comments explaining pieces of code and BWMON, extend
   commit msg with measurements, extend help message, add new #defines to document
   some magic values, reorder bwmon clear/disable/enable operations to match
   downstream source and document this with comments, fix unit count from 1 MB
   to 65 kB.
5. Patch #4: drop opp-avg-kBps.
6. Add accumulated Rb tags.

Changes since v1
================
1. Add defconfig change.
2. Fix missing semicolon in MODULE_AUTHOR.
3. Add original downstream (msm-4.9 tree) copyrights to the driver.

Description
===========
BWMON is a data bandwidth monitor providing throughput/bandwidth over certain
interconnect links in a SoC.  It might be used to gather current bus usage and
vote for interconnect bandwidth, thus adjusting the bus speed based on actual
usage.

The work is built on top of Thara Gopinath's patches with several cleanups,
changes and simplifications.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: interconnect: qcom,sdm845-cpu-bwmon: add BWMON device
  soc: qcom: icc-bwmon: Add bandwidth monitoring driver
  arm64: defconfig: enable Qualcomm Bandwidth Monitor
  arm64: dts: qcom: sdm845: Add CPU BWMON

 .../interconnect/qcom,sdm845-cpu-bwmon.yaml   |  97 ++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  54 +++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/soc/qcom/Kconfig                      |  15 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/icc-bwmon.c                  | 418 ++++++++++++++++++
 7 files changed, 593 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845-cpu-bwmon.yaml
 create mode 100644 drivers/soc/qcom/icc-bwmon.c

-- 
2.34.1

