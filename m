Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3267B5E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 03:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238922AbjJCBVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 21:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjJCBVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 21:21:44 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26067C4;
        Mon,  2 Oct 2023 18:21:40 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-668ebbcc0b6so2707086d6.0;
        Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696296099; x=1696900899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vhZi82yU9f+9I66zAblRTPICxvjbQ5OMGMGyPzNQBM=;
        b=Ezn40nHSBv8AF+E6zifgdvEkyQR+eJ1SwpW8K6utzqzqOZB1Lwno7kI1dPt2POb/Xt
         CjFQHCHmI4JNjpy1aUVpu/HOvZGKmuM8Xgh6PYZX8OJiklllkEZHFilYFeGl+UTLNN8X
         gm9wlYJUkn5F1y+K4PTg9uaC+5MZpaES+Gr7L17m6C8hXwe6tHbjtlUVOcUNCqKkLYA+
         dN1i1kSSee8xZAnKQ4JiQGYq+eIGkyjKRg9SnHAVSsrF3/+FHojaHo5ViXnqaEBmIiZV
         XlS/OaRuI/E/3wMG/z5PFklDEembBK2duIoMalBbVxipJPhUmiDPVu/oelHu0r4IvvDO
         yTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696296099; x=1696900899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vhZi82yU9f+9I66zAblRTPICxvjbQ5OMGMGyPzNQBM=;
        b=sjyfkFkSG8iKFQS8aghklPJT/dUHUUTW7Vmyf+LIdDkh/rJ1tR1uPmE+c/uoJwUkO1
         mzEC54lsFbvYucgu5rOkgp+CHZ4DxRnfwCgOeoA18BzJPwBrwPuwFz7YkDqlcpNuKx5i
         qC4cvmz3d8+CaM661IAikepW9IwZ8SykITRqEf4hBxfjBRziaOfXLfw0mRtFaAjEofgs
         0yve8m+ejeL9wUJ5YPWrUoAjkIdJ2h9oDkzXYFWUIpN2adg2m4juERe+CxSD8RRg6HMu
         gExyPotvv0l8g4dzNwxdATEK/jqv6k3CNI0TU+J6O2qliVmU5Q2CqjheMCbZQCXpEipH
         fp9g==
X-Gm-Message-State: AOJu0Yyhl589NG7Pmzc8J9c2DApnmrzfnHmlGb6k6jNa+MIz+oxngR50
        0iHV8+GspoFN88+4ilyF/Tg=
X-Google-Smtp-Source: AGHT+IGkrxlOmVZRgiW1JdvxZW/v1DIl0xUWG2ue6i5gqYguwaGs+Oc5zoGwPn1UiqL60jwhHSP3tw==
X-Received: by 2002:a0c:e30b:0:b0:65b:229e:cb8a with SMTP id s11-20020a0ce30b000000b0065b229ecb8amr12256754qvl.44.1696296098801;
        Mon, 02 Oct 2023 18:21:38 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id j15-20020a0ce00f000000b0063d038df3f3sm56569qvk.52.2023.10.02.18.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:21:38 -0700 (PDT)
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
Subject: [PATCH v2 0/6] SDM670 display subsystem support
Date:   Mon,  2 Oct 2023 21:21:21 -0400
Message-ID: <20231003012119.857198-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Richard Acayan (6):
  dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
  dt-bindings: display/msm: sdm845-dpu: Describe SDM670
  dt-bindings: display: msm: Add SDM670 MDSS
  drm/msm: mdss: add support for SDM670
  drm/msm/dpu: Add hw revision 4.1 (SDM670)
  arm64: dts: qcom: sdm670: add display subsystem

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../display/msm/qcom,sdm670-mdss.yaml         | 287 +++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 294 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 704 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

