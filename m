Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5148565209E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiLTMhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiLTMhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:37:03 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BA61A04B
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m19so8583722wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
        b=zdYDioXderfwfcpoqEGSszKKxODISIK+eKBQGtZazVtj03hImGlDylU1a+r60Dr6K+
         pjoH9kaVjyulD41ZfMC9FuYp+wIXMBfi1szB6Fr3e3hOKh0nqIUPbgOLdnQZ+GnrvLTY
         kLhPZJIFez08nw6BHtEz8yYbSQ1SI4ugFS7pcAL8ZHB9HBZBBADtKjYAPVlU98fBoWVp
         gDPn6XCWO3UMYNK7sY1Gs+zO0hg0xHgjBiQ7Uo55RO8N/5bt4VDlyIssqT038bPRLfnh
         yY7YK2BEuq/4diuvujMDCfwvaxwZMDZe/m2jJSmV6uJk6KELOygUGLJUqgsdkVYnlzYs
         F4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
        b=vfGqodJZ0McwVw1y7t99hnPOVRjr6+BMxV3a1itQxEtM078ojOyNndqr3xkriApZaR
         ZpFsPE0qefo2fGC6zncEWTT7d04T6WK9l9laBVEe5UxzNvjuMiBDFQeeWnC7isdpB+eC
         s6GjA9JAI7OZKzYaYNKpWLz5msEDoqMabARszg6bHpGXMDudlAsDD9HwaDiWiM2sQatG
         Orn/diB2biokaFKCKIYh0SdUy8DacL/jmjs/DK2yXliCR+3109m70aJwlwS29NIT8mTX
         EnVjmqZTqg6Q27deGPC/veV2jJvDJUUXYAwfXBKIXMk0H5TclLCF/JRYICW5HOsuSaZx
         Ck0A==
X-Gm-Message-State: ANoB5pkXVzsbmnfcWHkPoe4U7FsLiv9ItD6F85y+Gt5hV4PUFStKWcdp
        J/jDuqe+cuUoJQ2ss9ekYbrZKiVbpw09RlVXzns=
X-Google-Smtp-Source: AA0mqf6VMHNvsxwSU1zPalndDOSTwMiH2KTdJZPfExa9hIaCyC9VM0n9H7myjiH4rhd1cZpyqvVTDA==
X-Received: by 2002:a05:600c:253:b0:3d2:17a5:17fe with SMTP id 19-20020a05600c025300b003d217a517femr28733739wmj.18.1671539815933;
        Tue, 20 Dec 2022 04:36:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:55 -0800 (PST)
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
Subject: [PATCH v5 16/21] arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
Date:   Tue, 20 Dec 2022 12:36:29 +0000
Message-Id: <20221220123634.382970-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8a..fbd6a7b31eac2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3022,7 +3022,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

