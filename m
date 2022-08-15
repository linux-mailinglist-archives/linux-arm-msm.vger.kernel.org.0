Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01422592898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Aug 2022 06:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiHOESP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Aug 2022 00:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiHOESO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Aug 2022 00:18:14 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053C863C1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Aug 2022 21:18:13 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d16so5453715pll.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Aug 2022 21:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=E+SbdWKle26nrNTvjrwjORRMK5B3fUHqQoLgOh5gagc=;
        b=YCiOrOI4t57JroaK+DvgxUd40PqFb566csy0KZpoHxIAjL/vPPk6J1m/YLVAQJgafF
         MBc/BEm1UbTvtrczItUPUi4//hLIjk/GfM4ooAEfFoZVAo14khCxzIa/7Xg2+FZDNVLe
         Wc5wsr2o66GeVKuXZe7WjOqecyDFXKE0pAno4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=E+SbdWKle26nrNTvjrwjORRMK5B3fUHqQoLgOh5gagc=;
        b=4Oy+trQU+yLn3qctm6LJ05FtaMQb6JJspMKTXwYCgzVEsmju4H7Qw2DGSf7fRRRcb7
         s6kSNid/ANdmHdYegdkfgNt8AvnPYUg3nEi/qgzrQBpx6qKQKrSt9k6XYCwTmqz1tWYJ
         1XJahDL8FxDrjCZhpVtvuiHH7Scajl7GXoiSYhnlHG+/634JBQMGTt8Oc/Qjn08cTml8
         /ZuUCI/QtWfMM2jvn7VcJ7IwOqMzE8riDwadbvd+OVwScE79b+ZMZ7+47iJmxwIeS08s
         S6Wi/BhKLPyU2gkJVt6Pzn1HahugmnnHNi/uytZyljHq4nj5EmQrgte63/kKLIHvY1sR
         4CYw==
X-Gm-Message-State: ACgBeo0Awe2vCAmL9Hn37YEqeH0Nlbng7cwgGQfNXe/6X+0cXoIDf2bJ
        sjQdD3/ZA87b2dEuw5dqlGtQV7siVDvJQw==
X-Google-Smtp-Source: AA6agR6GXAxP7HE9fOcv7/Zk0pGt69h2rxMcVW4JHZ34d0rGzZis2n5ZicCc9p418kS+2Tm2EbU2Cw==
X-Received: by 2002:a17:90b:3807:b0:1f4:ecf7:5987 with SMTP id mq7-20020a17090b380700b001f4ecf75987mr15932324pjb.13.1660537092524;
        Sun, 14 Aug 2022 21:18:12 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0016d2d0ce376sm6114433pll.215.2022.08.14.21.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 21:18:11 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: sc7280: Use "PP1800_L2C" as the DMIC power source.
Date:   Mon, 15 Aug 2022 04:18:04 +0000
Message-Id: <20220815041804.583181-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use "PP1800_L2C" as the DMIC power source.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
This patch depends on:
arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]

[1]
https://patchwork.kernel.org/patch/12926099/


 .../dts/qcom/sc7280-herobrine-villager-r1.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
index c03b3ae4de50..983defa7c76d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
@@ -12,3 +12,31 @@ / {
 	model = "Google Villager (rev1+)";
 	compatible = "google,villager", "qcom,sc7280";
 };
+
+&lpass_va_macro {
+	vdd-micb-supply = <&pp1800_l2c>;
+};
+
+&sound {
+	audio-routing =
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb",
+			"TX SWR_ADC0", "ADC1_OUTPUT",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_ADC2", "ADC3_OUTPUT",
+			"TX SWR_DMIC0", "DMIC1_OUTPUT",
+			"TX SWR_DMIC1", "DMIC2_OUTPUT",
+			"TX SWR_DMIC2", "DMIC3_OUTPUT",
+			"TX SWR_DMIC3", "DMIC4_OUTPUT",
+			"TX SWR_DMIC4", "DMIC5_OUTPUT",
+			"TX SWR_DMIC5", "DMIC6_OUTPUT",
+			"TX SWR_DMIC6", "DMIC7_OUTPUT",
+			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+
+};
-- 
2.31.0

