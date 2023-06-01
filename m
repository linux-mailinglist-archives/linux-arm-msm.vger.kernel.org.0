Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279D871F01C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjFARBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbjFARAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:00:54 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FE91B7;
        Thu,  1 Jun 2023 10:00:51 -0700 (PDT)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at [84.115.214.73])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id AB9D7CFC14;
        Thu,  1 Jun 2023 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1685638819; bh=E9mUjQDo8UyBbkmWjAQSJdUKojwYy/hcV0Ek0774vo8=;
        h=From:Subject:Date:To:Cc;
        b=js7W3ejGpmo/uNG1c+7ZzZVZbgWdWL4uFUp9SOFdlinQDZ8UrSa7sxJGkAUS94th2
         vu82c2MspfTUymLeFadExvzSkH4CQ6ZKvh6kLdVZTMJLVbZF3ucNrkWE6m5ypmtkVT
         U5VjiOymzPzgSMUQrHSQzW1uTZ6ri9iYo6y3TU40=
From:   Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v3 0/7] Display support for MSM8226
Date:   Thu, 01 Jun 2023 19:00:07 +0200
Message-Id: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfOeGQC/32Oyw6CMBBFf4V0bUmZSimu/A/jgtJBuihgiw2P8
 O8WFsaFcXkm99w7K/HoDHpySVbiMBhv+i4CPyWkbqvugdToyAQYcMaZpNZbCSCo1QMVZ56h1KK
 AipFoqMojVa7q6nZ3nnVvP3mRQjrvocFhY6Zj8naP3Bo/9m4+PgjZfv09FjLKqCjKhvNcc52r6
 8K78ZVO80L2ngB/XIguMparQpSIIL/dbdveivtSuwcBAAA=
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=E9mUjQDo8UyBbkmWjAQSJdUKojwYy/hcV0Ek0774vo8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6Zxutcw3C8PPM2W0MlOxwMLfEqVfzbxhHqm
 W7xap/SoRiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOmQAKCRBy2EO4nU3X
 VthWEACX3g9quntLQ1EbVMqXp5IC9GIbgA27GePnz645CnqflV4RI9q1nJjWUecniJAOBjM5MAM
 xaM5ZBI0G9tqAoepgqPtiinLcBZBLpv0kdhOGlUmabgc9mhAVIPeoggNz/6KYqlZmjYNxN9OXgm
 zhxgXFAOL8z0P8B9nkk+WTvbmxY6oHfLW5R1RNSqoVJ1Pn4WRcrfgih11e929+MdburA1WzRO6N
 2czha8byQiO0dCB/AFEk6UXHr0TkJczNCeuzLqLLSKolgqpVELASn70X5/9OFTFwuk4zVQ/oInd
 Uuu/VNs3jkA58XBw/rEZqPc15w7rCzkOKfc26mFMil24agAQOKAV6AH/6sSwCeaec5kptUyYbv/
 kZH48cl3Msl3mnYIVnqjK8w3Wl18LwLN4pPCUZh5oQxWcnZIF9wNWNOuQQuH53m5RM3VBA6Ubho
 XAkr7ZZHhnwyT3Y3rs4OKgOqFXP5C7e6m0OwRiVka7hzYxjblCdHTgIsLNKIlec4o0s9Jq7IHKh
 8O0TfadwYSTtUzErlcOk8F49wuDFn9u1Pb+BmAy9ZShiyQ9mI3ZQqgm6JVZMo+cJ0XBbsWThmNV
 7RZxR/BRrtsFp2soLuSSou/Mb0X3uaXB7/hkmeGnhW9TgtD4wt2AEEARYKABLA+cE4jxTMXQwxm
 y1pu1GSScDwgbOw==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the required configs for MDP5 and DSI blocks that are
needed for MDSS on MSM8226. Finally we can add the new nodes into the
dts.

Tested on apq8026-lg-lenok and msm8926-htc-memul.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v3:
- Adjust mdss labels to new style (Stephan)
- Link to v2: https://lore.kernel.org/r/20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz

Changes in v2:
- In dsi-phy-28nm.yaml fix the order of the compatibles 1/7 (Conor)
- Remove leftover debugging comments from 6/7 (Konrad)
- Rewrap some clock-names lines and move status property last in 7/7
  (Konrad)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz

---
Luca Weiss (7):
      dt-bindings: msm: dsi-phy-28nm: Document msm8226 compatible
      dt-bindings: display/msm: dsi-controller-main: Add msm8226 compatible
      dt-bindings: display/msm: qcom,mdp5: Add msm8226 compatible
      drm/msm/mdp5: Add MDP5 configuration for MSM8226
      drm/msm/dsi: Add configuration for MSM8226
      drm/msm/dsi: Add phy configuration for MSM8226
      ARM: dts: qcom: msm8226: Add mdss nodes

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   3 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |   1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   1 +
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 127 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  82 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  97 ++++++++++++++++
 11 files changed, 319 insertions(+), 2 deletions(-)
---
base-commit: 1b3183710d69a48baf728cc1bee9f1fb3cfeb507
change-id: 20230308-msm8226-mdp-6431e8d672a0

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

