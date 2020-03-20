Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B245818C4B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 02:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCTBlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 21:41:19 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:43467 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgCTBlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 21:41:18 -0400
Received: by mail-qv1-f68.google.com with SMTP id c28so2170649qvb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BmLDbgrQGRMcKnRjecEwvHf9acIPMdQPCuaUHQoEE9I=;
        b=bdm7Sshv0U+VOsv1chWTcKaftld2B9J2S6C1Dzd267vnc2TrQbnx7sTDemjcSIdSIl
         XP4Jb604+7eOnOxLy6k1txkJObvEWQVL6zB4R/+lc0qOj5LVcfgCjoMOpbuTaAS2gGeN
         Du3KWhzgPiQnWCp8QomaVLBPjo0BzsFzj/4aGNjNpVX0NOLYiJrgukUq8/jecz0tT7+a
         tVf8wJaYJnhV3eh7b7VAsBnrc2Nw5SmzprjSgV0/WsWcofm++w7V3xbXnGbsCz0ucVRu
         pZo+pFLfUWafOSW5dPWRiBf/ngetpNfqqg9oEhwfV6SfLtV+lMlZJZZrsf+QpSFazJFS
         R+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmLDbgrQGRMcKnRjecEwvHf9acIPMdQPCuaUHQoEE9I=;
        b=ggzGs4Oe3DHLWFEfE/ScMnoZ+MkScqYrFdfkMUkx0PoGn9dU3eVoRV3NJwb0oZgWX+
         2X2LuBlohPq4N+keDogWJftmcJp8Ws2xF4KUikftmPDf76NGA3Jkh5vmcGHdzMG71adS
         CPdFLGXMMY46/y7a/QLMfoFlBrKeEkewoZB4UDF7rm1w0P7aoJn8ay5uD83GM12h4zCF
         Loucsgm2vP7LEdqj/kpyUjNueBHkbnr0w97xpH3cggO7Dl+p3FNT6+B0heZ7eoLlEowg
         vNHIPdSML2bulJaI3tltHBbu1OGTwQzpABBp1CYXREVlaTE1d3A/mV7DALgIqsc3VgVp
         5fxw==
X-Gm-Message-State: ANhLgQ0dLUs5UnAQ+bnF+/7od5vY1cA4u8LC9Uad0leMGh4gok4gPwuf
        XZ1xARHv/Os90WOIh4U9xSrclg==
X-Google-Smtp-Source: ADFU+vvLSkOdW7E5U5A5O6CcJJ7ZWJHOi0uG50WCDN6WNaQOvu8Lhdpvt6s/ZGRR/baXJawhCENi5A==
X-Received: by 2002:a0c:9e41:: with SMTP id z1mr5918351qve.130.1584668476689;
        Thu, 19 Mar 2020 18:41:16 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id 2sm2706287qtp.33.2020.03.19.18.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:41:16 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Patch v5 5/6] dt-bindings: power: Extend RPMh power controller binding to describe thermal warming device
Date:   Thu, 19 Mar 2020 21:41:06 -0400
Message-Id: <20200320014107.26087-6-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320014107.26087-1-thara.gopinath@linaro.org>
References: <20200320014107.26087-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMh power controller hosts mx domain that can be used as thermal warming
device. Add #cooling-cells property to the power domain provider node to
indicate this.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v3->v4:
	- Removed subnode to indicate that mx power domain is a warming
	  device. Instead #cooling-cells is used as a power domain
	  provider property to indicate if the provider hosts a power
	  domain that can be used as a warming device.

v4->v5:
	Moved the property from .txt format to .yaml format.

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index ba605310abeb..16b713d295c4 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -27,6 +27,9 @@ properties:
   '#power-domain-cells':
     const: 1
 
+  '#cooling-cells':
+    const: 2
+
   operating-points-v2: true
 
   opp-table:
-- 
2.20.1

