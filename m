Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F72469455D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 13:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjBMMKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 07:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjBMMK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 07:10:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E174196AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id sa10so31225640ejc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U56UrXaFt0mPlSN93LNd/4TPFAU9tpIeDztZRViLVrc=;
        b=MWedDO2B4RvsF1JyZyVT4Ln9oIZ1NBgnJ//OnxHaogVZS2WfEhkvAI/yO7BkRzgyHw
         Wm1/fUo8NqV0QxntOLpvhrOURhljqwpORLlEKRXKVJdL33Hp93h3SN3AJHFKS7MAxhQ5
         Pjf3OpfgK9GO2uEuqDgIA/bXfLUQnDpYdaoY1xYPogMqa+8MCHfwdf5zvtNvVusB5tgp
         dDDVlSqDQzqy8SNgMz1mYgqS8r8iKfzENiPsFn52BJFjTs1CrJy+YW2PjKPr7vbr4xRK
         cRE3xLI11wN0rv1DSOeGPM22W5qX4pgSf57iIHX9hm66OiITXToydw0aG5b3qfae4K9d
         OzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U56UrXaFt0mPlSN93LNd/4TPFAU9tpIeDztZRViLVrc=;
        b=PApVO5alONpcpUteEQNTyT261eLeVVWYf1PxOaulHIyAMY0KFtlC+0vA3+Vq0n95Tt
         UX8RwIzyShTb7/7j2NDMrATbbuTqj7TstF5FUSTceeEay1qR1sQ8j7eAy92PEYpz71c3
         THwVNgAogF07ciXO2bjdV1sDN5JKvx7X+geY12kyUwUv2fxs4ECYkOL4n+DIo7fzFM+j
         DvRSs7EdPmeewHZhpxcjKvMljmVS7dQp/wmdRvWICNDdqppi6F4er5LAc8zTIa8PjrS7
         XKEtFGEL0vVW/GJLW6+YaW3q7xxT2ECxsoW3RFOuGNEu+StzmbsfM6feA7orI2H56vmK
         /MqA==
X-Gm-Message-State: AO0yUKUABi0BmV8sVuF9IG0Vla4vZ2P1pejvG3ZPg+x7mZsgeBGzpwar
        xDSPBHgjRWbcVed4C8AWguAwLY/w/TD8Wl+t
X-Google-Smtp-Source: AK7set8NnL0COF6/YCH8JXKu5D/GBf5XCa8XMvScaj3jcmiEY+pNRMv5TxySIE13ndsTReLxi+5r+A==
X-Received: by 2002:a17:907:9484:b0:878:509f:798c with SMTP id dm4-20020a170907948400b00878509f798cmr29395703ejc.4.1676290215627;
        Mon, 13 Feb 2023 04:10:15 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:10:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/9] Fix DSI host idx detection on HW revision clash
Date:   Mon, 13 Feb 2023 13:10:03 +0100
Message-Id: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 -> v2:
- squash the 2d-array-ification and fixing up the logic into one patch
- drop num_variants, loop over VARIANTS_MAX*DSI_MAX unconditionally
- drop inadequate Fixes: tags
- pick up rbs

v1: https://lore.kernel.org/linux-arm-msm/20230211115110.1462920-1-konrad.dybcio@linaro.org/


Some DSI host versions are implemented on multiple SoCs which use
vastly different register maps. This messes with our current
assumptions of being able to map {dsi0, dsi1} to {reg0, reg1}.
Solve that by adding a way of specifying multiple sets of base
registers and try comparing them against the register specified in DT
until we find a match.

This removes the need for the QCM2290-specific compatible which was
used in the SM6115 DT (which uses DSIv2.4.1, just like SC7180).
The series also takes care of that.

Tested on SM6115P Lenovo Tab P11 and SM8350 PDX215

Konrad Dybcio (9):
  dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290
    compatible
  drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
  drm/msm/dsi: Fix DSI index detection when version clash occurs
  drm/msm/dsi: dsi_cfg: Deduplicate identical structs
  drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
  drm/msm/dsi: Switch the QCM2290-specific compatible to index
    autodetection
  drm/msm/dsi: Remove custom DSI config handling
  dt-bindings: display/msm: dsi-controller-main: Add SM6115
  arm64: dts: qcom: sm6115: Use the correct DSI compatible

 .../display/msm/dsi-controller-main.yaml      |   4 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                 |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 161 +++++++-----------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  14 +-
 6 files changed, 74 insertions(+), 119 deletions(-)

-- 
2.39.1

