Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B80C5E73D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 08:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiIWGSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 02:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiIWGSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 02:18:15 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F005126442
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 23:18:08 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y136so11494885pfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=f05ljLlUO9sOr4KvcyD5u6idMugfpqT7D62/tn0sbO8=;
        b=pAvhqToInZNWXhG5z96xzXs+MzZS5uqkxvSry9ySyYz+8JEQ2tND181S0DlMybrFVF
         w9mQcz4K1+mUBdiR7jMk1OgouLtp3SIbWTIdJAuInKMUMlC3zgcqfadD9bthLMIhcxJV
         NlWa43k4iW9B685LT1MgSDhmG2HVZp50lFSWPmGj9tI8hYXuCiRtHIa6zpmH+mPXyeO3
         GJX0ozoHvatgXFpit87GcEYn4y2HqDv++gZQKG3CgMwqShpYwfCHUrWCLAt0bPT0diZh
         dZgixhDbnM3FuGLYxWY62s/n25z5NY1wYDP+6ZFzWhlGsgpB4WJf0D1iZKYaFOtQJsaU
         WJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=f05ljLlUO9sOr4KvcyD5u6idMugfpqT7D62/tn0sbO8=;
        b=Y2vTfgmHlWE/xD5AascBUhT+JiQPBhLYeqYHkO14fXDNXveXGDpJb4Glg8tBJqlwPr
         EywOdNZcLYh9WC+zfceZA52obrV+TReFMd1wzkDELX3FmbSSnNDBmVS85lvRdC4tv+fV
         T73IX+GEDkRqp6bNWPWsNFk04w2gc7lkRcSJNrwDrGoF0QPAJRTRowzJm6/XgZ/BMt3f
         ldGdeuGpRyobkcoToIHxkZZ0yQM5FLJn5fi5Ulhw5ovISviXnRLUmxGvJpp5j/yYDBbA
         AQJzIxTGlmisKlxfKs/mGGntWiv1xu3p6iHQ0A2HqGDs6WDgBNJM+t/Em9mgOa+caQMW
         lp+Q==
X-Gm-Message-State: ACrzQf3s1aVXvTTkYw+ak+ZKOaRoKcKU565VD4RdwvPZSoTA7uVev/A0
        o1ighPbDGKg5dE3q5wjKAs65NA==
X-Google-Smtp-Source: AMsMyM7Yk+O5UM+vUUWL9QNeCbgNalG8zHkQHUtJtwzxGXbiqGa6c/4GNh20lsyAoFvR3tRsLjTxOw==
X-Received: by 2002:a63:ff4f:0:b0:439:61d6:197 with SMTP id s15-20020a63ff4f000000b0043961d60197mr6165593pgk.67.1663913887935;
        Thu, 22 Sep 2022 23:18:07 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id c190-20020a624ec7000000b00540f3ac5fb8sm5515248pfb.69.2022.09.22.23.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 23:18:07 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] Add LTE SKU for sc7280-evoker family
Date:   Fri, 23 Sep 2022 14:17:54 +0800
Message-Id: <20220923061756.2557403-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

Changes in v2:
- change Cover-letter tittle

Sheng-Liang Pan (2):
  dt-bindings: arm: qcom: Separete LTE/WIFI SKU for sc7280-evoker
  arm64: dts: qcom: Add LTE SKU for sc7280-evoker family

 .../devicetree/bindings/arm/qcom.yaml         |  5 ++++
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++-
 .../dts/qcom/sc7280-herobrine-evoker-lte.dts  | 14 ++++++++++
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts | 16 ++++++++++++
 ...er-r0.dts => sc7280-herobrine-evoker.dtsi} | 26 +++++--------------
 5 files changed, 44 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (93%)

-- 
2.34.1

