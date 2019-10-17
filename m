Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF6ADB99C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 00:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438267AbfJQWTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 18:19:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36913 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388926AbfJQWTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 18:19:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id p1so2155804pgi.4;
        Thu, 17 Oct 2019 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s9fEJB25cDAPZY3DtNOH/wi7012sGuVONlLEMVLYyf8=;
        b=axQUnDMyeNB3/EBhJoamiIXm331hdjS2hnK5N9pblD1OxnwedQ3V6CMj6cVPR6Fcfu
         MNJDZvPyfpOzBdqO+RCfBnMfW3hnJZZ+YJoDxb93dWQfgX0pRAjFxospgckErGSQ9Y9A
         ucp4yAg7SrCfR4vpit0Vl0AEraOTK05B4ViqW2kUHhMQ5jcViq8OUGQuT9zDeWvIxDKr
         aeF82II1p/2Ov8ZNLlwKPESxfsxfM/KH85VYXV95VOi42ekEWQEY6WCLCiTJYC0k2aHC
         Vuh63hMlaGeDQyNpYvKIQ7Ig56TDcTzCy9dTu4v4M4BkRNygN1aAqMDFtj82y6q+areT
         343Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s9fEJB25cDAPZY3DtNOH/wi7012sGuVONlLEMVLYyf8=;
        b=CYRDDrPt5L26GvFzEYtJGCPSHf87OdvCH2O9YZivW133v+XIFV50BUmB45cG5bRj3A
         PD9NTYArVrTQz267H41XQyer4lbeN0qa35gk3/7Gv7QDKdv29Yg63MFiq7qbJ+uELDer
         qFZTuHlAuNoZVYIQMjzQ6/0iD2hJwduIzYnb8dZ8JRK28TVQz2NxlX5SMKJg3djmxWHn
         Ik70ky17EB9GSBPi4S3vFGZkX1TGEQpgzRD1Vlt+hm0LgpTsxqmq7UD2v4DbtailEOMn
         RmaXRVl8Mx9K8RlMtoprdnPwEkfCDoBOpLAMdVH41/OSzi8hJt6AW6IIXnNxzmPUX0h8
         LW3w==
X-Gm-Message-State: APjAAAUKpnS5Okbg5b32Gn1KJRX9wxDZ5v1pCeRP4q19nAd73EVE1sp9
        kRsl3JCkC9R4nZcjHpV6Wdz4iRi5
X-Google-Smtp-Source: APXvYqw00sZLsNXkGPnJwatQdx2ULrHHTTRCvR4qpWroQu8ngO/9MBDtK0DT14bo6sYn2qSNTjaG9A==
X-Received: by 2002:a62:1889:: with SMTP id 131mr2738020pfy.21.1571350741437;
        Thu, 17 Oct 2019 15:19:01 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a8sm3441912pff.5.2019.10.17.15.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 15:19:01 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [RFC PATCH 1/4] arm64: dts: qcom: msm8998: Add blsp1 BAM
Date:   Thu, 17 Oct 2019 15:18:40 -0700
Message-Id: <20191017221843.8130-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
References: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The BAM in the blsp1 block can be used as a DMA engine to offload work
when managing any of the peripherals in the blsp.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e42177952690..a3465f6bae84 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1201,6 +1201,19 @@
 			status = "disabled";
 		};
 
+		blsp1_dma: dma@c144000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0c144000 0x25000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
 		blsp1_i2c1: i2c@c175000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c175000 0x600>;
-- 
2.17.1

