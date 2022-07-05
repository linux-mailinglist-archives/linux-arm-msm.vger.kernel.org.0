Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD573566F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbiGENla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiGENlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:41:19 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E15E1FCDA
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:03:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s14so14440877ljs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Zu4/ayyyYQ5Ucz1AuuZ8IojHLuhbZJlEcfiqr7+SQ0=;
        b=wNoxfu+ExvvLwYJTJNIghGlhtZlrwvY06hiC0aa7kNJ7cR6yKeM+1WIef95kOnvQuK
         W8FajZD7wjcykRaCOcWbfOEI365sV5MkaqvH3b+utnn84GxqnjNXXRUy41NvXkW0YlPI
         XoOaWaL2hD2Li5lPIrJHbfODP8eUr9AfHX9M4O32ZBYSzweiGHHR2cdWlyksuMW007Dx
         u8vSwhwrBnuA1Hop33BOmWC2aIjqr+RVwOOT09oREw1uHNq/Vq3373Vb5SrmvDbLLBxz
         4wGk4USnQZDvLlWOfFgMC6rMFLfk0Vk5rgxWoqWiJkMW4fpGwHhyoqH/ltQEJeEHN0WV
         pjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Zu4/ayyyYQ5Ucz1AuuZ8IojHLuhbZJlEcfiqr7+SQ0=;
        b=68YNKbXnYxXwP56JW85rnOtp9V4Rosm1GsqawJGu9JfGvsgQz7umbUcW34NRHxtQm/
         +21hqMmXHQ/lebhX+fZfVJ+bXa+en/+LccZi1BNfkNw6dfPqYDrbrj+GJm2am4SUBPcX
         sWKlM2JGFavhAP8xbd8Wk3kBKsm6qIdEXhqBPHhSWbpGV2M88GaWn59MROxHRQdDLKNP
         1gCctBbiyQEvisQSNkCqQnEk8Vnzqw5EGMMAZ/e3SW7ejTePIHx4xGGcWc7GFwR3bF/l
         L79P5gtgW7HXfEGdyRr0YoBpYhOev44e4+6N+GEPHdNq7ak3MLOL557OIaTzurt6UqpY
         ImSg==
X-Gm-Message-State: AJIora9KDKLpf8ih/XKnHmbcJCu5hyGTLyzYQgzvQ+LqCekcaknZuWQC
        8icgPnMkjSsCxhEyxH5ERMeCEA==
X-Google-Smtp-Source: AGRyM1u2pcnfgNTF1NSnG5hsBRa5MsqQGmW51gDLlR1mvGCJj9IGauPJ7o0heWsUxkUG6iBLBB5pFA==
X-Received: by 2002:a2e:8813:0:b0:25a:94e9:b2db with SMTP id x19-20020a2e8813000000b0025a94e9b2dbmr20018198ljh.9.1657026184897;
        Tue, 05 Jul 2022 06:03:04 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047f68d77008sm5688086lfc.178.2022.07.05.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 06:03:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 0/3] dt-bindings: arm: qcom: qcom,board-id and qcom,msm-id
Date:   Tue,  5 Jul 2022 15:02:57 +0200
Message-Id: <20220705130300.100882-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Changes since v5
================
1. Dual-license qcom,ids.h (Rob).
2. Minor corrections in comments.

Changes since v4
================
1. Change the qcom,board-id oneOf (oneOf at higher level) so newer dtschema is happy.

Changes since v3
================
1. Patch #1: Define all SoC IDs, based on Qualcomm socid driver (Konrad). Keep
   Dmitry Rb tag, even though it is quite a change.
2. New patch #2: use bindings in the socid driver.  The patch fails on checkpatch:
   "Macros with complex values should be enclosed in parentheses"
   but that's expected considering the macro contents.

Changes since v2
================
1. Adjust description of new fields after review (Dmitry).
2. Change name of msm8996 define (Dmitry).
3. Add Rb tags.

Changes since v1
================
1. Make the qcom,board-id and qcom,msm-id properties deprecated and limited to
   certain SoCs (Rob).
2. Extend the qcom,board-id schema to match OnePlus variant - four elements -
   and drop DTS patches splitting four into two touples (Stephan).

Description
===========
The discussion [1] brought several arguments for keeping the qcom,board-id and
qcom,msm-id properties.  Keeping means we should document them, so the DT
schema checks pass.

I revived old patch [2] with several changes and improvements.  The commit msg
hopefully collects feedback from the discussion.

Best regards,
Krzysztof

[1] https://lore.kernel.org/r/a3c932d1-a102-ce18-deea-18cbbd05ecab@linaro.org/
[2] https://lore.kernel.org/all/1425503602-24916-1-git-send-email-galak@codeaurora.org/

Krzysztof Kozlowski (3):
  dt-bindings: arm: qcom: document qcom,msm-id and qcom,board-id
  soc: qcom: socinfo: create soc_id table from bindings
  arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples

 .../devicetree/bindings/arm/qcom.yaml         | 120 ++++++++
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |   2 +-
 drivers/soc/qcom/socinfo.c                    | 259 +++++++++---------
 include/dt-bindings/arm/qcom,ids.h            | 152 ++++++++++
 4 files changed, 406 insertions(+), 127 deletions(-)
 create mode 100644 include/dt-bindings/arm/qcom,ids.h

-- 
2.34.1

