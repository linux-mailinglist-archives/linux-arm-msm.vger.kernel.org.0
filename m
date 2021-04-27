Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0289A36BF7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 08:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhD0GzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 02:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbhD0Gy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 02:54:59 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E4EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 23:54:16 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c19so4809491pfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LSfEUburE6sTonCK8O5R54ZOKcCerOIQD0317H/biuA=;
        b=zh7/Z3rTUKJa947vpJPqPjfZ0oK0uDxipn7BncYkuGu6GWM7bTPPM2OZ3CkNLxU84Y
         S9JnoeMn8fARLCfO6hBHWv6KfaHdY/TKQ2fVc0hUVXgnbYVxsilUA/EnvY7+uOnJAmJ4
         kHa9zRGeM1D1J0zwsgjHnXvT4ep/Mh7hQQMo3x9nkdnlJMzni0VK0FwifHmOYsXtA6Ht
         5nsM6QtkHhoPkwPz5N66z/6HIHlE0tPGu7B8/97KPf1GuWbiW9WP57A3/6Ruya0GpYDe
         C8LRojrC3dhMN7rcQj5X0RTpwvMrRtEgGk7DJJdHrufMNZJWTp4jjFxcFd0Hm+BSQO7h
         Gm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LSfEUburE6sTonCK8O5R54ZOKcCerOIQD0317H/biuA=;
        b=krQ0BsmwjUyQfK3emIhGeEeDTFUa1BCSfJ0+SRgWw9osaKri3ghE023DRppNw5hhg/
         dhQTS7FCThi4Ep3lD2r/iQGQl2Idn7qskw+BcX2SHFma38abaaR2c4C8RGq1SiAhzcwC
         hChpNWGAIrYULo1Mq7AjrPg2MLIlbkirrgsS5St6aYNkLkOJkXVhGLrbr64B7NJ1DRaZ
         4yhlbs00O0mw276eGZm++w2qsSQExDcW1Glw3W3l4+nBKMdwyNAHLg5+vAm+9sMZ93tB
         UUtA9hauZoxMgKlhVO+dCdrdsdcelB8DyLkrDfA/SENnPxJi5MWLE9AfBQwRHTZO1e/e
         g5YQ==
X-Gm-Message-State: AOAM532LOkumzuD1py4Ewa+e9DkIVwtcDGg0OrcoLo2oW21uerp0WKSw
        VLTpoVOdUOuwFV0we+c+Yn84
X-Google-Smtp-Source: ABdhPJwYbZYMGZenosONrJbUYvQapxgVf07Rw2SQL1L2td0MG3XwmqYWpYRRwBURaUx2ezw+pBOKEA==
X-Received: by 2002:a63:1109:: with SMTP id g9mr20922406pgl.88.1619506455582;
        Mon, 26 Apr 2021 23:54:15 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6d89:3c72:ece6:56fb:d9ac:583c])
        by smtp.gmail.com with ESMTPSA id x22sm13391986pgx.19.2021.04.26.23.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 23:54:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org, kishon@ti.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add binding for SDX55 PCIe PHY
Date:   Tue, 27 Apr 2021 12:23:58 +0530
Message-Id: <20210427065400.18958-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for PCIe PHY found in Qcom SDX55 platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 626447fee092..d5162d58a479 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -43,6 +43,7 @@ properties:
       - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
+      - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx55-qmp-usb3-uni-phy
 
   reg:
@@ -301,6 +302,7 @@ allOf:
             enum:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
+              - qcom,sdx55-qmp-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
-- 
2.25.1

