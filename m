Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1986D358ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhDHRFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232515AbhDHRFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:30 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF31C061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:19 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id k8so1848249pgf.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ejJXVBT5cBRarr3YHdHRXIKuEjksOMgRH6cDDd4fC4A=;
        b=gp4g5meSQtfycjiHInhRMBUaoK64/oyZdSgaVs77co98X/4vWXY5vXdesA3No3Zosw
         fip2DyI/v2rxEMK0qL9bNvq7YS23of7PORV1GvHCpui3C0o0IWaHQADrCQc4ChlB0QMo
         9cJnU+rm3s7wd/cby3/CJcP0xuX4huDmn1nXJB0EPU+huZIPjBBJCb7w2+Aw+iYddqR9
         2SWLlI40Z6cWmlO59XS/ynItgFs9v++vEEqnyFFDi9N9WsBxAZUT4KdL4iM/7lplacZy
         kBXhH2EGyM8LhO1YpE7DFq+zp0gzZHxhGVXojLi02AsQ1fHC1AymMTzNiD9pzaVF92Qp
         4q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ejJXVBT5cBRarr3YHdHRXIKuEjksOMgRH6cDDd4fC4A=;
        b=JGsPGno2/ghRB5ptvt1UZXLe0FSMavv0q1xPls3ophhhPJuK/B18NOrQ/cj8rIE8zl
         EhCiLnDutJZVhkhpz3wkr8E+HyLZgkcCVXCSM78DLEFFjhUokMmQnwxoE0Ykjd6s2sSm
         9GhdA2IK+Yl3ub3t184UMJwRWaxEyNTaHCpA+bRXtzHJZ2iEf+XifVAJVUDt2a0jUsqn
         9HMq5iCFS72YkhWC8YohR8kg1do4Xc4xEifkmXcPCES2pJX6Lymn1a3+fAkMqBgjHCfR
         HHyUS12Ybq7TGcqIjlHRjdNMqhOGyB8oj+KH7LRzxN96m0njDMNxTlpnVOhpR1CVUh9B
         IuCg==
X-Gm-Message-State: AOAM531WuXIjLS41/uzhnSNfqudQ7KMFVy591vfBxrtUor8JIDPDC08K
        trOQ/9yiA2Y+ZWAE6fuJjiie
X-Google-Smtp-Source: ABdhPJx24YajAJQ4ugMcnUGMemHvnOVpbzQPKgJD8Q64pNTegMg+CRvsEI/6mtGz7HQJi2XeUeKpWw==
X-Received: by 2002:a65:6242:: with SMTP id q2mr8847360pgv.277.1617901519013;
        Thu, 08 Apr 2021 10:05:19 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 04/15] ARM: dts: qcom: sdx55: Add modem SMP2P node
Date:   Thu,  8 Apr 2021 22:34:46 +0530
Message-Id: <20210408170457.91409-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SMP2P nodes for the SDX55 platform to communicate with the modem.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 20cb2c903a91..f2805b526516 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -148,6 +148,37 @@ smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apcs 14>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

