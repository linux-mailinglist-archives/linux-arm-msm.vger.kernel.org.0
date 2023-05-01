Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690A46F304E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjEAK6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjEAK6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:58:47 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6A81B5
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:58:45 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aaff9c93a5so2492025ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682938724; x=1685530724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZJiKllDLItsVzxcb83bHoOkbBzdRY7lgMq5/jA57JA=;
        b=DX4W5o6b4PrQ+p3HT7nrCoJI0e/LN+NRyrQ0OmB6UgMctDiA9oBPAB7lu0xkunK68m
         k6CnYzurg60J+iH61Va0au3DiQj5v4MT04jFWHbhDpk0n3yV/YJYm9zmw6My8r340Xav
         GXNILD+SvP0uqtuYhMmOCOk0CMmBoNzmoswauN/UTp2TrDxN1n1vlPxyo91z+wfIMRNY
         r6E4jaIQfWM6/B6/Sl7H8kmum4WkfuOuiRbbhOfzT1wWtFzhzwstMmQC+tr6CL0OvrQm
         xX7RQrkoVXubqXNGfZegVSOVxlbDAle0o/eiWbdu3+/QBQ8Cnu+ir2tKT97M+QglnX3J
         nfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682938724; x=1685530724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZJiKllDLItsVzxcb83bHoOkbBzdRY7lgMq5/jA57JA=;
        b=CKAi+gAADtV2hubll1nSREUTi4535FxTQ8DY+KF02lyxRZtS1Xd4uobnTkXo113iyt
         wHfzj7o+tSrjblbb82s3tWnHMok+j5gaP7u0EtJLUJXBSpfbLKpCW360cWH2mgiY/32n
         EY0pfBwYHjX8udiqAIN/ux93Iacs9ww7Mx/35GVB57CJ93bzp8et40Kr3txhtHmoPLBS
         OkAyhk+FacZs0ZvFOt1JQ1hWF50y/kDCe1gJPzZXZLHPzutoblSNusrVVsLiYwnXO26A
         IW8OIhIumZ7kZCNNDZQ1N4iziDdP4xqZeZ2mauwWSsKXkuLgvxwaEDglMbJ+2gxcdLji
         KIoA==
X-Gm-Message-State: AC+VfDyGuyWmhNseLYBbwXf56Gzz+sE1LUaWpobEqETLqG/NikNzLEQz
        4bslDJS0dIIrrCf2ibTCiNwIZcbg0l8JqSmhRI8=
X-Google-Smtp-Source: ACHHUZ6G7Ey9aufkK3qYq+UCXc5fkm16hoPgraeAg/qAkSi3+QpT55VbGj912UpCaLOPsIAgZDbRHg==
X-Received: by 2002:a17:903:1cb:b0:1a9:86ca:38cd with SMTP id e11-20020a17090301cb00b001a986ca38cdmr16722680plh.2.1682938724678;
        Mon, 01 May 2023 03:58:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902849800b001a50ae08284sm17569516plo.301.2023.05.01.03.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:58:44 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
Date:   Mon,  1 May 2023 16:28:30 +0530
Message-Id: <20230501105832.1185477-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
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

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index dc80f0bca767..5a5294cc6e45 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -190,6 +190,10 @@ vreg_l24a_2p96: l24 {
 };
 
 &sdhc_1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
 	vmmc-supply = <&vreg_l24a_2p96>;
 	vqmmc-supply = <&vreg_l11a_1p8>;
 	no-sdio;
@@ -200,6 +204,10 @@ &sdhc_1 {
 
 &sdhc_2 {
 	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>; /* card detect gpio */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
+
 	vmmc-supply = <&vreg_l22a_2p96>;
 	vqmmc-supply = <&vreg_l5a_2p96>;
 	no-sdio;
@@ -216,6 +224,13 @@ &tlmm {
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

