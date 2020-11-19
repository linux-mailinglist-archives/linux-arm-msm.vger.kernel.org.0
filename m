Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2062B96F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 16:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgKSPwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 10:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728943AbgKSPwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 10:52:43 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EB1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 07:52:43 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id 199so5744781qkg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iS4PFF4afNVE7r1m6FFtegXe9ReuZEWdknfJDOJxxsY=;
        b=ogRs7aHVgPAe9BFPnptBBpgxHJY2yTOCZkeVo9BIdOoGrIr47GvR7a4/SOKPKeXlz7
         N9hh27I3m3pqEEFW4SA/IirxvRS7+Uve3ZuaoQin3LNcceQO08qYMn92+YDYjVTybV7j
         bSIzxWcAQQJ1XcUKoeRemnMcO4PLgEUPDhV6TrTxNcyUW4Sx/hMjOXHvB5Q29nxFjdw9
         h+VnR8oEuBh5FV6QRfbJQuDhtwaatGpvwneia6taGDiJAMjegXWq5/MEPLinlC2OvfIS
         5r7gJNdpUtLi22yEuDSs6g9KfyI47VLO44gBTSnbRlonevCZrbfqQxE+doXbWaAEobcX
         ThBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iS4PFF4afNVE7r1m6FFtegXe9ReuZEWdknfJDOJxxsY=;
        b=tgaMwbV94SBTMKUNak9OuJU9EK1sRzpSg1F6AnxRow3rtun3uqmO70Ac2YoZyIrd0C
         GVyPloUYv5jM2DOGSomwUPSkUITebnwQFXR+omN2f01lxej9BhpTkYOWF2MWfxtYtaQK
         glm3U7/dSI9GYwW57XLeE6AQm2Ha3/lPq2/hj7vxf/m+5O5XH/Tltn2S3M2UyR+zxoPl
         mX7beR89wHW3x6nTvaJXqqLngVkrKqZcCak3UD8w0zPzbEGY88W2XmrQ+mK4a8DqhSRF
         sakKRVJdXd7wTA6prXQ1twyzao8nXdWX+X3UDZc82W6Xcg1FajJhu7hwebrq6E0pBD0Z
         UF/Q==
X-Gm-Message-State: AOAM530zyjHbSyA2xIX4lGgrPG6wDOZZdIWcU3dMBXK4LQIX3f2Xaxlu
        s+hE9/SzS5CCHXmeGfRkYVYWXg==
X-Google-Smtp-Source: ABdhPJxHwH4v7FYWbrIIlnErpYmRYuzu4SdUpPCubL+H7hYfW1iAJvkBSx64ZORRUh7Hqwse028vQw==
X-Received: by 2002:a37:e207:: with SMTP id g7mr11719107qki.44.1605801162795;
        Thu, 19 Nov 2020 07:52:42 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id g70sm127290qke.8.2020.11.19.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 07:52:42 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [Patch v2 6/6] dt-bindings: crypto: qcom-qce: Add v5.4 to binding
Date:   Thu, 19 Nov 2020 10:52:33 -0500
Message-Id: <20201119155233.3974286-7-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119155233.3974286-1-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string to support v5.4 crypto engine.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index fdd53b184ba8..ed1ede9c0acc 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -2,7 +2,9 @@ Qualcomm crypto engine driver
 
 Required properties:
 
-- compatible  : should be "qcom,crypto-v5.1"
+- compatible  : should be
+		"qcom,crypto-v5.1" for ipq6018
+		"qcom,crypto-v5.4" for sdm845
 - reg         : specifies base physical address and size of the registers map
 - clocks      : phandle to clock-controller plus clock-specifier pair
 - clock-names : "iface" clocks register interface
-- 
2.25.1

