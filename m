Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0257AE281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 01:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjIYXhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 19:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjIYXhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 19:37:13 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02B810C;
        Mon, 25 Sep 2023 16:37:06 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59bf1dde73fso96830627b3.3;
        Mon, 25 Sep 2023 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695685026; x=1696289826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XusWQaiVLnnypr9tEOMeBvsSPZlhaNXNSC6Pr95vupU=;
        b=CkPq1iYn+CYUWWBcQM8DKFZiD8n1O08Pl6TyG6l7ZnBuf8W1B/5c9GMgy8/W2Pdorh
         0eM0fMQ2fCI0cwKb9oAm5C7lzUXRZOZLlCDKFFdXoieDgTKw270ZfRzSRymxP9zdRNQM
         +EdHJ2b5VHZOg+2o4wGh912AsTRKukf1MuLO7B53cERdlYEpaTqZImIUAiC8CPLL09+G
         LymAf4w9a3zR3RG1LW53irIRPiymfqnXdVlurwivCwpgZe9ktzWi45PFbzmwoEBGLfbq
         jxxT5gE67fDUqbmN38HS/S6D0afRgV/GteCGniESiDPdCShjm1xtmzTeVxECnS2pQ0zE
         8SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695685026; x=1696289826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XusWQaiVLnnypr9tEOMeBvsSPZlhaNXNSC6Pr95vupU=;
        b=PynQTAapXbMtJ9Fy8qyQGeWFivs9ndbDNo5/lsjpeH+0l7ugt2NoQIYMGC3yzlQI3Q
         Siix++YX8YO041n92xTRAm4GrNxF0JXJrMkb8m8tgR2csOFIi9ko+hh1BGJLcaCDMjIJ
         juIdcb6drSSRLDTVCj6WgS9Vmc3LGw1HJYpeuOo5buZJBIMrzoRWapbIuKvxxJYqHS4Z
         HCW5gmABjNrHTTZTtHtUkcgewydsDx1qgcTH43iRGEtg2pERB42IF8YycVbB08gzKanJ
         HnLin7vr6IG8x6Raf4HV0ftRPQmbhbApF7wBUqKVWE40Gusrwt8bhOgdsib/rS0ebRHz
         16mg==
X-Gm-Message-State: AOJu0Yw274/sD4BYaNRcSOu6dZWrG6dPe8jvrEtDMMnjooYPDINon+Se
        43mK1Oo/o0cyrsg5boBFick=
X-Google-Smtp-Source: AGHT+IGWYEcfZBHT8tIWl1aa1+4+LVlzd5+IjI30XfF1jhF0OnlyzN7cwbBtYzp2chrfmVlAzzzZ5g==
X-Received: by 2002:a0d:c381:0:b0:592:9035:834f with SMTP id f123-20020a0dc381000000b005929035834fmr8800286ywd.34.1695685026161;
        Mon, 25 Sep 2023 16:37:06 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id e11-20020a81690b000000b0059b20231f1dsm2699161ywc.121.2023.09.25.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:37:05 -0700 (PDT)
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
Subject: [PATCH 0/6] SDM670 display subsystem support
Date:   Mon, 25 Sep 2023 19:26:27 -0400
Message-ID: <20230925232625.846666-9-mailingradian@gmail.com>
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
 .../display/msm/qcom,sdm670-mdss.yaml         | 280 +++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 294 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 105 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 698 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

