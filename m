Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D1F7E0C4E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjKCXgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbjKCXf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:35:58 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC96BD78
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:35:53 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc58219376so23775155ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699054553; x=1699659353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoOyn7ZU2hMXx7hgfAQE4i5cJVVLZXv3kQJ/BlZC4zM=;
        b=EEfTxfVAYYU1Ai0rReDxmia/xQ+70WFKt20A8sYqI6MDD5E2WqAE+JZyRDdAYNjDs/
         Nv3RlFyJZTYfxxbVwnzn/iiXsV/IDWcptJSgwItfKR0caAVNCTxihqtxuobsr5lf0ZP5
         Jxh1k0Qpt831qcZz/azEH/Ea8C6E0531z+0Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699054553; x=1699659353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoOyn7ZU2hMXx7hgfAQE4i5cJVVLZXv3kQJ/BlZC4zM=;
        b=wE0w48kqwZh6BJB21RC6SgLzg9mcOCxshvckl0/wqadNY7E1h9LXMau0bPmlw5TbKk
         vdgkLXHnhJZxMMCBWW7tVyK9FtZd3JqRg8MQ2wDYKyEDyU4iYr3XsXkUw4EkMInj3Y9v
         CpV6WdF5YacGJPjxoW7T4EApmLZ59e7xeX2jFChVslEZScuFbCKOjopVoX2fkMZ+PsXH
         AsWOVd1g/w/JwrXwR0nvA42SWEkTMkaMu2PCzikk9W6GpNNg45K+1IikDM87vLmItzO7
         htGkvITpdIdPd86Qx32HhqSmGQ15cnHCihaycO2gCJddpTcoZr6XgT1VYWKhVNGbd7Kd
         tF6A==
X-Gm-Message-State: AOJu0YzsHZ7XyxbuXQU+QqiKjAJfwQMMCki5zniWfxcO9qhheiw2WBYc
        BMcSuEUwOojBP/WwGxTmhIXGOg==
X-Google-Smtp-Source: AGHT+IHlJZV6Zi12fevoNRAI0nCJ5nZ2LsBAkFmVa3HGcoUhsACMAoJS8o5w/mEXDqBuOA0dOx8SmQ==
X-Received: by 2002:a17:902:b593:b0:1cc:ab06:e6c8 with SMTP id a19-20020a170902b59300b001ccab06e6c8mr2351313pls.19.1699054553182;
        Fri, 03 Nov 2023 16:35:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5195:5e72:f5bb:e3f0])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001b8b2a6c4a4sm1878114plb.172.2023.11.03.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:35:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
Date:   Fri,  3 Nov 2023 16:34:31 -0700
Message-ID: <20231103163434.5.I2910e7c10493d896841e9785c1817df9b9a58701@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 46a4359f9156 ("arm64: dts: qcom: sm8250: Add watchdog bark interrupt")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index be970472f6c4..72db75ca7731 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6018,7 +6018,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sm8250", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

