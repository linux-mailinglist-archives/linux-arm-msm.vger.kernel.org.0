Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B99573FFC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 17:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjF0PcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 11:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjF0PcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 11:32:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6238F2D4F
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f766777605so6348805e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687879941; x=1690471941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1gwQpREPz+0axDDVcXyrSCTCfHY3JnKCs9KFXnHp0c=;
        b=zWVvcHAirhTYM8pVpb/rmnQizbZByCRLLZd0C5mjB6bVBt3R6kKRP4l6zIoJglZ+VB
         QdOVzT00GK7ZPA8fpm8JTVIAUfU8BSqASN4S8UjsAeCdhR897F0qiogxnkT7P+JTnzsa
         Zrc66r6BnUv6trED3U0z0BMH2butyV12hA34aBfThq/MXd7iBAR9VlLaGuYq/rnlALf8
         N6/dH8MvPCo8X3iRX/efuIQ72qlxxoKTqlNoZKRHqk0yh+FWEHF/9lvXaLJt+az/Zk1M
         WuAH4vZaX/AhvSkyu7QpcxVtOc6NvemwKVyP153YTnKAjm8z6Of78aA9kahWTh28Y4Uf
         J85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687879941; x=1690471941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1gwQpREPz+0axDDVcXyrSCTCfHY3JnKCs9KFXnHp0c=;
        b=BY8H3gRrMLGgNTxlGywFKUStc3xeu59CmA4Sc+aXaabbvbcdVGMzkFnsEfDpRRPmmK
         sAjjGkGAFsb2woVGvUADQOl/ZgOquleHBzSMKloggGYy6YmA3BzgNtCG4rc3BcoRMjwR
         BRf8QQaH+3nAyP9vQBqOc/P3QcVafHC5sAYXtW/02LndgRwlNSsodv/StZ8l1O1wSwsg
         ZQrapyoLoJrNBe0Hyo/CTBAkgCDNnSjsx0tHQBYQr5F+w+M3NT+Q5Gb3cHVq2aMjM0bn
         wdt/D5jKiAiKTl28Xyq9Rkoc+gcnV9ncgpQcuDrMoImRAsDxoEq79rEYf9FeFGV0Yy7i
         sgLg==
X-Gm-Message-State: AC+VfDxMvieSwYWJRERuvDnVOw0rz2t+k45LlZW5h0fzqexfmtSfHfB/
        T6ovyH6kAfui21of7rHC+yId6kL4VG9Xe6kU66aV3A==
X-Google-Smtp-Source: ACHHUZ4uREcV8g6UxeNFhcjAXrqb/j0dtYSMOU90QcXxyf84oV1ebuXjob5DUK4HvEPEUX7j5pblRw==
X-Received: by 2002:a05:6512:239a:b0:4fb:744c:2e9a with SMTP id c26-20020a056512239a00b004fb744c2e9amr5443251lfv.32.1687879941464;
        Tue, 27 Jun 2023 08:32:21 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003f819faff24sm14089214wmb.40.2023.06.27.08.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:32:21 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Tue, 27 Jun 2023 16:32:18 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm850-*: fix uart6 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v1-3-b48bfb47639b@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=ryeYX6u9uZGX9V3SjmKOE4Wgip5e+264DsrGeqvG6ys=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkmwEBYlSsOca3ElrQnrMt95bxiDTAbI9xg5faN
 mLwiq269jGJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJsBAQAKCRAFgzErGV9k
 tu/BD/9KfPnnznilIvKcgQhLG3ICroCc5anwcWjjtxdCAh5x2tfQ7l324AlQJviOX+LQ4Tfzy3n
 T4k9DnJMe1eZ6nsoLbu1rVbNWB8sCtGsUfmR948HpdO1Lfj9fENASrReMn7qPiTuQjUwy/wOCBd
 NyJP1aMlTi72165OHAF6jjIu0TJW6gMB5lDw6Khl4kRhJz0119QkdHgySaD2J2+j19YzZJViEuP
 SESunKnRjsJbzzEcy0GNd+35lBASEw2719Xj5NbjpDw3ssPEgwVNbP+JoIT0f/u2WVQVi07QymE
 iwmp7gcIK52gA/+9B44679/D6DyV6Pygh2quXAH9KPxGeqbGs4yvMz5zo+wYSR6jUBMBO7yoZUm
 zwUTJBxwE45Zm/4FKVAIp5YdeNdQCndilc3jr8if+XuyzNMFGVrkqXozHaY0YaJUL1uWr7VyWpY
 JlqyqewJXBNbPOSYVYvEOrDkXFZZ76f2R+s/uZ/M77zjxWoKtethqXx44KV7hzdkpDG9TolG5FE
 /1hXfLdsaMF/a5Lwha2rx+dajUdd7CbPYUOvjXoXkSo8+bYgF4Vz+cWZht4u3QH9Ubghizm5t+P
 jAbTJB5tYLT1Ad1mzslmKj15GiBwLKNfJR3FPcFSI81DhCdcdXtSZUWRr3L2+aXB2fNSkI13TIr
 d7MlbtRCTbw1miw==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a follow up on a previous patch fixing the aliases for
sdm845 devices, fix them here too.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 090f73251994..62f503508dea 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -34,7 +34,7 @@ / {
 
 	aliases {
 		serial0 = &uart9;
-		hsuart0 = &uart6;
+		serial1 = &uart6;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index 41f59e32af64..543837316001 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -56,7 +56,7 @@ framebuffer0: framebuffer@80400000 {
 	};
 
 	aliases {
-		hsuart0 = &uart6;
+		serial1 = &uart6;
 	};
 
 	/* Reserved memory changes */

-- 
2.41.0

