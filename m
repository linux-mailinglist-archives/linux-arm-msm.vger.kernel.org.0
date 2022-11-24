Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B873636F6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKXAtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiKXAtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:49:13 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B701055B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:27 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e11so231576wru.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
        b=BmMvNzdp4Xr4It8CS2XqOsQ0/1pysRn+1u1rAugAEK5HREZVFB7vvN4R59kbSwCMIn
         z7VsyDiQMa30nyPISddzck50OSKNyKCEyi9+LEFtWgFgaJraxZ8XHTtOtcPBBOPexMJz
         3VlirAd7VrzLNDbK+LHzCwvuY0+Pvt1clDQ+1YfsxYA6WNsEyy6uPcnATNbEtUe1qsju
         1zDQWMq1i2xavL48Hunj9aWqU9S3KDz7OKVg/61HjKG/4HB7bSG2fi5dAJfP9majhq84
         94gupsXkuxRex8D9lkr9O0Gg9V9E6MaiuCOxXbQBh5ecClvbtQC2nCxXqH8XY0zCnEoo
         HZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
        b=sim+SRoFc9tg6wvVJt6PSwTh6n+v45cgXYIZYVAXQM4XionKaPDVb+YCUCB4kTTWbm
         kNLkvMdZnTCDfVJCUds42VATQrW3X91qWz1gWRyQOu537u1DPWjK6mWfr57YkJPCYhFd
         VqAct8ZgFoty+E65yjgdeQwbxluNUAxzXod8u3MaZHGgELYi1mggzGzn2mxB4chQCSIK
         EfNLFS/MGTK0lKaOpetJbqRt791s7uc28SodWHA2hMs5gqfetNbKIH8T0JrRSRydNxtR
         q3qXPFJO661qDe2SfO4/hjE0lyI3/tXtjkgBolYkdikbXw0rNm+B9uc1O67iM6p2cz4Z
         iHaw==
X-Gm-Message-State: ANoB5pmL+60hmUEtOcjIlf07GhR6y5OGEcIpXn7oyk5Ii9SFSp9jUpik
        lpGe57KcrkwUf5OD/dUokU17Cr5agkNruQ==
X-Google-Smtp-Source: AA0mqf409kRCLs15fCT6QuF9r3/Y5UfFTpHhWtaSGVJ2ihs3KhdXLmuB8UNDqK9RXjsd3IYNETwofA==
X-Received: by 2002:adf:e2ca:0:b0:22e:4ac2:aaa5 with SMTP id d10-20020adfe2ca000000b0022e4ac2aaa5mr18599351wrj.455.1669250906331;
        Wed, 23 Nov 2022 16:48:26 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:25 -0800 (PST)
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
Subject: [PATCH v3 18/18] arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:48:01 +0000
Message-Id: <20221124004801.361232-19-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0d47c5b7148e1..8a73f1b487043 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3528,7 +3528,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3619,7 +3620,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

