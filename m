Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26E33B5322
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 13:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhF0LtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 07:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhF0LtI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 07:49:08 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338F5C061768
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jun 2021 04:46:43 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id b1so758948pls.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jun 2021 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eEW2XE8K/ptfzE2ev+8+PL6o0bAxnSmLR8LwfhdyI9Q=;
        b=LttWFLo16LnaXvHbfVD0RFyMqIH6wDbctTNhtEZRcR106xl1T1Qzonqa5a/vDdD1OQ
         RpwH6FhJMo4UGIATuwKl+TVSOoFuwAQV7TorsT90+TD98BgnEErxgxgp2bYyS7GBeno5
         l1g4cIeuMbH9TbzN7QzjWUBn/pVzQrsz4MJlEofX2KMucu/RbnbrXbTaDle2OgrlIwnK
         xJBuHysfT94HJuCJz0Jg0TTEjDAHVxw33b51wYss/yobv2T7sY33rCfOjHnM510lIvDl
         ZRP3XbCqzTtCu69NoN0wbNHm9VxVtUh90zmo61nh1680X7/H9EQKN5pH3PyswuV12ILF
         xWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eEW2XE8K/ptfzE2ev+8+PL6o0bAxnSmLR8LwfhdyI9Q=;
        b=fUyNyEKEExxXeOxWcfe+foO8aHB5a3akN+NclF/pD4jvVoPfZpgSMkwCfS3PoX2w/V
         MEUqLmsLxhbYygxLbBlDXyx/jpIdhLC7L5oXESqh8pg3GVSCESodwofn9CFGMQZgv3Fl
         bvPwxGDh3b0Zy402gN1nvGJFgdAsUxIc+631tHL7CXq/bM9K+hgC4OeZyCcNOYR7AXyN
         er/TaLPMRYs5UBtHKSZqEwCwlLdp45esC8LIqpMSFXf/zzVlpdtfjMQ+bQAQ6qz1rbZ+
         y5NzJEXCUqdB8BsFYOJ5Pm1Y2IE1kxs69Nigcb675qJAvPIQo6ImWXCDFewF55kZ0GT2
         k6Jg==
X-Gm-Message-State: AOAM532JoniJi2aGNdgapM8OYwW0OEPoftHM+XaqUmAAoJWjD4y/60jm
        Yn5O/nVkZCWRq7jG7m6CaKc5h4A5lvlDcA==
X-Google-Smtp-Source: ABdhPJz6QZmqqeMQxEIAlavuKtdk4d4cXuuEDs2MDRTzO79rNRLSIzPT0L6t0cmwnRz1eKcX+KE5vg==
X-Received: by 2002:a17:90a:8a83:: with SMTP id x3mr3828443pjn.157.1624794402614;
        Sun, 27 Jun 2021 04:46:42 -0700 (PDT)
Received: from localhost.localdomain.name ([182.69.217.12])
        by smtp.gmail.com with ESMTPSA id x21sm10768762pfu.211.2021.06.27.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 04:46:42 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: Cosmetic changes - arrange USB nodes together in sm8150 dts
Date:   Sun, 27 Jun 2021 17:16:15 +0530
Message-Id: <20210627114616.717101-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210627114616.717101-1-bhupesh.sharma@linaro.org>
References: <20210627114616.717101-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arrange the two usb controller, hs-phy and
ss-phy nodes closer in the dts for better readability.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 9c931beeb614..163eb430eb1e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2205,6 +2205,20 @@ glink-edge {
 			};
 		};
 
+		dc_noc: interconnect@9160000 {
+			compatible = "qcom,sm8150-dc-noc";
+			reg = <0 0x09160000 0 0x3200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9680000 {
+			compatible = "qcom,sm8150-gem-noc";
+			reg = <0 0x09680000 0 0x3e200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sm8150-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -2266,20 +2280,6 @@ usb_1_ssphy: lanes@88e9200 {
 			};
 		};
 
-		dc_noc: interconnect@9160000 {
-			compatible = "qcom,sm8150-dc-noc";
-			reg = <0 0x09160000 0 0x3200>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
-		gem_noc: interconnect@9680000 {
-			compatible = "qcom,sm8150-gem-noc";
-			reg = <0 0x09680000 0 0x3e200>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sm8150-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x200>;
-- 
2.31.1

