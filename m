Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77705AF8CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiIGABX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiIGABV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:21 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B491857F9
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bq9so4861863wrb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cuLY/LribDJV50wWNFhEJZGm8pMeHRFP4i6NEGr/V4k=;
        b=kxLzSm0CrysdrnmUPMp4mZs3IJQ1SDyJha1vjiotmP94jT/R4rDvfeJAVqQcbd78X4
         nt71dx7rHXhq+pHpTNlqClgY8yH3GnCUZCZQTuV/pJ80ptg1R7AoFm7L5HVvYchHTjPO
         VHq/c2JtDh1cPVhx1LmU6PuHeAxeJyCd6sqsNicj5LpQ14aBZQ8mI0ht0OrJoHoz9VrB
         MmakP+kXjqE4l+jMQtQis5FlMpQCXlPfMHbY5vHxutrbiujJZ4p5KZjx1tsEIGXQECvP
         5ZtjqPbU/w3fSTE1bsb3oaPFKararNmqJVUfOwAasNGzB/w4vzsgt8c+Um0yxdZaY5p9
         MAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cuLY/LribDJV50wWNFhEJZGm8pMeHRFP4i6NEGr/V4k=;
        b=vy183IT9EvTVGA/4RkeLTL9xc/r56fH+nd4YuZXzmgPbsl7faeTfarbxicpwDNbl4n
         Q7H2RWLNMICyjKePbTy6tquXYewJRt6Uuk0McS5s28PqQEaqwiMOGcJdSXE+/ydEtFtz
         1R/0zaG0Vu/ry2KlD7yEDIQrXADjMoPqlBEGwn0WaDuQ71Go2C+bMEviIvMl6oSWYSB9
         dGqXCJZ/HOwQf9bv3NrmhrbA+jMihofljg6v8DHIycIYIHpHU1eLQ8vaO8wZaSBiOO0c
         gWnn+zt45i7GatQDvOVF5skGxAjjmbn/dnkXq1Pljr/cqEsW1vSD8pkE7n6uiUt0dppv
         XASQ==
X-Gm-Message-State: ACgBeo21OZN0m5puQ9MoyUTgpnAnt7c8JGaiRIqsCHHrcmP55qx8RX4r
        pfNU3pz2S8s9UAatsJppHKOY2g==
X-Google-Smtp-Source: AA6agR7DD4gketdS/s7cN1G8D5z+bplC/SOvpJqPB6hRyVd89leZcCAv+nQSY31B+VZtmdR8/e0nKQ==
X-Received: by 2002:a5d:458e:0:b0:228:cd6e:dc56 with SMTP id p14-20020a5d458e000000b00228cd6edc56mr450587wrq.614.1662508875924;
        Tue, 06 Sep 2022 17:01:15 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 08/11] arm64: dts: qcom: sdm660: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:01:02 +0100
Message-Id: <20220907000105.786265-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the sdm660 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 43220af1b685e..10bf1c45cf6ec 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -190,7 +190,6 @@ dsi1: dsi@c996000 {
 					"core";
 
 		phys = <&dsi1_phy>;
-		phy-names = "dsi";
 
 		status = "disabled";
 
-- 
2.37.3

