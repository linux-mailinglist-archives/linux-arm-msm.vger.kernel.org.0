Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9974460757B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 12:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJUK4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 06:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJUK4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 06:56:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76C13A49C
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 03:56:34 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c24so1996626pls.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vU/DuE4Eaix7qc9Mg5crIANCPOJ8DuGZdNrlRQlDA6Y=;
        b=qxIn1W5NmANH7TeIMGXyAtAlsJ9NjN4LbjmXSJ2+EKA/58ExYKFL2JmNU/ZSTtV55M
         mYctrLur9xYsiI6wVSuQENUMJJebFKR3boIHoRP7vrzVatxTv0R/e5IApHVOzyHxlcr+
         /Ot5UhT+CmavNXPpnKczC0PhaTKazUfudi7ThAZk5c4PDfreiCeQSIbfLp3nR9PNEHlN
         Mwj2D3e8y6yUZFzURka8WilktNWLOrNcYKICoxV7KQTchZd0qHpmQz/d57gre/BIC2BS
         4daIwYssaLwcc+Q4p3sI82GPZoQ1H62oyUQHzF3va1tMXzuFXC0uV6JOlSlizi65MEYx
         uGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU/DuE4Eaix7qc9Mg5crIANCPOJ8DuGZdNrlRQlDA6Y=;
        b=xl96CsynsWEAS2B4HF3usgXJcNMQEqNtwvCE5W2WQN6TL2faImq5sav84qC8SHUHbs
         O8i03PBt4vUytLBhDb5I6tgcJS1gL7swp44j0rRfpmKHjmqBatWeY5fz5QZXB/5wmgzF
         XWkVkEXpXOqIoGwOLpTiNKIn3ql9HiP7UrV1wPJneDbxxUTr1q2yveOR41sLgQmfWkKi
         qGf4Hf6F0kV40GATysVtU1jah8SRWU6TYUCfBtFeUqoQMqFBvyAD9IytWLyqAKxC+yOr
         sgJptcRH0MdUMif8bk1yGtatD3VxoZ786JzMqSJoxIEKm6CNNUuSVleWw3kBfmxiSRMv
         GEZQ==
X-Gm-Message-State: ACrzQf1k+kPDU+y8C5l9q5ZDSrLllFCK0qEDwPAyZopkF4xl9FnhFOVV
        /cTvaJJpOC9f+woTeuw5Hgd/hg==
X-Google-Smtp-Source: AMsMyM4AF1epMQ0gklAfq/TEi+5qRQfJJqFcac8hRczaFe30IChFzJF2ovDQaCCwPze6LTtYP+YbRA==
X-Received: by 2002:a17:90b:4d8c:b0:20d:2935:7058 with SMTP id oj12-20020a17090b4d8c00b0020d29357058mr56803462pjb.86.1666349794362;
        Fri, 21 Oct 2022 03:56:34 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e339-bb7d-a809-3af0-ee98-4fc4.emome-ip6.hinet.net. [2001:b400:e339:bb7d:a809:3af0:ee98:4fc4])
        by smtp.gmail.com with ESMTPSA id 2-20020a620602000000b0052d4cb47339sm14822957pfg.151.2022.10.21.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:56:33 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v8 0/4] Add LTE SKU for sc7280-evoker family
Date:   Fri, 21 Oct 2022 18:56:19 +0800
Message-Id: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
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
  dt-bindings: input: touchscreen: Add goodix GT7986U touchscreen chip
  arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for
    evoker

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

