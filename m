Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22788550E42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 03:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbiFTBDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 21:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiFTBDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 21:03:08 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF1710BD
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:03:07 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id k20so3851490ljg.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
        b=rsI0vlVTzQzpkdIbqpbf/7eqtUrBOHQcOmH/dDKHYQyv5w5BnNiuqXzOQGLDDGvNzS
         fXsuP66NJgPfGZbfopbYc87BIePz/YSODREPdzBXbhEJdIfIa0niozFq4mWuxf/whC7b
         Sn/Juaqe/sNT4rPQmcvOnABx6ltNxCPc+v0DQHCFjEqw5fMeiLN1t8kCLiRvZvw+U8fF
         l4ULH8eirH7Mo2IWeDTh9SwJ3DB9GFLDnDPzigXv4D9TggLZ2RxZ/V4ZrtM/De2MbVDn
         l7g5B3ov5FA9Dt06RaAnUetHRjDdOifIlcTDrkSvVabk6cglPvixLhS1uP2B8Z6RpVzc
         Sjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
        b=i5lV8NS1Yh5wV9eUAU43eU3SNuozd7nXedjjbuF/awI/zy9IyBtiieL3jXojvugMNY
         53Zl3vxiZQySOxmzAjTpCbT2vRBntwkeyiU+BMLlvIBORq5rMw+YeEfIkJr3HBVy2l2R
         Xc6mZmtqD9eRGSqsJDRTFVUiu3NhHRqgq+ssoEeLioIL9mSalCLY2KfqCvgmckQ/945A
         OTQ7HL+n0VrUWKOU0a7Xc6onjzkfPHErzMyzzJSiinmXJBJ/Edra5C7ZB3856W86r6lh
         1Pxy/3kj+hqR+7o2YVJi6mRu0zjR+O3zfctbwKSOGtsT5ABulTr07LFWNg/nJZw3bf6c
         npsg==
X-Gm-Message-State: AJIora9gqMw3aNc0lVFJMCR9RIVHlRZ5CATw4e95nSczCB2W/1sm7a4b
        oK1cZti5tl7OXgKk+v2US185DQ==
X-Google-Smtp-Source: AGRyM1tdp2xX6YI5PZBzkZwM6r8spgP1XYPDAPFEGuYiS7i9XQ32d7gqAd9JIP49mvbblK054b7l8Q==
X-Received: by 2002:a2e:a553:0:b0:255:9114:dbff with SMTP id e19-20020a2ea553000000b002559114dbffmr11077244ljn.208.1655686986055;
        Sun, 19 Jun 2022 18:03:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 18:03:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI PHY node
Date:   Mon, 20 Jun 2022 04:03:00 +0300
Message-Id: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock. While we are at it, also add the XO clock to
the device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..c0def6dd7f00 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -960,9 +960,13 @@ hdmi_phy: hdmi-phy@9a0600 {
 					    "hdmi_phy";
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
-					 <&gcc GCC_HDMI_CLKREF_CLK>;
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&xo_board>;
 				clock-names = "iface",
-					      "ref";
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
 
 				status = "disabled";
 			};
-- 
2.35.1

