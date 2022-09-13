Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55B45B6771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 07:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiIMFlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 01:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiIMFlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 01:41:07 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1895E5721B
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 22:41:03 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id s18so4764567plr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 22:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8AtiPn961hyTNS5WiljHXp2a6Co17TPPB3mTZga5cXI=;
        b=vx7X7E8s+iT/6ZqT1dFcqCc7eY8E9waW88gDBxfxGs2bHduhMXO9fJY74ITdPMY4S+
         Hkl0KpaU+4wjRtGils6Inmm7uZljKQbZBFObKt66SzIPTvuQhqr8QBy/4p/hLX6m/9E1
         d/wpuSmBAPKf1ATrvxf+pQuQvjxtqGbC3AbYQsdUmD7iPsl4cW4AsMte6tEpiiTKHopU
         GY5SQSaDS+THqgGco2x2CbjrB/lcvdSNZrsDQaORDiISOrbi21UtCk4e82fNYyUchanZ
         UIIfNVOGRQGEfbQHnOr48mmACCPt2JK0eVXGO20Jj5HOP0+6TOv9WwSzzulk0LwhjjPE
         cibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8AtiPn961hyTNS5WiljHXp2a6Co17TPPB3mTZga5cXI=;
        b=TFltVhOsMkBWAuXqpJBdd1U1iWr2qCPrllAwO7C0HX1QT5qA4r4SMMjWK0KVCdM0RP
         gLTWeD9ZwcF8fk2XElNZUOBUS2zA4rQBQpFTBf8zhj07xv8FD/yMy1CIAafFS8S/vprp
         vKZ+5PFB/IowtnyKuNCB0sshdjsGLH4IBU89iBxFtRepSDQ7SFuV7r+tvgq3vbDWyab/
         T/MysZhU9lTsBieIPpPGfEoXZvfqsXgdB6v+2bvPsQp8GjWw6iK7IpN0OJx2y07XeWHP
         Vt2EJZb9TWaLPBs2MRPPAJjq1DoF9+q4dGd5pGmrl4ATPrmUDqURTiqQEMQl8yvXfg9x
         IdiA==
X-Gm-Message-State: ACgBeo185eDHTrARggpTxCPFg9LmFH6QW590yrbmcok7dd2puMGsiCmc
        tJz/m82XPUYiFB2opCXgXguD
X-Google-Smtp-Source: AA6agR4GiufDU7XC8zoW3NGfg/BhmTxoUXEkVXswVDcOkrFcwnp6fq74SQtZK4HMlHS9Um18d/TxJA==
X-Received: by 2002:a17:903:2601:b0:178:a68:82ee with SMTP id jd1-20020a170903260100b001780a6882eemr18615087plb.163.1663047662509;
        Mon, 12 Sep 2022 22:41:02 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id c13-20020a170903234d00b001755f43bc22sm7241451plh.175.2022.09.12.22.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 22:41:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: thinkpad-x13s: Update firmware location
Date:   Tue, 13 Sep 2022 11:10:30 +0530
Message-Id: <20220913054030.3234-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.30.2
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

The firmware location in linux-firmware has been changed to include the
SoC name. So use the updated location in Thinkpad devicetree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index c379650e52b1..3b7943d6e164 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -554,13 +554,13 @@ keyboard@68 {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/LENOVO/21BX/qcadsp8280.mbn";
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
 
 	status = "okay";
 };
 
 &remoteproc_nsp0 {
-	firmware-name = "qcom/LENOVO/21BX/qccdsp8280.mbn";
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn";
 
 	status = "okay";
 };
-- 
2.30.2

