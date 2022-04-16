Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710025033C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiDPAZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 20:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiDPAZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 20:25:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB7CDBD29
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:22:46 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso12890897pju.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2wdkBWEu7t1Zq0jn+mQej628h38Cnn5GCNQKuo9zsU=;
        b=BjhbDcOMPU/aW28tUnjXsVJOburtQ7hO4cM3HGkZOaSnaMHm5JuCCNvLputhWNwrdU
         IQ6OrPhACwDMSI8jEgb3xHjBldIKqo3B6R4sxdYDlX/Qay1t67eO49zPbwtSoOa+XyBd
         MnBoALfjxpa/acEyJzA+ilnFMrvc8UcOxM4mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2wdkBWEu7t1Zq0jn+mQej628h38Cnn5GCNQKuo9zsU=;
        b=yYSikyNhtYXyciK6WMsY9Adq5CV7OZh1hFCV39nerO7tApDH9fd3UpgbeLAwDu8n6l
         PodbqPO2KkQc1g37ALnfdz1fXNdCPvjBf/2rTitRvxhRif/JWquUcQxSBzlm+n8PuNRU
         mEeaQm4dkqM4Ten7KueQyYlq6WvHc498kbE9/YaPjzq2yLer2Z4HgCj8RQThyESY+Nw3
         mVeKeqQswA+0nvG8jyRl/s9OW9aKzrmFhzP9P7Pe7b06dRlUtuPS/Rc9YBTAoXyubM/d
         66YKuuI8OFoOmLUyaAHyVOny+fNugpQpHkKj++H8x8SdhUoJ9RWKQa1aWeoGRj1TcCIh
         WCsw==
X-Gm-Message-State: AOAM531JRLG76+lF3PET/v7ecxmnDNxnEHanvTcMPuQQQH4+soQs6/XE
        6PUbH26SHOk3Qnppzf9QPz7r9w==
X-Google-Smtp-Source: ABdhPJxOMlZ+OwQHco4QYHzjp4mkac8g9pTG5o4/irnhPWad6g+JUwkTS+D1KyzVZ+3hm4sC9H7clA==
X-Received: by 2002:a17:90b:350c:b0:1c7:5cee:3946 with SMTP id ls12-20020a17090b350c00b001c75cee3946mr6755563pjb.42.1650068565685;
        Fri, 15 Apr 2022 17:22:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
        by smtp.gmail.com with UTF8SMTPSA id 13-20020a17090a0ccd00b001cb8984dc28sm5829592pjt.22.2022.04.15.17.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 17:22:45 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd
Date:   Fri, 15 Apr 2022 17:22:41 -0700
Message-Id: <20220415172238.1.I671bdf40fdfce7a35f6349fca0dc56145d4210ee@changeid>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the two SAR sensors of the CRD based on herobrine.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index fd6eadc8581a..b06f61e9b90b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -49,6 +49,18 @@ trackpad: trackpad@15 {
 	};
 };
 
+&ap_sar_sensor_i2c {
+	status = "okay";
+};
+
+&ap_sar_sensor0 {
+	status = "okay";
+};
+
+&ap_sar_sensor1 {
+	status = "okay";
+};
+
 ap_ts_pen_1v8: &i2c13 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.36.0.rc0.470.gd361397f0d-goog

