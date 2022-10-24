Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4168F60B71B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 21:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiJXTTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 15:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbiJXTTU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 15:19:20 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E623618B090
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:55:48 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id 13so6854171ejn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
        b=HFFQDxotzuNiu8RiJP4Gcbz0q1l3BTViLA2nQ4jWsD6PzrLWlbdmHhKCZ//WmWiOCN
         9supODfnHHTbGImqBByUJbUnzmOpyig+fzdr0XdxJ3fW7ISUTo0SWg51VQ3e8ws6XhWv
         bs02XtACIMdv6EvIJyqbz2Bvqknxy2GRm2xNn4wyJTIA54wMmmxagIPogQ9WzJ6eKnAv
         bOoZsLA3D1sPxRlZwqAh6BLn3Tb6pDpdS07MS1Btn5Iy/fiYGtaLdwJ5osBZQgdOOFS4
         Z4HBSRdAQwgSP6VErV+SnV9X9WARsaqaSasbfv6G6hVGXF4y6RsprKHlDlK8Mrpjhz3T
         7hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
        b=R6echuje4yGJFyg5A/jzqpmlw3EBeXxecVBVZezsv7yyNuzpWuwQL6tkFEY2mo0hJO
         1xkLNqgBvCTu+w5AJHrDIWVHpIIPzsuIqEPeNJdpfvOXNISlpac4dO9jZig8LcY5XLQK
         AYvAWZFOL6ydouy2soSOe3ALm2kmc9IDhsR1T5vaX0kjnkmTRhSMx9BftlxhW50lfYH3
         CKBQKEKnMrBTI5HlOhvPOWwirnZGWCso0+Tum4EFvw5aZd3kB6NCx1VY9YoQ9GWdfL3b
         qkvJK+wpOaeQ8O5iUMy+xKh3v8SlrHkp/yibxkVytOxjY8iTBNyXU0CjLCotAJzXBIaP
         y47w==
X-Gm-Message-State: ACrzQf0tnSz8wb6k8h3dfYsbSqL1lUyhxWEOL2AjJmvFaeMWeAgB5pyD
        IQjjadOm1e5Vb1Ezu8rv2kI900sXsQ43ESRh
X-Google-Smtp-Source: AMsMyM5BRHjEkq3n83PTrgXkm0oWcI0sJAz9goPedeo+9H/tq8jRiCugAs+CHvVPNaKZcLOutCrqtg==
X-Received: by 2002:a05:6512:31d3:b0:4a2:5c39:d446 with SMTP id j19-20020a05651231d300b004a25c39d446mr13147231lfe.591.1666629749244;
        Mon, 24 Oct 2022 09:42:29 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 03/12] dt-bindings: display/msm: add interconnects property to qcom,mdss-smd845
Date:   Mon, 24 Oct 2022 19:42:16 +0300
Message-Id: <20221024164225.3236654-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

