Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFCBE6B8C96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbjCNIGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjCNIGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:06:01 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09FA8483D
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:51 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id k2so7830151pll.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqwK6TcGjAz04KGXLoszY4ospGxs4tGDAzQeGyANDbE=;
        b=nP/Tw2wixTXRLo4uciqirv8e2e05IGj3I3RKHIWEL/gCrS0deSj14T78ipg5nURkyt
         hZzdCjeuDl1uU7oXq3zjmsgUa70kRudHCDliEUnEFfwtMcuH3ScQw/ptFAghBUU5ElfP
         LqkHr6cIfMR1H6U3tKB0rJBY7f6+k+HkEKzZ53tD+Mw2fe7QUpqG7utRX80Byf7f1Yfd
         4XaQUIwcFOXj8sEQ9E1O3TwuhfktGqaz2hOrvav1zxZdAK4eLDiAQBnOrK2QHUPxUbJ7
         0qLNcBhn9NbhGBIUCPyWtDzR7xaBj71gdjEzxOTBUDXtIqEO3cI+5kHJYMEmxv/+oc3/
         9RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqwK6TcGjAz04KGXLoszY4ospGxs4tGDAzQeGyANDbE=;
        b=SCnbibFhmgJiMCefc6vEQV26JiYVlICQyxaUVfdjHWbHVqDECZ5kSOuHv26KiSL/GD
         WBtdoJbAclLZjazdFODcY+bNefLozt3JtVoWyadfeXQJk/uRYwMD+mtH8ODSRQArr1Dx
         EOcgvydyo1Zkycfkw5DF0NINfzfVdCEVchnGOTvVrVH3UWc/K0OgJVr67uG8DX82mSQf
         utGMnVxBoRFJx3E1uxI+dg2NuNlbDT1A/WeDVO7eYNXXo1v9JnWG1hLN0NUUFo6+iuZg
         PksKPlikmxqYIa/VSkjBAGgYBFtF2ngOrV8Kpdvjjt7oE2Z0QXdoQlcXJbpNwV6Imdo9
         qdcA==
X-Gm-Message-State: AO0yUKXbl/b8xSUKHH1aJilB27sSnCwMyH4WTd8BD4SvrFjXWcxNoY4T
        nXXd6Mw4ORQ+SZ+l5FSRX2XE
X-Google-Smtp-Source: AK7set+3jxjTVufu6gLNWUhkkyccG/7NWuiW2l/zYR0R7qUAePKN3BB2I3QBYStZpfSJloobYYi1Jw==
X-Received: by 2002:a17:902:c412:b0:19c:be03:d18b with SMTP id k18-20020a170902c41200b0019cbe03d18bmr51755970plk.22.1678781151536;
        Tue, 14 Mar 2023 01:05:51 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:05:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 10/14] arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 13:34:39 +0530
Message-Id: <20230314080443.64635-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1a744a33bcf4..636dc6823d4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3981,8 +3981,11 @@ gem_noc: interconnect@19100000 {
 
 		system-cache-controller@19200000 {
 			compatible = "qcom,sm8450-llcc";
-			reg = <0 0x19200000 0 0x580000>, <0 0x19a00000 0 0x80000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x19200000 0 0x80000>, <0 0x19600000 0 0x80000>,
+			      <0 0x19300000 0 0x80000>, <0 0x19700000 0 0x80000>,
+			      <0 0x19a00000 0 0x80000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

