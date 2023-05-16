Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD34F704735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 09:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbjEPH7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 03:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjEPH7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 03:59:21 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9980B468F
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:59:20 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so94961755ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684223959; x=1686815959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+CFxVhZB5eU9Nsbv/HdbFkKEux0Lb/FuWQS7JB25g4=;
        b=PCbqaSNYjEajsbf0iPXtoZYhteBZX6MyFCOuycYKp+xkoOLwG2YYm3HX094zTO6rwG
         YDIfKCQozTQGf875JtQgOFtYZF73KYB4Fqj0s7zswxrBGSF+VVAIJNbxULnH/cBsbNfb
         /XwWd/gioMMgeIQaXDwXepG3+EBuoDBAEGQYc0K1d0B9uAaHqcgusOAP7h1cgwjPCI4z
         tRlqAVTNuYJDujgGt1zEFzL3xQxcRvR4QufP9IGPTiXEKT0ab5h7VHcJCxxq/al+QJaF
         hxqlvatPx1QYB3toKPtuHQvR/M7w8PLt32/d35mrVWijuFbf6+cn7Y4SOZkFzDMuG4/N
         DaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684223959; x=1686815959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+CFxVhZB5eU9Nsbv/HdbFkKEux0Lb/FuWQS7JB25g4=;
        b=FNSzYn5+O9Ig/+tDDxY6cavPrNF/ODhqV6w+iEmWjpLrVB/kbylMrx0rLUBximdr3N
         NeiS92DlNo2cgg0v5Sza0aG3Lc3V0v1ddAl4+3Nfj5cw/7UGjnCfmk95R6uvS15oDUbt
         80uaDMkI1+4dQmxnVWvfY23tvat9iUAX1ayPAt8EU36ANePT2z1vOZAZgu+t0N7wXeY7
         sL0Q6CH/lyanES2MCbrgld+jx84KnfdK1q+U4PHSgKmFXCJ2oiAABhzCMgmtNFtn0xJL
         IajgR+s4Epp0KntoEpbekgdtbxrn8Opp/vlQKxp0F6pg/aIfNn/OKODsgp/Jbo9rse+K
         IlCA==
X-Gm-Message-State: AC+VfDzzjz8TjAxItg6Bj+zL0gZ3mShcuwxeCEN9cy5krNantuf0CQYz
        wHCkzVMMLuZZBUmy/gAvoSYXyoz3QOdReijCRhE=
X-Google-Smtp-Source: ACHHUZ5iIh1wRFvy/DgxhIk2km+qXHE6sP2hK2XoqecECQbTpzQuzlnxibm4PJ/ovFg5IlbVcL0+qA==
X-Received: by 2002:a17:902:c10c:b0:1ae:403f:d838 with SMTP id 12-20020a170902c10c00b001ae403fd838mr460357pli.27.1684223959651;
        Tue, 16 May 2023 00:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:62ca:2e52:e0c5:d0cb])
        by smtp.gmail.com with ESMTPSA id cl16-20020a17090af69000b002532d74fb59sm469725pjb.22.2023.05.16.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:59:19 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 1/3] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
Date:   Tue, 16 May 2023 13:29:06 +0530
Message-Id: <20230516075908.2323372-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230516075908.2323372-1-bhupesh.sharma@linaro.org>
References: <20230516075908.2323372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the default and sleep pinctrl states for SDHC1 & 2 controllers
on QRB4210 RB2 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

