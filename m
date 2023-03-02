Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D126B6A81B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 12:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjCBL6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 06:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjCBL6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 06:58:32 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4E913513
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 03:58:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id g3so7387196wri.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 03:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677758274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53i6n/4N8iPHrAE+4akf4+FY/Eqzip/AN+jA8SQFls4=;
        b=HVXAXJS37D1r4M20G4fME7mQhMV/po3gK33mAgGd9ONtA1KJIUHhUUYz7SaUJ6JKan
         IYYZDZ5wCctvMCvxmUQGx6iooPIXQFxc8rPZOc5lFqLSiF1pPfoHaIVSd1ZhtbxVFoaW
         96FDNf3QSRrqCdrQd8Wev47LdWAHKYJGiGXzgEr2Jp/E2P0JhAB8E0NedQ9TW4wXcBx4
         IB+3B12W/AK2pPxT2lq6xI1bQ/SMiWslE9uXvjNLpfGT+2DY7a8Y56PWF3xCOyI/K2jL
         vLAk8GpcurSNSbo8q9k4DE0gX7uusTyf88CgnXbxgljv0c/DsuTiSOLYT8Ol/mz3l9Qb
         LcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677758274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53i6n/4N8iPHrAE+4akf4+FY/Eqzip/AN+jA8SQFls4=;
        b=IjsPr8ZTzI3gq3aFQkVwAAM1yTDrAW+FWBAng5PNZKNz2VL3Ek+4kBQnYGNEQJGBT+
         +DeSlG5Dv/f+uM38OUenYW2du5IoUJHnQGioWA/VXORwGDgKWmhMGdnm8QNM4FHre10K
         O2aVRHnf7WTj50X3+tUVUYQ6WjOi8VHLz744IBmjwMXKXvFtA1GVIMJNkRMpMaum2Q+5
         IYgA5sJfIt5ttJEpvNvPvNo6OVocPxWtwViJWDESST4FdfiC1xq7f4PKGAlzPZy3zOUs
         N6uEkx1BdWibQUHlxAmS9S42ZF0y23/uFOj0sEJ3oqrMgpuS802tqXx8+xVBCVtvmkRJ
         zOkQ==
X-Gm-Message-State: AO0yUKXayvPxauPHBG+qsiDkWHYxNHJvJwW+mueTXRjXvMSbjNHLtWAR
        Bh+X2qGJOU+XBc6IAh6PmmJpfQ==
X-Google-Smtp-Source: AK7set9JGhaVMVq1Aun7eorGLllXN0G+3ZY9aQjvAJK+0twIdWlGMLKeCpK9OMroCb5jMJzggb2DpQ==
X-Received: by 2002:a5d:5141:0:b0:2c7:1a96:efcd with SMTP id u1-20020a5d5141000000b002c71a96efcdmr7390210wrt.1.1677758274590;
        Thu, 02 Mar 2023 03:57:54 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b002c5526234d2sm15298209wrs.8.2023.03.02.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 03:57:54 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp-x13s: fix va dmic dai links and routing
Date:   Thu,  2 Mar 2023 11:57:41 +0000
Message-Id: <20230302115741.7726-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
References: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
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

VA dmics 0, 1, 2 micbias on X13s are connected to WCD MICBIAS1, WCD MICBIAS1
and WCD MICBIAS3 respectively. Reflect this in dt to get dmics working.
Also fix dmics to go via VA Macro instead of TX macro to fix device switching.

Fixes: 8c1ea87e80b4 ("arm64: dts: qcom: sc8280xp-x13s: Add soundcard support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d18d405d1776..89230112e288 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -933,9 +933,9 @@
 		"VA DMIC0", "MIC BIAS1",
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
-		"TX DMIC0", "MIC BIAS1",
-		"TX DMIC1", "MIC BIAS2",
-		"TX DMIC2", "MIC BIAS3",
+		"VA DMIC0", "VA MIC BIAS1",
+		"VA DMIC1", "VA MIC BIAS1",
+		"VA DMIC2", "VA MIC BIAS3",
 		"TX SWR_ADC1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {
@@ -986,7 +986,7 @@
 	va-dai-link {
 		link-name = "VA Capture";
 		cpu {
-			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
 		};
 
 		platform {
-- 
2.21.0

