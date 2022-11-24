Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDBA636F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiKXAsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKXAsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:11 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238605B59B
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:10 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id e11so230835wru.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
        b=N32F+OR79SQSbdzR9yWva0KCvzcWwerTV8JNMiYs6YGEtMsN2oSR0ESzOTYSJZRjCQ
         oNOZPF4RJP0nGRRwAuWrehizOTxtA5fHf30kEybQSz+3l/WqA07/W88RdUVpT9wBvUFG
         TUG56AkPQO7nkbzZeTkKl1itm7NWKdJE57xXL35iLg0VkgeDPihlrpQb5wua3ubXRfMQ
         3otFhGEi7HQJaZzaLVX+p93EnY6y1ehTvmiISj4f8Wg09ReGDGDu9i4wUio/rnirmNv3
         PIKagl/R+ib9xFiQYHNmgiy+f6B6H1peyk9L9f62q723vqhdDt3kWfGAQ15tAz+/s9Xl
         VjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
        b=wqtTJOje0kHphQwX4eSiUXCeyH/Gv4ft2On/2LrV5TIbWL4QvsiHtvNQOywgqlIqj2
         BpAvbzWG2z3D02pEOeFo7Q82g/CWJhGnhgU0UP+9bqo1cR4A3WHKqB3QAFt1EULcOkCJ
         EKj1FnuY/XdnT4mlcaGhVaCNvrSQNJpmKB4YyJoAUnhKYa71Tw1HIg+gH+toB7oyvIMs
         cyt4VbILD3uykx5BAiST9TGocYMNiaLhFkNo1eE6SaOsbACwnEGw1MSOIyL6WoBuOyX2
         YUaJAY7VlNlMeM1YCSil5nyP+bCrLAf6yF1TpsNmEM0j7IxMUj9yPNxxkAPBSJgsli2i
         sd8Q==
X-Gm-Message-State: ANoB5pmw4nPcgveyz5tB2QaXVRWBvzdrPj+ewLKaDfxJS7NX+FrqyMLO
        iAU4Uym6SMhOsBvcdoRBJz84CxPZiTbh7w==
X-Google-Smtp-Source: AA0mqf4n6UAjOVx73G5DDWEIyanuAsi+GDm8ViisN1rp1gp8RC3B5/SOI1xrQeyK7p6Q4i2cyQVBmA==
X-Received: by 2002:a5d:4706:0:b0:241:e77b:a81c with SMTP id y6-20020a5d4706000000b00241e77ba81cmr4995736wrq.145.1669250888449;
        Wed, 23 Nov 2022 16:48:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main: Rename qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:46 +0000
Message-Id: <20221124004801.361232-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

We will add in a number of compat strings to dsi-controller-main.yaml in
the format "qcom,socname-dsi-ctrl" convert the currently unused
qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..67d08dc338925 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,qcm2290-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

