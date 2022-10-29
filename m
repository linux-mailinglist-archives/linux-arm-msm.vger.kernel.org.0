Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2AE61206B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiJ2FQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiJ2FPq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:15:46 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B720A1C97CC
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so9024092pjh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0QqRP1D1eQSgHWesXmi0SdTGcBYrL7MF+tNbo4fAQs=;
        b=cWYOevpbrsYCKJLBBbZ0cVHERCaVHtsvJQDWHVZWQf7TNl6zP1+7pOfFeI41QS9CJP
         HJjLYtUN8QjFhuLXgDHJ7pqVv6XU0+mQNglkaLnz9jsscd7ODrz6Dj4gd/NyGngvYst/
         gMAZOt3mqkmzerFFzEJG1Y4jS7XYia7sHRF167PRssMLvcHpXaAy4y9swN25wFedw2jL
         znQJT+64KX7BUCVqItMiwVVxep9DV6Lr0M54LaaUFHWJbuHGzPr6C65xigYD26LgvboJ
         zH3lFExzXPIzZcKK4o3NCFevzkUmGXf6NRJa/vGNxNxg2widx2yMTpNfsnwxq28xvZ04
         DucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0QqRP1D1eQSgHWesXmi0SdTGcBYrL7MF+tNbo4fAQs=;
        b=Et3QFtXYUI96dIXewIqUc0V6DvXYJ1NorERtl3Vi12S3sAlrlceDcYBsKE1bohfhDr
         1miY9lGa12uF66+8X0FWkBRPopfI80ljYAkEF6spC5XQMby6yW+LM73kbR+w2oN+HQMB
         0i119RIgCJcUv/PacG3KygH+O7R1jXkb8oi8tXQe5G5tZDfGxZq4N1GzberWtdME+GZk
         JZJ7R/zL1rTNMHL2xzOTsohXphlf4sUmFDy9gdh+MjNW0puUje0D0wD3g4qbdDJcDq+/
         bUI3iVDd+5eFFKA8NF/MDY8rz/bQg3mWRQl0BhF/EWTfWLVMN1Sr92QFPfZFa608iRT0
         LKzg==
X-Gm-Message-State: ACrzQf2Fq3OUjDxlZRyEp8BUF3UeO/17Vjf/6VJQeYnwooLI2NPocKBw
        m36HkPP4jGecpojKmDQ7uPOr
X-Google-Smtp-Source: AMsMyM4u2iT/ElVWUQ1QcsObzIYM57c7Nc+QWSEv8gdwgD5jX67o8GLOl2oOiia90ytkwGVXzYq2AA==
X-Received: by 2002:a17:90b:4c84:b0:213:5fe0:6732 with SMTP id my4-20020a17090b4c8400b002135fe06732mr2924359pjb.219.1667020540399;
        Fri, 28 Oct 2022 22:15:40 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/12] arm64: dts: qcom: sc8280xp-x13s: Enable PMK8280 RESIN input
Date:   Sat, 29 Oct 2022 10:44:44 +0530
Message-Id: <20221029051449.30678-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
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

