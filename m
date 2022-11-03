Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1B8617A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 10:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiKCJ7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbiKCJ7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:59:04 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2270CBE3C
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:59:03 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y203so1136706pfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFJpBjb6QP5w8jom1mD9aX3bwJzFPKeDTupRGJObZls=;
        b=GPyvqSiEiv7CDnFXCQebtzu42nMnmronzlVeq0HyyGG+67EgFq8XuQqFisBJ9VMtlj
         fzM55rgS1L+vG2BkCNC2Ks2AAoNaTI7n4jl/A42fpcLxjfOwGQDseqBRL8Th7fs07yLV
         Q7447FBwhgZm87ODQpLa7aDDBxkyDh/N7/WKERxZcYhTyynJz3L/F+2kPd3lQ+DBrvqJ
         54rWM/0cwUcwLXhhORmgjFaf5P1mknW7xVeujQ00MYNxEGj2KZ14f0Icuap1o9EgJn4p
         6hDYXPCnHi6w5AbjpKMwRsKLEX1sxCCsUSxk/PEJH3Hv/VcgQF8ZcNd/KOyrLqNRm6Ku
         A3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFJpBjb6QP5w8jom1mD9aX3bwJzFPKeDTupRGJObZls=;
        b=kjmYUw2ATy7goXM3pl+oMpOh/fC+YQwjBvo2WWvg6SU2VFU+9AEb4t9jdDqn3HN6No
         e3jRUte5NOHInhxiIGrRQrFiKbPIS/LJDwtgS7aTIC1CfFi0NYL6Zj9FE/KUtudWxbIu
         NNb2JiyOTDUTjBh5ElLMhKaYNQ/uh3oPXdKKOs3r1Ah3wk1CmtdTHS9Sg1PzAtENH81X
         u8rqXzaGxmB9kWDQBa1/5IxS377zmUW62CUgdQ7gU8MUrETbYP1wpflRoh/V5rEwacHz
         8LFNfod+R1da0GF8nKACYmCo/QakG1heBXhUouOpSA5Wm8xjUnurC1Jsp7uMb3m4Zsgk
         5s3w==
X-Gm-Message-State: ACrzQf0cVSgXM3u+W3w4ftbftxjH6s/KckHW18+3/FhNwFSwsHEfpBVG
        UzuLNOYuj1LVQauzl1eFBb0p
X-Google-Smtp-Source: AMsMyM7uNucJzy/u8Hy9a3AFwkRjwXVdJKw+xrWgi8fiXd08XTQ2W2tfuMW4U3Jt+MPSJi/TjAA8bQ==
X-Received: by 2002:a05:6a00:450d:b0:56d:9ec6:4ddd with SMTP id cw13-20020a056a00450d00b0056d9ec64dddmr17165048pfb.62.1667469542595;
        Thu, 03 Nov 2022 02:59:02 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:59:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 07/12] arm64: dts: qcom: sc8280xp-x13s: Enable PMK8280 RESIN input
Date:   Thu,  3 Nov 2022 15:28:05 +0530
Message-Id: <20221103095810.64606-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable resetting the PMK8280 through RESIN block in SC8280XP X13s.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b2b744bb8a53..6aa8cf6d9776 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -169,6 +169,10 @@ &pmk8280_pon_pwrkey {
 	status = "okay";
 };
 
+&pmk8280_pon_resin {
+	status = "okay";
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

