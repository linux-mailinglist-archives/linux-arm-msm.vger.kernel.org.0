Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EBF4F05D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 21:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245330AbiDBTa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 15:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244313AbiDBTa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 15:30:58 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5256186DE
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 12:29:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q19so1781545wrc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1J4jbOIufB5Yu2O6S/NKhQdNITgZ9Yz7dpb+Le20jPo=;
        b=T4v3d12rJQlw3CFQpT1kLsgXeAj9++lOhg9qxTIEayPA/Fyt92B5NhITcKkZ0Gi5J0
         2OQW/nL1DLakKyzGvdVs2FCEkJ7u4PFr5Ezc7lBBYz7XqjF344Z4nrx9X58OFqzifK43
         aAwVPLJUtyyGMip3cblWV+X2kzvpl29o4BL6U/27+UfWfHQKZMH7AvBxFMnuH+p2JEYJ
         IZEbn3rIBXTe8Qh7eP/VGyWDC7E/PrfR1909NQpLHWuozQZATMKeZNMmVnEAikLeVZcR
         SJNh3MTLMHgblQD4qBvFxDkqu+n5GmOe5q9WCbEd+x8kOutGEBs4W5wpfPaV6VceDndn
         f5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1J4jbOIufB5Yu2O6S/NKhQdNITgZ9Yz7dpb+Le20jPo=;
        b=L9KoZJYHN1016GhhIxbwuXEvxu1MgmFWSPhF6G/wnt0ql0GnMH+bBF50yq/XWQ91i7
         rh1hLpy2vovudtpUD+uaDEfSIg4YDBgYUJCckL6T6RUFkAfb3WDXolZQQX1eipOWyXgp
         yWazZDbZony175x6IswRAarADCHN9zBpryuqiLM/D07kpzxDEEYwSfqA/BFCKCl2sV0u
         RjBfC/p+pwSLFLEhZngJpqv87daj+xWhID99Z2ygLEYk4wlUUAv3LVjwP4ejUg2q/ksF
         ahvjtGehmvgGoust7Py3VUgBppTPuNZ1VLodRVsBMcvOnbvhlLqj3O4pAdCOrJCsXC85
         HaBg==
X-Gm-Message-State: AOAM533+JM50q3v9OMqCulVa0ZQOY5t4zqnfneXHyVnNtTzdVPm4w7xo
        cyyvPdm8wqLLs0WwimfDF00ULA==
X-Google-Smtp-Source: ABdhPJz97ibe4mL5V709J4FxeTP0QTsMPLW98CWBdTf+a0Ssiv4SXm6T3yHRtbiaJcdYa/4CYkWjeA==
X-Received: by 2002:a5d:47a1:0:b0:204:9a7:22cd with SMTP id 1-20020a5d47a1000000b0020409a722cdmr12008587wrb.186.1648927744568;
        Sat, 02 Apr 2022 12:29:04 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id y11-20020a056000168b00b002041af9a73fsm5770629wrd.84.2022.04.02.12.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 12:29:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: override nodes by label
Date:   Sat,  2 Apr 2022 21:28:59 +0200
Message-Id: <20220402192859.154977-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402192859.154977-1-krzysztof.kozlowski@linaro.org>
References: <20220402192859.154977-1-krzysztof.kozlowski@linaro.org>
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

Using node paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).  This also reduces the indentation making the code
easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
index 6a1699a96c99..596ad4c896f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
@@ -18,12 +18,10 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+};
 
-	soc {
-		serial@75b0000 {
-			status = "okay";
-		};
-	};
+&blsp2_uart2 {
+	status = "okay";
 };
 
 &hdmi {
-- 
2.32.0

