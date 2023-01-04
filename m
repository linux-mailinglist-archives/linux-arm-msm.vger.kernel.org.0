Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2284165CF18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 10:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbjADJIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 04:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbjADJIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 04:08:51 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762A417E39
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 01:08:49 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so534404wml.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
        b=gigiGe5rRb34aJVuvZjpbTHFslzpbK2INEVyJg46HZdizq9iJkHqeWLrcZY53ohhlh
         fikpvJ8gRcsyuZxgSLEmhcJG+kPGas5eE3ZOrkRn2EwYTkWHR/JmKRZ97lNGxQnLX4uG
         DlNIdZFuWWoWA6HrcISfJh9C7+LFbZQWXg9mJDhkhB7ieSb2K5yjS5fqaCWu8BAOgnhZ
         pnDS8UAX9fljmbMBwsSU8AjMrFd+EghtZhCJV44K8OSvCNnAubvO7sgsMk79uYsucp0C
         vwVR8lT3MF0MF8DlhgAlczYqfETFbVYvASaAFQKXxSmGdnETbNxvVGz+MZDrZF2RxfXd
         HJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
        b=HJCr0pRsS0I9TAQqvt045sA8QtZe0ySaci3foJENU/OJsG3C8yEwP08UJ8FzULvB/i
         N7oemXWQTvAMkZs9BElTKLBCcy3GvQ2ndj96zfnSFJW865RHmb+vbJKFl1wftoltJl7D
         7hNyMmU0gh00zMT7kwZ5VhJbx8hx7ZAVZmF9mNUWXk4dgBy8v7PUVD3vwA1UbR7hETwl
         nb82LOkO4hvDrSgPZLi+OI4tLWq7s7Z1FKQgGyXZ9/NZM5OAKuNBxpkuB2b6r7sSGd2+
         0kP/rH0A6CykmAzkXdJznrdxN4pRcZW8g4Jcyyue2GFhOoFofHFWS3qtm0bKny/KczR2
         T9tg==
X-Gm-Message-State: AFqh2kqE2Ip8eZXM7BofUiWJCXPtlK7t2ehMwMQDTpepm+phg5xGh/Dl
        //PuL01xJuTm5zXkuNyM9SsvSg==
X-Google-Smtp-Source: AMrXdXv6qX18TiGEiG+Y4uCV64Ch859OaM/nIrmW1EaY04J7vq8U2dgvbt0GY9jY+48Ed5nWeP9bkg==
X-Received: by 2002:a05:600c:254:b0:3d2:2c86:d2b2 with SMTP id 20-20020a05600c025400b003d22c86d2b2mr41360582wmj.24.1672823328004;
        Wed, 04 Jan 2023 01:08:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:08:47 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 04 Jan 2023 10:08:43 +0100
Subject: [PATCH 1/6] dt-bindings: display/msm: document the SM8550 DSI PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8550 DSI PHY which is very close from the 7nm
and 5nm DSI PHYs found in earlier platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index bffd161fedfd..f72727f81076 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-4nm-8550
       - qcom,dsi-phy-5nm-8350
       - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm

-- 
2.34.1
