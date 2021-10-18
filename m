Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF6D4316F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhJRLM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:12:57 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:27888 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhJRLM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634555438;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=j86B15A9rsPXASzroXA2bFaDcU9X63WEGm7bZxaZ5wU=;
    b=jmHxh+lS3N09C6E4uPAVE4wtkKF73Hhd+0X9PrWg9GwHJTvrztcCWSTzZvqf9wcJy3
    18nFxs9yl4gua2Tk7b4uj2Xy9t8IMPRis8EG6qJMIH/GCiF8QSzXGR/X4cuSmXbTZiHI
    iHWIeQ0mAwgII6/nXMnlDIfXEwCUrd0wxKhUsCGfzBSibLDBjqe53YJV1AO8sP/EB/sw
    0XZ9hDr9M8HwDoiWF6uh6IZ+RKdvtEwKBvq81zG3EQqNeqsOG+5aknzkAUYeF+UFA1No
    NyHNS3Qd0aHFLTu1qV3TO8nQ5m3o0MBy+eoMJ6DKKfHRxsrx1UiequwdtsWOlITPT0L6
    Y89g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IBAcVhN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:10:38 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916: Add RPM sleep stats
Date:   Mon, 18 Oct 2021 13:08:03 +0200
Message-Id: <20211018110803.32777-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018110803.32777-1-stephan@gerhold.net>
References: <20211018110803.32777-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 is similar to the other SoCs that had the RPM stats node added
in commit 290bc6846547 ("arm64: dts: qcom: Enable RPM Sleep stats").
However, the dynamic offset readable at 0x14 seems only available on
some of the newer firmware versions. To be absolutely sure, make use
of the new qcom,rpm-legacy-stats compatible that reads the sleep stats
from a fixed offset of 0xdba0.

Statistics are available for a "vmin" and "xosd" low power mode:

$ cat /sys/kernel/debug/qcom_stats/vmin
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x0
$ cat /sys/kernel/debug/qcom_stats/xosd
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x0

Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 43464ac64f3e..99f7999aad2d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -445,6 +445,11 @@ rpm_msg_ram: sram@60000 {
 			reg = <0x00060000 0x8000>;
 		};
 
+		sram@290000 {
+			compatible = "qcom,rpm-legacy-stats";
+			reg = <0x00290000 0x10000>;
+		};
+
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8916-bimc";
 			reg = <0x00400000 0x62000>;
-- 
2.33.0

