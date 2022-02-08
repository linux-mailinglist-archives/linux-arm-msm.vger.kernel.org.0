Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36974ACD88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 02:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344075AbiBHBGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 20:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343973AbiBHAR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 19:17:29 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE985C061355
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 16:17:28 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i17so15857764pfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 16:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ump4WlSip5V2JlqWQTgJOZSUupb4pYUV+n/5B2TGlus=;
        b=iaHPcaPkhBgkbkHPw3lGkAeU7GfjdIaqcg5gfIllnqQXy+yFLmejaQasUxyh+E0t6V
         SoWmD8LzI/NWCJAY+kb9S7b3QKo6nmxuUGgn9DlYbhP33gnbjeuwH0rs6opMWpwZRd84
         OSKxOvIWXeoxsMj/3FJxSJVc/vvuEWExu2ERY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ump4WlSip5V2JlqWQTgJOZSUupb4pYUV+n/5B2TGlus=;
        b=pAV5R4mOCTDzw4YbRbp8sPbLZWOdlgtOBkdhg/MvvfP7BuGK/bxyQWdY31loheFEP5
         YHK1f3D66vwnMPEJxeq9UN9Xumgb5Bazh7XNV7NaZ6OCaN+wj/ShYBAH8aibTE/qthbE
         ePXTvV14OPoAzrLPAXakUnM4xjHc5uui7WpFPXOi50EWGsWzBOX/PXtEl4HToZn58sXo
         DKKJjZIWrHgfIxpr4a1sSa6e6cht7f/qpZ3cPDEjUETaOrQq7o515EMRhJ/G5t36X4ur
         K0DXLa3sEczzix42i0UXYmaQVaII2QKJUX/1C9UKu6hBoBIOTynGRi7v4AOm4bc4aZlM
         zTWA==
X-Gm-Message-State: AOAM530TmftyDnIuXvHwGXVV08GjOEY88GLAJrCt88fD4xJTQ4w4DaPd
        htQrMaIapVIijBCuJOXGcCtDoQ==
X-Google-Smtp-Source: ABdhPJysUN14OWRaS0gjx3vzBZsCwjAimW7jy/Y/9xx2AVEP2bk4Yk+URPQwsV73f1oA9YO2VwdQmA==
X-Received: by 2002:a63:4605:: with SMTP id t5mr399414pga.41.1644279448156;
        Mon, 07 Feb 2022 16:17:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c4d:c442:5b4:f597])
        by smtp.gmail.com with ESMTPSA id mz4sm456185pjb.53.2022.02.07.16.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 16:17:27 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robdclark@gmail.com, quic_khsieh@quicinc.com,
        quic_abhinavk@quicinc.com, linux-phy@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [REPOST PATCH v1 1/3] dt-bindings: phy: Add eDP PHY compatible for sc7280
Date:   Mon,  7 Feb 2022 16:17:02 -0800
Message-Id: <20220207161612.REPOST.v1.1.Iee1d505f0a35c2805f0468625b117d2e0f0ad339@changeid>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208001704.367069-1-dianders@chromium.org>
References: <20220208001704.367069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Add compatible string for the supported eDP PHY on sc7280 platform.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 9076e19b6417..a5850ff529f8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sc8180x-edp-phy
+    enum:
+      - qcom,sc7280-edp-phy
+      - qcom,sc8180x-edp-phy
 
   reg:
     items:
-- 
2.35.0.263.gb82422642f-goog

