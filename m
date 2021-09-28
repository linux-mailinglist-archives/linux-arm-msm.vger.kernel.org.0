Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BAF41B1B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 16:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241204AbhI1OL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 10:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241228AbhI1OL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 10:11:26 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E49C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:09:47 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g2so14949295pfc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+zsmMrRAzfRipxgVfK7O26W9c5/MJYDdunC8ZqBcMWg=;
        b=t9hVfVM9wBiX9IM06S4O9HxmSCryQxvobN4emzHC9Z/XPjvCChP9aUEeG9Qg35/BVY
         jioMqnc+iXmLWxpEK2oom/vbg4pdogZWRxbDPmXmviB3RejC2oI6nVpHr2XSJBAdb2PV
         m8QmSUxtr/Q0mURjN0A+ucQ3j+Tx7c53gSe40j4x+Ur2kSzFIKUHrpI0hJChVtbWr+vI
         ZHy7Z32sTXYJu1nnCRmtj+lABwP2MgEQ3HpiejukxFnSjOlNQGG5t5f6jWA758LZ8HwE
         m0dXvRBlx9BLc4EFKtNrpKENURIlrowJZqqun05J/LpadF/qoUqgVxamGHYYp6RBRf6c
         bqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+zsmMrRAzfRipxgVfK7O26W9c5/MJYDdunC8ZqBcMWg=;
        b=uKwGoNOit+uPrTaEHTUNjH45Nj1LKmSE0nm7pEs8x58G5khs7VPisq9YsfOJPSZjvx
         7yjpsV/PdqW2KXv8ZUTLXOWc4FDojDiLyJGVXwZT5ck2JerT+xTobF1+ftVP0d0SiIke
         lLsackUR05Tcf8gLqg0pAZLziN28A3G1i9PIsyTw7pCEVV+DhgwreuHlMjMlZ2cuj100
         clK7tsqdcfv7CTbKgbG8hrqsOhs5h6DuWhJFn7PC+6GkzARaCaIyleVxzMZJnHTnqF7V
         DV7RsAgHGyUPq94WKGnw70C8jecHWfU8WaSbVSnPsugtKL4Npa5PoqPntDGbKHekm9HL
         lQiQ==
X-Gm-Message-State: AOAM533p00uIHjpfwA566chRPeKvgUnvONuu9vf4mOYGDTC7mN1gu2as
        e6B42sqoKko85+bW3nZfn6e9oh7hLRQ0Fw==
X-Google-Smtp-Source: ABdhPJzjzbIhwvhJzd89ynHYRzjm4NVqbJOdI5Gk2z364qkUH9PuH6E3OpbNp1mqvYD9n49YhzpeyQ==
X-Received: by 2002:a62:7f58:0:b0:44b:5ea6:9fb6 with SMTP id a85-20020a627f58000000b0044b5ea69fb6mr5735276pfd.19.1632838186962;
        Tue, 28 Sep 2021 07:09:46 -0700 (PDT)
Received: from localhost.localdomain.name ([122.161.49.251])
        by smtp.gmail.com with ESMTPSA id ch7sm2704578pjb.44.2021.09.28.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 07:09:46 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8150: Add fastproc nodes
Date:   Tue, 28 Sep 2021 19:39:28 +0530
Message-Id: <20210928140929.2549459-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928140929.2549459-1-bhupesh.sharma@linaro.org>
References: <20210928140929.2549459-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add fastrpc nodes for sDSP, cDSP, and aDSP.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 119 +++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ef0232c2cf45..4895923097d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1746,6 +1746,33 @@ glink-edge {
 				label = "dsps";
 				qcom,remote-pid = <3>;
 				mboxes = <&apss_shared 24>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x05a1 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x05a2 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x05a3 0x0>;
+						/* note: shared-cb = <4> in downstream */
+					};
+				};
 			};
 		};
 
@@ -2961,6 +2988,72 @@ glink-edge {
 				label = "cdsp";
 				qcom,remote-pid = <5>;
 				mboxes = <&apss_shared 4>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x1401 0x2040>,
+							 <&apps_smmu 0x1421 0x0>,
+							 <&apps_smmu 0x2001 0x420>,
+							 <&apps_smmu 0x2041 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2 0x3440>,
+							 <&apps_smmu 0x22 0x3400>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x3 0x3440>,
+							 <&apps_smmu 0x1423 0x0>,
+							 <&apps_smmu 0x2023 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x4 0x3440>,
+							 <&apps_smmu 0x24 0x3400>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x5 0x3440>,
+							 <&apps_smmu 0x25 0x3400>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x6 0x3460>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x7 0x3460>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x8 0x3460>;
+					};
+
+					/* note: secure cb9 in downstream */
+				};
 			};
 		};
 
@@ -3337,6 +3430,32 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apss_shared 8>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1b23 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1b24 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1b25 0x0>;
+					};
+				};
 			};
 		};
 
-- 
2.31.1

