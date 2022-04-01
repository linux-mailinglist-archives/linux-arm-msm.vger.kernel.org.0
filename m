Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524BE4EFB87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 22:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352729AbiDAU3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 16:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352969AbiDAU3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 16:29:03 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880C590FFA
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 13:27:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z92so4241664ede.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQBy6B5GM/EaD3wIc1+Exupyw8if4FeDLlbN9LOSedg=;
        b=jSbOpI4F89k7KaiKpsGWGdpK82oABZyLeUyJauPVm449biqjgalCHlXsaoQSGjXA5Q
         fejB/667OqKA+yWpQf1ehM5McLxExgrustmssNboLruqW5NuH0QAvsu21yXNrPB1SbSI
         NpB5vRlMxmiRSwpgBuJHrSm7DFNXsDHbz4xmBsTd/jcMzlneNcjq1/euVLXwUkQiyUfF
         9cUpZBLU0dWghQGE3LrqCHHL1vwcXh6Vrh3Q3rDewEhjwazXFiaM78RrzwI+PXVUy8aK
         ybqAQOMBm6tBrO1TLA7ijbXNxqNbZG56id0nQl9yn+fUB5WUVBkEhU1wR1biaexqVZwD
         KS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RQBy6B5GM/EaD3wIc1+Exupyw8if4FeDLlbN9LOSedg=;
        b=hAzV+UGcWDYtFl6RP/1qwqf8xYIobmLechk+PML4GB15TBEstqy+cHJeqaAgrxzzia
         SAHrVkbQvl9f7ulE48vv+poGCgxBWJN/hVeRjg+nyfi/IKfTVECB6zUEOQmo4ma3sovb
         Jxyy6LIGsyzI3RG8rDuNiiv4U4oXH0GaeI+0G7n42l/xLaSGUoIxqAu6CxBGq6zV+OSC
         ME+ujspsavWl2Nvvos4lzQjFBQrgrJQIpDekWsxIoEE7AAqMfW2UHBTNSbwskFJxoYUA
         REL3ektNKxsSFAQls+VEMaEAv30dUGj1Ix1lAWNM5OvCZp/R0lQEfzXx+OlUmlDz36Zv
         ie5Q==
X-Gm-Message-State: AOAM530aJX07+1DUYnQc5OXbLlFA7wTvmXa7AOzBEv/fyqAHduMnFHdv
        quXz9d4JdFQZw/7aTjXjPWjKnA==
X-Google-Smtp-Source: ABdhPJybst4FMUoQiNNa8IFLKRH0nu8beDXkHBVK4LvEdXuUP7yr9PuHQS/CugwyJFlinipY07wKKw==
X-Received: by 2002:a05:6402:268f:b0:419:56cd:79e2 with SMTP id w15-20020a056402268f00b0041956cd79e2mr22560948edd.18.1648844830403;
        Fri, 01 Apr 2022 13:27:10 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm1619346edl.22.2022.04.01.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:27:09 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sdm845-xiaomi-beryllium enable smb2
Date:   Fri,  1 Apr 2022 21:26:42 +0100
Message-Id: <20220401202643.877609-6-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401202643.877609-1-caleb.connolly@linaro.org>
References: <20220401202643.877609-1-caleb.connolly@linaro.org>
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

Enable the smb2 charger driver and add a battery node to report the
battery stats correctly.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index b3b6aa4e0fa3..e6170b05a73b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -109,6 +109,14 @@ rmtfs_mem: memory@f6301000 {
 		};
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
 	vreg_s4a_1p8: vreg-s4a-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -302,6 +310,12 @@ vol_up_pin_a: vol-up-active {
 	};
 };
 
+
+&pmi8998_smb2 {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &pm8998_pon {
 	resin {
 		compatible = "qcom,pm8941-resin";
-- 
2.35.1

