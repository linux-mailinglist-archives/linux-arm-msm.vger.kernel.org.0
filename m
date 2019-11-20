Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE9F6103A81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbfKTM5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:57:08 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33362 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbfKTM5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:57:05 -0500
Received: by mail-qt1-f193.google.com with SMTP id y39so28847894qty.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gtYgZsKdjWgKCLPuHgoMJ2eNbNG78NE68Q155qN82Ug=;
        b=jGdbKr2TED35aioqiqlsFcPudOG7cyQVE8+ZKhJapv6KOePem9zkOJoCl1+xmbSFZd
         3Q1WLQAYXerCakAyxDej/i6/C0jfkafUUU9MZzFDq8WYmMQxnZZFjjEzGqnSc+kFxk/r
         Hq04BqVbcW9zp26Jbq1Dr2q9wFOWSlOWbEABb/tNcGOJzbygqL3sWIHAGyYYOwQ+Xi8h
         I/8SL4SnBPPb1Tq7d0A3X4E8ztaLuSp9DHAkEiMWHpT875qrb8xYGi1dGi19gF5T7RwS
         kOo4DPafrI4uFo/yxuFDuq1UvxqfascRNd0eGuLjPW+HU632Nql7sXT+nOq0v/wIQmgu
         UyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gtYgZsKdjWgKCLPuHgoMJ2eNbNG78NE68Q155qN82Ug=;
        b=ddpssaTIMiG60pBGbzqxXjyhArgWkcJ/n/DlE62ostHespi/DwvvhIur3C5ZNixGDv
         6AtwDmIRZ87Bo0eUOoKRARxzBJiBbn6c7SVG40h7nQYPadIYfu6GJ+6iwhst2lwB6BZW
         0WB6jYO6JnIACbJeXtMKY/MFX+8GeIy5X4iWZE/pKv2Ab62jQJGxDuR0AunRlJv1DWGy
         4piwRLQUmvVyCFBcSa2sEwNwPTfLec8C0zsgfJ5DSHkrdx1rXnlMekSt/R6RwgsGoN9Q
         cZ3lJ9zZU4dob69wkyMMvrBkKSXjKJwF2bEhIpO9f/iLOis18J3hfd4cKEniJiB7VCxG
         Z4oQ==
X-Gm-Message-State: APjAAAU7NzEvtZ+LKBv03l4Tsmvas4hkg/V0IAnSCackHBFW31vi7Uae
        XWDrHkVcmYMKpIJ0JglDAAHjDQ==
X-Google-Smtp-Source: APXvYqyrW8nUtaIuzKEjvmVZtBqF9yXQRwNnUnQSVpoxtCSbI9LpsbmrAPc1ye5t5YVnlTR8qlWrMw==
X-Received: by 2002:aed:33c2:: with SMTP id v60mr2423209qtd.168.1574254623419;
        Wed, 20 Nov 2019 04:57:03 -0800 (PST)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id r2sm14109637qtc.28.2019.11.20.04.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 20 Nov 2019 04:57:01 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Patch v4 7/7] arm64: dts: qcom: Indicate rpmhpd hosts a power domain that can be used as a warming device.
Date:   Wed, 20 Nov 2019 07:56:33 -0500
Message-Id: <1574254593-16078-8-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1574254593-16078-1-git-send-email-thara.gopinath@linaro.org>
References: <1574254593-16078-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMh hosts mx power domain that can be used to warm up the SoC.  Indicate
this by using #cooling-cells property.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
v3->v4:
	- Removed subnode to indicate that mx power domain is a warming
	  device. Instead #cooling-cells is used as a power domain
	  provider property to indicate if the provider hosts a power
	  domain that can be used as a warming device.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 23260a0..71d6f91 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3118,6 +3118,7 @@
 			rpmhpd: power-controller {
 				compatible = "qcom,sdm845-rpmhpd";
 				#power-domain-cells = <1>;
+				#cooling-cells = <2>;
 				operating-points-v2 = <&rpmhpd_opp_table>;
 
 				rpmhpd_opp_table: opp-table {
-- 
2.1.4

