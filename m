Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C471EB936
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgFBKKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgFBKJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:09:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D98C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 03:09:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b7so956375pju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDUg6z9g8U9M6fAkFW44jT1VB/1+ZQ8nnChdFdTrw0o=;
        b=JPrls4ETeYgIMJX8QWPVQUeGPDIFB+vzbpaSR5smt+GsXM2c2z7wR9aheT0MN045P2
         MNn4xigoWj3B+e/Mlkhx8leM+ryWRSyDkv2jCuMpjMoMbsu6AveAhfgJUHQ04LLWxZmN
         Mgejx+A7Nfvupn6zYsWwCzGymftS0KpiDMYxnUrGc8Z7h4wVwSJgqHJSqQ8KVtifV0X7
         rlEB+oWDujkm/iwFE0RsCoTI8us/FmQfaZNaYZGaCf6JwP+V5n7ZiL9XU/eRKA9H7Sb3
         hQZABN9U4kKHxk5DR00FZFVn1TbaoJ9Ge7zovM/YwR3zCbmAbsNpG5n5/W57XxXCdpd4
         S+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDUg6z9g8U9M6fAkFW44jT1VB/1+ZQ8nnChdFdTrw0o=;
        b=KCa4jE93avf6WLeD2cm9JIv2gtrKMyhf2x0EyOssLQ1H7hpzkVX3zglcm2nSTGoI82
         JKLdW9/eRtbsPK02tETnn7XVOQfJOYkUu91GCf8QUV0jy1IMO2R2t82yCXvvGUoNvROy
         pGCV4GlF5Gl9YgjjvaFhoO6P3xJjPda5+uhGKUVAUIKpG/j933gLv7OR2XWFmlugQVbe
         1XJTl6fb8Nh4/7lKLmzgG2AS6/0RM/DYSkO9U4hjPArdrgPD6+3V987STj54Tkdt1lxY
         fbsHt/EIqDPi2Qmj3QEu1HZq+IdBiQglVXdFUwPF71pvqD/RUSr3VFx1Dd5nVbrAcc2K
         EpwA==
X-Gm-Message-State: AOAM531CD3a/oHluuNPl0Q5sjZqnTC3G4WBvnvSMM0A2qErAuNryRLKv
        OZ0HRcXIt/UUImQ9eqcv6gHR1g==
X-Google-Smtp-Source: ABdhPJwnO+GOOLL0Y48EeL/vzlAQa5VHkhlhDZThUPUSKKqU0v9nmNf30V1MnTAaDnlATpYdfSTLog==
X-Received: by 2002:a17:90b:3614:: with SMTP id ml20mr4435051pjb.41.1591092589904;
        Tue, 02 Jun 2020 03:09:49 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id d8sm1931276pgb.42.2020.06.02.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:09:49 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 3/5] arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
Date:   Tue,  2 Jun 2020 15:39:22 +0530
Message-Id: <20200602100924.26256-4-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602100924.26256-1-sumit.semwal@linaro.org>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

This patch adds devicetree nodes for LAB and IBB regulators.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
  [sumits: Updated for better compatible strings and names]
--
v2: sumits: updated for better compatible string and names
v3: sumits: updated interrupt-names as per review comments
v4: sumits: removed labibb label
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 23f9146a161e..3230b78b8048 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -25,5 +25,19 @@ pmi8998_lsid1: pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		labibb {
+			compatible = "qcom,pmi8998-lab-ibb";
+
+			ibb: ibb {
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "sc-err";
+			};
+
+			lab: lab {
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "sc-err";
+			};
+		};
 	};
 };
-- 
2.26.2

