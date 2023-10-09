Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08FA7BEF29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 01:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379075AbjJIXeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 19:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379080AbjJIXeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 19:34:01 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D365B4;
        Mon,  9 Oct 2023 16:33:59 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7b3828115bcso1497899241.1;
        Mon, 09 Oct 2023 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696894438; x=1697499238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24TAuM3cmLFZcuAvvlbYcV7E7zxrlJcR+LOIybCTopM=;
        b=GrJuVW3fdlSx9STO/Kf1UYK4g1YxirFE2IkHHmmrlCBvY11tHhakyZti1StXsbgyQk
         5wOvr9NJ57Ved6kUgOjlf1jhL6YVFwOyMgZfsSvLouMIgJdGy+KkIq5+USpsyYZbc7lR
         UPwA0SkpLdwk0h9sniDKUR2ZOXaQb9UkO1XG83T/m9uxiwo51lcZEE84QqxWYHhPF6Pb
         aKej5MCLd+YSykblDAa2ugN3hl0TPBcpwdTLK/vBDNrJokkh8tcbUupaEsTuMTp6oZUJ
         eCxcN88rKlwPU2YBKPIYiaZzn3sZvfJLgRZwZXhKf3l7neqJW7EO7be+PBhaVSzPQ1wz
         DAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696894438; x=1697499238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24TAuM3cmLFZcuAvvlbYcV7E7zxrlJcR+LOIybCTopM=;
        b=UYs0Jo8voFKuhEzsFtcgh1vFlk0DpK07ZyhGzmpr8JjUgApV8nLeIy0xEfen2HNmx8
         eB/87xRD4SQTFHyPBYhbN37y4IkyhbJebneOX/0xQagAl2nzDuGZgVkD8hJlJXSXVucf
         QivdmVbKhnQYLYoEYksDVzVVz0OkiZl+RYOQYtx/JjoT2Yseufyr8/LteyGcBCG+mu5v
         VuJli86iJMFPr2ENVEAX5MThnImaYHIiTgjzPw9MuRsCcX03RkIvNUka+NWB2inAeFwp
         6eYJjU7V6Qn6tFVKKWUd3SEVHPv2LVeIM9JHeV31F+RntD5LtjpM1eOIPf4tcO8htwU0
         eBYg==
X-Gm-Message-State: AOJu0Yxp2r7pI68h8JnIsJxYU/qUIZ2ePpxm8wjaNyr8uD/HExAR+LBx
        dScUB5fZj7/kYVWbZBbKqEo=
X-Google-Smtp-Source: AGHT+IG4nZoYJfg9tcP7e2IgjNp0p7tfVw76OSdCMUhH2QkyRSVgv8kkdhMc105Ag9fnC3Hkn+8wNA==
X-Received: by 2002:a67:eacf:0:b0:44d:47c2:7471 with SMTP id s15-20020a67eacf000000b0044d47c27471mr13340465vso.27.1696894438567;
        Mon, 09 Oct 2023 16:33:58 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id l19-20020a0ce513000000b006616fbcc077sm4289486qvm.129.2023.10.09.16.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 16:33:57 -0700 (PDT)
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
Subject: [PATCH v3 0/6] SDM670 display subsystem support
Date:   Mon,  9 Oct 2023 19:33:38 -0400
Message-ID: <20231009233337.485054-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

