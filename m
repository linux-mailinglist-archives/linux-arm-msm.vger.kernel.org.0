Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DFD565AAA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 18:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbiGDQLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 12:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbiGDQLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 12:11:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33446152
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 09:11:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t24so16548110lfr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvpMkL8rwQeoEo+SMzO+GF3s7pNzolh8BqnzxKkFoo4=;
        b=PRa8oeritKHlX5Cuo59DeIr0jqFFxqZ1SUAiCm7V/3n46EK/pO7XM36ROBw3DzXSXQ
         YxJhUduCoQbUeCSf4f+YyP0BecLCr5Bdx0rzFxhPwJiYWfbtX1FSwGRSAoCvzxET1Aze
         d8bQuCcF05gDIgavHgfmsknIUBq4J7Cv/dhY0Q7FDmoPhqCMKh/YwDkOgUpXAZTVm6kx
         xj6PcFZA+zxLttELoWt2i3Nsro/aZyINoJiHx3vMmZ313zFWalf6OIYMpBFqs/QB+Zh2
         facRBNtre9zuGmBE7bQfhiLwEWoNOsuccYUiGxdwwsf9Fwk8OCu0Shq5UH8A38/eTp84
         QPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvpMkL8rwQeoEo+SMzO+GF3s7pNzolh8BqnzxKkFoo4=;
        b=hujhxwgaeiDLv2qhYmaOc5G3w2TyK/JrBriU/BETtOH41MGocnNrMYw/4IsYj2wAXb
         nZ6AdM+X3CUzlOeE5qemN4sgFqRbG/dlKnC7c6WWWmhllfDoRDl5T8JYusnEenIxo79J
         9nDUsekaNh4PHBNHB1tEzJh7i3F7Lgpleb6xYOx9i9KjnW0AJDxKkQ1sX10ygxIedv6C
         5khVvY3sU5o2aJfRsBHHCdRWvrBvFYQ2CBbtfSkT8zBswCTNdPP4CeQ8s8sO0lBZRESF
         zRlrouD1e9Y0bX13Uo1GKurkibdwJ81OAGlQ5D1ffT5ov4wKKDLgGmhmr3iYQ3Mx1bBN
         tBgQ==
X-Gm-Message-State: AJIora/uTX6lDMbusgmPbgWrdwFl0Pobs0muqDxYJsYabwN0yuNF/76x
        jUTcXOAzY/n/fiqeU4PJjCSOnA==
X-Google-Smtp-Source: AGRyM1tTn7DtmPOMMB8Ftu3ZrQuStfkpwldPqX63M2wVWQqfl+bhBR3Ly0in/NV3wLfdHb+lrvQP0g==
X-Received: by 2002:ac2:489c:0:b0:47f:6c54:7c56 with SMTP id x28-20020ac2489c000000b0047f6c547c56mr18196383lfc.529.1656951110018;
        Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:11:49 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Subject: [PATCH v3 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock provider
Date:   Mon,  4 Jul 2022 19:11:45 +0300
Message-Id: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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

The dt-bindings from this series depends on changes from [1] (part of
linux-next, but not of the msm-next yet).

[1]: https://patchwork.freedesktop.org/series/104836/

Changes since v2:
- Added minItems: 2 to clock-names property (Rob)
- Explicitly mentioned dependencies

Changes since v1:
- Also handle the xo clock (include it into the dtsi, use parent_data
  instead of parent_names). The patches were changed, so I didn't pick
  up the R-b tags.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells and XO clock
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI
    PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       | 15 ++++++++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  8 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 25 +++++++++++--------
 3 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.35.1

