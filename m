Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21C356B532
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbiGHJRB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 05:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237475AbiGHJRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 05:17:00 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851DD26127
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 02:16:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bf9so12100743lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
        b=Qvbd6yifiD7/ct9rnP+XdYq/mCCl99B+aJHaeAXhKaEnxENrBeFJRLC02SYLV/leWs
         cbScdHHFfiea7RDco4fPwsq4v02gsxFeLRQzzzKBLMddg3ObtAWluWX5in9K9w4P6SAD
         p6Z+ixeeoQ2ALZdHjP4CKmNVpvTBbm+c1YlplTMePi8wn4B1JsCTyqpOtCw1IMeA3F0J
         cC5EAm/eX336EjRlTPenQxlRXmOzl9mBUnzL3LduU2aCC+hIU7zm8o3BIwwiPMhgEqdA
         5zO8aAMNAguydT+kBtt95EU4OHknpqgi0AUoMJSWg1m56L+8XpzPsJ0oOQOQLCTxgCXV
         x4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
        b=60tJhVwbfLDqjFqfSIbF73KkVsAWRwr2alEwx9tkV6cM+KrvXycEE7pU0PZ7IAZ/6R
         NYWWyetBt6vnoUrlAwncrAe4O9hJOsStnbOqR1tpG9Yvx/Z6D4wMGaNqZckpHAq0jwVW
         i7bYvUvDJIlaEGkmglc7BvIgNqRhZsfYnTMAoMNIfOO9R6b+UIHsjXNVCeXQCBjdb4e6
         /Oi9Uet/e986w0AE4lgFwlQIZNTfRbj4yl4EFSroGe4M/klX7W/XDAIyal8gUnVZtfSK
         0lGcldpbXJEcsvAm7hNHzytUU0uGtdZZhCdYVrnCNsCXbOKoWzYWNTR2FH3cBnidnuTj
         WcQg==
X-Gm-Message-State: AJIora91yYTjNzwUHt/GV+vfgO9Q7ZJS5Ty7iJRYkRop+m5Sw7pQZ8lq
        63GhtPMJYwgLf1nJF1If+yJABA==
X-Google-Smtp-Source: AGRyM1t/QzqWmwODLVYImGVEVUthKacqI1k2aDlIHhTOB68dInKfp5ZLKvXgoZMB7YCcJT9zNR++3w==
X-Received: by 2002:a05:6512:2213:b0:481:7d:5aab with SMTP id h19-20020a056512221300b00481007d5aabmr1814580lfu.320.1657271817910;
        Fri, 08 Jul 2022 02:16:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d12-20020a05651c004c00b0025d52cb8c0csm567651ljd.31.2022.07.08.02.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 02:16:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845: rename DPU device node
Date:   Fri,  8 Jul 2022 12:16:54 +0300
Message-Id: <20220708091656.2769390-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 32ad5972a642..7c66f490e822 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4265,7 +4265,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

