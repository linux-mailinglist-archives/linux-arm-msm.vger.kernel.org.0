Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56BE506B42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 13:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbiDSLoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 07:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351915AbiDSLmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 07:42:23 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEA438BC5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:37:41 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q3so21393474wrj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngAHAx8KCTZqbA/wVhf/k9wvjiY7TwrBlQ520mj9F/4=;
        b=RWYzHRgQvZfHJo2jU1/3xQvDpndr9fLc4vmm+s1BwCsaTM5fkpaOaFXDbaldi6SvJV
         OQWvGg085wQjB0YR8W9rXIn++WOJDihmIhludfuVC25fVHl4WZLrQMmRE10yStrUegQY
         /enNo/GFtSEPSfKrqANfzwD0khRqSpjFmtS8fI77A5NvGC0u9cybPuf90RsD+vxxUKLI
         dT3nLJ18prverfHSkK7wItLWuLXzdfX47uNvJ1dpn/qTlVXbNr2+eTz2NhNlrR2dYppq
         NSU7laxJFuiA97AiDk8lC4ffozjk9OxzRlUHIGG+arVHYDbySWGBzrOEfcBLSTWiBaeO
         SKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngAHAx8KCTZqbA/wVhf/k9wvjiY7TwrBlQ520mj9F/4=;
        b=RWSNfNZQ4p1+I2RGVhH3lLyfTYz7QOUxKhE+tpqSlUMMDFxXVIbZHZxqw0hhai2UdG
         9uWt8ECCrHS5vUgLcg1LlkdslzZCLWEea46OxVFHtR32knv6hbiWt9A6oic5tpA/WxFS
         qfkxP8szu8WD4GuEw9SzxwvQgoUIyHHfj6wBMmrh1rknifQcWuw5tYqlJr7bY7tI3I6I
         1ZlGPadqk6YsPd16Noyo2DKsIo8YyM5Gfrm7x87MbNrUJr+RA0np8WlrfZIqcWebJS6s
         SYJ5BuIzHLbjKDxCh8CTFKE/FkHIGjKfO+AMaSL1xBm8d6V9NeNeB3fCqv4yME3u0zEc
         d4+Q==
X-Gm-Message-State: AOAM530RD5Z295RjR8u3u+1QdAyyr2moD20suASmR2c418XmFqcImSl/
        bggIjKyrzUnscyDFl35EX2mwsg==
X-Google-Smtp-Source: ABdhPJzYlHv5jsgVw0JJzX41AWoasKG2ZwaufFSf+pYOjoDA/UaEVrv0D3EgneefbiktzNCqamSPyg==
X-Received: by 2002:adf:e48c:0:b0:20a:7e29:e16d with SMTP id i12-20020adfe48c000000b0020a7e29e16dmr11628539wrm.595.1650368258616;
        Tue, 19 Apr 2022 04:37:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bk1-20020a0560001d8100b002061d6bdfd0sm14202120wrb.63.2022.04.19.04.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:37:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: Fix apq8016 compat string to match yaml
Date:   Tue, 19 Apr 2022 12:37:34 +0100
Message-Id: <20220419113734.3138095-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
References: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
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
index e34963505e07..452cdfbf8ef9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1392,7 +1392,7 @@ sound: sound@7702000 {
 
 		lpass: audio-controller@7708000 {
 			status = "disabled";
-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";
 
 			/*
 			 * Note: Unlike the name would suggest, the SEC_I2S_CLK
-- 
2.35.1

