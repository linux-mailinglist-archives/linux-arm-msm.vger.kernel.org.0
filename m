Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DFD693089
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 12:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjBKLvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 06:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjBKLvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 06:51:45 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F436166D7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:51:43 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w3so325798edc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf5t3HbtrAKwXxN83PQyrFhyZvJTE8qbhv7SBTxf2ho=;
        b=xj/ni0cLSgDLDgEKlmXGGn+o67yRqh5jENyWbS9gMtov99ms53J+LFZgtWWNxPW7KU
         Xc5F8BOrtOFX3DnnKwBntgtPvMoHfhLoe+p3/Mm+NgxiawwXInm632P1lu89DgGYhGN9
         PmASHrlneW0bFMiGl9KVWCTfsm4cwEsQWs5GAuoB1DTffKzBWfj/7XuvFMVb/OZtUXT7
         +z4IeB6YH335JKg2iLfUpIac229Ihh3FhwlgQtln7azoEgJ/OJvWett2RGOfNR2SVMBo
         5mUtCVU0dek5RuzKJLZ7VAborLV6R8AyMKeCoTKDZou6D85LQhpXRVWzt5ngcvl/9faW
         x58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xf5t3HbtrAKwXxN83PQyrFhyZvJTE8qbhv7SBTxf2ho=;
        b=10NtCoLUl8bSofsPkTx1sDejfR9MsDqdChBKmCHAeO2TbiGfICmAVT6xFPL7BrBB9B
         xHvGGHKQkwk1m2e874128giA4WiMuaCnd6ibHxAOGkLjbWQPpsG3H431wJs3oKd8Z9pW
         00Ak/7CFJ9yVUYaiaoreXlBq6PzCei+boaEZBO8eLWAT549AtLt3vd5MOAEHKKdFpFaz
         D/CfURkZZUO/l/C+26o28wPm5BK9vHm6nQT2AF9q5wHqwXkkvBZe1IYDPhFUURPhB2So
         DSX/0av11jlEhv9oZgwr76UPIiYV1SzLYNFgWG0L2yF6/CdCfWdCbMYUXTBtVkFpcFUc
         gqFQ==
X-Gm-Message-State: AO0yUKUiudP4PJJoHuziHa5QZLq8JeL8LQS+Tr9YIeueTjA+4hoWEicc
        2fJgetW5PWfx4lPKg5b9mGFyRZh2RWXP9sDQ
X-Google-Smtp-Source: AK7set84EvMrJ+po0WIywV9cukouyuLMaxrSGodpzFs6SfG56m37T3lw2p/UDakvZW3wVr5wnXv8hA==
X-Received: by 2002:a50:999e:0:b0:4aa:a5b3:497f with SMTP id m30-20020a50999e000000b004aaa5b3497fmr18724551edb.9.1676116301680;
        Sat, 11 Feb 2023 03:51:41 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 03:51:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/10] Fix DSI host idx detection on HW revision clash
Date:   Sat, 11 Feb 2023 12:51:00 +0100
Message-Id: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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

Konrad Dybcio (10):
  dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290
    compatible
  drm/msm/dsi: Turn msm_dsi_config::io_start into a 2d array
  drm/msm/dsi: Zero-terminate msm_dsi_config::io_start
  drm/msm/dsi: dsi_host: Fix DSI index detection when version clash
    occurs
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
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 162 +++++++-----------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   8 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  16 +-
 6 files changed, 79 insertions(+), 119 deletions(-)

-- 
2.39.1

