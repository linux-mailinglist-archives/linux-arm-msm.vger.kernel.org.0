Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C911A7CB846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 04:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQCSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 22:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJQCSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 22:18:48 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED6CA1;
        Mon, 16 Oct 2023 19:18:46 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d093265dfso33741446d6.3;
        Mon, 16 Oct 2023 19:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509125; x=1698113925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au8EOE9+FRX6HvHTMGueg6NHALIY7M3L0ggSoJVnPyk=;
        b=guAVDAK1HTlEU0ge9lhV2k2n5923OK3L3j4PvysiQumuH4LQsVRwniHeaLtTNjcOHl
         s4CpU4rwMNYm8DFpWCcoW0pOngzsoqNoeQE7XwPV6RHOEv/9CCpTW/iHjenBlJc818JF
         wF1tQ6S7oULhAOj8giLyeJ90Xa/f0N6u83XIkLjjp6kRMPnJVRGrpP2i2NA8VupAWBPP
         cFstwn6j10Kh3KdmymEis/rvlvQCwzK2830Y+94i4LWNBDDgo6RrdZbRzmO9XEF6wKpW
         bLOAV/xpgFacqA5/JFBVIW/uEz57hvbVQpcZvtZsTqjAeRut9+NhhaotWrYZAfrhP7NH
         OKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509125; x=1698113925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au8EOE9+FRX6HvHTMGueg6NHALIY7M3L0ggSoJVnPyk=;
        b=ebj8EqIFfNkOCZSmIlFHkjbtveGelslstNKKoYWXqg7emlASOXK65oQuYK4aIwWewY
         BB7v5+gQJ+Rr6XCP3wMyp0ZNN6/CD/MWKcKtIU/Uhks5tVPLT5nfqidWcv1uv0HAgRc5
         94ZBHGSeBN3KUH//IZ+2mb9iPvOkXhANZp8sVTeJgUaDSKXIoILSVL1w7qD6pCKWRimw
         A7MBDEDEeCY63TKpUWhRRZ8rcdglavXO5hyAJhMGOqhiU1+92hVb1ODOMwkG3GL3D/ej
         o1e1MD/Zyy4qZzwqsIp8mZDoONf+be1VFu4Boiaea6ga7fjiH0dXfkoRJPgzlVrxhd0F
         xoCQ==
X-Gm-Message-State: AOJu0Yy5qkXEhwiW3+hZ4Z2e2sLSkqspgzOQY0Xpc02E78fE7p2SYcBC
        9qwef89yXb8bFAIz7yxX/jY=
X-Google-Smtp-Source: AGHT+IFtEsvhkbeh2ULNCZoN5G/wwOiM7w7Uq65N4uCwO3yxCz4P6/Cu3d6wi5VaXVRjxt/MLombLw==
X-Received: by 2002:a05:6214:2467:b0:66d:1215:4470 with SMTP id im7-20020a056214246700b0066d12154470mr1309232qvb.44.1697509125562;
        Mon, 16 Oct 2023 19:18:45 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id d24-20020a05620a137800b00770f2a690a8sm255814qkl.53.2023.10.16.19.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:18:44 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/6] SDM670 display subsystem support
Date:   Mon, 16 Oct 2023 22:18:07 -0400
Message-ID: <20231017021805.1083350-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
 - move status properties down (review tag retained) (6/6)
 - accumulate review tag (3/6)

Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
 - rebase on series and reference generic sblk definitions (5/6)
 - add interconnects properties in example (3/6)
 - remove phy-names properties from dtsi (6/6)
 - accumulate review tags (4/6, 6/6)

Changes since v1 (20230925232625.846666-9-mailingradian@gmail.com):
 - prefix dsi1 labels with `mdss_` in example dts (3/6)
 - make all parts of catalog entry const (5/6)
 - add spaces before closing brackets on same line (5/6)
 - join opening and closing braces on the same line in dsc array (5/6)

This series adds support for the display subsystem on the Snapdragon
670. It is based on an earlier patch a few versions back, which had
missing device tree bindings and device tree changes.

There is a separate IOMMU patch which adds the MDSS compatible to a
workaround.

This series depends on https://patchwork.freedesktop.org/series/119804/.

Richard Acayan (6):
  dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
  dt-bindings: display/msm: sdm845-dpu: Describe SDM670
  dt-bindings: display: msm: Add SDM670 MDSS
  drm/msm: mdss: add support for SDM670
  drm/msm/dpu: Add hw revision 4.1 (SDM670)
  arm64: dts: qcom: sdm670: add display subsystem

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../display/msm/qcom,sdm670-mdss.yaml         | 292 ++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 292 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 702 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

