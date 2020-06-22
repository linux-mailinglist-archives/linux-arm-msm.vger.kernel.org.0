Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6062203132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgFVH7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 03:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgFVH7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 03:59:52 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE076C061798
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:52 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id c194so14839093oig.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzqoVDbQzZNmNPwLRsiHsWdrSJDCtl0FBiErUw9Lnwc=;
        b=yK7BuJkfP85RyShC36Lhp2LQ9octtbXw0Kd/pRG6QS48O7IW3L8gb/gFfA0yf7sjwd
         qQ8qPI4o3Ygkgw4i0odCiSvqAKMqVALqnXOOt7P9vk+2MaXZvyjxYqzUagMI2tVgkFoB
         xOK9fZ1Gmv1MLfSlpkTKaWnZchLEmKA1x0bXIzzkFFfoTvOZj7feLHbSoa97l1QyQ5O9
         0XxyCjm6upqXL3kR4YePhnZ84lZpjyM9GWyqRkzcrX7YNGPBLn8oHNGSwBOBzAuEz3u0
         NnqlLLw9N8bE+vK2Rng5KMKZBlqZKftKhXFHYNXVvG/F9nHug00DqL4aiFpfgM0Orqzj
         VbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzqoVDbQzZNmNPwLRsiHsWdrSJDCtl0FBiErUw9Lnwc=;
        b=Dw+AfXBmJ1jzmd5tKwl/l5YJ6Ulj2rmJzDm4n8hbbV3gxRdINIneZuhqHbUh7zwEDp
         Iv30Jty8sSxAI1o5WyZtaivlrjN3NChCCBpC6y6tBWsleZ5VrG5nKWNbo0lOKRZwvo7x
         CrShhljcoGkVT+r6ZxeIIZN/oG1pJyP1mEf85WfKtKWNKeGOPwDEGTmN3H6VNROiAcx2
         /cdrI+fZwA6QDJSOC7yWyOEDQPmINvHhOP0eqpygTuZKkICAoi3yQa+MWod/MNI7bQEn
         Q9BZMNM7qdezThdIJ4Gp7PxdosNvKkRnqEQ46gvpLUqJeW1rj0+/mOAP7M/eshx4nMTW
         08Mw==
X-Gm-Message-State: AOAM531szGnS29wJ21/mEZc+bIxTiMLMTTF35SeHe0tkBvpx9+LRgZg4
        6ndTQ+S5m4OItWQ7AQxajHRYWg==
X-Google-Smtp-Source: ABdhPJw+bQnmJ6Pc0QpgUAdyiwiS7PZ0gYPWeLnYhVPGbWLGZYw7lGRZsHNPlC3mtT6i7n21MomKDQ==
X-Received: by 2002:aca:51ca:: with SMTP id f193mr11618906oib.170.1592812791283;
        Mon, 22 Jun 2020 00:59:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm3135396otl.60.2020.06.22.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
Date:   Mon, 22 Jun 2020 00:59:56 -0700
Message-Id: <20200622075956.171058-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622075956.171058-1-bjorn.andersson@linaro.org>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we don't need the intermediate syscon to represent the TCSR
mutexes, update the dts to describe the TCSR mutex directly under /soc.

The change also fixes the sort order of the nodes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changs since v1:
- Adjusted sort order of the nodes

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7050adba7995..67a1b6f3301b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -144,12 +144,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -376,6 +370,12 @@ ufs_mem_phy_lanes: lanes@1d87400 {
 			};
 		};
 
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -486,11 +486,6 @@ rpmhpd_opp_turbo_l1: opp10 {
 			};
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
-			reg = <0x0 0x01f40000 0x0 0x40000>;
-		};
-
 		timer@17c20000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.26.2

