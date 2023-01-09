Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60619661E03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 05:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbjAIEy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 23:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjAIEy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 23:54:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5A365A5
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 20:54:56 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g13so11231490lfv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOb1Aceo/UQvqSGAz4vmSvKygF6ghKxNjCdlHBbs6Qk=;
        b=BZ0lu8cck+L9o8kMSf6bqXTlkqR1NMtBTyERO3za3EJ5AIYvP3dgz+tvW9Ahm4Wygr
         9FEyd5QXE/QQE9Jzpn+c3M0OFM66uqywbkN79smKoPFbk2Yeuxc2T2lGmLcBJ7EzOFgZ
         1bHyNDfSdW7PgvAFlTLJIaVfsrTqG6vAtJ+DkqnmhPaiHoWx5/e2lkEQu9Gj14W2kIjk
         kOBarEfb+JleUS+nhCTAVstPySPS0MjjXGIJtLHCltJMgpSWAvxeVlwuDZcqrUjuaYnl
         u/sj5bN8ApXwOWmp9URG+0IJ+ia7HHT0XSOGKaU9wWBEIc+9+90e+wnpZ+zGSRKiCoTN
         5GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOb1Aceo/UQvqSGAz4vmSvKygF6ghKxNjCdlHBbs6Qk=;
        b=dyydHQPAS+2pDB59jKbtu2KTU868OMDfvzxRyEqKNFDHyHDBqr+tX23h+qEgvMQiGj
         gqstNoeQX/nQuGmsg/K9H3wXxWeltZiVUbK/cELhaG+Sos8DNrXyMwun+w4cYd1uYfOD
         HY1h5/oqej194x2tu/IBjXWgFBk3H5FUBkwn0aqe8Jb8IjMq3Vb9+jsW2rsHkxfKL9xY
         i7UavfBtJo/YUD43CYJyBqDT60eNphTyRfYy9OQxiIItDXgt1j0SOjUasssj5ISKP9Iz
         6g0fuM/EEfAa0IdD/Yh6SoRq0PWM4JbUr5rWUZvimC/SOPMf7aqYHfVFEQGS+24bVvOV
         TCJg==
X-Gm-Message-State: AFqh2kpmbX+gY5pqoJ/0UzGkLJAkDMugc2tE6S5RGcbcjMb5xaIDdQ45
        kv5rX8QOiQRAuSyIfD54weRWHUIgc+Z2q6Jw
X-Google-Smtp-Source: AMrXdXvY1I9+V6lYnXjJHZ298O+1S7YjqX9rn/Bkf4N0/3GBJ+YzRcriOJEnzgP+J9jmaO0i2U6aRQ==
X-Received: by 2002:a05:6512:2356:b0:4cb:4416:1e7d with SMTP id p22-20020a056512235600b004cb44161e7dmr8500518lfu.48.1673240094995;
        Sun, 08 Jan 2023 20:54:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b004cb131751dcsm1408980lfr.158.2023.01.08.20.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 20:54:54 -0800 (PST)
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
Subject: [PATCH] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node names
Date:   Mon,  9 Jan 2023 06:54:53 +0200
Message-Id: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
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

On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
phy. Follow this change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,mdss.yaml          | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731..7479cd96fdec 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -107,12 +107,6 @@ patternProperties:
           - qcom,dsi-phy-20nm
           - qcom,dsi-phy-28nm-hpm
           - qcom,dsi-phy-28nm-lp
-
-  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
-    type: object
-    properties:
-      compatible:
-        enum:
           - qcom,hdmi-phy-8084
           - qcom,hdmi-phy-8660
           - qcom,hdmi-phy-8960
-- 
2.39.0

