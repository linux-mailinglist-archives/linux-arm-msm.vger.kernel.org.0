Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E8154195F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350524AbiFGVVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380966AbiFGVRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:12 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FC21B75AB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l18so12932454lje.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/W9jGpIH/OL56+uBhFnE9P3noAAOQAr28i57rZ4o8JQ=;
        b=Fx68vBqv45589Im4IvB0H8RQ6BqBh+sZp72BRgAEYLdJUHRr5zV3uUKQXxAjSGUa6q
         TCRiIPrfiGlbN9VT3oaxlxkAEPik61ghm4YmrJEiPPrnU6kFTxxb+LhB2c2O8iujSbpZ
         vYa0IXYWBue7/PqO70VJ2VbjW+HXeMZIspILfuL/mUL0wG5E+krhe8/YDsfxiZe5D8+k
         qCMIHa60w5zUFT9WMf2LTRvvMJrH4MU7NV8zhsJT1ffDSPXHA54XjHcBlj8S0T94Bb3G
         fkQdrK5t0CnollXZ7RGFXTbvnyOPE2iMS5kBvNZWKmI7LkrPYHWDCqkJTfc7KvdS2Ilt
         fesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/W9jGpIH/OL56+uBhFnE9P3noAAOQAr28i57rZ4o8JQ=;
        b=OkwuvvWM+7Ct3GX/7wrdhyN6ZJB+b2Dr5UtMUIh0/XvqtwKMF30V5Cptq0sZ7s+7S2
         6kOvkANDjafMlGpCxD3no/5TONo+nd27AJ5+svg8fV1Eg+eAq8RipbakyqiPG+ebgJAt
         fCtUj5qHoVdT9wqcrTcLnVcKeqZbObCnd+aktBP8llpNUlO2EvWmQjpoPidixc1eFi8G
         Rv1v3qRdq2YutsEvo1ViEK5FOozXN2SmKAJTOcgqVBk5142DIXGA+6DR33VB0VpWBqhT
         NX6U7Bt79iQJQtm6p3Ltk90HvSCj+HUaavPOj0q7YqrgVpE/r7ic9o6Y5u1hIOv/arMX
         /MDw==
X-Gm-Message-State: AOAM531D+w9cO8MbV0WByTRWxB+GGbELSTS1Ckg9VuALkYWdzrVd18Yp
        wYD65QjPR0npvXaixu/CJCE4gTi1VG4Idl0uqn/xbw==
X-Google-Smtp-Source: ABdhPJzLmOS1+/guV5q204SUkhFztXDSFtNTawl/bLE9lR2G+hjpUayf3IPB1mxKvThg6bhdHx7edw==
X-Received: by 2002:a05:651c:1a10:b0:255:9422:a7c6 with SMTP id by16-20020a05651c1a1000b002559422a7c6mr7959383ljb.328.1654628287555;
        Tue, 07 Jun 2022 11:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:07 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 0/7] drm/msm/hdmi: YAML-ify schema and cleanup some platform properties
Date:   Tue,  7 Jun 2022 21:57:59 +0300
Message-Id: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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

As agreed with David, this is a continuation of his work started at [1].

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

Dmitry Baryshkov (7):
  dt-bindings: display/msm: hdmi: split and convert to yaml
  dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
  drm/msm/hdmi: drop unused GPIO support
  drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
  drm/msm/hdmi: drop empty 'none' regulator lists
  drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
  drm/msm/hdmi: merge platform config for 8974/8084/8994/8996

 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../bindings/display/msm/qcom,hdmi.yaml       | 240 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  84 ++++++
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  98 +------
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  13 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  62 +----
 7 files changed, 447 insertions(+), 252 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

-- 
2.35.1

