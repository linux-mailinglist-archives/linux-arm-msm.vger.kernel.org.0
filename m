Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5898969AA09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 12:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBQLN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 06:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjBQLNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 06:13:52 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828396665E
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:13:38 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o3so1222425lfo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20OCfuLzA9fqgo8AT1mDWVtFNDiuNjsVIu2uoLHzxWk=;
        b=M7B9dusj6MIYmuDnw4a2+gkHtOEil5pVYeLlsyq0LtpccdoRJkVfAhfKtNG1wbNmgT
         Yx671npsFn+FMm+XEgqGdrr0U3yCjYo8GltBUXigdpmsl+gfVQMTefQrjVUqDP0m8akd
         mkqBdIFYbEmBbNObAt2vFzbJKot1qX5m3/NXq7YRTypAyFv7Pwp2JxIrudmJvK0QoZV8
         OVm3wCu1WOdeW1ja5/iLUHMZnRnDAOPp/BYu60DfwqiXnTqN8w0WC0aWvRNnUE5PaIhf
         Dxm3z5FY4/x9+CySIcYZ8tNc0etWFFWxscTPmj3Y/WGCBEz33RRn8sQVXgUM6zEE8KfX
         fn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20OCfuLzA9fqgo8AT1mDWVtFNDiuNjsVIu2uoLHzxWk=;
        b=G6Qw5UImkhWt6y1VuE1q1x8hBJYOYWtXPWxD2dacsB29o1HPQkBnlNRv8qhZvLUPzu
         szfQWbVVBZ0Ws1nfqQCnIjLZf+EQ1hIBrxXw3KfmEkp2Ai6vW5lBJwF882I63UlzKon4
         9O78S3ylXyHl06Ew/U3NFEuba/ipKxFGOA4wHmT+/prAnE/o+IYIvl46cSvDK2SOtNcg
         xOgSDNU525Lydw/H2t5IsOXIPuOFqwwk3yopSrROBmKgRQ2VlnS+K125graY5T43GBQQ
         /XXG6OGk/7gPnH+WtT5qbrc9KYUytU0AXBqMOmv8RIqSWCCLjZTrEvLKhpc3krIR7Jvb
         meIA==
X-Gm-Message-State: AO0yUKWbuv7MCITsorYx8N7yMMbtBHye+vOK8eCEP+o5hNyFmCIZUU1O
        DzCPQfaYONJv9mfQuPd+0n2VXnWyJX8XT2eV
X-Google-Smtp-Source: AK7set+Epg38ByI5yc4CuXBGxCUll56QIUpvMysNvjurttYEVN/0HvhURZSTZm/R+gytz24gNeGfLA==
X-Received: by 2002:ac2:598b:0:b0:4dc:8510:bfed with SMTP id w11-20020ac2598b000000b004dc8510bfedmr327637lfn.65.1676632399844;
        Fri, 17 Feb 2023 03:13:19 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id h11-20020ac250cb000000b004b564e1a4e0sm642683lfm.76.2023.02.17.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 03:13:19 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290 compatible
Date:   Fri, 17 Feb 2023 12:13:15 +0100
Message-Id: <20230217111316.306241-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
without the generic fallback. Fix the deprecated binding to reflect
that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on (and should have been a part of):

https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

v1 -> v2:
New patch

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 41cdb631d305..ee19d780dea8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -37,7 +37,6 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
         deprecated: true
 
   reg:
-- 
2.39.1

