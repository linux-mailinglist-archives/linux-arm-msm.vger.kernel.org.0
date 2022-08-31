Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDD85A8625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbiHaS7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbiHaS7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:34 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA261B4EA5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:32 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bn9so15579526ljb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=brxuiaQf9dye5+DaGvh20FqBL4kx0JzHd7qSy7viNzw=;
        b=ccpidNPb+lUdE972u8ZglMsObDluD17myZ+9Fj1MMdmm7Zjwfyi8TVQL119wEStSqm
         rNwcuy5hmqY4Ece7DAxKQMot2KzNnPwv4mONhtix0AItzw0hI4o/vUGs9YLsOkJfhos/
         tZBVUfsJMDB3Thwvk0GmZx9S2XAniH84gqlLJmJ2s9ZyauPdtP0yl3rHeHQubqFrNG1U
         ETvrJGGIToqupqGhNfYzd0LY0e5Ko2z5MS6KdaQ7Wg5ctXzESrdnujzq5zV5rzOFkjUV
         w0eKL2TlgORZnJ1eCJ+X+vqIAijKsNEmfMxi8jj2vOnpt3cO1U3xpKA09emJj4V+bTrl
         Xyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=brxuiaQf9dye5+DaGvh20FqBL4kx0JzHd7qSy7viNzw=;
        b=B8acZHYjScabexaRJNcf3i71elvq6HdIwxXYVZkHeW9A61Ze6v+OuGXYhS3XahumLW
         EzN8aMCW9lu1SrwS8aMWUPhueAffoMpfh4ENb8kVxUCrnvi42MM4p/RIYNChUxMztpHV
         p4pRvkFnlIOCRrV8sxG3PabzI8PlDD2Vum1FCjK+8lhMBigWmXWrCfLAFSx6AQftX2Qk
         E4W/urndz+IqOHACb/qVhEPcspL0wwUNskfCU0povr37+HUUssSrou2l0TIklr2WobYS
         /olJ0LdWrFBH4i0QKcmu30/WljSNhIqG0aaR+ApmyItDdv5h6RqfBLswl0SJyVsrS3RN
         acUQ==
X-Gm-Message-State: ACgBeo38d0iBDHnHksJjORBQ5eg24R7dsnwdRnRUioTAjUuVRwqphOI9
        n8PI7EB6UX+Ct1hODUhKaJMNHimHJYhisg==
X-Google-Smtp-Source: AA6agR5Jlse3iiaLpEaoJCRRExQn/Hv2gHJKEjMQle1Ga6L55HOTVIHYc6vvSO55Yh1NURHwtil/xQ==
X-Received: by 2002:a05:651c:1989:b0:268:a377:ba49 with SMTP id bx9-20020a05651c198900b00268a377ba49mr605916ljb.443.1661972311303;
        Wed, 31 Aug 2022 11:58:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 00/12] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Wed, 31 Aug 2022 21:58:18 +0300
Message-Id: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
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

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards. Add schema for the MDSS and DPU on sm8250 platform.

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
  dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/mdm: add interconnects property to
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

 .../bindings/display/msm/dpu-common.yaml      |  44 +++
 .../bindings/display/msm/dpu-msm8998.yaml     | 229 ++++-----------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 235 ++++------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 257 ++++-------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 266 +++++-------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 234 ++++-----------
 .../bindings/display/msm/dpu-sm8250.yaml      |  96 +++++++
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../bindings/display/msm/mdss-common.yaml     |  83 ++++++
 .../bindings/display/msm/mdss-msm8998.yaml    |  88 ++++++
 .../bindings/display/msm/mdss-qcm2290.yaml    |  92 ++++++
 .../bindings/display/msm/mdss-sc7180.yaml     | 103 +++++++
 .../bindings/display/msm/mdss-sc7280.yaml     | 112 ++++++++
 .../bindings/display/msm/mdss-sdm845.yaml     |  92 ++++++
 .../bindings/display/msm/mdss-sm8250.yaml     | 106 +++++++
 .../devicetree/bindings/display/msm/mdss.yaml | 184 ++++++++++++
 16 files changed, 1282 insertions(+), 969 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

