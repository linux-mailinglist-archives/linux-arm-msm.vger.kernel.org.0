Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0294A5DE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 15:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239031AbiBAOET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 09:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbiBAOES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 09:04:18 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188D4C06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 06:04:18 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id q204so21271623iod.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLEfOvs0XYTBMi37IYE0nxh2vKRdvGYr4hL4oQxHa8M=;
        b=Xj2bWEPqf/2o6pjwC5MIf9Pl3NxXOWzz7BeXYgtgm6Hus2Yg3a3j6lvS6Mh3MLMWjl
         XZmowq6m0Cg4I3jz80YK4GAhyGfB0jX6GvuIgpX7SSW8WYS67i51CLR1n6D3j6I8GJqS
         V7c8maJhi0BoIbeuo0Hfequvnf3k/jSCe2xoP6YmCFlXoNIHYA7XIj5jopwozViiO6eA
         /53is8M4gdf+L0/2kcthNDduO/rRUO9wW0b6zMjoi6J6UWvxb675WqEg2VTrCz5HAr2H
         gIlzofTgo1XmStIAR0OHYFAeYFl/+B5WySuRTnNkh3X2g2zLOfEE6ZAJH0P+h0dvYd1m
         2L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLEfOvs0XYTBMi37IYE0nxh2vKRdvGYr4hL4oQxHa8M=;
        b=CVolSaUiGrIRnOfzjwYXF04pjInzSsGJEs2oT5rOgHsKTyd+A2/rLPBbzxmGENSba+
         wwuqC7rMXS+sPdKyzJ3CjlN/JTUcNBh1bPTJNAleiUas6YPiLxyctIAdRwP32OrEKsMk
         ZjvJfdsgqMcdUYEC9BL76zZEpTNplIfjozDLmu7UcNZtyOG0bwQV/CTy7KoammZPCoS+
         UR+CQVaozIOzy6YednznZWyDOf6nssdi/Z9pK7jTMwm97DDAhOXrPx8Loh5qQdV1cypz
         cgCUgxVkPZVaZ1GviyS1k92wlWIQkHOiWTnj0WqSg3skBhKUWdW62arXcECZ8Ze3lNzr
         JSmA==
X-Gm-Message-State: AOAM531fRaHqdB9dLyQ2qNW3gMcs/WgcLhiIJwoI6kgnY6rri0xiEvWW
        owU2AJE6/LdmVd9MinocCDYZJWGaXlUwM5V2
X-Google-Smtp-Source: ABdhPJzhJCQkilBeE2UUjay3h4zAOk49+hyIXb1Kon58qZEntbRNmrkJBEYbHMuFuxnSqthW9Q+BeA==
X-Received: by 2002:a05:6602:2207:: with SMTP id n7mr13354260ion.89.1643724257507;
        Tue, 01 Feb 2022 06:04:17 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o7sm189267ilo.17.2022.02.01.06.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 06:04:16 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] dt-bindings: net: qcom,ipa: add optional qcom,qmp property
Date:   Tue,  1 Feb 2022 08:04:11 -0600
Message-Id: <20220201140412.467233-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201140412.467233-1-elder@linaro.org>
References: <20220201140412.467233-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some systems, the IPA driver must make a request to ensure that
its registers are retained across power collapse of the IPA hardware.
On such systems, we'll use the existence of the "qcom,qmp" property
as a signal that this request is required.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index b86edf67ce626..58ecc62adfaae 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -107,6 +107,10 @@ properties:
           - const: imem
           - const: config
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the AOSS side-channel message RAM
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: State bits used in by the AP to signal the modem.
@@ -222,6 +226,8 @@ examples:
                                      "imem",
                                      "config";
 
+                qcom,qmp = <&aoss_qmp>;
+
                 qcom,smem-states = <&ipa_smp2p_out 0>,
                                    <&ipa_smp2p_out 1>;
                 qcom,smem-state-names = "ipa-clock-enabled-valid",
-- 
2.32.0

