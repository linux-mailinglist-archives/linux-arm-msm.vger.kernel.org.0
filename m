Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B294F5F05D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 09:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbiI3HiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 03:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiI3HiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 03:38:01 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908961ED6D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 00:38:00 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e129so3473535pgc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 00:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=c8cSDxaoc+Bwbc6lxhsGSESz1SuPfGrG+FUcw6yQ/oM=;
        b=aQNGJGokDXmOp/q10VSxiouxd37Pc19eHXcMvvbKpeJojCPi/3Xn4AqsdE80ed8iZy
         tyugOLljSxGiIeLiGML3y5ocQxo/2/OnPd09GtYeSvTafh655iM/O+mIg7FDp6XiYdhQ
         NHhrrwZYrC/GXtp+Gqs1svqRQf8k2gUP7gZYPD4B2zKQTTVoCWEecMogHyzwTrhpJYCM
         CxeCGBeJuIRj3131zpeAS0dEWWt0oq9e3Wgiw2OXmK2qkNa3m4Fp1lhA6EEhG7v8+GKP
         mpoNWQyDjL7sPMA1lNL21YmYDW/sCGv1q2TJbpP4rWTOzQTkJHNU6tMaTlz4w6vlgptl
         7u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=c8cSDxaoc+Bwbc6lxhsGSESz1SuPfGrG+FUcw6yQ/oM=;
        b=m2hEjoANYD1IKpWE9bIbxw/D9hOWjxy7RMQeQ4ijyPHptAj51vL45v2PXgt051jmpa
         EoIvulFmBYP0J+F5xmPCzwaIPgSWuFzTz/exFga9QD5Xuw+kbjCKm4ymSZMuXhDWFRZD
         XtG33dJkqXIxCiRyCLIYREVjwCN35lgVbWFXvX7Scp11HPXDCApUdsVsNwzuUmgGd+ui
         sFxS/dVnWOHo1W+ToVuiq93/g/Yf+/UgNFuJoRRKB4SCPuZWrAxHIYLDbrcR+m1h9eSz
         M77YPci8OVJQbgWL8UGa3t6VeX9CgKp06J+WPvMKehyLBwW1ZDGV1KqPXmwTXzG2WI99
         3IRQ==
X-Gm-Message-State: ACrzQf10KARqT4P1Yns8k8keyBPdRRXLmY6lRgScFLlKvIuO95KCH9TA
        aeUz0O1G/K2bY1zlyguMiMnrMg==
X-Google-Smtp-Source: AMsMyM5lennRdw+b8Ndqaqu5CYeSBrEn2mbncHCY3LWvEZM9dVDcmSN1NEIUnVlXMEd2greTNpmrBQ==
X-Received: by 2002:a63:b545:0:b0:43c:2ad9:b00 with SMTP id u5-20020a63b545000000b0043c2ad90b00mr6366407pgo.535.1664523479991;
        Fri, 30 Sep 2022 00:37:59 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902ef4800b0017ba371b0a9sm1166132plx.167.2022.09.30.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 00:37:59 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/3] Add LTE SKU for sc7280-evoker family
Date:   Fri, 30 Sep 2022 15:37:51 +0800
Message-Id: <20220930073754.1391044-1-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add common dtsi and WIFI/LTE dts for evoker.

Changes in v5:
- new patch add touchpad and touchscreen for evoker
- remove unnecessary whitespace

Changes in v4:
- fix typo in tittle and commit
- remove change for trackpad and touchscreen

Changes in v3:
- none

Changes in v2:
- none

Sheng-Liang Pan (3):
  dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
  arm64: dts: qcom: Add LTE SKU for sc7280-evoker family
  arm64: dts: qcom: Add touchscreen and touchpad support for evoker

 .../devicetree/bindings/arm/qcom.yaml         |  5 ++++
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++-
 .../dts/qcom/sc7280-herobrine-evoker-lte.dts  | 14 +++++++++++
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts | 15 ++++++++++++
 ...er-r0.dts => sc7280-herobrine-evoker.dtsi} | 24 ++++++-------------
 5 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (93%)

-- 
2.34.1

