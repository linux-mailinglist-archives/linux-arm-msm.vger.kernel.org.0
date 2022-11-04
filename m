Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57466190D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 07:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbiKDGTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 02:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiKDGTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 02:19:52 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7C829826
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 23:19:51 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y4so4028616plb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 23:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmIndQ1J1v/haRlhJt4iO2I+8WGtsbIUvy0YrA7tcew=;
        b=QQToGw+PTcnbhiuXqPudorz7GNFwAK+nfr3dg3OpbjLinl469LoncimSbnmrC6md36
         3R2PloNovd0sdd2Qv5BpJatqAKkivi2m/y4CZtT7l1XyLwbjJ6Uyogs45gFqkNuD8ZV2
         +T2gST5s7Uco5KbKbyEXoNZkljibwibq1xEAMh65MN3ThAu/+wztLKLLpflwBSZtDOWq
         8i1lESDa5N3zQLFDTF7A3d70Kn3h1XSQrKOwV1AeyF6Hn9oDfHd74SkeS7wrhZTdjGF+
         4+EFZHdDvyy6bPRUnrTXbxUNHulyPCpCtn4BGp8r7B/CUZOM3jw1fgHwKwI834totTkL
         CmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmIndQ1J1v/haRlhJt4iO2I+8WGtsbIUvy0YrA7tcew=;
        b=YGFjjqPFjeTPwaa1Y9c40rlqHIR3Gua2s4X/xjPAZcgikyQgFQ9mB6UFjF/KT+7D17
         zaUVne/WoOeTuu9SB8YjqdY/sxxszbJAvqdNHScx1i1mvpPmdbyNdKKWiR0dVbBn9dwX
         QU/DoZ4CXHrJ/JV4grczssnFz0gmUv5zLf5/Wqe4Tu3s5OD8vAQt2/SCtbsszpjdsXek
         KdypUneIZ+VeOG9XWhFoTNMu+WBAnd90SKLt7dL3gzBMmjYsw6u9OjCAebR0JwcwyMCU
         DfGs3ALuCK1s0MB6Dw9ALLJGPLgeJIkMGHiCHTXXRWWKErLRF2bccdwQW/jfvkjHNnKL
         khEw==
X-Gm-Message-State: ACrzQf22gJEZW4bI9RnYwxzPXGz31Zlv9sU3tNEmeG68Hnvq0eXeLS+E
        3NhKKcxMd+pZaw16EqnqQGVpeg==
X-Google-Smtp-Source: AMsMyM6lzIML23ZpapJcyyuBh/o30aaXAWY61PK1yop081DrnntypO7ZscQRMk4dCSJ/SdTN8ZdDGA==
X-Received: by 2002:a17:90b:48c3:b0:213:b5ad:742d with SMTP id li3-20020a17090b48c300b00213b5ad742dmr31583656pjb.172.1667542790961;
        Thu, 03 Nov 2022 23:19:50 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e306-842b-9ec5-b6d1-6a82-aa11.emome-ip6.hinet.net. [2001:b400:e306:842b:9ec5:b6d1:6a82:aa11])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b0056bf24f0837sm1764687pfl.166.2022.11.03.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 23:19:50 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 0/4] Add LTE SKU for sc7280-evoker family
Date:   Fri,  4 Nov 2022 14:19:37 +0800
Message-Id: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

Changes in v10:
- add sc7280-herobrine-audio-rt5682-3mic.dtsi then evoker can include it

Changes in v9:
- new patch for evoker include rt5682.dtsi

Changes in v8:
- updated patch subjects

Changes in v7:
- goodix gt7986 dt bindings added in v7
- add compiatable for gt7986

Changes in v6:
- add removed pinctrl and align touchscreen label with herobrine board

Changes in v5:
- recover whitespace change
- new patch for Touchscreen/trackpad in v5

Changes in v4:
- fix typo in tittle and commit
- recover change for trackpad and touchscreen

Changes in v3:
- none

Changes in v2:
- none

Sheng-Liang Pan (4):
  dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
  arm64: dts: qcom: sc7280: Add LTE SKU for sc7280-evoker family
  arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for
    evoker
  arm64: dts: qcom: sc7280: add sc7280-herobrine-audio-rt5682-3mic3.dtsi
    for evoker

 .../devicetree/bindings/arm/qcom.yaml         |   5 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +-
 .../sc7280-herobrine-audio-rt5682-3mic.dtsi   | 194 ++++++++++++++++++
 .../dts/qcom/sc7280-herobrine-evoker-lte.dts  |  14 ++
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts |  17 ++
 ...er-r0.dts => sc7280-herobrine-evoker.dtsi} |  22 +-
 6 files changed, 239 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (95%)

-- 
2.34.1

