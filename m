Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599801A3E56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgDJCcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:32:55 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44091 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:32:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id 131so368065lfh.11;
        Thu, 09 Apr 2020 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRYexHiGlHYS2OWu1UqqdC4MhAnmblXrqW381GPECfY=;
        b=BBAYw+BG3rrs+XEE4ed6Qv/Qmwavu8nNLw7Re8Pv9v8p7xNHcZK3AaLVX9cPOTmIFx
         yUmOdmugsHW1ydXn0383VDZ31hDFyRIeiZlOAlZltuINRu/J2KcXF75SIMbTcEbVG84I
         R5JBPn37l2mIxcAh8+JK/wve3Shc1S2zQ89bi9MYHoL7fEBRT5KJucWXBaWj7UCsHCjw
         XyVrDnk77E/SCB2OxW6qmAjVS29vZd0r0hEdtJEBG5PuHDJDyuJFX0qRZBZXaPp++iCp
         VhkjaQBCr5AzdJnlv90zVh1YDxp1jI+NikU9eNSGAmvfmXwy3YaDYiL0xN6yrhEsx3RN
         1w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRYexHiGlHYS2OWu1UqqdC4MhAnmblXrqW381GPECfY=;
        b=ZRBIP/ebmdt8kB2Nnubzg1VHE7jCbBFSygEN7cLqyBCBWxwzVpFK53w5vxOTaugBry
         63oaHKavWxhN7zCzNcQK1xp8qUE5ldSmEgwZg5frXfsTISjz2WvyE5c1qEgzZIN0TkR8
         V1qJq2at/1ur9LgMINBzpqJpf/zTtV4Fa1gQvmL05VrTvur3TBr53UIhjutRO13QdBqR
         qveJZYRevRIVQq3/kjcSSJtB1MpB+yUjeDbFpylurFH4fANO96jak2IyWGA9BUL2Iwz4
         QQqQsUFUPXAlnpMwECOrLFnlsn5sFCnzo2wA0PcOGLNneIHV6ILMVhYWE0B33XXrA2u1
         HYRQ==
X-Gm-Message-State: AGi0PuZFJWsVeSyYGk6AvS/WIRiY+QtvaRAzwjubyQo5HFNjwH7VYTGq
        0EC+SQnl7+r2ia8KMG2b7roe5OR1YLxukA==
X-Google-Smtp-Source: APiQypIAaoBNNNTErcLAiMjEaEPexcgivbo0e3XytA6AzZFotVDr8zQ4mmaN/zExBKg4F1qjX0VgIA==
X-Received: by 2002:a05:6512:3049:: with SMTP id b9mr1320447lfb.176.1586485970329;
        Thu, 09 Apr 2020 19:32:50 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id v3sm415033lfo.62.2020.04.09.19.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:49 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 5/6] ARM: dts: qcom: msm8974-klte: Remove inherited vreg_boost node
Date:   Fri, 10 Apr 2020 05:32:02 +0300
Message-Id: <20200410023203.192048-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410023203.192048-1-iskren.chernev@gmail.com>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

The Samsung klte does not have a vreg_boost node. vreg_boost also
depends on pm8941-gpio which are not present on the klte.

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index de0bf6b7e732..ad26c83fee81 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
 #include "qcom-pma8084.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -196,6 +194,8 @@ l27 {
 			};
 		};
 	};
+
+	/delete-node/ vreg-boost;
 };
 
 &soc {
-- 
2.26.0

