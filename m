Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871C7636F64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiKXAt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiKXAtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:49:10 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708D9105A8C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s5so269303wru.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
        b=WHSkFhd8P6NIFTO/TmkR0PCswxgiWFuVrZKCSmlGOzlFxOKqt4FqfzmgP5zd6SiH2K
         GFY0S+TA573e5woPu1rXu7vCmqZQFF39GrFVEE8ZX5+LAhCE6mswoLo+pHnV26nsVILJ
         i3gaUGQigo5f2vMLA3Q/vT7gWZqyRUrwlTtPsSwRtJuI0Vz2LU7jalxB58H+4iCs8cVN
         TQT08uHcgqK61KhOFDlE2KLX5OhW8vpUDYvR28Yf/ePv1MzZz/ybLTAUnExhgLPoMjdC
         4sdZLeREEhboBAySqxUMEI0ITXQGA9OWshi6A9QotY6M41CE0zADOdsGQ8rB/RD2ofcv
         CJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6CoppLmCTxX9uttSJKGwFNEqGwRPNJKx/ekxUEKy2g=;
        b=SDRuJbHJjgTlrS8kBqkcl0eA5Yk+fNHNRsZcquJEeFkVPD91lHh8+T+M6rKdMjvEgf
         qbkAlfxie8bq4OcLWkMN5bzuzgfgpMDVS1E1+6lXItCfYVh2toI7uVNoqzPOBEQ8ayd/
         zhyj4Q6QsqWoQY0KnaCIAhxZ1GM2ybpTUUpxTTx5VF3kdjjS9hPnd+c/9H1ulbWipn6o
         VV7VsrzC3RApag/iMJe4RUQDZHlEz0/QdohLBm4u5qcog3WJ8wEmgNsTe3FcfpXIH3X5
         Xl6rxBCcvFwIaAb2hLjg1C4gGPRjNa6x5ZEWvz2ogghmKyOOjZPnxMOeIqb9uCCjZmkc
         vstw==
X-Gm-Message-State: ANoB5pmgSCsZottVI5MLwcPBqi7ML7gxJbTd4LRKJ3lsRjkY+7sOfbvc
        fiyubCmePMRXc+pIFz503Q/eME5MVwooTw==
X-Google-Smtp-Source: AA0mqf7EcF6R2JOdSaf1aitN7e8H8UowckCjABWzA7rN9UnA1eNxikUdMQjWTC0QhUcL0wbki1mCTg==
X-Received: by 2002:adf:f692:0:b0:241:f918:703f with SMTP id v18-20020adff692000000b00241f918703fmr1272883wrp.573.1669250902816;
        Wed, 23 Nov 2022 16:48:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:22 -0800 (PST)
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
Subject: [PATCH v3 15/18] arm64: dts: qcom: sdm630: Add compat qcom,sdm630-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:58 +0000
Message-Id: <20221124004801.361232-16-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm630 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0e7764f66b104..905ddb57318dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1581,7 +1581,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm630-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

