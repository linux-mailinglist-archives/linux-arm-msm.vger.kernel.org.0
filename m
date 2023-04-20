Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EF06E9B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 20:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbjDTSH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 14:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbjDTSHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 14:07:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5440335AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:07:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kt6so8526846ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682014071; x=1684606071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QpXIUjiGt8O1aDcypmRfE3dageaJXgmexjKRVJdM0=;
        b=O5uQMrhSanICTTZEs+i2ZJsufAVa38dgmhpsJy0s5Q0x6Hlu/gXz3EPp9Ec1cTy94g
         xk1NRs/c3jBVWOnuNzdehyL5ubI3Dvi6kvBUYBi3uNj+tni6LGmDwhGsRhIbW3kZGb3p
         WQP8kReyfYg/+G1szyQ2KThDnNYPWH1qsisEsSPviZlr5DAAOEjh3CAMOHsjIC4qMdYr
         W9PAPpYgZWt9kOKVYw7On1IDjyUtz+u1TICtfBjR569LhIhVN9ez0r0bHnMw/oonV1f2
         8GaLl+5xCBSbdZP/ur2ngYe9UxnAoTrvyC9LDahXyVCtQT+KwuNli3HO1HMCG7n7c0oq
         xIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682014071; x=1684606071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5QpXIUjiGt8O1aDcypmRfE3dageaJXgmexjKRVJdM0=;
        b=ZVNca434nIY9LggqeyMWycOgQB+UH/dUCvo/DtSCoWWtZJg0oXmCkGRM9FMu8VQ2rM
         f1WsGXTuS23mZPWe15H3IxlAnU7ukGJpIW6Yvzr313BIeeO9n8O0n5wtrmFFqImenpfx
         OOQlQVQ7CLYl/b0iv5XHTod6X8LlODubdKOd9rV1A9eREb6svtYQmFTwYZqwv5lzvcii
         w6IJ3ZPkXunP25TndmggAiKZspkVCJpmDzjxSYm3oc7wiFXCkeQvnuUM3fZ6cuDA6YlS
         OD8hO9VXa0x23yKf8pJobEHUk+X37tYlwmp0rK1Z84iAZuhFMyZicRB2mBCLJPuR4w9q
         qHVA==
X-Gm-Message-State: AAQBX9cCPhyI7DvlSkejxMn9GCBlmkCCEPlMEJR6EGCK7NmB8kqXOm4z
        pWEPJL+UgxwwcQ6sTEWDWLSGlQ==
X-Google-Smtp-Source: AKy350aHBADzNl7XDxI41B/F1AleE7huvsUg8f/rtQIdgyc4pT6XwwsvsmNAbuJDBUz6L6Kv+QsSuw==
X-Received: by 2002:a17:906:1985:b0:930:3916:df17 with SMTP id g5-20020a170906198500b009303916df17mr2610386ejd.0.1682014070819;
        Thu, 20 Apr 2023 11:07:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090610c800b0093313f4fc3csm984778ejv.70.2023.04.20.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 11:07:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: msm8994: fix duplicated @6c00000 reserved memory
Date:   Thu, 20 Apr 2023 20:07:45 +0200
Message-Id: <20230420180746.860934-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420180746.860934-1-krzysztof.kozlowski@linaro.org>
References: <20230420180746.860934-1-krzysztof.kozlowski@linaro.org>
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

Reserved memory @6c00000 is defined in MSM8994 DTSI and few boards:

  Warning (unique_unit_address_if_enabled): /reserved-memory/reserved@6c00000: duplicate unit-address (also used in node /reserved-memory/hole2@6c00000)
  Warning (unique_unit_address_if_enabled): /reserved-memory/reserved@6c00000: duplicate unit-address (also used in node /reserved-memory/memory@6c00000)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts        | 1 +
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi                    | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index fcca1ba94da6..501e05efbef4 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -15,6 +15,7 @@
 /delete-node/ &audio_mem;
 /delete-node/ &mpss_mem;
 /delete-node/ &peripheral_region;
+/delete-node/ &res_hyp_mem;
 /delete-node/ &rmtfs_mem;
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 2861bcdf87b7..cbc84459a5ae 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -23,6 +23,7 @@
 /delete-node/ &mba_mem;
 /delete-node/ &mpss_mem;
 /delete-node/ &peripheral_region;
+/delete-node/ &res_hyp_mem;
 /delete-node/ &rmtfs_mem;
 /delete-node/ &smem_mem;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 5a7923d7c62a..405778d92b43 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -231,7 +231,7 @@ adsp_mem: memory@c9400000 {
 			no-map;
 		};
 
-		reserved@6c00000 {
+		res_hyp_mem: reserved@6c00000 {
 			reg = <0 0x06c00000 0 0x400000>;
 			no-map;
 		};
-- 
2.34.1

