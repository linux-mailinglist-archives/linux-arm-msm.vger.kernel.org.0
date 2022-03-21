Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64924E2791
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 14:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347902AbiCUNfS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 09:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347879AbiCUNfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409F93C4BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:51 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bi12so29916736ejb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GXEdYy1flkYD5H4ZjwtkKaTgHfQbeK4Fic81sbDM2g=;
        b=U93LM0PPjvVS1NMUtHanmhanW3zHZ770C883frfTHWmu1t88XsHFJ/SEtXT6n/lMMt
         re6IfjnHppIOC4ngM2HuHaGjJrVDx1YujqZCFxpIUF2EIr6QHsr5IefXFV395iZgIMOT
         YuYCc2UNxihTIk8dpTKJtRls/VJrqYoN1jm955IKVdCwcvVQ+uiKrlwX48B4hZGHMmid
         5Oef/sbbEqSkxUG0zUMPUlutcFL1zpajN67vtPokaziudtmOagUAm3oL2tXePRIA0CeQ
         UA3IVj6jtKwNiGl1XBj0ttF0J0RkHEkR0FKdlhmOkz/f0ksZyjranNksDpQ10DtlkOgK
         b0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GXEdYy1flkYD5H4ZjwtkKaTgHfQbeK4Fic81sbDM2g=;
        b=c2qdKLkXv/b496mvNE7Un/0j99YY9ozoPbuzU+DHa/YAr/jWhCO0GU5CORdAOkvYBh
         HZ4JgFTyQt3Qv5ARzLBa+fBmOkJaxnEsCZh4qysZYl08ZEU9GJ77yDjwwjlNIezFYWC2
         //PglfaGlfr3Wk5xLHltRLOe78eWXdG+x7uvSRH9tP5KDazL1c4poPAB3F8s5W+Is89h
         e+6KRfZEE1XjW95XtIunab4++kfXWMp/F9J8u4I8z7D37M/A8SOTs69RWy9lprXD6nx2
         6OOxdJJzpXNkRM9j7Qg/ZrT6W8RiOYi49fe8g52SBOlr/VZZ4EsVe9NtokQxcKP8WX3j
         yPxg==
X-Gm-Message-State: AOAM5304VqBVguETyTeBOSm97WVEZbSxKMddzjGUYyOua/CmjMV1q4zR
        aS6eOVacGuZAiVQAfZPexU+dHgrk5dUvQA==
X-Google-Smtp-Source: ABdhPJxin6D4QUUEy9OSv7n0xOixCN3MCojKkmBkEpsKwnbOXMZ/kz4iQiW1Uk2i6FUu2r7N4MPGjQ==
X-Received: by 2002:a17:907:3f92:b0:6e0:2fed:968a with SMTP id hr18-20020a1709073f9200b006e02fed968amr1743024ejc.658.1647869629410;
        Mon, 21 Mar 2022 06:33:49 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:48 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Avri Altman <avri.altman@wdc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/6] UFS support on SM6350 & FP4
Date:   Mon, 21 Mar 2022 14:33:12 +0100
Message-Id: <20220321133318.99406-1-luca.weiss@fairphone.com>
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

This series adds support for UFS on SM6350 which is used for internal
storage.

Changes in v2:
- see individual patches

Luca Weiss (6):
  scsi: ufs: dt-bindings: Add SM6350 compatible string
  dt-bindings: phy: qcom,qmp: Add SM6350 UFS PHY bindings
  phy: qcom-qmp: Add SM6350 UFS PHY support
  pinctrl: qcom: sm6350: fix order of UFS & SDC pins
  arm64: dts: qcom: sm6350: Add UFS nodes
  arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  2 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 77 +++++++++++++++++++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 18 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.c           |  3 +
 drivers/pinctrl/qcom/pinctrl-sm6350.c         | 16 ++--
 6 files changed, 110 insertions(+), 8 deletions(-)

-- 
2.35.1

