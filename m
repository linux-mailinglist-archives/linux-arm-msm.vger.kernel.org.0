Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84474358AD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhDHRGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbhDHRFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:52 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888C0C061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:40 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id g15so2313184pfq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkDwMEtzOiBc5/NcupeoFQSSG9nOWh7PMrRuxNqcjXw=;
        b=vjUg3fUSHnzHGP0mch7Dmg8Nmpzb3dWceczBSTsiYqjMy+QPoDKb6qUYNoY43Ep/dJ
         EYmKHu6oGRB0069S/NdbbsyCpY0O1dhN3ybHGk3yiM6NQXDL7ngQjied5ZNkOJJ+ICrD
         /ITodkuWIhL5KnKbLntnz1BFTLpN3g1jcBMEPQkLKvn/oy+qUWMhhU7v7QvjQzRXHZac
         OM6F5sXo7cr7jztvef+tYwdVGSxn9mXUqbGFNMlSLUXPGIgEtYpkExKlmPcmYvmjhJwV
         Xuj1MsttjgYYuNfDA/+DSc0sRAyaESHFDx38bFywIQEPvldw89XJMeypKBykWDjb7lux
         yd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkDwMEtzOiBc5/NcupeoFQSSG9nOWh7PMrRuxNqcjXw=;
        b=M3/bJUQJMqHZTAA84+K8loDyqZvRLas5vSawgFJfYn9xa3Y/xpShFcVLSaJp+ttDgw
         IWOIIoKMU/QJ9VyD0Um7yqypOnX4MTk139o2XloiFn8e5nS+mO4SpfofCNysmRuZMGKx
         ftASGMjHtX623B/z0obD9mQX+KbXZQwx2/ufQSp1bDDMeuAOnY6kFaLsN3ofZEmCtUlD
         THOA2Jeom0DqG72aFMboeO5SnmpV4Ue3c1cPhpTIZcjPcg0wFKdWcfrn293dHYtTMkcO
         YPArQpRPhs+HJVsgJAzUg1WRjiEwq0oBitpBr/dSTW/zPWlolptFi/wvEmV7vLym+OV2
         wdLw==
X-Gm-Message-State: AOAM531cW+FDNiJHWMVGrNehJ/9SnZtLQrhjV8sAMVVx6vJi2xJJp+8Y
        /w+Q5y9ksLGuSjaYOe+B1Am4
X-Google-Smtp-Source: ABdhPJy+P6Osji4Z9LVdgzt46nNOyHTX9+JV1muOGWKJUip14XuZDk7MdQAlUfQa71nwCg2rhVEsdw==
X-Received: by 2002:a63:4415:: with SMTP id r21mr8975035pga.222.1617901540034;
        Thu, 08 Apr 2021 10:05:40 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 12/15] dt-bindings: arm: qcom: Add binding for Thundercomm T55 kit
Date:   Thu,  8 Apr 2021 22:34:54 +0530
Message-Id: <20210408170457.91409-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for Thundercomm T55 Dev kit based on SDX55.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d5d561d9e8aa..6827bf82fb74 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,6 +173,7 @@ properties:
           - enum:
               - qcom,sdx55-mtp
               - qcom,sdx55-telit-fn980-tlb
+              - qcom,sdx55-t55
           - const: qcom,sdx55
 
       - items:
-- 
2.25.1

