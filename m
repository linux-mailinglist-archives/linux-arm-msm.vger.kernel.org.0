Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A58744DE8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjGBNnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjGBNnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:41 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDEFE72
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:36 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31434226a2eso789533f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305415; x=1690897415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UH4lxIyJZ/66UDj2KyoTn9M7j7BtBKPALuXyhhsx3zY=;
        b=rTTs+dvFPBvLv56c2PzoZXwMLUNAwux8KQpWZOH202fmf8iQHlr6vk6Gm+F97yCDhw
         x82RBU6MrO0479H9ZkorZzCT5A1a+Dcp7SptrlBqdkbSw4GRoeqW0vMVRId52jrRXMHM
         MNXkLeBg0ePy3V2gkIbNViv9Lba0cdvcLP14sNIHyFer47Mae9CcRZFdD7OQbi6cEniZ
         vZywLp/vMHllsNU8yhZbev3iAUSO4o7fs5ATUlocGA+nBKpEQS/755kySin1gaU/+wCz
         e1al+o0BQ63NTx0X9BEBuyWJwoQLEdhccBkGlpt4B3yQQxrbUOUpfrVAwaKb5UcsemDr
         ETYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305415; x=1690897415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UH4lxIyJZ/66UDj2KyoTn9M7j7BtBKPALuXyhhsx3zY=;
        b=hAAgfrwI1kaxHTJ9r0muSWybmW7MLACJ/gz2B+ZaoF8dPbbgUx8CKdOUATvvmXTU4n
         Ag54EtEhOzKkGNiDgIBliG43c2ONf19r9u43IRCagMPxhxadkx9mvAyJzEhxKB4U5I/n
         WfemyKw/ULcK3IdH/MRtnPa7DH8mzb7hwR+bF40fOmhvkO8XANJgR7/4mJpGRBeRjpFT
         igcG1DnjlsS43F0SPwBE+LH+qthgFVoRWiDcPZQ26w/uetq6JwxZXdoYmoTrY5pfPDwL
         GqIRMkC9GWIFOcozE1nvenM8g90kvWB1kwRkhjyDsZ5aQhtjNAKUu/Acbd7z+2DLgnN5
         DzKw==
X-Gm-Message-State: ABy/qLYYlOzfdGtXrKCd5TlxTAU7ixOWz8XuMVc7+etXsqYLbLeyvthK
        PdfQDkgDLFNpho41hEsQ4VspL80C14E+UrQCDy4=
X-Google-Smtp-Source: APBJJlEprJQwnNOP499rvOpiD0JT0fgh3HWSvF0MPaaTU+L8HceuepV/nX+bUwmlbrAFwP7KkAn8kg==
X-Received: by 2002:adf:ee51:0:b0:313:e520:936f with SMTP id w17-20020adfee51000000b00313e520936fmr10220681wro.17.1688305415272;
        Sun, 02 Jul 2023 06:43:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 18/27] ARM: dts: qcom: pm8921: move reg property
Date:   Sun,  2 Jul 2023 16:43:11 +0300
Message-Id: <20230702134320.98831-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move reg property to come after compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 4697ca33666f..fa00b57e28b9 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -31,9 +31,9 @@ pm8921_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8921>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

