Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3928E20E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfHOAtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:18 -0400
Received: from onstation.org ([52.200.56.107]:44380 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728647AbfHOAtR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:17 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C34763EE60;
        Thu, 15 Aug 2019 00:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830157;
        bh=MgVVYz3IFOaEWkO0SUurG8P6fyggfR5oXu1sG6fhpmg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bp3wTiAHR/MmK4BZ7UH9Kofa1DoQnFfUoY1BKE1p7bS2jKvwMZ7NtUQ5SBR5Yj8oM
         zZ7+UhUUD4ei3UIylr8qmYdCQjodCRWJM/JTShTg5Zfsl89p5BwGyP2ttJlRD5qKXe
         N+p9CACHiMQ9R+jKZjKW/Z3Ee5GDeUksSCLoV/uE=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Date:   Wed, 14 Aug 2019 20:48:52 -0400
Message-Id: <20190815004854.19860-10-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
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
---
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

