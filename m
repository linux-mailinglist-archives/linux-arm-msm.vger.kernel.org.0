Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E75742F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 23:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjF2VBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 17:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjF2VBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 17:01:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378453583
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:06 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31409e8c145so1302976f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688072464; x=1690664464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOBQQAO39ORd9139cxaa/8jYBiyUfsE1Tz3TWmmoA48=;
        b=EHkaO3Xz/aFpzpDvUr+1th1OQNVk2w8qipWA/+EpTRAkILexEhuDc9lxWSslxxSWGg
         27IAOJezPtavNF6vTpt62/YoctOqc3QjkNrsddQWumZoSNnKgxp8dN1W9RpKp1gztNQv
         GtG0ZBiLuxsNbPAzQ38ObWaWbFWI9rBtCPqeeCPB0Ihwu8iQqqhi1PK/zogqDIS7CO6n
         RUmQ3ifNpWAJYLgemxVtrPGFTNW7kG3M1zrJk+HFtxxRbyiuzfoNdqFW1sudkvgCAekV
         d2gDTfNpb50pgMEBHKh6Y3ZvRBe2c7RGqbv7kIXZRcW4H+iwQXE27tneUWw6QnJhW+TA
         I29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688072464; x=1690664464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOBQQAO39ORd9139cxaa/8jYBiyUfsE1Tz3TWmmoA48=;
        b=AcSEHZ0RYOEXtyu3aHBplUPOn4oRl1AHM5A6RxmXpO/lIVNCgzoNjnM9y1+RsDX2yD
         z/Zm3ez8Jjg8UTzCpj4sTCDkOoRbQx4bdikPXjpPDep2xq7CtN1oSppgHgtuqsVro55d
         M3syqjFbV97DvPvujc7Hef2Tls9Ew6QsEu5ZQkhGvaxNnjChSFEmHQCKX/5kqRXlrULv
         K98vx9iGt3h57+4nG1wQYC1DwlYLy381ECtSRy9nui1602eYJRk/KUJN3X/K/SICoiWn
         /t4kmkxWIIBO/cnQYEk78HNABl/+n0LbbpL8nuASdcN9SRNQR5k4VmaNrSVvx4e37v5H
         UGfw==
X-Gm-Message-State: ABy/qLYf+7dgxgd5TJWyCfYnyG9IfGGxR8nc/jqKXim99fIs/pABq/lt
        T+77n2/JQnluJcczhYTbVyZ6EQ==
X-Google-Smtp-Source: APBJJlGTTPfQrqLF+wgBEqRxUOJBv9wdQQQWG+9w4ApC0NgSyPibUxk3CWKWZ9PIMFZB0p2RBapehg==
X-Received: by 2002:a5d:61d2:0:b0:313:e8bf:a6e with SMTP id q18-20020a5d61d2000000b00313e8bf0a6emr560436wrv.21.1688072464741;
        Thu, 29 Jun 2023 14:01:04 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm15745722wrs.55.2023.06.29.14.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 14:01:04 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Thu, 29 Jun 2023 22:00:55 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm850-*: fix uart6 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v2-3-496b581935c1@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=mIKtpml91PM3gdeXmNYntQf53BgERbNuTOCLXCFBW1M=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBknfEMQdBXLRT8t49iYEWTFPolTPzPtQO+LLqYz
 ch5VknnbEeJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJ3xDAAKCRAFgzErGV9k
 tln7D/4+IwOi1ioubjJTKTUpZHjSTzkFasotbnr136fREsjAU8nO5BUGOij7MBcE580X4DdeZpH
 YU48ItNUflILo5yEOO5L9gTPR9o4vOwLaAIE9WbRhgZzrBB6BYfx3AP4hHGj84ac0GNINyQHpPn
 WpY/t8Z3j4yVIKfqXWdS/QGjrKXk4LtWNmjWMmRpr+ThkpUpuS4CrtREdTFlvdcdrShfRU1pI/j
 NSg0p1lpfiKdswj4/pAiIVm0u1jwuwe7cYcix71R6UL7VgOiyZaPA+FRFC8sn0kbUoH486MCpRG
 Oo84zr+RJOi4/pGMp561QDaN8+D6eAFKJwM/xHzNVWO3p+Wym7bREmYm1QN2RB+P1echXkVchh6
 FOA1XP38/jalCuyl55wH9f3nW9rfbfDiXJgOaHYuJ1BPmZnANvcKnv5W52BwSQnb3LGVvp2Qa8B
 YQV5Jgv+9czWdrnGAzGLnaY+Y6BjVYPt2yCBujR4g3AA3c0d/s9UT3yBxYTAtAyFM65vgXPRDkE
 +elv5r7pO+P8E0NlSPuF4GfzcHofW6WYu+lVNxGpS5HKPHe/6gZuRqCbQcR77xJjFn1kvQwtBC1
 RdfAxAvHwmDgXxfSlp2FWDlO6wRdySB23qcgjOqL7pMsSZAr9QdcLrNEhrwdhoosTSaA0m2XREI
 sSebzK+qtkL/n4g==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a follow up on a previous patch[1] fixing the aliases for
sdm845 devices, fix them here too.

[1]: 4772c03002c3 ("arm64: dts: qcom: sdm845-*: fix uart6 aliases")

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 141457ddad6b..fbd55bc89fd1 100644
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

