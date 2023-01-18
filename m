Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94BA6711DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjARDYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjARDYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:24:39 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3152151426
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id mp20so33503645ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
        b=g3c7+YQ1EJM8IKsNmfUYFSKpFtYbB6qR5Hz1eQVcCd1Mzr92XRCWFcVn5fABo0YWFd
         EOaaXaYDC+2NCV/Vmy45wyOiliod8czwMG4riNyZYBsmk4fkZ9qUaMsNmoBiLzN/MTkD
         edXihRbsu3i6mKV3f/R04TTMgXqsiiT329B06VKrhB44euEmQjGoqv+q48CVt1XOF/UI
         cSKMUKtCut/znSfu24UF85I26jOEmvQ2cTGDzLv+/xNLJ8JOzYXHJAWBQsopR36lJ+Ep
         MuYtUVMLBZGrXC3GV1rZCSRM7uqyvpgczZtSrFNT2rhWwEl5q5w06YJQTDOun7j/29F/
         PH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
        b=5vjlZoQaz2YW//+wanfYTu2qAsEamDSPC0B+Lt7wbtiD66xig9c1sJjtKICXmWKqMT
         nlx+bE1BNY6M8zU3VbtkseMmXbuZ3O6MasjZm8jGauVDOprDoYzb6HGEu+l/VR9KKEr2
         quYf2rPqTA9YC1VIyGOG6jyakQsc+JjADS06u4W6nzjoSyAzNuzo1KazT2pFnsMydQ90
         /xQGoCMLYLdlAOLSm2JsIJm+x5s41Elz/W25i0ZWjQqWiY+ywNydGC2lvSR0jrk6Ybma
         zK19mNXeHFLfLeGy9fzOVAjOVV+HMR4f5DY+tgZDapQ+g2+T693g2uBLAjtyIXJhyci/
         A9ew==
X-Gm-Message-State: AFqh2krHAy2ieFRsx2yqucTejxhP7VTtWTNorDB7uVGYE7aUN6Z/nRk3
        V7BU/z/ICyA4Fnk9acRS7ZzA5w==
X-Google-Smtp-Source: AMrXdXssA/hakgWZgE4naeoB9z6EdLSKoJlaGcpYJydyzu2fjfgzgYxcL5zYzluE0+bh2eahd/J99g==
X-Received: by 2002:a17:907:8d18:b0:7c0:d6b6:1ee9 with SMTP id tc24-20020a1709078d1800b007c0d6b61ee9mr5948982ejc.11.1674012276788;
        Tue, 17 Jan 2023 19:24:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:24:36 -0800 (PST)
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
Subject: [PATCH 2/4] dt-bindings: display/msm: dsi-controller-main: account for apq8064
Date:   Wed, 18 Jan 2023 05:24:30 +0200
Message-Id: <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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

APQ8064 requires listing four clocks in the assigned-clocks /
assigned-clock-parents properties. Account for that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b07bdddc1570..357036470b1f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -83,12 +83,16 @@ properties:
       2 DSI links.
 
   assigned-clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       Parents of "byte" and "pixel" for the given platform.
+      For DSIv2 platforms this should contain "byte", "esc", "src" and
+      "pixel_src" clocks.
 
   assigned-clock-parents:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
 
-- 
2.39.0

