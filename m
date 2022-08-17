Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C119597268
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240578AbiHQPAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 11:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240577AbiHQO7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7D19D66D
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v2so19334780lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wPKBtYXi2Ze3ckC0zD7CwQ7b3Iobe2+hO++/2P5RVXo=;
        b=fYktL5rBrnbRLutzNuYkG9xEaUY6HADsN99LEyldvipx5hK95Wti5n+LPNBt7s68Tx
         39UKh3Wjbos94dN3sAo26fRbvuZHF0DKGg1W2k6lISMLEi8Rd+I1EUcvIFp6PWnHL4wm
         oPJbZ1+tChBsrefXdrLOcWhQdn3//hzLxFZjlTRwZGlHYp0IrlWwVp4wPYs2VXZGLk52
         Royu3lTY533uaC9kTZA3f6TJa6pKmI8Ju02A6lHpUj9ACiBnvRigbXomMdHtnyhXys81
         Wf+IA++PXhOz+lK6aVSUT/QQR7pUSlCf8jB9CMsobXLARL8xenU3TD6tBRmBchDEEMpj
         wZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wPKBtYXi2Ze3ckC0zD7CwQ7b3Iobe2+hO++/2P5RVXo=;
        b=Noh5diI0+FJchcrIYbWXjKF7vFvfc7fEdKFzMYLiJdtw+FUvT4A+wkZCI3HOrdCXrw
         riEty0u4P37KvViZBVAy+ta6FLuOhF4dsyrwwtRSmXdmWrW2OJaiqlZROMPyD21ctaTf
         +m92nKNsWWLWaE4ihA1i5OBW6XJbrevXIwxtisfT2/ggIlmwn2GfgqSr/fjsDlmYkzUj
         yYy6NkiusohSfMYiU62HI/ourt3CCHI3LCpohr7qGau/a8s2LqXLt0xt6eGy3TH2bqWv
         Jdan1Nt04y6As/eV744npMkJCysYXurZtQS3na5x+fmHS6B3m9bZWjg+SPaqO9QZZCh4
         MA3w==
X-Gm-Message-State: ACgBeo2FXBdMzbWlFw92ShHs3JSem4pviX7zcDTjfeUWv5MZx5Tbwd8M
        52YHOlbmQGGnQz3kPHO3ie8YFg==
X-Google-Smtp-Source: AA6agR6MOlVK00kjbchMKNwSwRq2zfORVGHLlgFVqP5A5//waKyy386hgjs5+k9v+bK1QunSeAbc3g==
X-Received: by 2002:a05:6512:239f:b0:491:cd95:f67d with SMTP id c31-20020a056512239f00b00491cd95f67dmr6131346lfv.184.1660748358509;
        Wed, 17 Aug 2022 07:59:18 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 07/17] arm64: dts: qcom: ipq6018: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:51 +0300
Message-Id: <20220817145901.865977-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
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

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index aaad7d9059f6..6b35f03c4862 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -258,7 +258,7 @@ tcsr_mutex_regs: syscon@1905000 {
 		};
 
 		tcsr: syscon@1937000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-ipq6018", "syscon";
 			reg = <0x0 0x01937000 0x0 0x21000>;
 		};
 
-- 
2.34.1

