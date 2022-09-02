Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB835AA985
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 10:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiIBIJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 04:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbiIBIJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 04:09:30 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1D3BE4F8
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 01:09:19 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id l3so1106205plb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4nZB4b1a4Bx+TKwI4YjuhAo8rNEmX7coE+hbb7TOT8s=;
        b=3IJ4Uk4ySwi8qF9Ok7x8/WiBhnhTuE0AM7l2n6pHmJ0K9epfVQo8TVSKN5UMXGh6Ie
         TjLGnsQcHq25o44oTFo4IJvMr/OQTCAhlss3hLiVvgRztK61OeeL8SnzThU6WYIuDYBD
         eR4JqS/J8xIUwWSHrz51GWgssU5ow6nT9VLZ5pIR6B47hBq6jYMlv9wJo6f4rarp0hsk
         kOz25E0LEvPSfxbr8YNOsITjQ7nsIcANtC+Upj4MInnQXdqtL8d8BgBh3gAmEX0cjSIV
         sHhHCKoLI7HZpv4FrZoTVSjFCbsc2KXNXcAxHT6Oso0viXZdPdYsRYsggkyQTbH2lJUT
         rgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4nZB4b1a4Bx+TKwI4YjuhAo8rNEmX7coE+hbb7TOT8s=;
        b=o9DZG0Q0MsYifIkGp/WL4tYBFXzl6Zqk+QN5wbzK61gwGdjEWc+AN01QzNypEUolKS
         DVlb3RONblVhzC9tqQ1biO23Tz4j942zBtjr/FohGmIiQ7tLY+EtS0PyzJEtDjfdfgI8
         WArF/gOJLwAiGSuNB/I+yCHrDxydm1C1Rq9wLxT522rYWoFhYHNyveSSN84KcfOTMHu8
         1tgv4Wm3Ui+9DdHwc4uCsIB4sSVGlOvT7RFr4FQdG67mONVbvq6Jzgdx9L1ChRwdbIAM
         pDrOrLiVjcpyeCcfKIMAhKj7mp5upU8gZ6iFCuvUXKthj0Fvl92Ytx+ZWFZytZHzwgJR
         M0ZQ==
X-Gm-Message-State: ACgBeo3gnVBgJAVXklfTbR7nVNkAufwKqWXE2AkDrl52tM7xHU0e/Z6A
        6kFmQIyxw2rlwixVemnuJUbE6Q==
X-Google-Smtp-Source: AA6agR6y5gg45KYkW2gKaPrAvDHBFjEpHwtN/RDCpAxB49YT833zaza9iheooye2UctlzDRIUsR8Lw==
X-Received: by 2002:a17:902:cf43:b0:172:86f3:586a with SMTP id e3-20020a170902cf4300b0017286f3586amr34300117plg.71.1662106158217;
        Fri, 02 Sep 2022 01:09:18 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b00174849e6914sm943447plh.191.2022.09.02.01.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:09:17 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/2] Add a new board device tree named 'evoker' for herobrine variant.
Date:   Fri,  2 Sep 2022 16:09:09 +0800
Message-Id: <20220902080912.118592-1-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add the initial dts file for new board 'evoker'.

Sorry about getting mixed up with version numbers. Here are links to
previous postings and what I'll assume the version number is:

v1: https://lore.kernel.org/r/20220830053307.3997495-1-sheng-liang.pan@quanta.corp-partner.google.com/
v2: https://lore.kernel.org/r/20220901061336.61386-1-sheng-liang.pan@quanta.corp-partner.google.com/
v3: https://lore.kernel.org/r/20220901091253.93333-1-sheng-liang.pan@quanta.corp-partner.google.com/
v4: https://lore.kernel.org/r/20220902074240.117075-1-sheng-liang.pan@quanta.corp-partner.google.com/

Changes in v5:
- Got the version number correct
- Got the version number correct

Changes in v2:
- Bindings patch added

Sheng-Liang Pan (2):
  dt-bindings: arm: qcom: document sc7280 and evoker board
  arm64: dts: qcom: sc7280: Add device tree for herobrine evoker

 .../devicetree/bindings/arm/qcom.yaml         |   5 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sc7280-herobrine-evoker-r0.dts   | 333 ++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts

-- 
2.34.1

