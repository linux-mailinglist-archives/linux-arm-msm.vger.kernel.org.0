Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4794868A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 18:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242013AbiAFRcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 12:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241993AbiAFRb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 12:31:58 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E674C03325A
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 09:31:55 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id v123so2327071wme.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 09:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+lqRhrkooB1DRVf4+Ugj5CfxzFlazGWH1jNE3D3s2OI=;
        b=B5og2ahCvc0V5eQYnz//9KyB1M9yh5OnSf9NEBwUn0cl6yfDw9koEPExIjvXDrqnVr
         PiM0tlvwNs69cnyhj8cFKJIWsNlqEqJII5HPFrDiWQx9p6W9RtfxhJk5ObaMJj3S5qsI
         W4i1wPNu8vY4tQe4f1XMuQhUoHzlrjDvLDmteFfjNrlFc/Oa1KleP6lWJxdATSfs7RXs
         lZOb28HuXGjMhutAM2RSA8+s/4TWoki8beGts/bwyhnd4Kfy3Xg1eUST9MBGRZrXFOKu
         ra0DDvOrY0NookVrMZac6z79cY+S1MRs03lyf8u7wOGFk1zc4lIaFqto8FQZWVSP+ZFx
         h9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+lqRhrkooB1DRVf4+Ugj5CfxzFlazGWH1jNE3D3s2OI=;
        b=VABdmKPcEsxtTWigC/sroEsq3ra/9RjygGUnGPg1zTI3OjI22XiDB6FEh8QiiVfcMz
         WFIeyt6zt2I6lLBVmOlELaLfjGAnjszZDNxTsfvcu8vMSenV3Ac6f5Qyvjn0HcveMlBa
         Lv63zOru0ghyBggaYSTTE4Bq3R51mmZuYW2MwgL5V28Wv0+UbqPYV/uzcvB0vIaCewDb
         IVfpsenrmZey1Pcd11RQBKGftogk+mYlqZJjVbiRntNxGxIPNOhfRbcTgBao6jIULBxL
         0uS/CZazb5YJwV/+7RzhSrVafaJhrEs/XzFdzIzanapcEk+p4vjodLlUhlgpICw9K6gT
         AXjg==
X-Gm-Message-State: AOAM531BDcOs2bIrgVlEbUkWL45AYmvpHUZsItMUiVogAq4AjEEkDdHZ
        5dEXTya+pzordPLt3celKz62pg==
X-Google-Smtp-Source: ABdhPJylFri1IhYTfNifFni3+y0w41rnv8HNSTX7UHKiOdSyFAW6lastbZD9vY82SCOO+4/F86aazA==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr7812524wmc.58.1641490313995;
        Thu, 06 Jan 2022 09:31:53 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id b16sm2575594wmq.41.2022.01.06.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:31:53 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v3 4/7] arm64: dts: qcom: pmi8998: add rradc node
Date:   Thu,  6 Jan 2022 17:31:28 +0000
Message-Id: <20220106173131.3279580-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106173131.3279580-1-caleb.connolly@linaro.org>
References: <20220106173131.3279580-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..da10668c361d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8998_rradc: rradc@4500 {
+			compatible = "qcom,pmi8998-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	pmi8998_lsid1: pmic@3 {
-- 
2.34.1

