Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54715E8C6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiIXMgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiIXMgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:16 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85394EB12C
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so2786033ljq.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=toQc53WkbQPwQ5JPZfHZW/Yh1kfv2FG1kx31QTZ8l38=;
        b=F0etvVAPhhy4qaOyep2aCB2lnXOqY61OK/wIBS4SQqP9eXIGB6EXKLLYeYit7rLcTD
         HkThc/UXR0NJbA6IehH490uYedaFXRqMJvbgLm/KY5cNa6jE1fSWyujGtZKA7f5UJXAs
         HnGxs+Ea++aJVUrp0ZpFO1JT8WJHqtkprHJWxBDHVp4y/heKnhrHULA3D/ZJ+8uGcre6
         S7JUSNyXOFmO33+K5W8KApsFBrL6YHEvVrFsDE1i5mjXx+fN8dE4BwFNF29+sLmLxuTr
         gmLXGnzsG7HOVBIaRHX/1m5DExICNtJKaqT6uUd0OM69b1RKGZk8MEuNE2D17CBEiUmN
         dnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=toQc53WkbQPwQ5JPZfHZW/Yh1kfv2FG1kx31QTZ8l38=;
        b=49KJG/9iDEqYUbi2mfX8rml18jWCEYHSxJDfG0XhVDop1GJfjiYTeMBbuxLeFC5uu2
         bRhs5QKlqQN8eMOvVRRk/Fe9G1TS6gjIoQRt26vXTcn/8RP7ICNsubJMFSiYVV9OGhoM
         jv2jqGTtu6LvsYx13SrBxBzHKwBRDN7m7mrE6MZU2WtQK03Z5nYC2EMWBMw9j6a0rtci
         XUGh2MaQXQDbVzsQYoaTcn26Jf3vtdLwpNpJ8jfjIrhOPtY3hmV1U6ObsK2D0TZmL1wo
         XgQYvvNfgXrso+e8U545uajWK2Q1wVvWumsBB8F0MbHAgQE/+WEYAdEiHsUatxPEUn16
         gkQA==
X-Gm-Message-State: ACrzQf1dXxZ1ceXrCiqW/ln710iRhLSjeQe1nFCZrEuv1puKEozKb7ck
        7nTH8wGlfXCU/crIUMhkRAa0KA==
X-Google-Smtp-Source: AMsMyM7pCvd5VAOJ792sod6xBHPzInrhT0fAsld3E93XqlhuuWm9erDmpBSpQl3wP2nefc589K7mVA==
X-Received: by 2002:a05:651c:1a24:b0:26c:3220:3762 with SMTP id by36-20020a05651c1a2400b0026c32203762mr4864664ljb.457.1664022972889;
        Sat, 24 Sep 2022 05:36:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v8 00/12] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Sat, 24 Sep 2022 15:35:59 +0300
Message-Id: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards. Add schema for the MDSS and DPU on sm8250 platform.

Soft dependency on [1] to define qcom,dsi-phy-14nm-2290 binding used in
examples

[1] https://lore.kernel.org/linux-arm-msm/20220924121900.222711-1-dmitry.baryshkov@linaro.org/

Changes since v7:
 - Expanded examples to include MDSS child nodes (Krzysztof)

Changes since v6:
 - Removed extra newlines (Krzysztof)
 - Added $ref to dpu-common.yaml#/ports/port@foo to enforce schema
   for the port nodes (Rob)
 - Removed unused allOf's (Rob)
 - Fixed repeated interconnects descriptions (Rob)
 - Fixed dpu-common.yaml and mdss-common.yaml descriptions (Rob)
 - Fixed intentation of examples (Krzysztof)
 - Renamed MDSS and DPU schema to follow compat names (Rob)

Changes since v5:
 - Dropped the core clock from mdss.yaml. It will be handled in a
   separate patchset together with adding the clock itself.
 - Fixed a typo in two commit subjects (mdm -> msm).

Changes since v4:
 - Created separate mdss-common.yaml
 - Rather than squashing everything into mdss.yaml, create individual
   schema files for MDSS devices.

Changes since v3:
 - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
   depending on the mdss compatible string.
 - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml

Changes since v2:
 - Added a patch to allow opp-table under the dpu* nodes.
 - Removed the c&p issue which allowed the @0 nodes under the MDSS
   device node.

Changes since v1:
 - Renamed DPU device nodes from mdp@ to display-controller@
 - Described removal of mistakenly mentioned "lut" clock
 - Switched mdss.yaml to use $ref instead of fixing compatible strings
 - Dropped mdp-opp-table description (renamed by Krzysztof in his
   patchset)
 - Reworked DPU's ports definitions. Dropped description of individual
   ports, left only /ports $ref and description in dpu-common.yaml.

Dmitry Baryshkov (12):
  dt-bindings: display/msm: split qcom,mdss bindings
  dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: add interconnects property to
    qcom,mdss-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml
  dt-bindings: display/msm: move common MDSS properties to
    mdss-common.yaml
  dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
  dt-bindings: display/msm: add missing device nodes to mdss-* schemas
  dt-bindings: display/msm: add support for the display on SM8250

 .../bindings/display/msm/dpu-common.yaml      |  52 +++
 .../bindings/display/msm/dpu-msm8998.yaml     | 223 ---------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 222 ---------
 .../bindings/display/msm/dpu-sc7180.yaml      | 235 ----------
 .../bindings/display/msm/dpu-sc7280.yaml      | 239 ----------
 .../bindings/display/msm/dpu-sdm845.yaml      | 217 ---------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../bindings/display/msm/mdss-common.yaml     |  83 ++++
 .../bindings/display/msm/qcom,mdss.yaml       | 264 +++++++++++
 .../display/msm/qcom,msm8998-dpu.yaml         |  95 ++++
 .../display/msm/qcom,msm8998-mdss.yaml        | 268 +++++++++++
 .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++
 .../display/msm/qcom,qcm2290-mdss.yaml        | 198 ++++++++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 ++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 304 +++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 ++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 422 ++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 ++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 270 +++++++++++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 ++++
 .../display/msm/qcom,sm8250-mdss.yaml         | 330 ++++++++++++++
 21 files changed, 2746 insertions(+), 1165 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml

-- 
2.35.1

