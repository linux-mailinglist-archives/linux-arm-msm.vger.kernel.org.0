Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC3A71F9F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 08:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjFBGU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 02:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbjFBGU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 02:20:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D6F184
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 23:20:26 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6042d610fso16350585e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 23:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685686825; x=1688278825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pGoSQNUEtENmXvmMG8wo2zJ9RR3w0uIozwV1kxs298=;
        b=gDt4AF9SEvF2br9Horn/IyrzILprR7JvN0btTWGBaSek7yUTEKSiKF6jZCyCm18ugG
         fUP9lBoBoib8swSQbP8rnppDZb1Syu8wSpeD40hQA7o8w/ZJ2JpWxi0H3n7vdt0p4/7w
         ZYADRbLcHIOSmlvuZhes4ldGYm06vFl8j1hvtv6+vPNr2rtQSqznMp17jAmnxQ0Po9lS
         SL+uz9Qs8pJdEW+WFLdinDyCVGuyabZd8CNOipQIQsKhzBjESN2LKLcAB5tPT1tP2f83
         HCoq7GR6TXUe6pOK2Oy2UdfA+Y4OQeyPuVe/4vKNq7ZcsO3wNn8GfUE5T0Tz+MbhNl5c
         I3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685686825; x=1688278825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pGoSQNUEtENmXvmMG8wo2zJ9RR3w0uIozwV1kxs298=;
        b=BJvSz8XFSSbG+lj0pr8XJcsCziJmBEO9LphV/Ub6wdCvu3PHp516w1XQtSPAZrkTxe
         xPYKwVASH2oPjSyKk0VIs3F9Fqjn4uoNUCvMuj9Nyimyydw5vrzPAhB7qkRiInMrWrqf
         WLQR/NwL3Vu5chX9/zNKyrN+QPzIUztp4Hi19nmTjQC2nQEtLvU1EihcxgqFM9wWgSyq
         OZr4NvH1MX8dJNK6/Z3qBOr/lWRPxc2Elk8sIO3iwiUZdJHH6Tk3NBRa/bvP9PY0ABFs
         HXuc8PTL2Rk1gUf0wm6f6pSm8Yep753ylXrLXDi0OUyXXJD7PV/c5zIMe4rGZIA5XW40
         OGkw==
X-Gm-Message-State: AC+VfDzgM+V/6jCAYtC3eeRXQX0rWW+j+lu15N+6rvDD39BRjMNXlaiB
        dGvq3eMCHqEwsnRd+C0XMkiHm9sgjmKltPzp5Vc=
X-Google-Smtp-Source: ACHHUZ4czJGb31gdf4WgrXbauiNzexD/RsY4uV4CvuH0EuexGhvrk/bf+yyzn42f6TPqy2mYDdhEsA==
X-Received: by 2002:adf:e905:0:b0:30a:e499:e5ff with SMTP id f5-20020adfe905000000b0030ae499e5ffmr3684220wrm.30.1685686825111;
        Thu, 01 Jun 2023 23:20:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c229700b003f42894ebe2sm4388213wmf.23.2023.06.01.23.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:20:24 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/6] arm64: dts: qcom: sm8150: Add missing interconnect paths to USB HCs
Date:   Fri,  2 Jun 2023 09:20:12 +0300
Message-Id: <20230602062016.1883171-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602062016.1883171-1-abel.vesa@linaro.org>
References: <20230602062016.1883171-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB HCs nodes are missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * None.

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 50a21062ea24..18c822abdb88 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3595,6 +3595,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -3644,6 +3648,10 @@ usb_2: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
2.34.1

