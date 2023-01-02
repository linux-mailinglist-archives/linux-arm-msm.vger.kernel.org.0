Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157EF65AEDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 10:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbjABJrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 04:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjABJqu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 04:46:50 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C3C192
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 01:46:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 1so40905902lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 01:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdQNvAH2JqNq0OpzmxS1hTlpqEznH+7uxOW5B1JMPq4=;
        b=x8P94/Cwoq3AWscFOMq1vtEGpWVRJhOOADt1DRcxWzamuZ2Jcm8o8CcBTHeemjr/rH
         t7lNyoDoV+arAPn9weDFT0FaQrzrr5Y1oPXEs2TkQxMZ95ZMvq+RppDM6IKn/VDrlpKM
         uvlXBsPs1J+YnGg50MJ/euc1p2v8ZBjyi5O1mY/Eu8G12tXvQCCpLD0bhu60c52hI65w
         Jgd1Hct8XEw+mJ9slEQ6VnfL415OuruX8feXotWYE2PZYYKdC6eWymd2udl0QXQ7HiwU
         vADW1DvpL1c58Qm/9DwgUhu42xujXeLQ3JLOVKP+HyzGhT0VfNraLo3JM25Zanvaaw16
         Gajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdQNvAH2JqNq0OpzmxS1hTlpqEznH+7uxOW5B1JMPq4=;
        b=BxT9a9otv11mXpc65Hdln4xFBL+yTIgRS321e9fUX9o9y/cARqowXMxU65Cr1TjdaI
         xNwsXBm1Ud7tSGCKikB0LAJcyCqp8KAytV7GytdwzoI6hgPY9M5uif/BeVcUgSbtHf3C
         dch9Q3goOlqsFnS1QR6pbsGEwZyKpAu00WVS1BP53k81qVhYSiVCwZOwa6Ax+58aReQD
         2pYctB/A+ftMsWxTHWbgjXuKHbJpjtexrA2HP4YrXhQkjhNYfRDxLsScKJm7xpyE4vYh
         ID0bghaVIa86Yb4Mrp7lgvGpe7Cdugg1eKJuAPH8RC2UsFNGK0497HbBHrjHJhYY3Bk1
         8/Pg==
X-Gm-Message-State: AFqh2krSGANc+hMTuH9vX9ndE8l+TtwZVBFdD/VGqHHuqbEAEorcdXEg
        zhSqovh73lyRYWmKqMpXAwO/kgJ0dZq1HZ8R
X-Google-Smtp-Source: AMrXdXtwwa0eVzUGCAN1l/vI2DKh8PqI6szMWhbBAbOk/HkrR3OobgdUfPCRAlrj8riM8kYrXHFTxg==
X-Received: by 2002:a05:6512:39cc:b0:4b5:580f:2497 with SMTP id k12-20020a05651239cc00b004b5580f2497mr12196102lfu.17.1672652805134;
        Mon, 02 Jan 2023 01:46:45 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm4382143lfa.297.2023.01.02.01.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:46:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/17] Misc DT style fixes
Date:   Mon,  2 Jan 2023 10:46:25 +0100
Message-Id: <20230102094642.74254-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

As part of trying to write up everything we care about when reviewing
DTs [1], I put my regex to a test and removed some reg inconsistencies,
among fixing up some other things in ipq6018.

v1 available at [2].

No dependencies as far as I'm aware.

[1] https://github.com/konradybcio-work/dt_review
[2] https://lore.kernel.org/linux-arm-msm/51875ab4-b0af-466a-cf27-d3bed65a94c5@linaro.org/T/#mc791099fac8349db446468ee873e0953e58a8246

Konrad Dybcio (17):
  arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
  arm64: dts: qcom: ipq6018: Fix up indentation
  arm64: dts: qcom: ipq6018: Sort nodes properly
  arm64: dts: qcom: ipq6018: Add/remove some newlines
  arm64: dts: qcom: ipq6018: Use lowercase hex
  arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8150: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm6350: Pad addresses to 8 hex digits
  arm64: dts: qcom: sdm845: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
  arm64: dts: qcom: sc7180: Pad addresses to 8 hex digits
  arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
  arm64: dts: qcom: msm8994-octagon: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm8450: Pad addresses to 8 hex digits
  arm64: dts: qcom: msm8994-kitakami: Pad addresses to 8 hex digits
  arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits

 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 548 +++++++++---------
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  52 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  46 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  46 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  68 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  54 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  16 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  48 +-
 13 files changed, 461 insertions(+), 463 deletions(-)

-- 
2.39.0

