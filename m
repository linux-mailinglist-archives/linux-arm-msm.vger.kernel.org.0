Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8954A56CDDB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiGJIlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiGJIlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DF119008
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w2so3019221ljj.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ng9sE96WrnIx3xQqutYhfh5XLKWJitjlsYB4zzGeV8U=;
        b=Qsn4LaHSwTMU51F04OesvPJNbPxXD4oMQFLWl/7JxiEGaAJEzqpHUT5+EnoOOlvzMf
         HREx4aWfGryUUkow99r0JpcNX68syExzCcnhjj2pjpA6h7O4J0tfGX6+DF0Axs4xaW24
         FxOCj6FxUww5Ya4dk9IyY+qjhItSIoZgeUnCBKFjSu8Qe9PwOFXTjWGbupmsXfXz+MTL
         9J15KATd74EpxXmcmb/iS5ucRzjm7Fta7y9nGJVkKYz19rtzHMP/HkiIABQSS6g+JAGE
         tQmsgqku0gZk4r8lScKAKNv8pClXqNxccvr80e9QE6CEevcKCXIrSCeHHzlzLq1mIBHR
         /BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ng9sE96WrnIx3xQqutYhfh5XLKWJitjlsYB4zzGeV8U=;
        b=Eu1p7kPClh3vkdbYC8mLEdsEH7TVYO7YSJLY0AL7mvF+q/9bPaXYSOkrOLLA48UmCU
         4ZtiUu6z7zE6CPiwg0epipYfYUuP82X3C0CdHJJrjM9R1Wiq4oB+KzIReIQP8nFXVUPu
         J5meCUH2/YZTfhvKLXid7+/HSbfHVO9HrtRgQxrES9a6bVQQlVkkJfx+kq1PQiYEc4E9
         aSPA0HvZxuRmkQC7eYrL5sCOd4QIPVhUvYnVTiz79FPne3bNnY7pXpGeyPUiH4elzbnJ
         FoRGupmVPNJupu8gqNvrjjcdspuTqYFqnWws8kaJ/CrJNRmGKEi7dwMHZRLNSZKR9d8e
         G8+w==
X-Gm-Message-State: AJIora+iuv7jNcRx0inJJSHsyU1Ks+Fbpm9a+4bUqmGNTtL61/sYaCPl
        flV2b+nEUmSugNc2+oSWDtnzig==
X-Google-Smtp-Source: AGRyM1v08aU8P5seYjw/3JLFPxv2a3nAdhwSLebTrqOgrKbenfnMH+mgaHO46Ye5C47bl9zpxFySzQ==
X-Received: by 2002:a2e:b0d3:0:b0:25d:6888:7c70 with SMTP id g19-20020a2eb0d3000000b0025d68887c70mr913658ljl.244.1657442495285;
        Sun, 10 Jul 2022 01:41:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 0/9] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP bidndings
Date:   Sun, 10 Jul 2022 11:41:24 +0300
Message-Id: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Changes since v1:
 - Reordered patches to cleanup dts first, to remove warnings from DP
   schema
 - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
 - Cleaned up the p1 register block handling: marked it as required for DP
   and absent for eDP controllers
 - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
   eDP PHY.

Dmitry Baryshkov (9):
  arm64: dts: qcom: sc7180: split register block for DP controller
  arm64: dts: qcom: sc7180: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: split register block for DP controller
  arm64: dts: qcom: sc7280: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
  arm64: dts: qcom: sc7280: drop unused clocks from eDP node
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: handle DP vs eDP difference

 .../bindings/display/msm/dp-controller.yaml   | 47 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  7 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 19 +++-----
 3 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.35.1

