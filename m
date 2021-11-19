Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E623945783E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 22:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhKSVn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 16:43:56 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:27666 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhKSVn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 16:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637358047;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PFFG3zsTAGfI5MIKIY2r8uirf+fqz5UpQlO0sBjSEE4=;
    b=cXo4Oy9aDJeTVX4BXXWnqd9sGTktTABBDFWrrrCKG/LFY3cysI2g4t+55o/8Lg7d7U
    Mz83wQ5MpW+SnNTDf/nVftHeZwZsqBCbWoIgqmKJkZYaCvTMChbDMmvH7foAkSXSBA9A
    61E6g/s/CmPWnpdjMNeZGWxChHm8y5NXdIzjyYMf/b3dZhlgpNqgzscwMNfIa1XbvJ1C
    sS0KVXPI3cQNlmAOoUBDW1Fo+zZTFwx0bCsCtbxetNbQIpCKpKRDZQi87EJlngOMYLHC
    xBGmK/B8I5UQnkPXNg7HRg+9cNoTVWhlxAjDRhQxr63biZWwqazuKpguKhnsphJHMUNV
    oQcw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL0Iik="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAJLel0CT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 22:40:47 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8916: Add RPM sleep stats
Date:   Fri, 19 Nov 2021 22:39:53 +0100
Message-Id: <20211119213953.31970-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119213953.31970-1-stephan@gerhold.net>
References: <20211119213953.31970-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 is similar to the other SoCs that had the RPM stats node added
in commit 290bc6846547 ("arm64: dts: qcom: Enable RPM Sleep stats").
However, the dynamic offset readable at 0x14 seems only available on
some of the newer firmware versions. To be absolutely sure, make use
of the new qcom,msm8916-rpm-stats compatible that reads the sleep stats
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
Changes in v2:
  - Use SoC-specific compatible qcom,msm8916-rpm-stats
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1c42f26b61e..9044eb41a81d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -453,6 +453,11 @@ rpm_msg_ram: sram@60000 {
 			reg = <0x00060000 0x8000>;
 		};
 
+		sram@290000 {
+			compatible = "qcom,msm8916-rpm-stats";
+			reg = <0x00290000 0x10000>;
+		};
+
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8916-bimc";
 			reg = <0x00400000 0x62000>;
-- 
2.34.0

