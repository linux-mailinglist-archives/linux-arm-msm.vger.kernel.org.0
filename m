Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE803709D49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 19:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjESRFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 13:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjESRFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 13:05:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8980E5E
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f13bfe257aso3859115e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684515873; x=1687107873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyCk0vApwgTjSDnNJalnQpuOZFRhcWkh1QwJsnySKOM=;
        b=UCiwjQpZAb7h2+m74yvBcbnaJjMMk71654o+eJXLCcCoAAAyHpS8IKw6MZKlXjswI7
         bFimYZj3fLzGIzYmTQqJe90MIwdFGVgq1apjDOhzy5WlYb0hPglo/UW+SGYh9tQq2JYD
         rBoKOwJA+YhVk77gKDDg3s9VNhB0nSd8YlZFxYeJmFQGEfSJZVF0JAmFYTA1LMm6r1jh
         7xZMNgs8i/d7YgI7pnbqzD2uI5S55eDNoRd85vYstW/fRR9Gz/hdgu7ZxBJgwWsdk9O1
         XfU3sZb87LfHPhN/GpaB/k5O0heDpA192v0NVDtoMSBds0KhYwvBET+8tvvz1mDlF9VG
         dSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515873; x=1687107873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyCk0vApwgTjSDnNJalnQpuOZFRhcWkh1QwJsnySKOM=;
        b=LwunRW1muFDUnGU4X1ERQm4VwFBlwprHcxuwF1kOJz/EFxK2m2se0KuvCOJoL0IImf
         M8PHcwg2J3TiIUdnZ/aVPPxRqxyo3LDKo0PtWCQm3Yci174eebAm6I5itQuJUzWUFzOB
         RAA0KbT7NopTJA8j30gzXhxVsyT3TJXzcJsAJ5uMEiDhxR5V0XWFWVgx+UzYASW4YTD0
         LWLSXwUmJ7javeQeCZ/8NTTA542iryFD8xB6volQzGxJJcfK3kwYWC8HRjOiPeixsUMW
         UagzDtOW5SgpKoEOF37hExy/zLPSZWJ6Fg1rs1Z2kqDHTFa2aL+ZIoOd6+PsjwXXcV4Z
         4pzQ==
X-Gm-Message-State: AC+VfDytkgL3HMhrcZ/0BCqKZwcpTptdxQW82rspu8CHWLsUPlwHAqOL
        2JVGYtKiLJBQj3XeQ9KRM9NT/g==
X-Google-Smtp-Source: ACHHUZ6GN/bhuKL58gWHKLT8caJt3gK/qw3c4uByALl9Rr38+yLc8TfEMdWUpvlI9PbsNFjExvXbMA==
X-Received: by 2002:ac2:5991:0:b0:4f3:940d:abc with SMTP id w17-20020ac25991000000b004f3940d0abcmr990105lfn.0.1684515872768;
        Fri, 19 May 2023 10:04:32 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:04:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 00/12] SM63(50|75) DPU support
Date:   Fri, 19 May 2023 19:04:21 +0200
Message-Id: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWsZ2QC/42OTQ6CMBhEr2K6tqa0tIAr72GMKf2BL8GWtJVoC
 He3sNKVLGeSeW9mFE0AE9H5MKNgJojgXQ7l8YBUL11nMOicESWUkbIocPIjKBxTkJAG2Xnv7g8
 dI64tK5VUmhsqUF63MhrcBulUn/fuOQy5HIOx8Np011vOPcTkw3uzT3Rt/4smiglmwqoi6wSl/
 DKAk8GffOhW8T4A18ZWzHLS1OQbsL6a2M4nLIOamlVatIwXQv+AlmX5AExalZBeAQAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=3464;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OJOixfObYHwLGRqX2gUn7RkJYqZ/5XYM5lggdyuDZ3c=;
 b=NBF6rURP9V9hWT9FAmQRFPDpD3HTcWMrBMgvkE0668zPhldTa+nDSXAzr2Jzata3v8dbZmCbn
 Pg9s2UcwPaVCQnf4m1icu9NZZM9LaTxqXO/ivTRnw1WjmUJB2zNkq9t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v3 -> v4:
- Drop adding new QoS LUT entries
- Add safe_lut_tbl for both SoCs

Depends on:
- https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/

v3: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org

v2 -> v3:
- Don't duplicate qcm2290_lm_sblk
- Use DEFAULT_DPU_LINE_WIDTH defines
- Fix up sspp clk assignments for sm6350
- Add 6350-6375-common QoS data straight to the common file
  instead of moving it around after adding it
- Fix up iommu compatible order before adding new entries
- Reuse sm6350 msm_mdss_data for sm6375
- INTF_SC7180_MASK -> INTF_SC7280_MASK (enable HCTL) on 6375
- use double tabs in catalog headers
- remove one unused entry in 6350 dpu_qos_lut_entry
- add missing tear IRQs, drop INTF0 irq on 6375
- don't overduplicate DPU bindings, reuse 7180
- Pick up tags
- Rebase on INTF_TE v4 and next-20230504

Depends on:
- https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/

v2: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org

v1 -> v2:
- Rebase on the DPU catalog rework and INTF_TE
- Fix QSEED(3L/4) discrepancies
- Fixed DMA/cursor discrepancies for 6350
- No deduplication, that's gonna be handled in catalogrework 2:
  "the return of the catalogrework"
- Split MDSS & DPU binding additions
- Drop "Allow variable SSPP/INTF_BLK size", that got in w/ the rework
- Split MDSS and DPU additions
- Pick up Rob's acks

Depends on (and based on): https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org/T/#t

v1: https://lore.kernel.org/linux-arm-msm/20230211122656.1479141-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm: mdss: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6375 support
      iommu/arm-smmu-qcom: Sort the compatible list alphabetically
      iommu/arm-smmu-qcom: Add SM6375 DPU compatible
      iommu/arm-smmu-qcom: Add SM6350 DPU compatible

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 188 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
 11 files changed, 821 insertions(+), 3 deletions(-)
---
base-commit: c437aff71b13c5ca77821ec1bab98ca7e18716d0
change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

