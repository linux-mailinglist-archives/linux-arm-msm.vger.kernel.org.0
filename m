Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1B8597229
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240668AbiHQO77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 10:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240670AbiHQO7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22639D8CC
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c28so15288446lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jWF6n+I4kNaTh0+wS5ew6McBkQX1vr8gLcwhdcZ+294=;
        b=VYTxhkmUOIanaG/LYrmZX4VFnRtLNLjphcbJlvD0aJ46afDqqJoHzQztoTdj7MmUfO
         SgwNtPjXZpdt13PrNzkUCiRRFrYUzmNKsOOyUIQOBixZtYx/aIAdnBIFC6OPOxlYxYQE
         WBUiHwPBD7fKim0Efo6+l3FNoHSgzzP5OxkHAqxsy64coOoaeqhizjoM2pFt/0kc43+6
         Qal3S84ICoUTQuCBLxJqUZjp0vcpX00ScWunHBb4bb8rbEBkH8X4XNuKAdaa+l8cMUbC
         yx6fACQhBePo8XFM54lt9LZfvneLDuefT8WryruekZqZi0ZUhrKz1FR20GKibXqEsjVe
         C2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jWF6n+I4kNaTh0+wS5ew6McBkQX1vr8gLcwhdcZ+294=;
        b=ijgoO8plRtxl6FtAW+6HBxY4uYvhQNkm5H9tBaPW4qW5d8L6Y55Dcs1v5BcpluP1wW
         5fq9NZP9voU/dUI2XutxPda2ZIgQaf1jZx/Hqkvp43hen6BbNQJQADoMnC0pMPT941XI
         nPByrJcvhSktP85H4KEofIk0I7NpnZygTvFHKNrSpmkufvZOeC95uaWFaHh09sCaE5lX
         kp9qrPrCK1OkwwteWvvzS0/hU+9P7qmkbNampWEIKwG9EgD+rBSDaaE0PrtVywMUwjbJ
         w97lBBVYypBV+J6BWUdkQZOOZM1bzqvFJVaGKJOwgplRaGEphEObDmT2Rjwyetn0M3wl
         3SLA==
X-Gm-Message-State: ACgBeo13OwJKFe20sNegcbXVldMwnoozmcAJeawkqOXgQGQLk32QybKO
        EHrK+9ThaMuV8zGVoxxWDDPapQ==
X-Google-Smtp-Source: AA6agR6YcIcd3f/KjVsmOwSBtPeN0nqhBr4HRZuho0j8CFgszJRqjxqcJN2mDn+dR2AxmwZaZGfb6A==
X-Received: by 2002:a05:6512:c06:b0:48d:1d99:2a1a with SMTP id z6-20020a0565120c0600b0048d1d992a1amr9877957lfu.396.1660748362178;
        Wed, 17 Aug 2022 07:59:22 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:21 -0700 (PDT)
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
Subject: [RFT PATCH v2 09/17] arm64: dts: qcom: qcs404: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:53 +0300
Message-Id: <20220817145901.865977-10-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3a94eb2cc448..c79600c28398 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -727,7 +727,7 @@ tcsr_mutex: hwlock@1905000 {
 		};
 
 		tcsr: syscon@1937000 {
-			compatible = "syscon";
+			compatible = "qcom,qcs404-tcsr", "syscon";
 			reg = <0x01937000 0x25000>;
 		};
 
-- 
2.34.1

