Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51DC64661D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiLHAzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiLHAzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:55:02 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E16184DF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:55:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id f16so11133328ljc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
        b=tY2d4VviSGal/QMy9Z8CDdTou7sz4oxGObjk1VhuO0dDlh07dZ/rj8gFNbZLpvolDr
         RsiekjR/3/s1q+hK6q5mLycMcIuBOX9nmO+86FAYo8GV462xgJU8JOXZz+KuI1lwsFqm
         nLlgUQiAa4BGZPDXR5CfiXcEXMOgZR43PMk0EDYRqrn/cRlJ6zy8n6c+p0nILDA3uWJq
         TBRKce7/qGf6r2l++J9vufs5OrlJm5MPo5V54ispGhcZy+202z4BMYTShMpl3EiJ5/0I
         HL5zScV3/d6utMGTzhyVtjnQzCmXvK8oFhDz/LvAAleKaUfktCjvkeoqTEK21fTQRosa
         xLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
        b=YbFjO4UzdKbycHsE0kuzpnrLfDCT9WVIuZSW2fJ9IMKz8yJcFa//Zg/tiojkT9UN/1
         gwlexkctKdvv1q9XpIvhAW4SCGx85zgxIW1QxOYrB7UGLvU3CyAOilo+OLmu5/5qNh4Q
         4mqSLOiDBY5NJOyGcXy9Bvz0rAZNxrXQ3WOADfXg/MOLpI+M9QDvC8v3RZ/+UjF4ItgC
         iIIv0JRRbAufKsSmUwf2joFQF0W5F6N+b5QUfGu8HSbZD5/ktraLyA4bWNDy66FUhuJZ
         0D8ktcuTjlNrdUUtgMsPHp1ilfokZssgsPfW7H8GNsUN8mnu8SCvpr8086f08eDCAYhE
         9WhQ==
X-Gm-Message-State: ANoB5pnsqPAJdUC90RPXq1kEufqlvGDJpz+2EyYTB9UzdLhnidiuVOKB
        xaeZsRkOJO2yI/1aJQPS+AIuHg==
X-Google-Smtp-Source: AA0mqf7elxcLWQxq40/vt8Rf3Z6g2zKIwhLRkFfg9GZBlR3gUTfVmrB+lEcu5V+SRNewsNZOOhiTdg==
X-Received: by 2002:a2e:8092:0:b0:279:da43:44bc with SMTP id i18-20020a2e8092000000b00279da4344bcmr8376466ljg.432.1670460899485;
        Wed, 07 Dec 2022 16:54:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:54:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] dt-bindings: display/msm: convert MDP5 schema to YAML format
Date:   Thu,  8 Dec 2022 02:54:54 +0200
Message-Id: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.

Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 155 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 161 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.35.1

