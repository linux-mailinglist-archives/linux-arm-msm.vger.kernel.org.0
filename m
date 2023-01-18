Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879786711E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjARDYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjARDYk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:24:40 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4C94FCEB
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:39 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id mp20so33503739ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
        b=SDPgSkODr61lQewXQXI9MyT/fdS8sLKxVe8zbDt480jNYNViWZKlB66TQ50+RHpObd
         aeYljotojqgrgkvZlwwbJl/6Sckkt8wFAAhfvYY4gMK/CQWUidj76qIl0ByCh5lmVn5G
         KrDRo8cqO8Bwlynja54VfKNFRq+WfFcB1HW/FwgQ2qniA4JxP4kFH4zlewRyLcHM6NRn
         qPM1y8jkksW9f2tpT0hZLivrX4bYFKfZlt4DP/BSA7bkFXdauJsAx71pW+MdpIJusJ7v
         pZPSTjo99Uz4hqVaIUTnUvxkJ53TMTsGQYV/enMc+qyb1ez5A8vFmb1TObju1Mee0FYS
         YJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
        b=5yJbHH9Mnxt62QApJLW2HKopUi+1y4jiJ9eUy15KZGCVqZZCtOzh2zXlECUGsidn1k
         oAbnSHCetty82oGQ/e9uTIBZ4b/IWgIujIy8rsUl3QWnqUdwyPKwuxf+CZGF2+VJWGlq
         Bngz/XpNQGmpihy42Q7GfqCUB3TXvPtYtw1pdv7QNKCoLWfchxmogIaeM4hSiMyjxpKk
         ZMimscAkDPXo1Nsuobw/Izi3FNZZCrutlGkTdd1mO8deCzoicBKQc+cS+OTu5Wk8oI2v
         3E1Ykz08XZjHE4emkZ+bhKT1QOnUQ3ZV9SrVb7hR5lYqEINtvqGUuOZ63NPrIOL9MXFe
         s+Cg==
X-Gm-Message-State: AFqh2kqfqfMTt4uqJ156qO+P+bEhu4Aiob1+lBfzw4+sKSfQAn2y+nOA
        5z8+5FzKS0yeHjsJR7WpqnABtg==
X-Google-Smtp-Source: AMrXdXt03VdBtNqUkusVgtXrGcDHG8DymvlEvlG/t1HO+TD2pWZa0lVglqyym5GI9849sj0aYeM9Og==
X-Received: by 2002:a17:906:7116:b0:78d:f454:ba46 with SMTP id x22-20020a170906711600b0078df454ba46mr1383522ejj.69.1674012279005;
        Tue, 17 Jan 2023 19:24:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:24:38 -0800 (PST)
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
Subject: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add missing supplies
Date:   Wed, 18 Jan 2023 05:24:32 +0200
Message-Id: <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
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

Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
(vcca-supply).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dc318762ef7a..31d389249c1d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,14 @@ properties:
       - port@0
       - port@1
 
+  avdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vcca-supply:
+    description:
+      Phandle to vdd regulator device node
+
   vdd-supply:
     description:
       VDD regulator
-- 
2.39.0

