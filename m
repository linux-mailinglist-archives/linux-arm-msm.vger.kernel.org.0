Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F0C1055A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 16:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfKUPcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 10:32:05 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53447 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUPcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 10:32:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id u18so4205475wmc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2019 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3JB+CPTSq4N72ZLvXLiiiG1zAE4KtwmOfqjMHLKlCQ=;
        b=g7wTo36jVO8nP95kktpDbk266oeLWP/70+1Tww2s1Jn5HQ608EcBG1qg4BSU8JXwzQ
         ELo+sHigumVYvVyik1N6d2G5CcMSa/vXzHZB1xN+sc1dJbKKgj+uBsZBBWdDCNMxxsPX
         KkjtHAIovNQUz2QDch7wufy1XSbzDggP8wdQ9XQN+jnUXCTSUC3Dy3l63EI7rT5yihKy
         C12T/h1K5yUx+PBzAgs5YJ6KlOCPVO0HcyGNqe5jYD93OqTmlnHXCkbGvPIGq9zy7Vor
         cNRgMQORUZdsdHzDvN+UH3ruxFe/rqwc3AppsQVARtAoZJBt6EG8/gPhvMGGFQ11ShRT
         0sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3JB+CPTSq4N72ZLvXLiiiG1zAE4KtwmOfqjMHLKlCQ=;
        b=Mcgw8PWr0TeeRdGMaWBusxvlSNO4Z4WXMg5koZMVEpS3xbINbH2u9EBBJvOHIqfg+2
         HvtLTcU4bpIueCTaBsbTUsyl1PAML2gMhp52OFWq8vzXtKqIP79SkictRcFIH7riRXJ7
         pEqKk7UuX2fQgsW3mphgxuGCz7oOeBSvvOjmoDXvnaCJQFhtkOAPg0R+LeuadbE46g6A
         iCsShehGMeQFOcVs4X4+BXZvypY97IB7NF9Ie7FHiblgvXvApM558ZefC4N+wtW9J2iK
         EP9o5NX8scxSi6DM1ZlZgYAEv2Y09LpuO6Hn5GNwi2rRjbYXqv8MXY7QtbByYRVCn4Xg
         rmpQ==
X-Gm-Message-State: APjAAAUd6uyZmPanJPU23F7mvrTNxVPVIUR+F6k1wQE3OT715WRKxh2O
        S0j1c8kKLTIGG/jjGCheX9fIbQ==
X-Google-Smtp-Source: APXvYqzT05RuHMG6V7kEDU7t+mZjhzJqvbh8fcSitLWaeNEk5JXNALubr9+oQJSCLbUPlL9+YS3v1A==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr9877441wmc.148.1574350320590;
        Thu, 21 Nov 2019 07:32:00 -0800 (PST)
Received: from localhost.localdomain (mx1.racunarstvo.hr. [193.198.208.162])
        by smtp.googlemail.com with ESMTPSA id 11sm3413640wmb.34.2019.11.21.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 07:32:00 -0800 (PST)
From:   damir.franusic@sartura.hr
X-Google-Original-From: damir.franusic@gmail.com
Cc:     Damir Franusic <damir.franusic@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: Add nodes for SMP boot in IPQ40xx
Date:   Thu, 21 Nov 2019 16:29:02 +0100
Message-Id: <20191121152902.21394-1-damir.franusic@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Damir Franusic <damir.franusic@sartura.hr>

Add missing nodes and properties to enable SMP
support on IPQ40xx devices.

Booting without "saw_l2" node:

[    0.001400] CPU: Testing write buffer coherency: ok
[    0.001856] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.060163] Setting up static identity map for 0x80300000 - 0x80300060
[    0.080140] rcu: Hierarchical SRCU implementation.
[    0.120258] smp: Bringing up secondary CPUs ...
[    0.200540] CPU1: failed to boot: -19
[    0.280689] CPU2: failed to boot: -19
[    0.360874] CPU3: failed to boot: -19
[    0.360966] smp: Brought up 1 node, 1 CPU
[    0.360979] SMP: Total of 1 processors activated (96.00 BogoMIPS).
[    0.360988] CPU: All CPU(s) started in SVC mode.

Then, booting with "saw_l2" node present (this patch applied):

[    0.001450] CPU: Testing write buffer coherency: ok
[    0.001904] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.060161] Setting up static identity map for 0x80300000 - 0x80300060
[    0.080137] rcu: Hierarchical SRCU implementation.
[    0.120252] smp: Bringing up secondary CPUs ...
[    0.200958] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.281091] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.361264] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.361430] smp: Brought up 1 node, 4 CPUs
[    0.361460] SMP: Total of 4 processors activated (384.00 BogoMIPS).
[    0.361469] CPU: All CPU(s) started in SVC mode.

Signed-off-by: Damir Franusic <damir.franusic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 56f51599852d..72d4e290b543 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -102,6 +102,7 @@
 		L2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
+			qcom,saw = <&saw_l2>;
 		};
 	};
 
@@ -341,6 +342,12 @@
 			regulator;
 		};
 
+		saw_l2: regulator@b012000 {
+			compatible = "qcom,saw2";
+			reg = <0xb012000 0x1000>;
+			regulator;
+		};
+
 		blsp1_uart1: serial@78af000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x78af000 0x200>;
-- 
2.23.0

