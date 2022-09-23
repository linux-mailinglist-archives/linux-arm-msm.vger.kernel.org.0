Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67CA5E7F69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 18:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiIWQQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 12:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbiIWQQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 12:16:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5729012E407
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w8so1009018lft.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BjjTPJSzqgBsq5wMwT+ax/tFG7nlLkeOxNbMd9/sTdQ=;
        b=PK9B28z08bhUKIQgM+yNx9Wz2ylSZRVEfmOQsW+mJVB0NcNNX0BhQFpVZGcnS4Wuo7
         XNB70x4DchMy/KTiKyXIkQPPEqyXaKBOKrx3rgNcbkRmGlIqWLMOcHGwQcRw5RDi5Pxd
         Q03XGAWPYkmybfnO6SoChG2NrYyRcpOoz2+eSdYbAyvpgsnxaBNHkch3HRxex1zG0day
         mJt4wtUWnXCCYQQxqZSHDa2mSGDgdJxyb8N/KMxV9bTxkNEnUeteOU+WKj4D1i58zE9t
         axWIQ1VHUPJNnpXmRU99tTSnF0GQZASHrPD0fPybzLhBGDikJO6gQ0wdnVzts6UKXBpg
         hvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BjjTPJSzqgBsq5wMwT+ax/tFG7nlLkeOxNbMd9/sTdQ=;
        b=2Y61L3zjr3JQS9tM/lNS473tmV31YY08xSaB54HP1JnbOLVq2oDE3Rd0sYIZbpUHaO
         6ImHcnMq1C2O1+x7urRbytVubfjIifYwE+/KUEhxlEPbXJ6pHs/6WZMcQ/xDOaRpNzvG
         n+txkJnAXuH8QdRw9B31haMk9PKlzFvv1VNbwLCb1I1MuFgDknxq0Tvi3c+GLK8vk8zQ
         ZQjdqAuyhBLqiH6vh44WdctPFmkX+CGCik1CIwrQr4pYIpI3YtoNk0EkFE7KFRJjlKWb
         FTxOMVB3tvtSNePBMLks20AKSVNfAF0oyTS8tFet/1fOMPxdkUT7PMpFRIsINmLNGo/d
         MP8w==
X-Gm-Message-State: ACrzQf3fsnORDfipVyuxbOotl2jzd51LujZibbKRIEuAyODIzgKtqKSH
        4Sz6VqWAt0q0n6nPeMX8FQZEPg==
X-Google-Smtp-Source: AMsMyM4yHwMG3ruTD0WvINGKfD4sELqhnfdUFK2QastRqloWz8MQ19+ebjdIznviMQ8MP2sJziO0SA==
X-Received: by 2002:a05:6512:3d17:b0:497:9e34:94f2 with SMTP id d23-20020a0565123d1700b004979e3494f2mr3391894lfv.285.1663949771853;
        Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/11] arm64: dts: qcom: sdm845: drop unused slimbus dmas
Date:   Fri, 23 Sep 2022 18:14:47 +0200
Message-Id: <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings document only two DMA channels.  Linux driver also does not use
remaining rx2/tx2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2264bba69f84..1213f78a8b7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3828,9 +3828,8 @@ slim: slim@171c0000 {
 			reg = <0 0x171c0000 0 0x2c000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 
-			dmas = <&slimbam 3>, <&slimbam 4>,
-				<&slimbam 5>, <&slimbam 6>;
-			dma-names = "rx", "tx", "tx2", "rx2";
+			dmas = <&slimbam 3>, <&slimbam 4>;
+			dma-names = "rx", "tx";
 
 			iommus = <&apps_smmu 0x1806 0x0>;
 			#address-cells = <1>;
-- 
2.34.1

