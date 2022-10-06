Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D6A5F64A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 12:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiJFK6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 06:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJFK6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 06:58:31 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485E698CAF
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 03:58:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id bh13so1571600pgb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KeNs8fCcYpKg86qDxmbz50KjfKjeNMX/qMMheV0wNlw=;
        b=281al9VDSNgdN7ef3vBBlnIgy39k7iLqKKXnwelxmBYoagcPeuftgOmBf31vh1Canz
         ddInGdx1+cNcMN5moQdAY5PHKBQc/3jWeq1SDBbhf3867YQ2uYAzY+DtYBfBc/z9hhWD
         bX/P6k4xYTeU6LoRfdtdPPqaY3tJ5qg6sHQNjzYsI9fAStJtbQgvW7hoSG5dRY5NV7R+
         kspi2ZrpdkUaJ9E0JvCOp6Ld+nO15T2f4owJEfaKQ88LIpteSLKeAyy0hqBWdM90g66B
         zxjv03JAH6AFaZSS4NMZ8SJG9Fq2BZFBZLXwo6XpUIu2IiDumbcSg2Nrzit6to52vADB
         B8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeNs8fCcYpKg86qDxmbz50KjfKjeNMX/qMMheV0wNlw=;
        b=Rf/0qTqi2hny/mgg4bNITu7SRkl1LjGnHVLIcneIE0eMdyAShY84PRdtfAJ9/Zho6T
         yRRx/Jp9tAAe0QVBZNtEM7Nx484V0B5+q64+560W/yr+1UyaLdX8rIXX89KYiv9XnzUX
         Fp0xrK9d1Tw6omVR8nCfxx5RNGBJ+1sb1g74vGUHFRldHouhRM6Y5/kJnJ3oWe3rbABE
         Pq6cqNhfiwWGB3Cdpl3k/RQmk1dTmarIp0nuqODl2FuELxLjaRvNr3srVXCyxI4sNgFv
         Rv+wiv/x0vmpS7s4tytm2Qh44nUPD36xpi23YLwLiYJXGAcIDKAI2wTQMEIRL+r7CjJw
         XWOQ==
X-Gm-Message-State: ACrzQf2fDXsimrY7TRu3NwopFye3wruB5wdJAUt0V4KSc6CiBvUTgv8Z
        tBqNkilXicS0xayH27pSNYBnIw==
X-Google-Smtp-Source: AMsMyM7husJwz2VnhdB4tWxqDegCHdd9betvS5Rm6WKWUXd20PvFktQcN2B2JK0Ky8cjMEgc6DWigg==
X-Received: by 2002:a05:6a00:1743:b0:562:781f:ec92 with SMTP id j3-20020a056a00174300b00562781fec92mr2646776pfc.68.1665053909737;
        Thu, 06 Oct 2022 03:58:29 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id c13-20020a170903234d00b0017d12d86901sm10504297plh.187.2022.10.06.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 03:58:29 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v7 0/4] Add LTE SKU for sc7280-evoker family
Date:   Thu,  6 Oct 2022 18:58:19 +0800
Message-Id: <20221006105823.532336-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

This patch add common dtsi and WIFI/LTE dts for evoker

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
  arm64: dts: qcom: Add LTE SKU for sc7280-evoker family
  dt-bindings: input: touchscreen: Add goodix GT7986U touchscreen chip
  arm64: dts: qcom: Add touchscreen and touchpad support for evoker

 .../devicetree/bindings/arm/qcom.yaml         |  5 +++++
 .../bindings/input/goodix,gt7375p.yaml        |  5 ++++-
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++-
 .../dts/qcom/sc7280-herobrine-evoker-lte.dts  | 14 ++++++++++++
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts | 15 +++++++++++++
 ...er-r0.dts => sc7280-herobrine-evoker.dtsi} | 22 ++++++-------------
 6 files changed, 47 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (95%)

-- 
2.34.1

