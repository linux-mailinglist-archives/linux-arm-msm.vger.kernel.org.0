Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265E84316B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbhJRLDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:03:18 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:21101 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJRLDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634554864;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=64fNCz6PLHf3a0nc9PWpPKCBTh5jdX56sRaGLAcAQoY=;
    b=hXc8+Yopyw+JGQbE11DkQD9I55vijjZX8Th1gt1d0s8B6AsRhqNeVsbRu1bE4WxoT1
    Du8bItdFErirPA2fWsB1vJWFFes3+abNTJmwZbck0pO968y0UaqZQLfkdmYuDMqKV6Cf
    p3JgmrkEIYbfuM+w/qRUEPlLyAQfTQVpVMCUDPc/RGfm0NzYq9NhQ89uG1ECQBUyOib+
    ap5sxIYcSHZ80DtVHl69RRY5hgHMPg/VcS5qgk4YXWgI477JIeYKo2NwnxFsTwKOmy/O
    GXcECkPm68kiCDI4/INOIrO4a1Y7ij4qEvfeuU6nTz91ERIhanfpNbNzEPX5Ud0SS1LW
    hrCw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IB14VdN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:01:04 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916: Drop standalone smem node
Date:   Mon, 18 Oct 2021 13:00:09 +0200
Message-Id: <20211018110009.30837-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018110009.30837-1-stephan@gerhold.net>
References: <20211018110009.30837-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SMEM can now be described directly in the reserved-memory.
This is mainly meant for newer SoCs where there is only one SMEM
region. However, even on older SoCs like MSM8916 there is clearly one
main SMEM region (described by "memory-region") that holds the
smem_header and one special extra region used only for data of the
RPM ("qcom,rpm-msg-ram").

The definition in reserved-memory also looks cleaner for older SoCs,
so make use of that in MSM8916 as well.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I don't have a strong opinion about this so if you think the extra node
is better for MSM8916 feel free to just skip this patch. It works just
fine though. :)
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0dcc614b2c61..43464ac64f3e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -41,9 +41,13 @@ tz-apps@86000000 {
 			no-map;
 		};
 
-		smem_mem: smem@86300000 {
+		smem@86300000 {
+			compatible = "qcom,smem";
 			reg = <0x0 0x86300000 0x0 0x100000>;
 			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		};
 
 		hypervisor@86400000 {
@@ -323,15 +327,6 @@ rpmpd_opp_super_turbo: opp6 {
 		};
 	};
 
-	smem {
-		compatible = "qcom,smem";
-
-		memory-region = <&smem_mem>;
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
 	smp2p-hexagon {
 		compatible = "qcom,smp2p";
 		qcom,smem = <435>, <428>;
-- 
2.33.0

