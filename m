Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB206661B8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjAIAi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjAIAiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:38:25 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4FDFD0A
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:38:22 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id cf42so10664248lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
        b=WSTVYuuPoAuJOGdQph3kfnYWipMLSmMWNS+WYmdpTUOEmn5pPUhh9nNcnS1efEkdE/
         x8F627H5jfYqXPCkawGZLPAr5M71OhOgkdgCsGdVBO2fgcn8r+lPFWf7fK7L4bwXF6p6
         Zezq1PKUClYDM8U4p+e+oFBGOKeBeWvi+5ehYI3WCb+Flvnk0slu3TzjKN7L0Z59/wmt
         sIziQuIlHA9i2G0zAuuRo/e+zf7pWa6ObRjCNDbR493i4NPSe3Wu3nlqttWx7empA1Xs
         dkBcEfdQZDn0Btnywe+ZXPmgGkLPahBihbLYdY2SJ5leJmagJzcUVfvk9k+ac7UZh6Rn
         JIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
        b=Xec4o6oqvZygiuZ8/C9w8oQcyviorNJJxcOwY00b2ey8QxmWaSc+Q5KKHU/ASPzpCq
         hpr3GQxtrRvcSz6XQEVTAkx1pmzfTYREN9xfJ422q32QdCc5go5in/lG1LONR8nYJNUM
         T9cLHF9EYqGVpJ6XNwdscoeovH9oPuSDHjuDqMkFKRsxRUCj9PHfhpCDERp1DnHC4dns
         D5BJ6cNq622YxjGZePmNgqqiwltfnuavw9kxYM9NaJ0lQtssXCZThv4wEptwsBOaJDjo
         ddU0n4g/0NT+eOTWdflDQ8PmU4NLm2FVj8B0lH48xidxOiybMW/dzn6cOJBfAgo1N0Sx
         cVcA==
X-Gm-Message-State: AFqh2koJGySoa5oWq7T3TJLrad21DiB0L5AkDjR5upxox1snyH4elUx4
        sAWPcsErOCL7DiY6NC8dmufntA==
X-Google-Smtp-Source: AMrXdXvlxb4EFZ072+msFp0BZ4dz+pfleCfeN6prAx0jUGEHgXIzupqxHMlHuRAsBi9MgmaVLWbBNg==
X-Received: by 2002:a05:6512:131d:b0:4cb:c3:9363 with SMTP id x29-20020a056512131d00b004cb00c39363mr17078413lfu.11.1673224701119;
        Sun, 08 Jan 2023 16:38:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:38:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/4] 
Date:   Mon,  9 Jan 2023 02:38:15 +0200
Message-Id: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Changes since v2:
- Fix MSM8998 compatible list: "qcom,msm8998-dpu", "msm,mdp5" to allow
  handling this device by either of the drivers.

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
 .../bindings/display/msm/qcom,mdp5.yaml       | 154 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 160 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

