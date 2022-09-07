Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3025AF8B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiIGABU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiIGABS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ECB80F61
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id i188-20020a1c3bc5000000b003a7b6ae4eb2so10646307wma.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RniU58WLCxu5iZWo584U8agcpdHYwieVZ+o3bEKXFFw=;
        b=pxIHFe+vXckm5IjEvmVfc5QuPxAg0EK51RmVDua/i2AJ46KX4o4QbBigQQYO0a9Vqo
         vMReC3xPgzHoboPWDNsm4pjompGULM9L0gpjSd4UkSmkzC/q2e004x/1m0GjA5UqYnDk
         r5Q1teKjOyLe5WtLMiHdWWuCqfk9U/mVcz4spwZSjHQqQRCjxRUoYCadl+y/2+KNL9dx
         Fc3bFWC1C8e6ND+D/pS72uvAhdyWn7h9IK8uEzXSiksfM7P9sz4EfEz6P8OW5vZM3TFb
         uomj+x9mHIfsdTrAXbdFI4Eg+EdYD43hVN75deGureV8O/UW9hiI0dcdaf5nErILrHbU
         pbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RniU58WLCxu5iZWo584U8agcpdHYwieVZ+o3bEKXFFw=;
        b=0ycoKLE6jS2XoQhlWVjNtEePA19rJkTMblgyIqtrwKpkxpcne8es+eImO8qSw0RsTb
         oj1Z3LUAfoCs5zpmx1BAAJigqaCBsgLCaUoksvMt3VfriVZGju9Nsr4euki1DQ3Uf2tM
         TOWQJI7VpvNp2ye++hECCd34DHPqUhb2w0CXeQV+wHNh1oCQptOYK/oQgQjJRqe/alZj
         UhGxFxN85yLaQRdjp7Ozl2amPjooKSXdDHU78Cz9o4rsn5eOzNZ+bpAHZwx7IfK2k9++
         /kMgQeaHwgtEStpoUZSrnMuZ8SPgFpCXUTweF/nxnlunsbMUh0p8ibXV5aVlYVxbmxvi
         XKdQ==
X-Gm-Message-State: ACgBeo2IeHBCFoPMZtNyw41s8dKZkGoSmKlWUxFOh14CgKYO38TgHA/v
        gjL0mQQl+vPBstvf8m0cXQ2u5A==
X-Google-Smtp-Source: AA6agR6bTQMtJWSrd2TkHwCosfo+bDStVaOK1uaRU4Z0ZUoCpHKxe/QoEsijWWgOWjJ01jpxaCTi7g==
X-Received: by 2002:a05:600c:22c8:b0:3a5:c134:1f50 with SMTP id 8-20020a05600c22c800b003a5c1341f50mr15603179wmg.55.1662508872969;
        Tue, 06 Sep 2022 17:01:12 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 05/11] arm64: dts: qcom: msm8996: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:00:59 +0100
Message-Id: <20220907000105.786265-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the msm8996 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b35..cb15dfce76efb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -992,7 +992,6 @@ dsi0: dsi@994000 {
 				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
 
 				phys = <&dsi0_phy>;
-				phy-names = "dsi";
 				status = "disabled";
 
 				#address-cells = <1>;
@@ -1060,7 +1059,6 @@ dsi1: dsi@996000 {
 				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
 
 				phys = <&dsi1_phy>;
-				phy-names = "dsi";
 				status = "disabled";
 
 				#address-cells = <1>;
-- 
2.37.3

