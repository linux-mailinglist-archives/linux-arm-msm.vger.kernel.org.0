Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E252151572A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239000AbiD2Vrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238903AbiD2Vrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:47:47 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7F6D8939
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:28 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so8390638pjm.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPKs9GVKGDSLOQL2zQiD6oZiNSnA4Ko5SyLdG3pcspE=;
        b=AQeKf5X42YQmvfUJhMz5xEM+z1so3kgd8cgzlQRhphzfmIkWk5CbVzdl6shGEqD4yJ
         aHGeeKKT1kQvEZtcsPARhWXSC67sEXZ0c3pBD4E+1gxvKXgIiZH0RcAb525/oGg96Oue
         h1CDWGzlKDp42/eFcr4lSF0HX3+B1LO7gWa94VIbUcm9IXd88/80DuRsOtmGHLnZxzic
         Ci99uxxgEq7uURLkMtF0JIUHuIUQHfnbadpaPaB7ASfGdT2yguHuAiijrCEm9A5fcV0N
         Tuz9u1Iw3BmADrBBnw2ZNpPJ9uM0dguAn4I9UXj0Z2jE49yfoDnKUZgexnnnwVrKS4OQ
         ggTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPKs9GVKGDSLOQL2zQiD6oZiNSnA4Ko5SyLdG3pcspE=;
        b=gHXrFYqudQCyLBvUQye/YKgQ42kEC/Eflxr4nIv811B9PfjM7K+YhJ6fXxk0D2eKHg
         vOFZQveM+3KbdqP28v/WbocZu7OCGSo8U1R1OsUEYfRBJn6VIPv9n1bOa0y0NW6qwbRp
         bEiwEXAHSVTWcD+RUQb59KmAOmfH7k6K66jkwVCsM317tcNdisS06IOAzOwM9v7VMQNE
         fzdvopCYxEB0Xf+1txllJn7JTRUv+HWhM3NKlPfoOpQ8elQhFUAC2O6DyxPiz/wh0vBR
         mZVppWBqtgGwajUXjYOnOuyA8GZVvH3oX1q1f1GUj9DrsHSsxoYy+DCB0B9/RYiJwRgS
         nbYg==
X-Gm-Message-State: AOAM5334ydKSTRbFsL/yP+DKgDdSG/1XkQdF6EtvU70PhYtE4Hu/Ha1f
        0ei5gf4PG92X81yNy99v7WejqCvoHJwp8w==
X-Google-Smtp-Source: ABdhPJyD5nledjZldpVBkUeIHwtkPn86Y8kWM9/OKUm3v0yMu1s2avwykyzK1dXTyzhQDRDdazX/3w==
X-Received: by 2002:a17:90b:304:b0:1d9:752b:437f with SMTP id ay4-20020a17090b030400b001d9752b437fmr5964663pjb.242.1651268667658;
        Fri, 29 Apr 2022 14:44:27 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id fv12-20020a17090b0e8c00b001cd4989fed0sm15271086pjb.28.2022.04.29.14.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:44:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH 0/3] arm64: dts: qcom: Fix 'sdhci' nodes for 'make dtbs_check'
Date:   Sat, 30 Apr 2022 03:14:17 +0530
Message-Id: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Since I sent a separate patchset to convert the Qualcomm 'sdhci-msm'
device-tree binding to yaml format, 'make dtbs_check' now reports several
issues with sdhci nodes used across qcom dts files.

This patchset fixes the same.

Bhupesh Sharma (3):
  arm64: dts: qcom: sdm630: Fix 'interconnect-names' for sdhci nodes
  arm64: dts: qcom: Fix node names for sdhci 'opp-table' nodes (across
    dts files)
  arm64: dts: qcom: Fix ordering of 'clocks' & 'clock-names' for sdhci
    nodes

 arch/arm64/boot/dts/qcom/ipq8074.dtsi |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 14 +++++++-------
 arch/arm64/boot/dts/qcom/qcs404.dtsi  |  6 +++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sc7280.dtsi  | 12 ++++++------
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 17 ++++++++++-------
 arch/arm64/boot/dts/qcom/sm6350.dtsi  |  4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  |  2 +-
 10 files changed, 48 insertions(+), 45 deletions(-)

-- 
2.35.1

