Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297D455D9EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345368AbiF1MFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245127AbiF1MFH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:05:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5EC2FE75
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s1so17344182wra.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xyE1UAgMW31jME2wx6Txhct6npxMtKTSOZN3VWFZNHw=;
        b=m3vTwS/dP8Fe6wpZeS/CQG9ugsk3/odZc3WP+Bfsr3fKin6P+AUs3nuxKWP+qOBk0k
         Ofisb+kLd0uFcPR3clSCtQwkzAFzITwoh3AgAuAEuDpvpijcRVlaf9O9j9EB7r9zW9b5
         vS8/IKQr9Vgqd7dfRGp4frugIvbrnZ0Yu6BeafktCNdj92hMX7G/Vr2TK+HjuT7QuKFO
         Gw//2e/AfNzs2rma+RFnN5PcekzAKGkt+mmqmiKegpOa+8GtNLTSulPEcI233ZhWK6ye
         81FWM0JrwlEqX0iG2s4h3lWis25+gG5YRtzfys8bLC73stUm1iBO3M8rL6WoH7/8VRix
         biTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyE1UAgMW31jME2wx6Txhct6npxMtKTSOZN3VWFZNHw=;
        b=aUyQpPN0Ot7I9361p/PAvnLNN5G5HFvNt2yPy/a3aEc3j1feVnrfGfHStgKB8zusos
         CKACi5AolMwlGw4NkLzwQgnktR+cAq07bks2p7Pb5bQHE+6cJ4gzrYhtmuDaekBH5W8n
         aP8C5CLonlXIQTXwFFOPKvTlr4BNFmIwVVVmX6oriA1vfkjXqCnawSqlT3uFpBfHjsmc
         vinuJAUWPD2Tc8lsYKnJbMMu/XgC/h9bEYeVuk03oURlrsptMIMYL67BbAVG9SMkeGat
         U+Ykb18hyzn7P5fEyFE2L8vkPkDqStqF4+M73RUFGrl1huEeM/TsXPvPyc7VMuTX1g60
         450w==
X-Gm-Message-State: AJIora+PUrho1iruDOxCQr41seB0z31uuaQiGtmPS39pt9lfk0iWN6YP
        sqVXzaGByP5XFmLAFYf0enKa4w==
X-Google-Smtp-Source: AGRyM1sIGgkLsPSHOSBLRUUGIuQR0r+aLMYB45/sEFZDsRlArA/bkN9r0zZG2vSMYwT6ccthSxkwZA==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id n5-20020a056000170500b0021bbcff39d3mr16525829wrc.502.1656417881302;
        Tue, 28 Jun 2022 05:04:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:04:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date:   Tue, 28 Jun 2022 13:04:35 +0100
Message-Id: <20220628120435.3044939-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
References: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 05472510e29d5..a101b2871d5f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1422,7 +1422,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.36.1

