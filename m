Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABA254E7685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 16:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359755AbiCYPP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 11:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377372AbiCYPOP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 11:14:15 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D577065167
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:11:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y10so3336154pfa.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AA0RIphE1PJLLtUanm5oTog2K49TCs//CGuoWg4e8Hs=;
        b=hzanffi7zrkFiMc7YDN8omOPXMSW+M0ZOEfvqWuXPxCrcNdflUTtNYfzG6eR5hMpsr
         CWFF/nfWfOH0KtxqtX+80udGtxAKFMABFLKwqvI+U1QD2fFIYpTf3QyyKOQ8SSJilGmI
         0x/CLU0IR8aNmQdf2uzRTG/1wjrnmeaeG7eBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AA0RIphE1PJLLtUanm5oTog2K49TCs//CGuoWg4e8Hs=;
        b=Uw3jyQJYTErvvJeU7wnweFYV/d1xUhgo28dhucowUCqcv4tqsfaFzl0eux0h0d+YXg
         1PXvcQxEEk6dY9Sb4qNFT30OqW8ZS1yHSyB8xRAgf548/qdyG1g6WEwDz/WfD0BX8xpj
         L4IXewUeYQSU3z0P9mMYsJnHO6979YplqP83EOAdOMcUa1poL3SY4md+uxyBdCJJqJ+e
         kZya9WPYdcVQXIIPh8ozh+mUk4K8js4rBzSbAhh5hJW5KMrF2SvYpvQW91Tb53DgsQRF
         vmTgHLJi7eKPDdbH1rmSMQUjY48XjmWCvT3MrxcIZ0fIgpOBvYBzFGEc3zxBMtunMXEo
         kScQ==
X-Gm-Message-State: AOAM532Ol1CFYIwVCeQ1gUZbrTOmrojU4hKeShGO44+Chd2s1rloA6jp
        kCF2ik6aLihm3iXW+ti36XSW93KtQd2Z7X7GrbM=
X-Google-Smtp-Source: ABdhPJz3TexA8bi1jVv6urswawRRrftx4duACSg9G5izC8NbIevfzzjsI+39mHC+vogvBFcZz2ffvg==
X-Received: by 2002:a05:6a00:9a7:b0:4fa:ebe8:a4b3 with SMTP id u39-20020a056a0009a700b004faebe8a4b3mr9621244pfg.11.1648221110411;
        Fri, 25 Mar 2022 08:11:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:c95f:cacc:f8c:e361])
        by smtp.gmail.com with ESMTPSA id o15-20020a17090a168f00b001bf66741097sm6399479pja.16.2022.03.25.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 08:11:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280-herobrine: Audio codec wants 1.8V, not 1.62V
Date:   Fri, 25 Mar 2022 08:11:05 -0700
Message-Id: <20220325081100.1.I9f06fec63b978699fe62591fec9e5ac31bb3a69d@changeid>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The L2C rail on herobrine boards is intended to go to the audio
codec. Let's override the 1.62V specified in the qcard.dtsi file to be
1.8V.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index dc17f2079695..c2075f3e7c4b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -339,6 +339,16 @@ keyboard_backlight: keyboard-backlight {
 ts_avdd:      &pp3300_left_in_mlb {};
 vreg_edp_3p3: &pp3300_left_in_mlb {};
 
+/* Regulator overrides from Qcard */
+
+/*
+ * Herobrine boards only use l2c to power an external audio codec (like
+ * alc5682) and we want that to be at 1.8V, not at some slightly lower voltage.
+ */
+&vreg_l2c_1p8 {
+	regulator-min-microvolt = <1800000>;
+};
+
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
 ap_i2c_tpm: &i2c14 {
-- 
2.35.1.1021.g381101b075-goog

