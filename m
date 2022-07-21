Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E5757C687
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 10:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiGUIjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 04:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiGUIjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 04:39:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA0F7E827
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 01:39:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d7so1160222plr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cThkGCtdmiVD8HST0EzhDMQ2qjKnc0qbzKVo4jE+GUs=;
        b=DgaEkOmk03HqRk9UyvJefPMfG0oQHCwjpI0UOvE+/u22fReCzHt4VX0/zsk4J8nVHv
         +qZsGVJXK36aPiXNRqdhNcKlO57eErYYFoRgaqcEme4pO09G/GDs9Iv38VakUPbPfnIs
         +qrxaX4pYv6e6Hwqd4dr9KOqCldkfZ/gGjGxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cThkGCtdmiVD8HST0EzhDMQ2qjKnc0qbzKVo4jE+GUs=;
        b=Jxnuu9a58Dg4ANGyOb6b1Bizt5Lwrs0DPYBYRMvhLrC3H+8maNnh8qj8XLkO9CIoEJ
         mdPVAFg80x0HHP12J0KdCBpuSIozXiQ1mrSPAFHZg3s1ZCI+03+KHOh8Dw358D0MrJz9
         X86qD/KgaJeyGrrrE82KDkz1p/JHzm2bPV3QIYh3Q9FrrE715FiWJoeWplBnZyLg6C83
         btc2VT5+LSY6+AmP0XpyPbaWhREwlH5tdCaAa7ynhHcd8zLTyd+T3vPpe0V6hY5SwI1n
         0Ooy3ouVOjsLWgMzvIvECrSQdo1xiTIiKITn3GvPRtVuJ3Hvew2OZauierpus6AmprtQ
         Anzg==
X-Gm-Message-State: AJIora8ByRqB8O873G8dCOG50VU9Q7pw6S3+r7KmRYdcTAN7tmHXFUGX
        9Xo/MowUBm3yDN7kSlZgQkKK0Q==
X-Google-Smtp-Source: AGRyM1ujZ06QWF7zySjG8/ejcm0b83yipgO5/xc8Aw3PzzwuzGno4gbtnf8O31SWcvDoNmJ+0RX/9A==
X-Received: by 2002:a17:902:d584:b0:16c:9ef3:17f8 with SMTP id k4-20020a170902d58400b0016c9ef317f8mr39360097plh.149.1658392740819;
        Thu, 21 Jul 2022 01:39:00 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b0016cd74e5f87sm1025943plh.240.2022.07.21.01.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 01:39:00 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v4 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Thu, 21 Jul 2022 08:38:47 +0000
Message-Id: <20220721083849.1571744-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220721083849.1571744-1-judyhsiao@chromium.org>
References: <20220721083849.1571744-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disable the pull-up for mi2s1 lines.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 57bacca6c5e1..67874749f1a8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -632,6 +632,21 @@ &dp_hot_plug_det {
 	bias-disable;
 };
 
+&mi2s1_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_ws {
+	drive-strength = <6>;
+	bias-disable;
+};
+
 &pcie1_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;
-- 
2.37.0.170.g444d1eabd0-goog

