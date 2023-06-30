Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A057434C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbjF3GNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjF3GNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F00B3582
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so17766961fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105598; x=1690697598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbN8YixtRFw5MfSLQ3HIEcog7jarzVsnePXTmPIwLKs=;
        b=lu5uDa6EUxBjer3HCr8tLV52eI3v1/CXuXYoH/v+PGY9/mXaUrz+Y7j7puwkWWeh3L
         za9zk4uFm74BiO4P/iQbg7xlvC1xKk+Fe4O240JFtijcnr6crdMjroGPwAGNdduUK3g4
         R0LRrNKrfPdBhtZ14uMHvAgNQg6jKPAqf8VhmFYco3VelR+XMY7Y/wv1uJjwNABgtV24
         b1KPyLvkrliUyBfsBlPIdWmjHLqCObwgkn3r0defE4wbZubru3lB7HbCRnP/NevnNxBe
         B8B6Iw2eSWgtnIWZuYVtfLWi/IYpmGE1XeDEpGbNuaRQZIJ8IOgN0fMlVhcdWyXX0OY7
         Ux0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105598; x=1690697598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbN8YixtRFw5MfSLQ3HIEcog7jarzVsnePXTmPIwLKs=;
        b=R1Bv5ULIbWjZAroal21nd2cNmmcfJ8kIoLshbeJE2rVhyKodeBCaMjvUtP2/GkhgUD
         hhJSlEM2/lzBuU/iYtYCiUnmTxGsJTwDITUJ+8+zlQrP9+KeMcyl5T83QqxYCck3C6yj
         gd4i8+cgBVIeqniszK4PtQ90xcIIHVi8arPaXr/7OLhFzRocuALZlGfcr61grn1hwdB8
         WGsQULaD810qeN1PKm40/WBK0ie9Ho7rCEJg/ylJH2YqZD79c9l9iXUzBEWcZHEqtlLH
         DuLdV2Z0blfaWUy97n/oV8QPjjY27StSJhaQTw2S/G0ip3opQMeQjnXp62d5tuXJ/9Qu
         R8xQ==
X-Gm-Message-State: AC+VfDwHLmPpQ8fFsl0LKX8axoTXgjmEFBS1BNExwY61pKpJqFjUZFaC
        AtZHO5DwCHB24mfc+k5/awtEHw==
X-Google-Smtp-Source: ACHHUZ672LUPXvverfuBKxpzDkdyvhRM0fkf9tY0/Z5qpjj+UxUW4BWbGfLPwh6FZFVwIzzkdSUzjA==
X-Received: by 2002:a2e:b74f:0:b0:2b6:a840:1502 with SMTP id k15-20020a2eb74f000000b002b6a8401502mr2024140ljo.9.1688105597814;
        Thu, 29 Jun 2023 23:13:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: pm8350: fix thermal zone name
Date:   Fri, 30 Jun 2023 09:13:09 +0300
Message-Id: <20230630061315.4027453-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
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

The name of the thermal zone in pm8350.dtsi (pm8350c-thermal) conflicts
with the thermal zone in pm8350c.dtsi. Rename the thermal zone according
to the chip name.

Fixes: 7a79b95f4288 ("arm64: dts: qcom: pm8350: add temp sensor and thermal zone config")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
index 2dfeb99300d7..9ed9ba23e81e 100644
--- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
@@ -8,7 +8,7 @@
 
 / {
 	thermal-zones {
-		pm8350_thermal: pm8350c-thermal {
+		pm8350_thermal: pm8350-thermal {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&pm8350_temp_alarm>;
-- 
2.39.2

