Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DB9550E3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 03:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbiFTBDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 21:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbiFTBDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 21:03:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC88101C
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:03:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g4so2480639lfv.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYx02C+EGoQu6KMZwxBVohOCqcqGTmt/TOzhzyy1LWE=;
        b=m3sa52vAAbFrpDwICO52CQsJYLvI4DPQ04un6oUG38P7j4Q+ZThELmIAd3gmRaRFAq
         6pDh3TdB+B1NEgQsF/FJLuH6ZDCupihbcEG2ive+X5rT8oUOAqL0BXVOqNlnSrTCMGHe
         PuWZE1pedoKE4aSLbr6jrcuR8AGE3QKbNl8ADEKMmYJ97gwwIdnuuDB+HJfG0o7iqZrc
         289OTNHwAtpeeg9pBqDdGeT7eVGQOJGlqTNPh2+Rhkuk4rtQgfiYSMjVyfodxJHFNwqR
         58Cxyj0YS0rSfMc66y/HkYsrIXGPAJG7rQX1vtrgY+0v6x9FOMib6Nj4QcrQufltmpwI
         HxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYx02C+EGoQu6KMZwxBVohOCqcqGTmt/TOzhzyy1LWE=;
        b=gLNYJzV3gGvkcUpZC612xXGKAFytwbVznijs4cCo6U3ZlDJKKWy3gAAl2LlG2GRaml
         OzgG/Nh1jEluT4JVdUXDDTt/EHvQXJ3hie7FCq1Kx43VCq9r0PJ+K0uXvy9W8//LTR9R
         Dp4hU4vWRBtEfBXIDjRv9RimDDpmPszYDTh+uyp9x3ipmDthfBK6XujsAMIbYCTsHtex
         N7FP+61AqNjuv3WARyzwK1f8+Q05ufmRFw7IqaY15n8GAZTCD9pteNH6SwY3Zz1t3DNO
         bJngeuiKENVASw+pgE+RITFXTFrp9W55+cLb5rHyJrP/O/xy578wyJ3sBIEfEZVPjj2L
         GepQ==
X-Gm-Message-State: AJIora+gbBwraAqXYj0t3FpT8X8Oz1SpqzK4BxjBsmZ2tFsNiCHJJuLZ
        vj2aVgKP5p7jw/orKYUcj6rrdg==
X-Google-Smtp-Source: AGRyM1sMWLywf7r4SVgZehvoyw4bAZ3HVrwRR/gdH4/29NKbQUy4lNRoKx8COczxk47Uko6qNZvqoQ==
X-Received: by 2002:a05:6512:2828:b0:47f:68dc:9feb with SMTP id cf40-20020a056512282800b0047f68dc9febmr3098074lfb.475.1655686982374;
        Sun, 19 Jun 2022 18:03:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 18:03:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock provider
Date:   Mon, 20 Jun 2022 04:02:57 +0300
Message-Id: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
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

On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
used by the MMCC. Add support for providing this clock to the OF
framework by registerding the clock provider and adding #clock-cells
property to the DT node.

Changes since v1:
- Also handle the xo clock (include it into the dtsi, use parent_data
  instead of parent_names). The patches were changed, so I didn't pick
  up the R-b tags.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells and XO clock
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI
    PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       | 14 ++++++++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  8 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 25 +++++++++++--------
 3 files changed, 31 insertions(+), 16 deletions(-)

-- 
2.35.1

