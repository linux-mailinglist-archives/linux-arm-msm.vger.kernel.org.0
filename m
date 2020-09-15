Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE44D269F62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgIOHN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:12064 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgIOHNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153982;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KRCdyFKe9/1p7HeIh4uDlDokU59kTcrhEk5ZPa3T0eg=;
        b=QI30ggW4P8YOeHkB7OIXT4wSkcK2Tc48/Z7YG78I/S2f87xGoVW158HSCSDOh5NPkA
        xh460uzwj+MamarL20RBo1Lp3yAk89SFARL5+6trpt8wYJrAQVd0kur/unh0KxyvRViw
        6o6813G2XSSGmvm0Hc9eXkOadU8KyWPHpdUfTRj30yiwq43GwQ29rlD3Yhv7gapnWvqm
        U0HK7OjkN4YqUkGx0WyUl+/AF8ZEOE9U4c1faqs94cN86WDBW4UYqQ3XTu2Ti7lltp3I
        mHk/Qs49djlTsSoorZ/h5rjyqXlvTJcbbBF9PVNZ0hv4iM6JnhBRvbf21giRZjut++wX
        5lcw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D0rdt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:00 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 06/14] arm64: dts: qcom: msm8916: Drop qcom,tcsr-mutex syscon
Date:   Tue, 15 Sep 2020 09:12:13 +0200
Message-Id: <20200915071221.72895-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The hwlock device node does not (directly) use memory resources
of the SoC, so we should move it outside the "soc" node.

However, as of commit 7a1e6fb1c606 ("hwspinlock: qcom: Allow mmio usage
in addition to syscon") we can now assign the memory region directly
to the hwlock device node. This works because the register space
used by it is actually separate and not used by any other components.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 003451ccf3ee..10e177988555 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -458,9 +458,10 @@ gcc: clock-controller@1800000 {
 			reg = <0x1800000 0x80000>;
 		};
 
-		tcsr_mutex_regs: syscon@1905000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x1905000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
@@ -468,12 +469,6 @@ tcsr: syscon@1937000 {
 			reg = <0x1937000 0x30000>;
 		};
 
-		tcsr_mutex: hwlock {
-			compatible = "qcom,tcsr-mutex";
-			syscon = <&tcsr_mutex_regs 0 0x1000>;
-			#hwlock-cells = <1>;
-		};
-
 		rpm_msg_ram: memory@60000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x60000 0x8000>;
-- 
2.28.0

