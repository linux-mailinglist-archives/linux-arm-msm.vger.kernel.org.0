Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1F65B1ABC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 12:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiIHK52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 06:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiIHK51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 06:57:27 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EBB5FF68
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 03:57:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t7so20375312wrm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MTpafhz6IFrqVPkemCGOt9Lbta4msZyE0ZaenAtXmGc=;
        b=BKDKFt0NzIiRAuszyYSTnmvIjX9+MtmXMvlgdbUdEyAdSOp85ZU4PVdFIPsGyuE8P7
         toH1E5/T8CDnZqUiKX8+XScAz4sx9qFTTfhxznTjMuE2+nRRekgWvro4xrKisxY5U6KL
         9p3MUp6XDFmH8mKyGoxXHuP1dorV3MAJa5QYgBOTLjt6BJqDykF9n18eRRYnfqrzsEN5
         4M+0io/6e9WF4AvRQHCYqVvYAsFSk7zjP0kbIcOiaUswUz2Y5fd3dAJEa8FzvoY0ySfz
         ecDEJAZnOTf/a5MHwM6uEY+Mk3ZYXgT67TFwg+CtC3jH90idF/8DnmPSfbRl/Y8n6dsF
         SZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MTpafhz6IFrqVPkemCGOt9Lbta4msZyE0ZaenAtXmGc=;
        b=VCvbIVURvNDGqavaNlRubVH+HAEpa2z721Q8xXhUeR35AtqLyu3VSeOt2kqMcf1JOT
         E3N5mCVhMB2uMh575p620xOhnVjQepjFRWoMVDboguH/W01Uygi02IH0c1q1uIu3r6Om
         eZuu2xuUTOussCj07Ic66kaPOLeAg7jqKiPiMih0T+j2yh8uG6FokXVHktC6xKGyOSp+
         9k/XCLjFWVEgFtmjXr1cphCFFZu+8sK9Fx3/VPmyi8EMzc/BbmTjHXpTuC8rsGDMaUru
         o+WqV/OiQCkomfg1sdeRrU7VJwWHt39lB7OrIlxVPxPE1KkztqnqUL1L1HMqUzUxo2dG
         POXA==
X-Gm-Message-State: ACgBeo0g5kJ4lfITUbNKalgEO7juNjTq9QBlkwtyHBgd+B/1thmPJyuz
        3ssSpLMXxchlPr3Q8oMZ+yoABw==
X-Google-Smtp-Source: AA6agR4IFeJGhbOHvttmD7hhRPThg+F+cQeqUAzpsC1bxlRo/cytynuWcEkKxJqAfaBH3r4H+CqL/A==
X-Received: by 2002:a05:6000:1f0c:b0:226:f3f3:9929 with SMTP id bv12-20020a0560001f0c00b00226f3f39929mr4644490wrb.362.1662634643905;
        Thu, 08 Sep 2022 03:57:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k1-20020adff281000000b00223b8168b15sm20877527wro.66.2022.09.08.03.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 03:57:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 1/1] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date:   Thu,  8 Sep 2022 11:57:20 +0100
Message-Id: <20220908105720.857294-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908105720.857294-1-bryan.odonoghue@linaro.org>
References: <20220908105720.857294-1-bryan.odonoghue@linaro.org>
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Fixes: 3761a3618f55 ("arm64: dts: qcom: add lpass node")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 48bc2e09128d9..7a9882e39e905 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1424,7 +1424,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.37.3

