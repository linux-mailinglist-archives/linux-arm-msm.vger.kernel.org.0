Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF07544BAD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245150AbiFIMX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbiFIMXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:23:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730BC2F395
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:23:53 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c2so18291829lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zd34kREa0n00H398I8o2YhXQla1j3aeJKt50d9fLvpQ=;
        b=a9GC6/AhrnYGFqHxrVH0bfIEVxyfwQBfJxpCnNS8YjK467zxQBT4yZTfTSntHLIAng
         QYi+ajizkgGnyx0L9wAOewRZtUf+uxC8vEiClZaW2xtNbro5e5opB2WwmKca3ShcHzLY
         ceR/O2a9U3d953WuKHVJnrt+INC+KfwRSlGC66H3xS0fgNOFRSG8Ftqq/oSZW59NlSg6
         YVs8i9F0pfwFEwbPi/oGIWpPhPJ3+MnXPZSFG0P++PAqhNnwkZKnSKhAP03s6VkOuPNU
         ViOgAhJT9Sfuq/cFQ8lysnt6GxmpSv/Vhtu25ivjGCGlz7eot/B4OZHTYugO2r19WNwt
         Godw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zd34kREa0n00H398I8o2YhXQla1j3aeJKt50d9fLvpQ=;
        b=N3tI3NbvskM/7LYPVY1bg1MutuZbPVVKDeXQZnWWTYf+QtLMuzIrYnLpdj7vGe+5ut
         wrFUayhxr03UrEuwskSZGvCVZPATq52SqSozPOcAFKg6NGaYq/MSTmhlK5vHpxfm3TPc
         /iyQzumJV8By5X8oYfLiXD7pSAJkkhFNuqlU45DC2tQ/8Yxf7mcBj80+ZG7+OcCY/XqC
         9vhC751a7dHYL9m0dND7YvLD54z+YxCj+mgezEIV0C/vCWg2snLrd722fXJIwmMZHGkd
         oBStwHQF+h4EsiDsGkL0MFSDkO415wn0FDp3AJXvGkamtXngF0UpBnHMjsSQeTIz1ENx
         /BTA==
X-Gm-Message-State: AOAM53341YXJAv4wqeuYat9unnQ1Go4z1e/rU86oVNGdFhe3EJ4tFQxA
        5q7qMOd6pnnE8+TNAJOU38ujFg==
X-Google-Smtp-Source: ABdhPJyxqJwN1fJVc3vG+X2bWsbFDHRVBc9p4ES3Hjxr0Pn1co0TJLZTo0YqlK6Z6CtHpmd8TDH7nA==
X-Received: by 2002:ac2:5e37:0:b0:478:f418:a2a9 with SMTP id o23-20020ac25e37000000b00478f418a2a9mr31156071lfg.281.1654777431709;
        Thu, 09 Jun 2022 05:23:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:23:51 -0700 (PDT)
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
Subject: [PATCH v3 00/14] drm/msm/hdmi: YAML-ify schema and cleanup some platform properties
Date:   Thu,  9 Jun 2022 15:23:36 +0300
Message-Id: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As agreed with David, this is a continuation of his work started at [1].

Changes since v2:
- Deprecated usage of phy-names for HDMI node, added two patches to
  remove this property from DT files,
- Fixed the uninitialized variable access in hpd_gpio code.

Changes since v1:
- Dropped quotes in $id/$schema
- Sorted out compat strings alphabetically
- Removed obvious descriptions
- Removed undocumented qcom,hdmi-tx-ddc-* properties
- Switched to additionalProperties
- Fixed IRQ and GPIO flags in the schema example
- Added 8084 and 8660 variants to qcom,hdmi-phy-other.yaml conditional

- Marked hdmi-mux-supply as deprecated (and dropped it from
  apq8064-ifc6410.dtsi)
- Reused 8960 regulator/clock configs for 8x60 (verified against msm-3.4
  kernel)

Changes since David's patches:
HDMI schema:
- Dropped generic pinctrl properties
- Dropped data-lanes property, which is not supported by the HDMI driver
- Switched to unevaluatedProperties
- Moved clocks/regulators/supplies to condition clauses
- Specified phy-names as used by existing DT files
- Dropped #phy-cells
- Dropped power-domains property (which is not used by the device trees)
- Marked old GPIO properties as deprecated (in a separate patch)

HDMI PHY schema:
- Split into QMP (msm8996) and non-QMP (other) PHY schemas
- Added proper clocks/clock-names/reg/reg-names descriptions

The rest of the patches consist of the new work. They further cleanup
the platform configs, remove unused supplies, etc.

[1]: https://patchwork.freedesktop.org/series/98353/

Dmitry Baryshkov (14):
  dt-bindings: display/msm: hdmi: split and convert to yaml
  dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
  dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
  ARM: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
  drm/msm/hdmi: drop the hdmi-mux support
  drm/msm/hdmi: drop unused GPIO support
  drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
  drm/msm/hdmi: drop empty 'none' regulator lists
  drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
  drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
  drm/msm/hdmi: reuse MSM8960's config for MSM8660
  drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
  ARM: dts: qcom: apq8064: drop phy-names from HDMI device node
  arm64: dts: qcom: msm8996: drop phy-names from HDMI device node

 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../devicetree/bindings/display/msm/hdmi.yaml | 232 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 104 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  85 +++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |   1 -
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               | 109 ++------
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  13 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  62 +----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      |  12 +
 11 files changed, 459 insertions(+), 260 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
prerequisite-patch-id: 89e074537a1d17a955ba626431104040577c0bec
-- 
2.35.1

