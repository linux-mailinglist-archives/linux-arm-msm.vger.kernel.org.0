Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A3056CE26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiGJJAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiGJJAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC1D11A18
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bf9so4237554lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmPlNJYlds990eGPZZtGigUJJE0SVYVhnQt/Wb6B8Mc=;
        b=FPZicn1DZ5+gTje17L/Vq3qcWwhGz8tezM3C/kEtObpX3VS3Y98qACs7Ssor1aDwld
         cHib2+ryqe07jsKKo+BZIi5paWQ8LVg6qFuSrSDugkEyeBozMreKAUflFqGL0ZmHPEli
         sP1gZqACUH8mnl2nt5zLduzhK/muD9zZNCEU51wX7PLcNZ+qplgVgHvNw6LABKorG7o1
         lxGwNv2XU7FIN8DCEfDf5kUcCvF0BeWJvA3KltJvj3W3dsBx11Jlo/dapMQhIK0nzlf6
         8iLg+lrct8QfZBomTKGuNdmA/jGljo9oxoe4Ei9AKJsHFX0JgiWVb9Jol9lWufr1cSVW
         Nn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmPlNJYlds990eGPZZtGigUJJE0SVYVhnQt/Wb6B8Mc=;
        b=u2d+/TVnUMgiWmuwzVzoYJzdvKxC45aeeRfCpzxNwX1r9wMmEKULebzbUFuDED/QVh
         lfe/HP4fSAdn7Sz0IJdcoyfuv7iIYXhyg9MXiBr2SI/aw/POrlUlKIEQg0ZZ/FTe6zxh
         /60BOs5Vp7zkguvNu1eKzCewW0i3eSAbE8FYttAQEII7sroYiuXaNumEnZhxU+gT0kel
         12MV8vZEjcDbb8/FDbm4dhCTxj7tMRBGi08R1DwP7dfTkw8NmCw6TykTmtds70ztD3ul
         AJFGAW5tQCsXKbA0xwC5kc2BOVZXn2uvmj4TRL5Ceamc05jHoYKP2hfBSUWa2MfZp17J
         UWUA==
X-Gm-Message-State: AJIora/ArBeJ6V/bIQMMlpxLRjfB61rqW9s9HPcTXuJOtF5j3j1aeuMk
        jSmSmzgAdmoluJ2m7wKAIVJcvg==
X-Google-Smtp-Source: AGRyM1tU5awrMCxLyw28G+pMddt1hY+A/nRMM+84fPixR6hmuIsmOXY3ZQBqKPD9Xyu27uGmJpJRpQ==
X-Received: by 2002:a05:6512:39c2:b0:489:dca6:a23b with SMTP id k2-20020a05651239c200b00489dca6a23bmr263157lfu.633.1657443641120;
        Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 00/11] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Sun, 10 Jul 2022 12:00:29 +0300
Message-Id: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards.

Changes since v1:
 - Renamed DPU device nodes from mdp@ to display-controller@
 - Described removal of mistakenly mentioned "lut" clock
 - Switched mdss.yaml to use $ref instead of fixing compatible strings
 - Dropped mdp-opp-table description (renamed by Krzysztof in his
   patchset)
 - Reworked DPU's ports definitions. Dropped description of individual
   ports, left only /ports $ref and description in dpu-common.yaml.

Dmitry Baryshkov (11):
  arm64: dts: qcom: sdm845: rename DPU device node
  arm64: dts: qcom: sc7180: rename DPU device node
  arm64: dts: qcom: sm8250: rename DPU device node
  dt-bindings: display/msm: split qcom, mdss bindings
  dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
  dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml

 .../bindings/display/msm/dpu-common.yaml      |  42 ++
 .../bindings/display/msm/dpu-msm8998.yaml     | 139 +------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 143 +------
 .../bindings/display/msm/dpu-sc7180.yaml      | 148 +------
 .../bindings/display/msm/dpu-sc7280.yaml      | 147 +------
 .../bindings/display/msm/dpu-sdm845.yaml      | 139 +------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../devicetree/bindings/display/msm/mdss.yaml | 361 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   2 +-
 11 files changed, 508 insertions(+), 647 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

