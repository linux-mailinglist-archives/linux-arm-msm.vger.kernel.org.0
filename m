Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5C9627ACA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236111AbiKNKmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236248AbiKNKmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:43 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410761F62F
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:42 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d20so12548331ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwpc0rIre8uNuN1eJy4uWlPjk12XVzk5gyvKFTUgULo=;
        b=DZ/LwzMZf2PIHMWmeoXKs++TRDuiAWQu7+6fgTvJrNeiG2WvOJ/a8F5SRH1cGzCQn7
         ruxcuTpeC7YLCWSPtWFXkYtRBwzoTG3fSXaqFTeTpiDeQbK9w3JhziRAe7sKQOYU2S6y
         KBQx02fnt2+vqM+j2bBg5h1+cGjo7MjjIRAMAhpQRRmWLjivFg+3NV8n/+NaMgn29tLo
         QqDYAF5Q2ZxG5rzfF2ULflzWzHHtuV/MP+8ZoG5TtAaYcODL05Gdf8ZHPgsq0YsslmaP
         DkwxrqOBVmUFbeiyGwph4rEkRazwNc+AZWLduBmb2dnCix8sQYBNv5pPR7XYf7JazThx
         RjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwpc0rIre8uNuN1eJy4uWlPjk12XVzk5gyvKFTUgULo=;
        b=oyLC35+4IMhpcBB9auT3p1Qmj2QLRJaR7oPbvprAioRyfxkxNq7JIV6SYx3PJmGKCI
         841wnqEjBoIGPM/GPphh+zfk/fQwtX+XZGwvpELlDLtaaac0QPPtAOvb3fV3LqD/Fl6k
         1sWYkSitPkajEyPe2sd0fpW4nLqYaOEcsBP3CuzOWfWNV16pOxFE/piJfVDHG1AsoRLx
         xjFLYTO3W32t3Kb0BBXmhzT4jTbYK37286E3APG/2S+DzTQmm09hnofPRPzABfTLiBp+
         +k8C77jBUb4s2sh6LCicTkYv/1/YsL7TYpidOijOL5yHQ4skQ+Ppiabw/GH0U9Fln4ge
         2tfQ==
X-Gm-Message-State: ANoB5pn267j9xSEIdK4J4vPU7x7IG9q1C1BnO7Nf9W+BGaApZE8fb9Dv
        yvBF2BaoK4atsYgGXsojaGy8auwmiiVUlfjL
X-Google-Smtp-Source: AA0mqf5NaYl+cRLXDuVIrB/BACVOK/rrxmhegHtMvxWI8yh5jU6TNj5lFzRK9sLMcm0hdoGWmiMStw==
X-Received: by 2002:a2e:8711:0:b0:277:92e:976c with SMTP id m17-20020a2e8711000000b00277092e976cmr3679269lji.306.1668422561463;
        Mon, 14 Nov 2022 02:42:41 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
Date:   Mon, 14 Nov 2022 11:42:19 +0100
Message-Id: <20221114104222.36329-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114104222.36329-1-konrad.dybcio@linaro.org>
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
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

Enable QUPs & GPI DMA on the Xperia 10 IV.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes since v1.

 .../qcom/sm6375-sony-xperia-murray-pdx225.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 450d4a557df1..6a0f4c0bf7ad 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -65,6 +65,22 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>;
 };
-- 
2.38.1

