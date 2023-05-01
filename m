Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756AE6F3946
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjEAUeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbjEAUeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:34:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87692D55
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:34:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4eed764a10cso3625574e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973250; x=1685565250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAxH9rWCk/bpezJ8GFL6XWAviGE5bfFxt6Nmj/QILfo=;
        b=UoS+O0XjKskhozCJF1BzTkblrM3ESP4xbCUF0PQbD0VoLqygD+YHha4IKbqiIdNE1+
         3iLwyFZwVPaVJeTuhgJCExE16CkAdEpeefmYs8AHgst3aQt70erCwi1uSI7CGa5x7lO5
         cquQ+n2a7uFPx6UbKyHz0YrsnX12JikCCvWld+whFNQR5NZfOXyRzawJDcyMFGjMHp8x
         Wjjk9WF4cXDZTDwZnniAWCW/Xzy6ImuWmbhwFCU9gi7aEkS0gDDhrrjl+5BX8AUxxj/l
         G7p/JV5QhLgYoula6BXsQuBTLElszZtl4gZVlhBdADVAsSW2j37owjEOlyyqZf5S5u3p
         rI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973250; x=1685565250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAxH9rWCk/bpezJ8GFL6XWAviGE5bfFxt6Nmj/QILfo=;
        b=USimcakDw39wUqIAlQqEAyyW2FyLpr1LTxbSr8xPnLtPyIZRF+osdl8MEyhukII2eE
         dKPGLYIVUk6VF3gWuL2VqzjmvM9evfyJgZAoB0uUFuV7AJ0PMK784HsMYFOp6ty4tZ8B
         uIc7dEQrmCsRjA963od4VzuMn8teLlGffJI8dzHLc9Uw103d+eIY0H+Ksf8Hpl5NvPLV
         8t2jHzPFTvJG31AZn1jDzrZ5AZkTQw0bYtH0wrwyxqev1lWRpiL9AZMcD8juNJMnRsUq
         kFaRqh3ZQPU4cs/BGXiAzde3N++fYygNIw6sIbhWTw5/SP3YuJHPd1rxFYOZXiaa4J48
         ua3g==
X-Gm-Message-State: AC+VfDwwm+BBV2Y2z7r5o/lHjXoIuhbpBW2z1aVSUpNcXtXocuIQ7ydU
        nacjtY+s/LKS10KejDrSqyw0gjF/3b1KTRmC0wQ=
X-Google-Smtp-Source: ACHHUZ41tcIugchhXd5BECUV/v1wRfZTDaMsvNUst3/lnUFmjxG0o/tDSE0Z+mvNrs1udgvr2VTF0A==
X-Received: by 2002:a19:f80a:0:b0:4ed:ca97:2feb with SMTP id a10-20020a19f80a000000b004edca972febmr4557562lff.61.1682973249915;
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
Date:   Mon,  1 May 2023 23:34:00 +0300
Message-Id: <20230501203401.41393-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
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

Specify clocks used by the LCC device on the MDM9615 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b40c52ddf9b4..556abe90cf5b 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -39,7 +39,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -113,6 +113,20 @@ lcc: clock-controller@28000000 {
 			reg = <0x28000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&cxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.39.2

