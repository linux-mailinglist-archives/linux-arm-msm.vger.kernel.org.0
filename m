Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7355783D37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 11:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbjHVJoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 05:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjHVJoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 05:44:23 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C3E1A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 02:44:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-26d466705c9so479074a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1692697461; x=1693302261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVlFH3kAFL/05tPu+4i34IHoYuCuVyTATmf88CsYYgI=;
        b=BiisWe5tBXGe2sUwu/cNdgJJRH8tzfClw209m+rY9pb/ZT6Dv9pEq5Qh4t1TeWUznw
         QUKgRgyQd1TLabahWA9C78Dwahi010UI2dKwE+SveLrN/qXXHO0HaY33KHV28e0Z17B6
         1we5IWGHlmeBAGNDGvHxUsQaUYM54bWmflfimvsB5Ssyd1dPUP3LeTfpciOCfCnbnOsX
         zj+lhzLBozP03Shjv328KUdUKGHA3nx70tyG90SFK2Pqqq/PDFHgw6fmLIL8jbfzsz8S
         y+YL4r8DOhiQ/9AlREuEVyyA+vZa21+YSfPjEZp6I7EOAs5PcENzAqxzZHIGGGl1cGey
         wL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692697461; x=1693302261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVlFH3kAFL/05tPu+4i34IHoYuCuVyTATmf88CsYYgI=;
        b=QZDpVjD8t8HFjGzSSWw4+OHS0YRnf6U5hpxwiEQT9V4HbwJzPilLrSZF0gBxbcrcQJ
         7BFvbGPzefRPD5bwESvN2xA4o2uprvnNelnplPEfctrDwG+mKrBAVi5QZ60ewtK6CINA
         iA8aOU2X7QETaH+ZDe73zK1XDzpT9GAH2E2h2rSRkTpqnvMJAYXufqxWz8KWWRAEdsd6
         AtQkLcfHlvn8sPSOOEgjQ6281UYEMvlQoejgzh+RdA72I+LC62xOPrs0xGeBW8kfDqxE
         FFp8ZyIa4Yy0UfoB03wRYl/kqdmYP8y7tEHBA7dljE3PG6URoeBMP3GsmtkhxfFAWLkO
         P7Yg==
X-Gm-Message-State: AOJu0YxTInZED/wKiM0lWGiq4iqVYLj2S7FqyM0cRWkT17Qh4R8yg/yQ
        vKC22vMUr4/1cuOkP10oZv0O1Q==
X-Google-Smtp-Source: AGHT+IHSDwhuGqghjX65WCVUk2cymMj1QiKOxhCtgPPJam07sRBl3HLv52L/0z/VdePhDJUT7VPzjQ==
X-Received: by 2002:a17:90a:17ec:b0:268:38a7:842e with SMTP id q99-20020a17090a17ec00b0026838a7842emr8160706pja.2.1692697461010;
        Tue, 22 Aug 2023 02:44:21 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id x33-20020a17090a6c2400b00267d9f4d340sm9976082pjj.44.2023.08.22.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 02:44:20 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] Add no-esim sku for sc7180-lazor family and new board version for audio codec ALC5682i-VS
Date:   Tue, 22 Aug 2023 17:44:12 +0800
Message-Id: <20230822094414.123162-1-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



Changes in v4:
- combine pathc2 and patch3

Changes in v3:
- correct corresponding of new board and new sku
- sort out the node order alphabetically

Changes in v2:
- add new entry rev9 with Parade bridge chip
- correct newly create dts files

Sheng-Liang Pan (2):
  dt-bindings: arm: qcom: add sc7180-lazor board bindings
  arm64: dts: qcom: sc7180: Add sku_id and board id for lazor/limozeen

 .../devicetree/bindings/arm/qcom.yaml         | 31 ++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 ...sc7180-trogdor-lazor-limozeen-nots-r10.dts | 40 +++++++++++++
 .../sc7180-trogdor-lazor-limozeen-nots-r9.dts |  4 +-
 .../sc7180-trogdor-lazor-limozeen-r10.dts     | 56 +++++++++++++++++++
 .../qcom/sc7180-trogdor-lazor-limozeen-r9.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 34 +++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 38 +++++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r10.dts     | 30 ++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |  4 +-
 .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |  4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts |  4 +-
 12 files changed, 244 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dts

-- 
2.34.1

