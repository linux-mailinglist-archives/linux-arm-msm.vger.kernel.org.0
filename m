Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED4812D83B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2019 12:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLaL2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 06:28:40 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:12637 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfLaL2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 06:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577791714;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=h0PLyKIkbkGqdx6tdiE+aZeXQwoAnAqAKU7wjRUkNtA=;
        b=k9vaA3qQFM3WakxUFagv7iW/GdeGyTJy7IaZRTN0q3RlYG6qovfOHfvUJM9oJQZdi1
        Tgq2s6zAkc+7ghBn8VIjRHDmXCaZHQcMjuE929w9i4DWIbFxxaMeLxl/+xUS6epfCJTe
        bwm4nkYQ6IAB5aSd0QLwwVoILqTpJx4V3Jtj5R0q40hH8+9sMBnxO6fRg0GWaIPRZG8U
        EkMfjANoObuL1Ji2+LtRWhscQ5cHWW8PToII4fvrBFWOuoF/poojmH93Bdzs2pGHP9xE
        SguF9Bl5FQEVF0n9uNBTZn2g6xbRfWCRhy6yNbbNTuPY5yeSwpuKNeWyraX7lvsD8LNU
        Ihzg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXs8LvtBRRLg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.1.3 AUTH)
        with ESMTPSA id z012abvBVBSRQog
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 31 Dec 2019 12:28:27 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-a2015: Reserve Samsung firmware memory
Date:   Tue, 31 Dec 2019 12:25:11 +0100
Message-Id: <20191231112511.83342-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment, writing large amounts of data to the eMMC causes the device
to freeze. The symptoms vary, sometimes the device reboots immediately,
but usually it will just get stuck.

It turns out that the issue is not actually related to the eMMC:
Apparently, Samsung has made some modifications to the TrustZone firmware.
These require additional memory which is reserved at 0x85500000-0x86000000.
The downstream kernel describes this memory reservation as:

/* Additionally Reserved 6MB for TIMA and Increased the TZ app size
 * by 2MB [total 8 MB ]
 */

This suggests that it is used for additional TZ apps, although the extra
memory is actually 11 MB instead of the 8 MB mentioned in the comment.

Writing to the protected memory causes the kernel to crash or freeze.
In our case, writing to the eMMC causes the disk cache to fill
the available RAM, until the kernel eventually crashes
when attempting to use the reserved memory.

Add the additional memory as reserved-memory to fix this problem.

Fixes: 1329c1ab0730 ("arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U")
Reported-by: Michael Srba <Michael.Srba@seznam.cz>
Tested-by: Michael Srba <Michael.Srba@seznam.cz> # a3u
Tested-by: Stephan Gerhold <stephan@gerhold.net> # a5u
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index bd1eb3eeca53..43c5e0f882f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -15,6 +15,14 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	reserved-memory {
+		/* Additional memory used by Samsung firmware modifications */
+		tz-apps@85500000 {
+			reg = <0x0 0x85500000 0x0 0xb00000>;
+			no-map;
+		};
+	};
+
 	soc {
 		sdhci@7824000 {
 			status = "okay";
-- 
2.24.1

