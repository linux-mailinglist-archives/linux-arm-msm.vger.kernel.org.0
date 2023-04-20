Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A886E8A7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbjDTGgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 02:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233953AbjDTGgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 02:36:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9914C1B
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:19 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f490so533977a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681972577; x=1684564577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGck67i0PPw+TaL7zAiej5gdvY3hZcESoSztQn09XAo=;
        b=FkDSXltuPKsYVrUFtKUbHG098FXVW+Ckc0AQJ8NOyb8diJC8S5lkqlbdpTyD0EZ2CC
         k3K4t7eQcaI9eNcutJc09tHE6L1ziabGhkQzqus8a3V3f3t81kkKfKQSqotuUj1BybYK
         d9pGNd/Y1zvFe7A1kOpDS9VekRirK2l4ptSEgjy45XbGFz1mQFvqEZL+vLy74MYn7ni1
         M+zeiSK8oFnqQ+t2vn9L66DyHxWgE2cc+GQzoj8+Oj/Q9BUUIlPIcGTHcQKajdhmV+un
         IRRd+qbXGsn9sZqtCAsFhKy05ac1YJeOXH7qLKcrJVI+lVo/841997cEZFjcxYEgbqSw
         t3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681972577; x=1684564577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGck67i0PPw+TaL7zAiej5gdvY3hZcESoSztQn09XAo=;
        b=TKlJ9hTuVugj7H8FC4p59JNg0CCbwluIql0owhjGDI7aKEu2L8Q9FS+3FxGdaouGzN
         8r2RVDqnzqlvrv5L6aOZ/nfgG/ZkVt+FRFdWj/FNOzm62icaXi7jR+sL2Arf3UTwQ3zr
         yftlrhx8kdUNiXrQtfSydHEsAzOeAXR9QyK0wZQA3GwAgBgDVQudEeU66y9H0BMMVIs1
         18q3Manb/XeSGtCAfpRzfXbX4eMprleCS6hShUXCe5PAYJJDxwz6BwrFld7FSPN8MI7X
         9HBx4J0dm0HDbHoChh8zJJOsVQXqWz5lHh27aPpqU3reAMQo1Dsq5IVWwgvgIMh8tSFW
         wWHw==
X-Gm-Message-State: AAQBX9cCaFu62We13KBCDsqC8wXQQrdoPtvR4S78CLvGbIlGydrXEDBk
        gt/QdtpH78fih0ZoBH8WiwDu4g==
X-Google-Smtp-Source: AKy350bBcmhyjtN3k6Q1oFOaroEHGAiyxZEzwVxsNAwM6N8TOQ1AAzVtCJ+0EE9FQ/BwGGNYsEeZHQ==
X-Received: by 2002:aa7:d606:0:b0:506:be86:2a8d with SMTP id c6-20020aa7d606000000b00506be862a8dmr629911edr.19.1681972577464;
        Wed, 19 Apr 2023 23:36:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm395342edx.77.2023.04.19.23.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:36:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/7] arm64: dts: qcom: msm8996: add unit address to soc node
Date:   Thu, 20 Apr 2023 08:36:07 +0200
Message-Id: <20230420063610.11068-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
References: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
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

"soc" node is supposed to have unit address:

  Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0114e4fdd37..8a40c4b0f94c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -604,7 +604,7 @@ slpi_smp2p_in: slave-kernel {
 		};
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
-- 
2.34.1

