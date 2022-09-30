Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862E15F0EF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 17:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbiI3Pgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 11:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiI3Pgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 11:36:53 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA49D18C02C
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:36:52 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso9421263pjf.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=qqaXXPlV6Wdvn0q4C8VxTCjIDz9FmR2A+6qQXG2ZJns=;
        b=HMqRvT11slWKeu8o257YB+RqDLo9R3t6NHuauaxivFXfdlGclGlMs2z69n4+AsROdZ
         KukNPjj7qrDli2HcsomV0zPtWGxJ7vp7OvDMjEeMkMeEVGhmCxnSKAPq1l0bqNOnbpYO
         N6F1RENiv5OQEU+kjVrkigtTYKj3UI43V/+/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=qqaXXPlV6Wdvn0q4C8VxTCjIDz9FmR2A+6qQXG2ZJns=;
        b=P8Ptn0h5gCgsVIAYA3Zoa1oVItzwbxBgvkJEFTbn1JIiIHod/iEtAx7mh4xoPEMei5
         e5NrUdfa4u/QDo2q4z0zRoueNxpiV22wPtYW6LhEI1Tzgui44759IcMfJVqMLqOIXrMW
         abhX+21GjRTJ1/4vOPX3FBy18n9+272YmBeNaOZlcxSNLeBq0Rd4CxdBvZVDnx5e66NF
         0+x2endGdhAI6MrWwv4cOrt9SzdAlKOK4ur4Bi/Xdv0harq85Mzvba0Y/Q7KXYYZ2Rqo
         QztQ7Ftw5H6RtDM7l6DLzZdc+xeX0v1Kw1BEh0QeOvj+sjqd1IZcYc9g2PG4qQPrDGJM
         2lig==
X-Gm-Message-State: ACrzQf3zRTl5LPQM7v4tuf7cEj5dIB6wsncheoVIcu9xaEo7E5SEoSte
        1y1KdXbixSnF3efR036eH4w3ZQ==
X-Google-Smtp-Source: AMsMyM6QbKbOzf6mjVB/DxGl0Ok2c0vz2UIgNY4njotN8/Y9LiHnz2QksU80zj6dqEa3RKJYrmQRiA==
X-Received: by 2002:a17:90b:3b41:b0:202:8e4b:f532 with SMTP id ot1-20020a17090b3b4100b002028e4bf532mr23185598pjb.231.1664552211904;
        Fri, 30 Sep 2022 08:36:51 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b0016d72804664sm2025155plg.205.2022.09.30.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:36:51 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     andersson@kernel.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v5 0/3] Add dtsi for sc7280 boards that using rt5682
Date:   Fri, 30 Sep 2022 15:36:40 +0000
Message-Id: <20220930153643.2018907-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put sound node and lpass_cpu node settings for boards that use rt5682
codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
choices of headset codec for herobrine projects. Common audio setting
for the internal speaker is in sc7280-herobrine.dtsi.

Change Since V4
- Rebase and include sc7280-herobrine-villager-r0.dts change.

Changes Since V3:
- Remove Change-Id in the commit message.
- Add dependency in cover letter.

Changes Since V2:
- Fix sc7280-herobrine-audio-rt5682.dtsi syntax.

Changes Since V1:
- Not to include the herobrine-villager-r0.dts changes in this patch
  series to avoid conflict.

Judy Hsiao (3):
  arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
  arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
  arm64: dts: qcom: sc7280: Include sc7280-herobrine-audio-rt5682.dtsi
    in herobrine-r1 and villager-r0

 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 122 ++++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
 .../dts/qcom/sc7280-herobrine-villager-r0.dts |   1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  30 +++++
 4 files changed, 154 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

-- 
2.37.3.998.g577e59143f-goog

