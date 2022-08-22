Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B044459C9C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbiHVUSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiHVUSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:18:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623D954672
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m3so11165915lfg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=NR5Sms6sG1p7x6GaSvxGcxAu0Rk0o2U7p29fsROBKKA=;
        b=Fc9nfBUmcMjZ7iEPxRfiRu6t8YWkighq+81zv4mg1fv0A+6Ey3gzEMldpdqVWG9leg
         xA5Ya8t+FYOc9Xn7eoEKuUuGgBELECBuAC18oUoRwkE+GdJWG7Yin6NGslUxnHlSwQak
         s1JuQqvMwMWSTdtynbv8K5aUmbhYHNPytVqbqzt543ZerhX6IXWn9VoMoOVbky9zvZAq
         Zh7hZivxHpUNI9Qbk0uBfvVAnwtUDw68y8fRjviXqEMxFd9W4aLXul1bz4jxyOuLUgyu
         qMk33ORWCt8ilaKhe40uOeevK44NYUrAe/p2aJjbEkXrSxgvUAyorETHsOqjBvCVMUUf
         z1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=NR5Sms6sG1p7x6GaSvxGcxAu0Rk0o2U7p29fsROBKKA=;
        b=sMelepdn1ntZ4231cYaE7fRZnFsHQgm8TvKb03XgaGpG1Aj0QZ5yBywssph196O1Rw
         KnkekwJ9twY7zDJnP3JmnL9rmCRwASybcMjqOsWfkWDlp1+VUwl2sy8IfQa5LXK7oJYR
         ywd4OcLTWI/w1kmfNShJj9ftD7HM+3fkOOzcywbN6xSDA3ccE2eZ3Xv6s/uoiA9tbC+4
         ps1/kfFoeAkWMZtz9UY1leC64FWaClJrH9z6cSihCKdTMkEMbOfUWJq3IT5KPc4BCKHg
         KaOWAtI1cAKM9ldUiPwXBf6usb7g6iFFoR37j2gbi76we51NvJ2EtUUjojmBNANmd4xI
         qSCw==
X-Gm-Message-State: ACgBeo0qqrZfAe426B8QNu1oXKj9wGc7eBxl86GVKRMOEfGip1Y8SsRb
        0XAKenEXyIUPgKqnusjfgZSYPw==
X-Google-Smtp-Source: AA6agR7CTo6COBZ12nIbdfek3TUn8EoHkUm6N7gK7wR1HgHYnm/AMO3ng/rF7MY206MmvGdzbpNclg==
X-Received: by 2002:a05:6512:3b91:b0:492:e174:60d0 with SMTP id g17-20020a0565123b9100b00492e17460d0mr2859322lfv.576.1661199489727;
        Mon, 22 Aug 2022 13:18:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:18:09 -0700 (PDT)
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
Subject: [PATCH v3 0/9] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Mon, 22 Aug 2022 23:17:59 +0300
Message-Id: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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
afterwards.

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

Dmitry Baryshkov (9):
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

 .../bindings/display/msm/dpu-common.yaml      |  45 +++
 .../bindings/display/msm/dpu-msm8998.yaml     | 139 +------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 143 +------
 .../bindings/display/msm/dpu-sc7180.yaml      | 148 +------
 .../bindings/display/msm/dpu-sc7280.yaml      | 147 +------
 .../bindings/display/msm/dpu-sdm845.yaml      | 139 +------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../devicetree/bindings/display/msm/mdss.yaml | 361 ++++++++++++++++++
 8 files changed, 508 insertions(+), 644 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

