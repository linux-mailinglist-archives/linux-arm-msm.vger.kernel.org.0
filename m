Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF27CDA41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 03:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfJGBpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Oct 2019 21:45:24 -0400
Received: from onstation.org ([52.200.56.107]:33064 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbfJGBpX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Oct 2019 21:45:23 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id AFB9D3F23B;
        Mon,  7 Oct 2019 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570412723;
        bh=gzdgs5zsOWrjVwg2I8HksBIuH1s4hkhufGSorWKu1mI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PhMYZfXEjQ9WbuoaMd9YNUF3WP3En77w80xXRCf1KlpMRFzmeAMpOu3G4Ya+O3hth
         h6lL+ADPRViKAuiuElORVwWcOB2vXT1c8jUvkuAHah97QsYquU4IYZg4HtvmsosAvf
         nU/AxP09NHE6SKn9kJ/veTb+RfySZjPQlFtRob2E=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFC v2 3/5] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Date:   Sun,  6 Oct 2019 21:45:07 -0400
Message-Id: <20191007014509.25180-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pm8941 is missing the 5vs2 regulator node so let's add it since its
needed to get the external display working. This regulator was already
configured in the interrupts property on the parent node.

Note that this regulator is referred to as mvs2 in the downstream MSM
kernel sources.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/qcom-pm8941.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index f198480c8ef4..c1f2012d1c8b 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -178,6 +178,16 @@
 				qcom,vs-soft-start-strength = <0>;
 				regulator-initial-mode = <1>;
 			};
+
+			pm8941_5vs2: 5vs2 {
+				regulator-enable-ramp-delay = <1000>;
+				regulator-pull-down;
+				regulator-over-current-protection;
+				qcom,ocp-max-retries = <10>;
+				qcom,ocp-retry-delay = <30>;
+				qcom,vs-soft-start-strength = <0>;
+				regulator-initial-mode = <1>;
+			};
 		};
 	};
 };
-- 
2.21.0

