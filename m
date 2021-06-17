Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F9A3AAB33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhFQFse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhFQFsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:48:30 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9C9C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso3171125pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsJhWYmZBDgj/tFiSi4wj9WE1h/l2+Md9lyjAfn8iR8=;
        b=wOOS4VAbMd2nYdoJCV7egK2DDp1ZSn2v/Mh602YP5TNj1U98qN22pMvHXCHEVEA1Qt
         FbyLCP/dCif4jQFWf3+IQ80pEwNx1KWoyuxvxDN4xBTRxVAK5KPkQrUMidoUvPsLrV2Y
         n5CnoG9OS5jzBKxDG0is7darEbEt6H5odeZdifnyx4BiSpS0sml8er8yu8ZxY/q/DdEV
         KWSXIp+GlJhrNVUPzExysq+4SJxfPgyMraAN80OoymMQy0T+SmOmp/Ly0UDSIBixYa2V
         tpqC94gmiLEU+4HZiv3obFyR7lGPQb3aBysr9T8Su+88O1hF9nBP8mEv6qUsnh4augaT
         GDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsJhWYmZBDgj/tFiSi4wj9WE1h/l2+Md9lyjAfn8iR8=;
        b=NjoBL3laf3h4jjpltBx59JS0R4auv5wpTR2MIHlGHCI9Dc8FJaFfhQ+5uTmlRYcNRy
         5WyslwCBRqybk+H1zWbYGvZsCbbz1wTbv9OpiPQ+cd2uV5QDUzsRXXQFG7KBcPuzhesE
         jk0yoR5/SpHUuZxqVF7cmU3x5C1/m7Xe5Jp+8/xW9kBT3nSBsjziGTMv2XI9hftn04YD
         0zdbwV4K9WUX8Usn1JN1t0okLEzY5iU3zA7hvvBnEH60R2ms8/+gp1mov1mgOeHcAuxf
         lTIQrRJ6pKxO6U45klqWiB2Ny9v48UkN7V1lPiKWJAkNcAFAxBZwkM5rND/CVET9Awtd
         lDrA==
X-Gm-Message-State: AOAM532+lyHon6JjSS87Cowlx/7+qDwRkqTECgp77Jk++XMfpxvR9T5Z
        4zY7CxeOxWZE8rYM3Jctldu53OgF5WdcuA==
X-Google-Smtp-Source: ABdhPJwFGa8BwqCx26oWn0H764ybHhUWQQnQydJTCyAex86fJTVXNqRgghY+dzqJ0C8cV4n8umQWMg==
X-Received: by 2002:a17:90a:d483:: with SMTP id s3mr14661286pju.61.1623908780546;
        Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id y27sm3882700pff.202.2021.06.16.22.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Add compatible for sm8150-mtp board
Date:   Thu, 17 Jun 2021 11:15:44 +0530
Message-Id: <20210617054548.353293-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sm8150-mtp board is based on Qualcomm Snapdragon sm8150
SoC.

Add support for the same in dt-bindings.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9b27e991bddc..d7bb90e5082c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sm8150
         sm8250
         sm8350
 
@@ -198,6 +199,11 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - qcom,sm8150-mtp
+          - const: qcom,sm8150
+
       - items:
           - enum:
               - qcom,qrb5165-rb5
-- 
2.31.1

