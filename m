Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1954AE17D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 19:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239828AbiBHSvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 13:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352977AbiBHSvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 13:51:19 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F99C0612C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 10:51:18 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w11so45577wra.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IObv89LbNrZYavKYMS1gWTg3+LyoAzoINhD0LOwgdjs=;
        b=KKOc6hDgttGYmwNMZ7uKkcrJ/eVJsYKtLyWmf9aufdxpHwXpoVlEfNJE/i4x9MCpcP
         AUAJfk6MFRYKLvTnz8PHZj/4qL5BMtg+OQh0CjjI7KFvHz70p307ow8O9uyhzwesfVkw
         3VYAwCfqTHz9w9vEDmwfbZ5lasLkrNV1oHfCNkVz7HyX0YhpW9AVwFpNREsuYXe1pKmz
         hmDJIUTVxW9zRq2dgC9qC6Px/87w1K4yxo/C69CcaROSnhag/XWmLVNEw4WjE/Dten6I
         6bXaWVkRco3AJi7usYwd3RvOq2drUCcyo2YKuL5BB/Jr2ozqxZeANHKtd+CBMw6sW1R5
         NBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IObv89LbNrZYavKYMS1gWTg3+LyoAzoINhD0LOwgdjs=;
        b=hJ5+Gj2djmjQ+zu5riNA2JPCWTOIRaItcyisaoP9iA/3JMnvPYM/JfYh3/NRDBP97D
         b80TC6nyJxiPbxqE7tRDz58rKXXvyjoCRY0SZqE3N3GZxbt67hN4Tc48xHVTKBlCbJQ0
         ipzDeVivWMUn6E8tTrUOXHvJ6c++odONU+ObukuibNqpbKu7VjgjErw9kwRyC9ps5tkL
         Wt1BpB5/ALtEGuRr5wpAXLg0SLtVeRyDin0Hmjrp3E8epbbghDbWuNQJ1hS1ik3zWnM9
         zj9dQNAqr/OImsBBYMa+hd/zpA3VvBF+stBnSr/ogHc8cevbPlTAcjMcf3GjBVXL/1fB
         Hc+Q==
X-Gm-Message-State: AOAM530Yud7Svx8d9mglCjYu53gFg+chpPx2mvQ8NOmRs6m/xPcfq7U3
        LlS9qgeE7HQqcpYxvQXWgp96TA==
X-Google-Smtp-Source: ABdhPJzckKCpxQU8AxLxjSn8e70QPd5LCPCMa8xWCpXhvK90ywMKDZUPguJLO+EeqzpHACovvYWCdw==
X-Received: by 2002:adf:e10e:: with SMTP id t14mr4585122wrz.299.1644346277422;
        Tue, 08 Feb 2022 10:51:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id z17sm2762725wmf.11.2022.02.08.10.51.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Feb 2022 10:51:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 3/3] dt-bindings: msm/dsi: Add qcm2290 dsi controller binding
Date:   Tue,  8 Feb 2022 19:51:12 +0100
Message-Id: <1644346272-3403-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
References: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
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

