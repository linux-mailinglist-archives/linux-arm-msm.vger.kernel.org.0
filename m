Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15603542FD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbiFHMHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238653AbiFHMHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A7F1207F6
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a29so4389271lfk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHJ84TvATipBDD8bX8DKVRbAMxK57cbNX0Qh0OSz2u4=;
        b=p6sUTGw1Hbrk+FTOYNKUsrbBHLd1vviISuy2ymTJwJ2qaErzIhLpNC2ahvsUQXzYck
         lIUrtgE6eQksSaKS5txREoyveTcvE7qormHK1L1ZhmBgOkRGP7fFCgHiafjzTHxR4UVO
         ofcSHAz4Dl61mJ/Pr9VU9usdQWVyB+AuScfCqT+jYBNUddBww/4XwO6KbYQETYAWNm21
         sn3OCd1ETBZm+sGIlOmTNd1EELu0gq6UTXu65MmUvblA+Xi/nBn79ex9NJtC4yUnktTJ
         t/PO+maBOwGD6M6l1yrFsMEdH86UTuQ+dmcoLh4SBnmBI4NrbYrTkjSpPZKJ8TDR2fB5
         +zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHJ84TvATipBDD8bX8DKVRbAMxK57cbNX0Qh0OSz2u4=;
        b=VdaD9Q5HDbk3H4iWvqW/vtIdzT1ORq+QgZAnO5ViGpe8xFNH38u+7SsPq3deMBpfGD
         0WvggwDjmxdIdAPsUKvCyG+4w7A8DrNhv7HDENcETPw3xkJqGQT7OgLxj2GnIIMiYci0
         iFu7Q8X51ufV4dsqCf4ZL2qLKR8Y3MARV/eIB/w2NT53deFrAf1zDIgMMmWSCPZfjMLS
         8GYg1gVdLgJoOiRTXMN/yhM+9ck8mnARGvJF0GkVOlwEe0aJevkPVO8APix6EVnuvsBp
         zXK7QmlfpC2gns/bzQbneYDL8gSBbu0DUcyAvcTFr8bnlC/LsASFyLbqbe6QkFLan6rE
         r+Lg==
X-Gm-Message-State: AOAM533dCi60E5uB3hc4P0VmPOmzM8LeDdeCJVX+i0gRV2sfwqj5PdOw
        uW5M2bVa7nc6UFfvpR8smcWvnQ==
X-Google-Smtp-Source: ABdhPJx81PXvshf1eliVIiEm3C5RGBqIuZcu0SRNR44xkx0s4ZOpmtlVMIYi/PKJGj2uvv6cQyo72w==
X-Received: by 2002:a19:4f1e:0:b0:479:278:8d24 with SMTP id d30-20020a194f1e000000b0047902788d24mr21280946lfb.370.1654690045070;
        Wed, 08 Jun 2022 05:07:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:24 -0700 (PDT)
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
Subject: [PATCH v2 00/12] drm/msm/hdmi: YAML-ify schema and cleanup some platform properties
Date:   Wed,  8 Jun 2022 15:07:11 +0300
Message-Id: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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

As agreed with David, this is a continuation of his work started at [1].
I didn't pick up his R-b tag for the first patch, since patch has been
heavily modified.

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

Changes since his patches:
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


Dmitry Baryshkov (12):
  dt-bindings: display/msm: hdmi: split and convert to yaml
  dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
  dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
  arm: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
  drm/msm/hdmi: drop the hdmi-mux support
  drm/msm/hdmi: drop unused GPIO support
  drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
  drm/msm/hdmi: drop empty 'none' regulator lists
  drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
  drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
  drm/msm/hdmi: reuse MSM8960's config for MSM8660
  drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements

 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../devicetree/bindings/display/msm/hdmi.yaml | 234 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  83 +++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               | 104 ++------
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  13 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  62 +----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      |  12 +
 9 files changed, 454 insertions(+), 257 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

-- 
2.35.1

