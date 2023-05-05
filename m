Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942716F7E45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 09:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbjEEH55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 03:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjEEH5r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 03:57:47 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF2516364
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 00:57:46 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so287774b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 00:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683273466; x=1685865466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASPdjssv+eJExTJTXyWCjTmaIC0fu4B7/nrk3o0mOEg=;
        b=JO3IyNFcmDL44htRKeFX9ji2ce7HYjosvtXJLzpdTuZX/HhgldZpNvJB9A+WwWFeBo
         BOwe4n9fLnLZdvhLj2LInmcQc21xq6CybXg8HNQLci/+i2oLiOkBFe7vNJGvzKfEGQdU
         7z2UkWMxfzjpt9MejWRihxEn4/MrxsFPfPCSRTLOUaghWJPGSz0o5QWrzG7rFvr4tggf
         PfTlbhFaRkwb+lvZhMSMx3kbl8+5QJ1bRShl7zZSbuYkIfsfCiBG8dPK2Znz+sD099P0
         LjJGjA335PHEWIbGdWV1xLA6fB7dAcwKvTCSyKPNeScO9dkrmrItM+FUys7fs1YcsTiH
         8gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683273466; x=1685865466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASPdjssv+eJExTJTXyWCjTmaIC0fu4B7/nrk3o0mOEg=;
        b=byDAQDQiYmY9z4Gl4nLVwoq9ZZgJrYhWcHncu2Ep0SNRwmpgFNRe9hx0zZ9COWVI3H
         1/b7th7AbO+g3zMVRBavQrKYQuNFE4ieHRbuTEgU8uMeA1uYt5hIFhu387qt3aTCxsR0
         m3HdSKkF50Be0d+k/8Q26mc4w9aGL74W4K/WEj9jDyEKgXJTM5hFuvVn0AlJGFY+ZhDM
         fJQCMXkV7b1erhE4W67MUdvJ1f1Vq8evDN/iU7M8dJDCLWt2zVMr+LvHrfODPk+fPlJX
         MMAu+aDwwUvvOPiNyH+bFfK9GKSTi1JqrLs69A75W2w82qPoBnw36QODalPT3j99aC0S
         T0iA==
X-Gm-Message-State: AC+VfDwYzziR2Edit33iB8N71it6qyq+yN1PizDzzIiyS5/UwGyADe+i
        I2y0Xkfx4MZig9fbdcRZiLcs09PrCEXWdPBM9Qs=
X-Google-Smtp-Source: ACHHUZ7kOB/JqKHCpHc6VTD5WpkBCzZ6f7xeWwCnqK0kZ7AXFH771D8TByr/oA5bNRnWUhUR4cm7XQ==
X-Received: by 2002:a05:6a00:815:b0:640:defd:a6de with SMTP id m21-20020a056a00081500b00640defda6demr1449038pfk.5.1683273465830;
        Fri, 05 May 2023 00:57:45 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id p17-20020aa78611000000b006242f4a8945sm988873pfn.182.2023.05.05.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:57:45 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
Date:   Fri,  5 May 2023 13:23:52 +0530
Message-Id: <20230505075354.1634547-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
References: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
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

Add the default and sleep pinctrl states for SDHC1 & 2 controllers
on QRB4210 RB2 board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index dc80f0bca767..504543ad1a1b 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -190,6 +190,10 @@ vreg_l24a_2p96: l24 {
 };
 
 &sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
 	vmmc-supply = <&vreg_l24a_2p96>;
 	vqmmc-supply = <&vreg_l11a_1p8>;
 	no-sdio;
@@ -200,6 +204,11 @@ &sdhc_1 {
 
 &sdhc_2 {
 	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>; /* card detect gpio */
+
+	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
 	vmmc-supply = <&vreg_l22a_2p96>;
 	vqmmc-supply = <&vreg_l5a_2p96>;
 	no-sdio;
@@ -216,6 +225,13 @@ &tlmm {
 			       <49 1>, <52 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
 			       <68 1>, <72 8>, <96 1>;
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart4 {
-- 
2.38.1

