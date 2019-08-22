Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3483C991FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 13:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfHVLYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 07:24:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:25907 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfHVLYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 07:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566473061;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=TQMNqGl32GIAa7JwFwxwB6eVR1q8AIZuBnlWOXTPoAA=;
        b=trOMQb/Vh87fd1gC4TWJdeVxFLoNku8MHgQa61qQhrSIIo9CqGOfnJAwMwvFvKan/b
        XCk08lMEEir7J/aVAKT5YUJitvUsItHtLoy1ohpMXqL5sqnfGh0q27wsUGolmUJJgXV7
        5XRP4g9q5J6gsk/uzT1I0Jb0GrhWEHHw6sfT4rjh1tjcP0A253Nsgs9GUDEjCderbo/c
        QE2c8c1hrm7uSJruT/oGMubIWz1eaDJky0Mb8wKHNaPJV+4R48tIppjJxY45E977mCMU
        lvZ5b9W7PGvtE2HFftYg0MAOjC9EE0S9w6g3urK/N43oCTt74LCyoIWgfcPHAc3HH5OW
        /ZzA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1RgWArOaRE="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.26.1 DYNA|AUTH)
        with ESMTPSA id g064fdv7MBOKeLm
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 22 Aug 2019 13:24:20 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] arm64: dts: msm8916-samsung-a2015: Enable WCNSS for WiFi and BT
Date:   Thu, 22 Aug 2019 13:23:38 +0200
Message-Id: <20190822112339.121804-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WCNSS is used on A3U and A5U for WiFi and BT,
and seems to work fine without further changes.

Enable it in the common include.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index e675ff48fdd2..6fc0b80d1f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -63,6 +63,10 @@
 			};
 		};
 
+		wcnss@a21b000 {
+			status = "okay";
+		};
+
 		/*
 		 * Attempting to enable these devices causes a "synchronous
 		 * external abort". Suspected cause is that the debug power
-- 
2.22.1

