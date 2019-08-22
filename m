Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 486E799200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 13:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732448AbfHVLYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 07:24:35 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:25632 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfHVLYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 07:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566473070;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3v63jXg6iYj8362Qhy6x26vt+3Fc0fDF0MVkWL5OL4g=;
        b=TcyIZksGtER6unWg8jgm9gR0+i3FJlYc4OKCssCNfwlc1K0x7qdj55Ig0N67F4hOEL
        3o9UsFxFwOe4Y52FCqvQJaprU4HQ5C5P4bF5yhBVXdipcS82+yR7FhtseNYZ2FBJ6mmO
        Bkxm48skDvaLnv6kNumJbqTpydTliSjetqfBjA5pqo3IiYIpd+J1bS9J+BmfBsla9Gm7
        oRmqWgz8B+h9vqVUPNZsD9Hste9c1yIUBKYr850gcDyqgBW5mDx6/oliojmI+VvhaW4g
        fwz4Qa6oVrO8U7Oqx+dE4nH2+ftLpCmP9imlUoeGIyQhv6KVhpEJ7fWj3/zfT/s86xS/
        FcxQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1RgWArOaRE="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id g064fdv7MBOUeLn
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 22 Aug 2019 13:24:30 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: msm8916-samsung-a5u: Override iris compatible
Date:   Thu, 22 Aug 2019 13:23:39 +0200
Message-Id: <20190822112339.121804-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822112339.121804-1-stephan@gerhold.net>
References: <20190822112339.121804-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916.dtsi sets the iris compatible to "qcom,wcn3620".
While WCN3620 seems to be used on most MSM8916 devices,
MSM8916 can also be paired with another chip (e.g. for WiFi dual-band).

A5U uses WCN3660B instead, so the compatible needs to be overridden
to apply the correct configuration.

However, simply using "qcom,wcn3660" would be incorrect,
since WCN3660B requires a slightly different regulator configuration
compared to WCN3660.

Instead, it requires the same configuration as "qcom,wcn3680".
Replace the compatible with "qcom,wcn3680" for A5U to make WCNSS
work correctly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I'm not quite sure if it would be better to define a new compatible
for WCN3660B (e.g. "qcom,wcn3660b") since this isn't really a WCN3680.
But in any case, it would use exactly the same configuration.

The compatible seems to be only used for regulator + clock configuration,
see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_wcnss_iris.c#n57

 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 1aa59da98495..6629a621139c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -8,3 +8,9 @@
 	model = "Samsung Galaxy A5U (EUR)";
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
 };
+
+&pronto {
+	iris {
+		compatible = "qcom,wcn3680";
+	};
+};
-- 
2.22.1

