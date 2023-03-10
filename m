Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE646B355E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 05:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjCJEL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 23:11:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjCJEK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 23:10:28 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83713102B7A
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 20:09:35 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id a7so2852017pfx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 20:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678421375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=T838p+Gk/zYv4/Qevbgh+Dc7eZumK6aAMJLP/Z15+n29Gc5V+aodL4yew5LU25+JUr
         cvVvBkeOLmKXSMPcLJ3jvvHdE6q11Ml8iUw5zmnRGPPHki3j72e/pTojc9Cp5Dk7p+z8
         SAvYgUhlJkJhgBeXwzeLc+jqmed25ZnhigQlb4sI3uEUUFsyXDCkJ5A0rgueFGeF/170
         RC7AYR2Nz9f2qnLSIWgp4PYjLkP8fBuFh4S4RVnQlzX0+jHZY4b7GkzqG5cjnnEUXLNB
         JDtE3O9hRDBX553kJrMBIGZIopzvggE4DhGBYdK67YcPYN2jX5mC3UzzTpFWf8zzvlGK
         Fk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=hBI1xWwHqLkq49bWibq+G3GxFTOUCQcgf4NednY3QA7ssYmcMGjg5GAZOQE7c3IIO4
         4G6NT/HtNaYyHiv7fr+oyjEsArsMasb1jRSu0P6FdPzpV/+l2CQ7ExfRI3h4jZHE2vYe
         FQdZ80aamzHGi+6xlnJPorjWSfkjeM9MH+6IatbURaXY6fe4mDG413RwjkQT+vUm2s8R
         78OjWg4Vb1V+wFcAmCl4mRV+kuvGtlkVtIuCap+wUOMoe5uD4tN7rjN6v1H1rQnXvtTz
         +c5/3I0PtSDMY4dTUJMmpZckEf1Zm3gs+no58+w/wKiLg0MiQ/mPKGulcPhc3mwudvGR
         e7qw==
X-Gm-Message-State: AO0yUKVKKkZVfW9E3mJpmvVoSxvGQB0ETGoif/4JlTE1gssPEqirkkTy
        /28o5C/V3cW42AhpHyHqfNYY
X-Google-Smtp-Source: AK7set8iWgZsctnWyqET4kdeHLJhm8V0kp44MnXmDnxSHmcr58iaHZEabkhLVBxnrwRZ1052oZwOaA==
X-Received: by 2002:aa7:96e2:0:b0:5a9:cbc3:ca70 with SMTP id i2-20020aa796e2000000b005a9cbc3ca70mr22595640pfq.24.1678421375186;
        Thu, 09 Mar 2023 20:09:35 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.67])
        by smtp.gmail.com with ESMTPSA id y26-20020aa7855a000000b0058d92d6e4ddsm361846pfn.5.2023.03.09.20.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:09:34 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 15/19] arm64: dts: qcom: sdm845: Add "mhi" region to the PCIe nodes
Date:   Fri, 10 Mar 2023 09:38:12 +0530
Message-Id: <20230310040816.22094-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310040816.22094-1-manivannan.sadhasivam@linaro.org>
References: <20230310040816.22094-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "mhi" region contains the debug registers that could be used to monitor
the PCIe link transitions.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..46caac9acc95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2282,8 +2282,9 @@ pcie0: pci@1c00000 {
 			reg = <0 0x01c00000 0 0x2000>,
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
-			      <0 0x60100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "config";
+			      <0 0x60100000 0 0x100000>,
+			      <0 0x01c07000 0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "config", "mhi";
 			device_type = "pci";
 			linux,pci-domain = <0>;
 			bus-range = <0x00 0xff>;
@@ -2387,8 +2388,9 @@ pcie1: pci@1c08000 {
 			reg = <0 0x01c08000 0 0x2000>,
 			      <0 0x40000000 0 0xf1d>,
 			      <0 0x40000f20 0 0xa8>,
-			      <0 0x40100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "config";
+			      <0 0x40100000 0 0x100000>,
+			      <0 0x01c0c000 0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "config", "mhi";
 			device_type = "pci";
 			linux,pci-domain = <1>;
 			bus-range = <0x00 0xff>;
-- 
2.25.1

