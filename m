Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06623661E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjAIFoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjAIFoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:44:11 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B448FD1B
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:44:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m6so11313130lfj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwVoASNnAU0yQzXSIlPjrbYKvIqxO9QDa2dRwLN6fIU=;
        b=JLoDUGJzmWpdrZg7ltG5rMZwhCslsDHUYaWKlGO/v3RT0Aue7fAVLddnC2nMP0B/gf
         Sz61LE0abcai8EuYfaiS1uExIi1D9Tci3KQqAUt6ZF3Dc78mGimWi+kh/GAKmqB0TmhQ
         4pIoo+Z5UrDZbh9YiQHyAMTrfeVKAOZcpPaEpBaFYNNpst6rWYCiMxZiVGNqxgJbLBLu
         YdcHZLdEJbEOFee8hXD0IPloM6DIktpVaMBqg9N3lGSuBU7Z+bTwR9h1I+hhZcZ4dYo4
         L6caHL5bXKQVb6BeVLncbxjbQJlgSES7uNkIn5z5aPQ2bnFKpMlEmVRQVbCeRxIU0zn9
         r/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwVoASNnAU0yQzXSIlPjrbYKvIqxO9QDa2dRwLN6fIU=;
        b=CUP31jHRCJguOh3Dd92rSqNljh8a+t5ysmWMfwp8juQ1J03jvk2oSJAZx9fM/YeVHZ
         rlyjtHtEUbSVcLMl0NoE/2MrQ1BSvAAVLwFlK09XV3n2HjyHDwkat2LwVhUq+gyjKj+W
         axYtsXNkKAkQzf2egXohbyD+wDMmgA7RPNt3aS/L83CJW43lzlz0hNdEBcKuXAnSMzcC
         hx3pf4pMndCBb9s1dgAYf4fFcrICyV2TwcxPxFuj+13aljlytT+hYypF9pv+WjntCCIV
         0ZaJlkR2SVYaXs8MDO5JB4/Lq75ycOumZA7lZtwhIF2uH/frM8Ddq5zQ2E3zWsbv5AMU
         V7zw==
X-Gm-Message-State: AFqh2kr9saQXJslxvFT7AoGorjiVoobhQ7WfUq4I3T7JHEO/JSmB4q5o
        rcFoB5HCEYuYPqCehW52D1ABwA==
X-Google-Smtp-Source: AMrXdXsj8AerO4srrK26Qjkd12NTfm5B1jeUHvkCnBvxmjfKRHExkI/AEbhV2uqVFOVIiOUfhfCXnQ==
X-Received: by 2002:a05:6512:3a91:b0:4b5:9b8f:cc89 with SMTP id q17-20020a0565123a9100b004b59b8fcc89mr20482250lfu.55.1673243048633;
        Sun, 08 Jan 2023 21:44:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u14-20020a196a0e000000b004b575d239besm1431944lfu.237.2023.01.08.21.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:44:08 -0800 (PST)
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
Subject: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Date:   Mon,  9 Jan 2023 07:44:07 +0200
Message-Id: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
SDM630/660 (A508/A512).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c5f49842dc7b..db8afc636576 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -149,6 +149,8 @@ allOf:
                 description: GPU 3D engine clock
               - const: rbbmtimer
                 description: GPU RBBM Timer for Adreno 5xx series
+              - const: rbcpr
+                description: GPU RB Core Power Reduction clock
           minItems: 2
           maxItems: 7
 
-- 
2.39.0

