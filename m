Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579065A0D4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 11:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240995AbiHYJxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 05:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240398AbiHYJxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 05:53:24 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08918ABF3E
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:09 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bn9so11341266ljb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tpyf1AK+W21R0VaLwh8O8+lqzRdSfdFGGL30pitSVKM=;
        b=J9KRyJrDgp3B5iFvG8wKhqBYQppPrdNLt0cdQBT9SR4/ZjFxDGnjp1AYqpwiluT47b
         LMkAbILCXkKDgo8KIEXpt1XTHOOhyn0g0ON2vdbGTjD99tZVRwmun0bjaxoWJaFYvdxB
         Arv9xQDXAxUSjUfsgeThbnn8tpX3+AGG8r3r0ehPCwBT39EboKCwUY/vdJMgAif2Gss2
         oBKB0vnsqgc+IymkJlJsdUFrJ/QfJBBE7IP1MBXAZjLcFozvx9/8Xfj42eJ6POYGb6sJ
         3cJ44/FJSy4mavYAaIQvOz9oONnm5a73z1D8IUDGweCIlKXC5ezMw8a/AvT1eDH49z/J
         My3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tpyf1AK+W21R0VaLwh8O8+lqzRdSfdFGGL30pitSVKM=;
        b=nkIcUfK9WkO9C54DsqF2s0aMvTHwK80ouMEBrbKOkLuw11r339AMND5L0UnNml6f9U
         K0s07R7MxibgsMTqdaed3bFTT8a0yZCOd5IxG4Kp9tLF0vdAPs8qoGsb28pYJcKZpFrz
         vgMFsUSDArG3pRDccw4HqAU3RmDp3MccxeK39tbSKy8bmFo0ChTjOD+ViVv2WsEXhmI9
         ifO9rbHN4KIENEUcUBnxfZ/Pq0Ak7QNpf6WTgcUFgsjIFfzUPc4B1eQ6ziscR1cKgXU2
         1mE2OVRlQph/KDVQXm3mApjwK6E/nSL3tn8kk3LYjKLoBwBWpsxWxaQUNCynWBdwPsey
         Qxng==
X-Gm-Message-State: ACgBeo3fM1zjA3+OrxJ414JOuEmTQWW5b1TaA0joRBxDrbqCtuEKg9Y9
        UZhRJalgE4YiDbI7RR8I5Qua8Q==
X-Google-Smtp-Source: AA6agR74Tz9FPEsBsZZMiR9A+8UDim/mVuD9g6zKLM5gd+q0/nbi8JTdlx+L1gjtLTobGxLzqAHrqQ==
X-Received: by 2002:a2e:9b59:0:b0:261:d61d:5f51 with SMTP id o25-20020a2e9b59000000b00261d61d5f51mr801415ljj.418.1661421065035;
        Thu, 25 Aug 2022 02:51:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:51:04 -0700 (PDT)
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
Subject: [PATCH v4 00/10] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Thu, 25 Aug 2022 12:50:53 +0300
Message-Id: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards.

Changes since v3:
 - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
   dependin on the mdss compatible string.
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

Dmitry Baryshkov (10):
  dt-bindings: display/msm: split qcom,mdss bindings
  dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
  dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml
  dt-bindings: display/msm/dpu-common: add opp-table property
  dt-bindings: display/msm: add support for the display on SM8250

 .../bindings/display/msm/dpu-common.yaml      |  45 ++
 .../bindings/display/msm/dpu-msm8998.yaml     | 139 +---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 143 +----
 .../bindings/display/msm/dpu-sc7180.yaml      | 148 +----
 .../bindings/display/msm/dpu-sc7280.yaml      | 147 +----
 .../bindings/display/msm/dpu-sdm845.yaml      | 139 +---
 .../bindings/display/msm/dpu-sm8250.yaml      | 123 ++++
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../devicetree/bindings/display/msm/mdss.yaml | 591 ++++++++++++++++++
 9 files changed, 861 insertions(+), 644 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

