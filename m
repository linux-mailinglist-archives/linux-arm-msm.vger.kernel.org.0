Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E101F002B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 21:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgFETC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 15:02:57 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:22247 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgFETC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 15:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383775;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=axBeihvN2eJz+OrmbCAkO3UrmkPWSVR3SL9YowwDyw0=;
        b=Ubm7MjcmH96mdKka3xdNcVz/VshkBFNCUjA32wbF7LTVbgv/JWinjbZo/lI+RFMwIK
        bM/4YTrKYtuWTQBoLktWkHh6lMcAvKTJUqXBhOSJ+8EtRlL7t0MigVK2XsSLvcjYFw48
        AjAKbFyH3jhWXui4JP8cCC6M3R9aPKDhwLO/Gq1B/YQi1nOO6UuY5pNQZf56IVV1fYsX
        6QZz2ERIEDtA76LXPXleUHyb4lLmqPa6WCfYmcmqvfDaGSroUgL6V/zqdH3kj/Pv/pW+
        B+czI0tk/Ok0mfQ6mx/H/UZ1dQpHKmiQ3yiuh90zgEzyORPq3/xGIZFiYcIs4YFcjgDv
        aL6A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxrKmG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:53 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
Date:   Fri,  5 Jun 2020 20:59:15 +0200
Message-Id: <20200605185916.318494-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185916.318494-1-stephan@gerhold.net>
References: <20200605185916.318494-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The original qcom kernel changed the PDM GPIOs to be pull-down
during sleep at some point. Reportedly this was done because
there was some "leakage at PDM outputs during sleep":

  https://source.codeaurora.org/quic/la/kernel/msm-3.10/commit/?id=0f87e08c1cd3e6484a6f7fb3e74e37340bdcdee0

I cannot say how effective this is, but everything seems to work
fine with this change so let's apply the same to mainline just
to be sure.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I found this at some point while trying to make audio work
(searched for differences in mainline compared to downstream).
This was not a difference that prevented it to work,
but I thought I would just submit it in case this could improve
power efficiency a bit.

Feel free to ignore this if this is stupid.
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 5785bf0a807c..591f48a57535 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -569,7 +569,7 @@ pinconf {
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68";
 				drive-strength = <2>;
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 	};
-- 
2.26.2

