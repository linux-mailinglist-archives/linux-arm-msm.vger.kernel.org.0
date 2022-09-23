Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693A65E738A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 07:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiIWF62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 01:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiIWF60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 01:58:26 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1170B122611
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:58:26 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e67so5181257pgc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+2iEYbm4WgWRcksL/NgD6V8Qgsl3K7rBVbxhls3Qag4=;
        b=Fgt2C0aXPLjW9f9Hw8Lb+d2KztyhJzO6sSLfHh8dibEEXJCu1pG5IN818Dam82kH7B
         DAka+TL9kZmEiFKVth9PqBpQ8oULEeFapcAp10rWD40vz7AWiU+VV9wgheFtrppj+xKW
         GQg4DQF0akanQenbtHfz9bIm7AVGbxw5xKnV8fhIBhnqEjqRdJQw8voTzVM3YAA+7H8y
         dMKedRB1mMsNC4ZxhgJi8AUHpHjwBNNCL8J0+QJUaboK9hrw03h+HUQfepAld6q2nF3i
         7eV/J6LEdSOuOlWb55oxMQE9cXAtArMXu2ujGcVccuFukx4CZlOf27wlsSAweIv1+Sfm
         Q2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+2iEYbm4WgWRcksL/NgD6V8Qgsl3K7rBVbxhls3Qag4=;
        b=AWvRmVCBkxFvVOTEqOxRsWh2scrsdQV+SwHeO3zsQJXO3mPR8Ku5C/e4Frl9cfvGS6
         yQ/3ofD9qms6gFmHmZRJK46rM3arxreNYzCCRT8XmCh3Oxhzd/WIF+mb/DG3NVwws5dD
         mrCYKM1KJd/qS4NSvK0As5t17SZdKrbLu4XyjRDRTAFLhyxIO4j3ADqU3oT1vfW7Krro
         N4NAIvclkQ50YmHotJntpzzy2kdEaeEHN7gGSXCdm7/bLTwjv7A+jJCSw/k7gJkeVYNL
         aAxpdQr4c5ZzV9pJmSDq0WEmuLOuvTZqY1LC6knvm5PvtGAWz+idTORVviazUqt9brwe
         PxPQ==
X-Gm-Message-State: ACrzQf1CvirrYKuelmjnqoZ3KQ1LJI2Ix+fR3t71sPe+FoJMO/EN0shF
        eB9JjbqlX+K8XmuIWASKqj3iAg==
X-Google-Smtp-Source: AMsMyM7LtxzI5Ylnx2f8GMwk4fVhQEHRiAZiuGM/fI3m/4T8Fw30VXSloFP7lsylj92oBcfPfNlUFQ==
X-Received: by 2002:a05:6a00:194f:b0:54d:d12e:93aa with SMTP id s15-20020a056a00194f00b0054dd12e93aamr7244579pfk.34.1663912705448;
        Thu, 22 Sep 2022 22:58:25 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903244a00b0017532e01e3fsm5075638pls.276.2022.09.22.22.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 22:58:24 -0700 (PDT)
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
Subject: [PATCH 0/2] This patch add common dtsi and WIFI/LTE dts for evoker.
Date:   Fri, 23 Sep 2022 13:58:04 +0800
Message-Id: <20220923055806.2556746-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

