Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EB16739E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjASNWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjASNWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:24 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF013ABD
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:22 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z11so2872497ede.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
        b=FTCVsOvKrMJzB7s2HyfaaX0VK0I4lqjddNgbgaeRdIaEeBYpc0zC9L96+kTMzE2PWF
         ELasBp8eHVFjaffdh2Rsh3uF/4xpsUTXTqr/o6jmPD9Ccr6lIncU6f7B9bM5cQcRq6Is
         gqPjfccgdjpEB/PHMplYqOGd21xht/eF6IoCmYCZhk1l/v6fCiE4qqYTlh9EcQiirHzZ
         JBbGvo7RPP2KcvfgJE+9JyJd2wGemrI+5ETHY+mBkeDoBVJw036xpxJv6SlnkjxJF/rW
         rMD4xknymB8h6iSCJBuirB8rNkCW4nW1Abir7DnpNQdGUdHtoSDGPlp3Uh/xJ1limrxr
         ljdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
        b=UY3zHz7hBTHeHSmXyiJfx1ufbx2KZK413gk2Xar+vTvVZQf0QGIn3yyz/pD27koclm
         5E0WBI9hbWeo53wuT4xm+/GEPT/VjiD404d6eEF0lBvr5FgqDgVaSeQnHsnDi6WefDZJ
         5SlPkDoiPQyV0q+wSghZXTQq4Ih0hCCQ3EBt5Knp7SdyL/DMiF2gGXfeRaYSbSq0mO5I
         jRWAUFC8+skJbKaVntXxwiQKH3p1y6VfUL0TZPkbg7thg+9Gl2tMrmdRB/c0Y2bm/EIs
         3QtPJaDhhGb/dBtVtSTexY4McVreCgw8ZOwmGnZbkBj+ZRa+6aZIO8f/nB3bPu2MpC5K
         qE0A==
X-Gm-Message-State: AFqh2krtrcAIEzev9PjFa10ZxDHCZ/kVfKUJDX+pT2wzH/AmAFQCppYj
        bPa20QM0Q6oJymnrMrSdETQFqg==
X-Google-Smtp-Source: AMrXdXtxFXcYL86Q+ICy0lk69FgCFVTS6nVq4OzYff6WuL9NPpU43VaFJccJnYaa8jaxEVj0W2IjVA==
X-Received: by 2002:a05:6402:4d5:b0:49d:a60f:7827 with SMTP id n21-20020a05640204d500b0049da60f7827mr10775320edw.6.1674134541040;
        Thu, 19 Jan 2023 05:22:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI PHY with DT clocks infrastructure
Date:   Thu, 19 Jan 2023 15:22:13 +0200
Message-Id: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Make msm8960's HDMI PHY accept clocks from DT and also register it as a
DT clock provider.

Dmitry Baryshkov (6):
  dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
  dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
  drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
  drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
  ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
  ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock

 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 27 ++++++++++++++++---
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 21 +++++++++------
 3 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.39.0

