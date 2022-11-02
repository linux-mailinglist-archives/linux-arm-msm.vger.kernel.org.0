Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42756617183
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKBXNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiKBXNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:13:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCB2DEB6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:13:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d25so169964lfb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
        b=ZLES/zqOOoOa8Dw6KTS5MQwPc03kZOBxLJ2USXc89gQ3DfiRBT5FHWqFfvLSzxb96t
         VdnVXmlV35/UIEVpVOfbpaFb+mfg/sY248Ec5ZmPrmrgfpiCMNi+WaovfCP3rVeoXVp4
         fwc/NwVIAnryEPwQR0ebpBUKPziDETs9D2pgpasOoQKZtdfGZWV395DaQ8iJr5ne6uh9
         YMkI6XK0LYVqqybLz0CRbKeTw7JA0wT2hKbqRMS/pOX3440BUO1XngVowSqDBe+uAJmM
         R4X+oX0MaXogPD4Vg8BzvwTgESpJBYTsWB7S69KXvqxGYO646F77rRIUr8WjhqT8lrPl
         p1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
        b=YqMvNndU0hBIir65xOILG/8m93p5kAJJ6HltSGUSU0hgzwpptnqJ7H2Ma5WXSsegm6
         ghE2jXd0e8384e0Y3ddHD8bH0ZRA+35ddBr00NB16IeqVtbKk6NuiLWVxllXTWlMWBtR
         YWFrvktcj8hD6D4spPC2pdR/QAoCbdNVYcKv1S0k9d5TEyx8gWzuWoi6OfMAMOPU00AT
         0lmG+JznM0V6TOwhlyLy3+HUbPmWyUjxuaQpHyyJGTEH25BV32YPaqbt6BuwKGCxd9Mg
         vvqEKDKw1174ENFcQnlCXi3lp6NMmgmATH1TIUmFgYG3TOEuprNRphZnbGtq7X8ZFUnQ
         k7TA==
X-Gm-Message-State: ACrzQf2tvqw+qcVnaHfK2lGxsQLXDyNFPZEGNLB7kj9RX6UCUR9Waqwz
        l4hCG5mqn2i/HAWaxZl+7k7XUQ==
X-Google-Smtp-Source: AMsMyM7BCht8X6bxZLVdcbcIZzH8YRsjw+PzdKJq7+vHqi2BCOS/2yVSg93iup4XOoSyvzzo6AAVPQ==
X-Received: by 2002:a05:6512:3241:b0:4a2:4f95:c02e with SMTP id c1-20020a056512324100b004a24f95c02emr9621126lfr.23.1667430792917;
        Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/8] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
Date:   Thu,  3 Nov 2022 02:13:03 +0300
Message-Id: <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

