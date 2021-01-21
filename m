Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563092FE153
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 06:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbhAUDvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 22:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392031AbhAUBq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 20:46:59 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D7AC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:45:59 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id q25so491331oij.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4DFohxjHJSYNY3a+F05NUS9S7JPybkMexC8rsO+oRU=;
        b=QsPAqX9TY/BWe9zTDe6MxhOhDLgbLrq8BstQ+sJAkugA/rnzPM6ja1bsYcfTsm5I8d
         MgiH0ztalwjuv5+RngCemJMBt8Bky4zzLuYGfv+8KEUwgMvcXB0fhi1ibjKq/i0gttxv
         RtArzsqusPCsGo9qu/6k1MBMI4xzg7kvxdTP+dMHBiwNmsC3183swtdVLO+AH5JQDdYV
         3sla7AhsXRIZLi+Zz+OGTnMwNXm28VRWy/dYaTlFySMJNLUI3w7JaeOckvj26ovVZWQo
         e0G9ngI5LgmEt6uDeNgc0XKq5R3GSrOWRV8apOeHQIkOBa41G2v1B/oi6UzkM07UEVR6
         l9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I4DFohxjHJSYNY3a+F05NUS9S7JPybkMexC8rsO+oRU=;
        b=gIC1xKAvnj4CDxEMiW8rQLy8D6XNbnQVWOT87RUK4KtWY0FSOzU8PodQpdLgHiyXzy
         nPKZ7WJ3N3wqSC0xyzJoR4lE8cunxF0nF0G4/i+vmZ6AQUkqNLLEoQgmDnpmEgmAxrO7
         bwlrydehY/Lb384CjLbagKBm56SuZceJGNiWPzIGDPznD2CPfEZA3zI7QnI1b65VQ+BF
         Mb0plygi8CDAPZR73oj9Z6SbqebT0BFrGbp67249cyTcwnPG6f+R0Mqt0sZTUcVtJ8fi
         cvVjsGCL+NtJS2sro0do16V0+8GT/qlQixHnTXr0zrMgyjrRXu8K9/73ynlJmjcD1QhK
         eYTw==
X-Gm-Message-State: AOAM533pLaVBclaHMw4x7j3HRzJ8vY4imiYbrpr2+ceejA4uu2uWEp3d
        sa7cvXWWH9tYk1LteBQmlL6zMQ==
X-Google-Smtp-Source: ABdhPJwAmlA1rQnLnws7DJI21S9hRZV/VftP5Ut+N8wK9cAeCbbQ4jQCPO3EaDOyxJZth9/GPjKI1Q==
X-Received: by 2002:aca:3784:: with SMTP id e126mr4573366oia.170.1611193558556;
        Wed, 20 Jan 2021 17:45:58 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j17sm784398otj.52.2021.01.20.17.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 17:45:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: aoss: Add SC8180X compatible
Date:   Wed, 20 Jan 2021 17:46:05 -0800
Message-Id: <20210121014606.1612668-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the Qualcomm SC8180x platform to the AOSS QMP
binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 953add19e937..007139b9a58b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -17,6 +17,7 @@ power-domains.
 	Value type: <string>
 	Definition: must be one of:
 		    "qcom,sc7180-aoss-qmp"
+		    "qcom,sc8180x-aoss-qmp"
 		    "qcom,sdm845-aoss-qmp"
 		    "qcom,sm8150-aoss-qmp"
 		    "qcom,sm8250-aoss-qmp"
-- 
2.29.2

