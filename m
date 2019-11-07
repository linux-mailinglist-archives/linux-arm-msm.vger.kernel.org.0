Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304B6F2695
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 05:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733111AbfKGEdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 23:33:43 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42108 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfKGEdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 23:33:43 -0500
Received: by mail-pg1-f195.google.com with SMTP id q17so1022835pgt.9;
        Wed, 06 Nov 2019 20:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LbE/xztA3ca2HrMOMcgsagRjWaGT50SCwVvLyRPFO1c=;
        b=aAC5niyDARYhrLAtyaeZJo9oy8uyfnQnL+aF4Dzb9EcD41+3+bBi+8jKmH5AYiJUtj
         vxPBoSwpfUF0PxgdpYqpwSGq6egWCsNzweLzCCqObsMNoWSQ3iFqP1vJpn22f1zfPuKk
         ngrLVdTWQTpi6M+sfaRvxKtmL+kWog3zJr9GueQ3FAGWOFv7cerJdGPVyAFopsSJ33Mr
         YzmvpB5MAAuZD6TlRIq4Jmu5DQRhu1JTj0F08YmGyVjhsHWWP4fkhL40JD/gNuBn4r1r
         onwTTW4yfkllZ4OSHvi1MdV5qyVVaOZLwfZpPJJXr/ihd1ZcQ+at9j4D7GIcfh+0ah2u
         Zgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LbE/xztA3ca2HrMOMcgsagRjWaGT50SCwVvLyRPFO1c=;
        b=UXEemioofVRGWg0VV/GkWI5xR9t9oDBmq5Usi8sKTLCnrwxHOLy9mlwm+HH3AwwcGS
         XBc2HzTxTbIu4RmWbnSst2U/RG3cCxCA7c1gPjvYVEeNANiB/adJaPqKWyD1QT2doJjd
         U87Ii+a+6KSyV9XR9fQ7KfJ1KNSavD1y2tliH7T7J3UzANN398vk/1I8T50ctAmOSzk9
         Ax/J8jllEE7sZhtTHSifTwkx09Xel1xxRl82uciuoafyPs24ak6QMHlSQrkm9KGk2Wij
         qS+Kcf4wIEQgvqvPSj8FiOFSQmzEnsnQ58GYg/y+z2Zhp0eDFDjNCEbHjwsFYmuBTTic
         NtFA==
X-Gm-Message-State: APjAAAWlw48+HQRyxpVb+QDWAHCznTISgG/eKdm+z2eDDPqVeycrWDZE
        g9BTa1VT3A4hEGZQqJO4+yc=
X-Google-Smtp-Source: APXvYqzhYy1x4uC0FvOvzJynRkccru6DiTHLCV7TuUBp1qqEiDMitG/5HGkY3uhj7QoryAgLZ6DLBw==
X-Received: by 2002:a63:f34f:: with SMTP id t15mr1960823pgj.453.1573101222181;
        Wed, 06 Nov 2019 20:33:42 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r22sm737524pfg.54.2019.11.06.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 20:33:41 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] arm64: dts: qcom: msm8998: Add anoc2 smmu node
Date:   Wed,  6 Nov 2019 20:33:12 -0800
Message-Id: <20191107043313.4055-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107043313.4055-1-jeffrey.l.hugo@gmail.com>
References: <20191107043313.4055-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While there are several peripherals on the anoc2, most are not behind the
smmu.  However, the SoC integrated wlan block is behind the smmu, so we'll
need to control the smmu inorder to enable wifi.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index fc7838ea9a01..d5263e4f64ce 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -847,6 +847,25 @@
 				<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		anoc2_smmu: iommu@16c0000 {
+			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
+			reg = <0x016c0000 0x40000>;
+			#iommu-cells = <1>;
+
+			#global-interrupts = <0>;
+			interrupts =
+				<GIC_SPI 373 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 374 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 375 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 378 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 462 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pcie0: pci@1c00000 {
 			compatible = "qcom,pcie-msm8996";
 			reg =	<0x01c00000 0x2000>,
-- 
2.17.1

