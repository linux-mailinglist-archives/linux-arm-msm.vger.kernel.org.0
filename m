Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D739A5E8C35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbiIXMTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbiIXMTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:19:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E70AD01C2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x29so2762010ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MaDjvuC0T1gDpBZdhun71775TT8KE1KBiE1Ke5bcei0=;
        b=puESy4K8V67FVny/TjrFn4LNCygurVqlx7Z88YOG3DcajlZ1Lszxvj7Uu6WFZGat75
         gOugVJLQ3NBooviB0K6QVmabT7FiLHXvfoG+9h62FqhGY9GxRJsGDeBwn2mZ7x6sDxi1
         MyOw7HdrZkWoRWVAOsM6EGDv+Xck5CrYtY3WByrl3PQ8M3ZSKd12f/ok+m1KT+WyAMHi
         ObuFmIuwNIC8zDWN4LVCICN9omcE4Q0crG0AKI8ISX8qzPEwDaA8QI4Rojq3+XUNEMRJ
         qcvmcP22Y+Tp/BrEsZ8GZ8MLmH2JqPy8O6kHjRBpjev0x61/l+ZmZ7HCvuvjFZVL4YfC
         wlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MaDjvuC0T1gDpBZdhun71775TT8KE1KBiE1Ke5bcei0=;
        b=YadHuqF9vLna9FbFIpksHh9ZblKTVAsWR2SH40Vwud1Eo+MfXCi0OcQAgdRCvzDzXL
         ysoksY/5D1dfVDTvnsiWrI/Qe/jANS505tv7dNzjB+Okvmhy3jBoJkIaF/zKsAAySbmn
         +PDkGOweQ5PSs4dKFrrta+yOrotaw09nzeVASZ+2FaGuLJHV4HBpMDWcc1YemrS0O3Ai
         gFaBxbkzKP40sOHG8TkiAS6a59Q7yOnlWuOugJbRtvwDrf04Zf3PrSe3ozwDKmKeYuOQ
         llBSfWXrihUfdCukQBilDeTb9dVqP0Mn1IUubqGI1JbR4Uxj0bYM02Mi5oo/pD8TpY6+
         SElg==
X-Gm-Message-State: ACrzQf3DqGWvVKqiJRPaR8HoZgij433zVmceR10F+KsJt6O3Vnh09oDH
        DSrmN/SivZiYAhjb7EarLHU6ag==
X-Google-Smtp-Source: AMsMyM5kIedc2vSNfpdV2AwJCTNLYPUIAuFCAPKvrxjxi1VJPZakDOpQOr8MJzT2q6U8UAD3So+Q+Q==
X-Received: by 2002:a05:651c:198a:b0:26c:27a:c504 with SMTP id bx10-20020a05651c198a00b0026c027ac504mr4475685ljb.443.1664021941429;
        Sat, 24 Sep 2022 05:19:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:19:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v3 0/2] drm/msm/dsi: Add support for DSI PHY on QCM2290
Date:   Sat, 24 Sep 2022 15:18:58 +0300
Message-Id: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCM2290 platform uses 14nm DSI PHY. As the configuration is not
fully compatible with the main qcom,dsi-phy-14nm, a separate compatible
is added.

Changes since v2:
 - Changed compatible back to qcom,dsi-phy-14nm-2290

Changes since v1:
 - Rebased on top of msm-next, fixed DSI PHY config to follow upstream
   changes.
 - Changed compatible to follow agreed scheme
   ('qcom,qcm2290-dsi-phy-14nm').
 - Updated commit messages.

Loic Poulain (2):
  dt-bindings: display/msm: Add QCM2290 DSI phy
  drm/msm/dsi: Add phy configuration for QCM2290

 .../bindings/display/msm/dsi-phy-14nm.yaml      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 17 +++++++++++++++++
 4 files changed, 21 insertions(+)

-- 
2.35.1

