Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68213D508C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 16:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfJLO6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Oct 2019 10:58:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43876 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfJLO6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Oct 2019 10:58:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so12516056ljj.10;
        Sat, 12 Oct 2019 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrLiuXk6l7SBWQR/FCMK363GSw8hqDIyi5NTJpfi314=;
        b=iCaBwwXyKPJMg1mxYoSRXQD/mncQ1z96UvDtS8jEzgZITzuq4gpgXTzU0offq3wurE
         MEZwnpqibgg5BQzSLhS9d9BL/dkJC/Vss8N0a8vWXmICnhqAbx9zyLqKbHDdDv+D2q8i
         QKylPi+m9O+rkIQWXNkSr0AaEpW8crubfVQJPttMzrPJCICM5E970Oqr61AIfjVTXYWx
         HO0GJyO+jmjuoOAPp7BeaR/14jCDg0Wbe27wlumM0VwPrMhB3SQXtHAlVPh0Ju9wqGgf
         Z/fYEv5cKX7yhIpfbFvqpk0syBEj5BIw7VdcwNhhypBMCPZ9Wk2sl0z0HDgQQecgyZeQ
         kVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrLiuXk6l7SBWQR/FCMK363GSw8hqDIyi5NTJpfi314=;
        b=UvrzPMIL0b3Cce96jaOoxzChnALp22qLnRIM58m/sxgJPFrXLgJDrqxtqblgUtdvJV
         wdzP0J6H/dbMNRx9Nd2W8XcHyOc+YRVg/lBW9xzLq0wSgsTWdyD1ssoeYNgFb2GB95ih
         bQMNBYytd5tlrSmBcqZRG1kCCBC0/2O67LPtvy+RvbrA4n4+sdu1LkubJJfvRJmSkYjW
         QHmCKqhfiU16GEOQ3eEq+2bGCx2rpGUrxaX8941vzwleHQqvsEBL8062NtTioNyCkdZT
         gs0VrjzfMQfBGe7IFaaznYRDuXE1Tap8Op43TjsxI6AUTHnTWOG+9t7k7XVUbY8Igzf8
         a6zA==
X-Gm-Message-State: APjAAAVa7K/wF5I1OExBL58JOJrY40X9dTVbSE9vksRFtJ4mS2VThIle
        jmYmRQ3M9WkrHyzG0bc3sX8=
X-Google-Smtp-Source: APXvYqx6lwhG+N0xzxU05Kphy8LHfZrbnQCsHxSlgS+fhatMJ1vOIhpMriusddYyEHoUWBVgGCfaPQ==
X-Received: by 2002:a2e:6c15:: with SMTP id h21mr12681149ljc.86.1570892314106;
        Sat, 12 Oct 2019 07:58:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:3f08:6700:a54a:5215:2ca7:fec9])
        by smtp.gmail.com with ESMTPSA id t4sm2599764lji.40.2019.10.12.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2019 07:58:33 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 1/2] arm64: dts: msm8916-longcheer-l8150: Enable WCNSS for WiFi and BT
Date:   Sat, 12 Oct 2019 19:58:20 +0500
Message-Id: <20191012145821.20846-1-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

WCNSS is used on L8150 for WiFi and BT.
Its firmware isn't relocatable and must be loaded at specific address.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 2b28e383fd0b..e4d467e7dedb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -18,6 +18,16 @@
 		stdout-path = "serial0";
 	};
 
+	reserved-memory {
+		// wcnss.mdt is not relocatable, so it must be loaded at 0x8b600000
+		/delete-node/ wcnss@89300000;
+
+		wcnss_mem: wcnss@8b600000 {
+			reg = <0x0 0x8b600000 0x0 0x600000>;
+			no-map;
+		};
+	};
+
 	soc {
 		sdhci@7824000 {
 			status = "okay";
@@ -68,6 +78,10 @@
 			};
 		};
 
+		wcnss@a21b000 {
+			status = "okay";
+		};
+
 		/*
 		 * Attempting to enable these devices causes a "synchronous
 		 * external abort". Suspected cause is that the debug power
-- 
2.19.1

