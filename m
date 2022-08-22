Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF9F59C74E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 20:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbiHVSvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 14:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237514AbiHVSus (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 14:50:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4FA4BD23
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id be9so8600267lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rsjsUi5j29pEEYwqLrOimHSSjS8I1Tzv9QAdiQT8qPo=;
        b=LQGklJCGzJGKHdWBkted5ByOVqUVC7J0izLl28gYCPluIn7L0Ez6NyrkxwrK2a8q8p
         Ktftb7A2PEroo6wEZIwBtcIIsxvDh2fMVcQv1waPpo0s1Jspg7npBdJLUG7y+h2MNCzN
         1oYGU7Rmveduyu1Rx+gFlFujMnRVyItJxagzMVfJAZb+kfiqUkHKQnPYR9bV+VkGTg7O
         3uFyHLmSr5XOsciaST3frULP/uFly4YD6sZd7ubkRkbfy5YX3IMBGsfC4I6Kn7Mq4KXl
         KUzV/QFF3ngPfyhbg1vuYJ6yRdVo28JJWd9Hr0P57j3KRWL0j44wAaeMWCAHeNwB8mNU
         mtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rsjsUi5j29pEEYwqLrOimHSSjS8I1Tzv9QAdiQT8qPo=;
        b=DJmFWNKiv5dp6etHj9F+e2fg81JZ5iZo4KuLGqBq7dhcgVWf611GtcmZBL7e0FhV3q
         tfzWmYJ6VZNGSWo84zFnZmFolHd62PK/b/xBAJ41lEHtTxgS9IyRKZwp8MFj719wFj+r
         cNtxppQjeDd5x8lpn39ngpYjfXRFI1PANsBB8Fn3V4Sga07zhmcFgrFTN8+Z8nqSxW61
         OnjKMlr9Z23k/AYDEpJg9f1rSX10hcY/yk4qGzRxGclBjenvyD3dJJwOdeVGaVNkFkeC
         s5VqSmg9ZxEwyBb9xM4vvvMKXMbtRDmDIySHXdb62bkEqPtTr7rA+HCwwvIqOiJ1oXZ5
         6pJQ==
X-Gm-Message-State: ACgBeo0+zyd0ph+Gvj+Dla6dcj6obknDsd4Wk+crzyam+pnQVzYcsAcN
        9HHBaD00/KmMwuDd42Wfc4u2JQ==
X-Google-Smtp-Source: AA6agR5DtSe4fBaOZwmnol1A/9xLdl1qZkv2nRAnVVepcoZn0MEJuGyfMi+XYztw6sZ5o48fs5c2NA==
X-Received: by 2002:a19:5f4f:0:b0:492:e5d9:a0eb with SMTP id a15-20020a195f4f000000b00492e5d9a0ebmr1992808lfj.377.1661194141378;
        Mon, 22 Aug 2022 11:49:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:49:00 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/3] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP bidndings
Date:   Mon, 22 Aug 2022 21:48:57 +0300
Message-Id: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Changes since v2:
 - Fixed commit message for the patch 1 to mention proper commit IDs.
 - Dropped dts patches which were picked up by respective tree.

Changes since v1:
 - Reordered patches to cleanup dts first, to remove warnings from DP
   schema
 - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
 - Cleaned up the p1 register block handling: marked it as required for DP
   and absent for eDP controllers
 - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
   eDP PHY.

Dmitry Baryshkov (3):
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: handle DP vs eDP difference

 .../bindings/display/msm/dp-controller.yaml   | 47 ++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

-- 
2.35.1

