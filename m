Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDCEA63A8E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiK1NFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiK1NFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:05:53 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7C9101C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:05:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f13so17220134lfa.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuQh48C77gQ/TMVZxCsqY8SgBUnajng0+oyERW2vKQk=;
        b=EnjSZlGpndXNviDybU2/KigDMsBgeP8C9gpb3sG5Bz7dIldg6KjR5IxMw1I8DiAVNY
         0eU46wFNPtqT8O2ssOiSk3NR3g4f+NVlw7yLvpd5TknDMQqfwgg5EQdT/FUTitbMYEt5
         7ktV3BtKj/lwA6d6GnFLuoUkqSA/BAYg1h2Q0yMhZzT1ACWYimwMqwiVdbtDo9EtlL/i
         bNRY4Dn3SdLUg1ny2zjXQ/gsPD/Hl4+P9aCastjzDzYrPMovivjxgEpd6JI6qiSLMDli
         qheFrt+S+XJ0iGHgH4VV+p/+108tABMxQIzSs9iuXCPe0+/m9ABrNMrzHSfHsvtAIWeK
         QPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuQh48C77gQ/TMVZxCsqY8SgBUnajng0+oyERW2vKQk=;
        b=uItHSAiNF+tz+z5iU6tdV69cAlkrDtdKo3vctmEEVwjqScXt8t3A48WdJHERQKtla0
         IimzJdLMPjM0p33r0SNaCuVUrgJXsI7dA6htPAlhw+YLDnMBqUAPKFTy5tbQgacBKiRY
         wLU1vJSbQKoxwC38Fxkj6c2VQBjAD9l8AiWpHhNbu1BMh8CaNHRkQI6UpU4O47QyjGSq
         Vo6KV5O/gQhsYO/G7XnJ2CplucCd3yaSLq3eijXvQ5ot8Su5ZBAugeELYTSTFrGlHGws
         eH5gnuqjA6x5ihTVjEzANcOgZVCr5Fenxd/XxY6YuivqFPpawVlDn1FSgucht2JWLNsM
         pDIg==
X-Gm-Message-State: ANoB5pmrpqmsJ0YHrnujSyAvhWmWGIObNUa0onCoK0t1CV2I/SvwDvuO
        ApDujiY+AyfxNpvKoDAvD4yVSQ==
X-Google-Smtp-Source: AA0mqf6hG/rlcj/xsEokk0uGjyjnsw9eADiy1/1UH8i/KvRsZ+ztogS1oFqwMVRSli93VHxCCJYRSw==
X-Received: by 2002:a05:6512:3762:b0:4ac:5faa:654d with SMTP id z2-20020a056512376200b004ac5faa654dmr15767649lft.684.1669640751132;
        Mon, 28 Nov 2022 05:05:51 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512202e00b004b501497b6fsm1354324lfs.148.2022.11.28.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:05:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm: dts: qcom: use qcom,msm8974pro for pro devices
Date:   Mon, 28 Nov 2022 15:05:45 +0200
Message-Id: <20221128130545.857338-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128130545.857338-1-dmitry.baryshkov@linaro.org>
References: <20221128130545.857338-1-dmitry.baryshkov@linaro.org>
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

Use new qcom,msm8974pro compatible string instead of qcom,msm8974 to
clearly mark that the device is using the Pro version of the SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts             | 2 +-
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts              | 2 +-
 .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 38e69ed4fd1b..77e423b707ce 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Fairphone 2";
-	compatible = "fairphone,fp2", "qcom,msm8974";
+	compatible = "fairphone,fp2", "qcom,msm8974pro";
 	chassis-type = "handset";
 
 	aliases {
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index 38a95430c7d4..20edb88ad81e 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -7,7 +7,7 @@
 
 / {
 	model = "Samsung Galaxy S5";
-	compatible = "samsung,klte", "qcom,msm8974";
+	compatible = "samsung,klte", "qcom,msm8974pro";
 	chassis-type = "handset";
 
 	aliases {
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 8265a0ff7857..1380ac81dc23 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Sony Xperia Z2 Tablet";
-	compatible = "sony,xperia-castor", "qcom,msm8974";
+	compatible = "sony,xperia-castor", "qcom,msm8974pro";
 	chassis-type = "tablet";
 
 	aliases {
-- 
2.35.1

