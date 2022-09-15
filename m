Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648DE5B9BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 15:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiIONhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 09:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIONhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 09:37:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063C559246
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so6412963lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=lrd6VnfqJApSJppb6xI303k0JwHHmOYhEyNS4XGWRFA=;
        b=KoTHBVBAaChkoFAE5029XAI7eKlWeFk7/R39zb6Go2RhR48+VIk6tJFy50F/jCglRE
         WHDFLDLIjL4F7O9tvzKs8RejHyBr8msYVAKt6GrVllvrU0VwgE74TLaMCSGTGLkJb1NX
         rfZIQ/t8XOWI2205/AuyhZS8XeGPyjYWonydI1m7u3B6VPGJvOpL4pLFt9FDJsDiE8Np
         LxpQM3R1Naj7LiYv7tHATUkJWyJW2Xg6bIOkO4fYKldOcD5j1jdtN0AVMGiSRBPGtKWc
         hc4vlDNl4NJj090m6tOXRpxOro/0uxgz1H33BZIC//CgHcAeHstCtHLvzmx8SC3v/Mru
         iWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=lrd6VnfqJApSJppb6xI303k0JwHHmOYhEyNS4XGWRFA=;
        b=jKUUVN8sU7LH7dYAHxthQ+prnxYiiFR1hxm3uvWQ1Ticce402qLX+4S0EWXLYWR3j7
         FY94WDguoLbMWpiYcUZCT+60OAlaOzjziB3B0S0rJyderoZrJ6svWkW14YlMTeTfRyLe
         VOdr3D0yL8E91yQFdZcEshHarknPSrZ+AwLJxXcusbpQACzTcpk1ntd+FchZhiehhmYP
         8h0bFkpn6KHu/3zt8XtvngouhH4hWaVTatbynpyFYrz0KhJ86i7T8ZUarIVR4i3HAyvK
         zQenEQBjLBz636O0I75UifWiHHtufec9lzkwkUDv2jJxsmhsb/Px4WFTU8AG/RRs89xS
         aMuw==
X-Gm-Message-State: ACgBeo38QJtB4yerQu9cZ7XcNrKYqUGydKUV6EOphnLlunkwqLPgtFVY
        V9rt7juYodG40mkqkwox/6IUPeB1IrPlfQ==
X-Google-Smtp-Source: AA6agR5fzXF7XwpqvzAUleEv9zA3CFS2t43pRwg1PxEtvOSAtJvDH/n2zv8Nkk7iQj+WC4hWVUuoMw==
X-Received: by 2002:a05:6512:3d9f:b0:497:a108:544f with SMTP id k31-20020a0565123d9f00b00497a108544fmr12679417lfv.688.1663249063304;
        Thu, 15 Sep 2022 06:37:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:37:42 -0700 (PDT)
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
Subject: [PATCH v7 00/12] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Thu, 15 Sep 2022 16:37:30 +0300
Message-Id: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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

 .../bindings/display/msm/dpu-common.yaml      |  48 ++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 223 ----------------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 222 ----------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 235 -----------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 239 ------------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 217 ----------------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +--
 .../bindings/display/msm/mdss-common.yaml     |  83 ++++++
 .../bindings/display/msm/qcom,mdss.yaml       | 164 ++++++++++++
 .../display/msm/qcom,msm8998-dpu.yaml         |  95 +++++++
 .../display/msm/qcom,msm8998-mdss.yaml        |  87 +++++++
 .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++++
 .../display/msm/qcom,qcm2290-mdss.yaml        |  91 +++++++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 +++++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 102 ++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 +++++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 111 ++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 +++++++
 .../display/msm/qcom,sdm845-mdss.yaml         |  91 +++++++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 +++++++
 .../display/msm/qcom,sm8250-mdss.yaml         | 103 ++++++++
 21 files changed, 1435 insertions(+), 1165 deletions(-)
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

