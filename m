Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B16B4B54EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 16:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbiBNPh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 10:37:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355902AbiBNPh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 10:37:56 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30E2DF84
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:47 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id j26so16668341wrb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aijvcWsy9YtZiV+n1WapUIg4+6ntUJUoIxFuyguMb7g=;
        b=d2smxsP4lY8EQU1zErCDeEd9cyKWYZkCDUktgBcZ/37aIGxUVMJloxXmmMGDuI1aNY
         XM7mbLgPCEpq3H4LSR4gD2zckDXLiKmzBw/rf96aiVcoHu7FmcnK+n1u5Gbt4oV+977F
         laGYHR4xHhM9E2Z048+Ww+9KIu3CBm08UxTvnyGz/iPAljcYepLLyAzah/4G9X+XZp/e
         886JNhKnUWCsb7vcSKDnXGGCEWQzXZnbh29alvExLBA0R4xGqiPRhybIZBNt1mXbun8N
         L1rfIQuhlzaQyxW6lPsuzJXQsiKZD71xStkMe5GS1sHEEV8vCGl+zswNmgzadtUA/mt6
         6DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aijvcWsy9YtZiV+n1WapUIg4+6ntUJUoIxFuyguMb7g=;
        b=1uyHAZIXxDbI4kxkBRhSsoBaY2DmYmIIw+DAk89IlF3sYKGU5HomskjKqjZ/8Bgd6x
         F9c5asvwno3WHXCRT3GQWbtOTH4AqAAQf8Eu0Oou4CZTRkQ7BFM55X7pqbOprTY8AZ4w
         QLCc1v1uFNQJULpBoXOaxA2S0E7Fn62EPU7KqsiWYXUKFXmISs6tSI1UnyKbzej0KAgd
         fFVW4MLTXSb9XNIXkjBY3vueiOI3TY0lCmKHGqphS19JyZOiGPBToDOcdYKOVeZBLhXB
         Xb//YODDfuie5cw/upcunWBciMGsDjyi/Fq5AHQsr2J5xYaelw0kCjKNebLSJQ8nu/XJ
         6wGA==
X-Gm-Message-State: AOAM531hSSpDXGRChN5NyHtazljwK71ZR7WdcCjSa/gvCl5J8fK9VjCH
        Z1iJoFrTE8ri3Llv6oPvv/X8hg==
X-Google-Smtp-Source: ABdhPJy1jNaE/Z+WGRu0Cij1dahEbDE8D710Pc2g3XwPeNMUzaKum51xN0xAPyB7Gve6/2IpMXoqEg==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr155713wrw.712.1644853066487;
        Mon, 14 Feb 2022 07:37:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id l26sm12935850wms.24.2022.02.14.07.37.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Feb 2022 07:37:45 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.baryshkov@linaro.org, robdclark@gmail.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 3/3] dt-bindings: msm/dsi: Add qcm2290 dsi controller binding
Date:   Mon, 14 Feb 2022 16:37:40 +0100
Message-Id: <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DSI block specific qcm2290 compatible string as valid
Qualcomm DSI controller.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: no change

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 35426fd..7095ec3c8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,8 +14,9 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: qcom,mdss-dsi-ctrl
+    enum:
+      - qcom,mdss-dsi-ctrl
+      - qcom,dsi-ctrl-6g-qcm2290
 
   reg:
     maxItems: 1
-- 
2.7.4

