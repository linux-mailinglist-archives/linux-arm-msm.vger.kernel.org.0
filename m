Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D535E37FD1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 20:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhEMSPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 14:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhEMSPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 14:15:04 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A733CC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 11:13:54 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id m13so5176073qtk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldYQvJj0KRbhIl/z5ApJ979hT82UmNbqcDoq3QhJiLI=;
        b=U2J1N/A9ZhX1Szit1iN3ukByjGJiCdHzUALcnisOGydgjN6s3ggdUIWRRPBRJ22UlD
         aMAu6vBH3KbTrXu5Bo79Wm+4oIs126Um2n/cyx9yfRdmTmFdQTeNXLRyqu6SyylXUxRR
         jhIKPMWhOP6HboQwgtTjlv51XVlFlLohk14B9q+QRcAfzuUTO8Hjkh2Zga2PMn82psYg
         dgauIdmmU7kNjJ4rrI6YX7PGgXuHYAjjoH7N6iG/a51EtaezuqT16InnnNqoBIgshjN5
         YaAEMPPjGii2YFNvBdonU+Q5q8YNksRbVMVRjS8vhVGwS8aRXorSFMyUa6Ydi8iDf/D7
         l5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldYQvJj0KRbhIl/z5ApJ979hT82UmNbqcDoq3QhJiLI=;
        b=dwo+CmrxtGViSCXXO6rjPmApUFiLk9BHMAYwaN7zZoMwXLE1VnbKaDEdbtGwwW3koz
         hllmmuGmx7bdshec1c2FSK3gFYvqhdadTabvWUxoXIbV+1UEi9g5kb6GKMYHXn+QKGH1
         d0meJKYdkEyI6ANUfbDL6TLS8uUxbcvY3eq8bXzOAdyZLRNQO6NzVWgdhGN7qSvw99sI
         XhXOsvjhFVWYJSP9iT8bsirmt45N3r0NnXhbf1gYhZXOo12n9toQODvq4qjMCvt1Fo7B
         KsYJMcY5xe/FDy1bU0k/h0OCJsuHV5rA39Am79oRHFudA1m6N0Cj8hlcuxB30zELB3W1
         F4wA==
X-Gm-Message-State: AOAM531QvRLkxOgYCz+6Nr1C9H235KQd2p0AArO4x0wHbzu/G7N/uwN6
        Tl+SkyEd3nydKYj6koNHqedZk73bJW2RBUAnekw=
X-Google-Smtp-Source: ABdhPJyViVkXqngrTbPXR5baqsDGgSvGEqIvytRmZa5Jg4j9jhOzXSbt2XtpVyUpO0jdYBys3SUzBg==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr8260611qtb.208.1620929633570;
        Thu, 13 May 2021 11:13:53 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id y6sm3069492qkd.106.2021.05.13.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 11:13:53 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] arm64: dts: qcom: sm8350: fix names of qupv3_id_0 and uart3
Date:   Thu, 13 May 2021 14:13:08 -0400
Message-Id: <20210513181309.12491-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the correct names for these.

Fixes: 0684074a46e8 ("arm64: dts: qcom: Add basic devicetree support for SM8350-MTP board")
Fxies: 9208c19f2124 ("arm64: dts: qcom: Introduce SM8350 HDK")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index f23a0cf3f7b7..8cc507ce2230 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "qcom,sm8350-hdk", "qcom,sm8350";
 
 	aliases {
-		serial0 = &uart2;
+		serial0 = &uart3;
 	};
 
 	chosen {
@@ -219,7 +219,7 @@ &mpss {
 	firmware-name = "qcom/sm8350/modem.mbn";
 };
 
-&qupv3_id_1 {
+&qupv3_id_0 {
 	status = "okay";
 };
 
@@ -232,7 +232,7 @@ &tlmm {
 	gpio-reserved-ranges = <52 8>;
 };
 
-&uart2 {
+&uart3 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 6ca638b4e321..423581751ed0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -20,7 +20,7 @@ / {
 	compatible = "qcom,sm8350-mtp", "qcom,sm8350";
 
 	aliases {
-		serial0 = &uart2;
+		serial0 = &uart3;
 	};
 
 	chosen {
@@ -286,7 +286,7 @@ &mpss {
 	firmware-name = "qcom/sm8350/modem.mbn";
 };
 
-&qupv3_id_1 {
+&qupv3_id_0 {
 	status = "okay";
 };
 
@@ -299,7 +299,7 @@ &tlmm {
 	gpio-reserved-ranges = <52 8>;
 };
 
-&uart2 {
+&uart3 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0b51bc03ea..76a1df371b17 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -443,7 +443,7 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
-		qupv3_id_1: geniqup@9c0000 {
+		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x6000>;
 			clock-names = "m-ahb", "s-ahb";
@@ -454,7 +454,7 @@ qupv3_id_1: geniqup@9c0000 {
 			ranges;
 			status = "disabled";
 
-			uart2: serial@98c000 {
+			uart3: serial@98c000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x0098c000 0 0x4000>;
 				clock-names = "se";
-- 
2.26.1

