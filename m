Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7DF4732CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 18:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbhLMRTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 12:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbhLMRTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 12:19:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A284C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 09:19:54 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u17so28316091wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=075Yk0+y68GloxUXTf/Thww/w+qmHUDekOuz0aOcf0Q=;
        b=nZYah+y0wyEUy8U0mi7D03PliOVEhrN1pu022fo9i4e3eWzjTSNbSlinRNb/0NXafy
         XT7ziMe+yLbCMrIcuayBK8VbSmgL2NtC1UeLEX5OI3itfszWki6RdPrQ2HnVul1/1OkO
         AVWpG/1hJq6zGRq9q4KBieqKv88PvK2XYG9bVPP2CjpGC7eBLIQvRWsLafAyadnLq5at
         HCPhJYNJIfLsFbBGuiMlDPAA3gZ1OPp3R1IYWG9CkmHU+pCgAcXOe6/3/fmduxF0tnAY
         1Ir52p8mjepyrDZJXuYX+rWQSYX3PalLJPe0E73+Kf84op4pNfKVvMnAbhi0YlOjmeVe
         nu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=075Yk0+y68GloxUXTf/Thww/w+qmHUDekOuz0aOcf0Q=;
        b=gJ7QxSjfPIupk9moECNS1bpntc+Eknzz28cKberEO5gWRksEeXCE1eSqrHyJpQhTAM
         bn3KZBNzx9c8wrIG3aqb81OjAMztUdbO02C1swWsvY0fwQlQYCLXiIqRnbYbhwFoyBbt
         KG9gZSpwriQI3vLX6HZC/wJtKJZQc5VRTWXT6CETtcNdiAJIgER8D7kxJDGb5NhDboN8
         464O8b9t/p8Z/+SAxI7HUYVsIkBjx6Jc+f7cNYR+Y9KDsIIFnDMmaxJZygUK8/OQnPFM
         +jxMVKD29aYj+50AFR0N8tyOL9Gq9KcRXLEP5t1CpA5XuFJTn3XHw4h07T5XINoc9h/p
         Gd3w==
X-Gm-Message-State: AOAM532SR2blxMytSvVHohCo36NW99R702KsgZM5AePfuphpjP5aiaU1
        EoQaIXX3e4iZXhaoTpNnEzzP1A==
X-Google-Smtp-Source: ABdhPJyAwS+zgaTzXAAzYkD2cTgfRy9evWiBsjvc4LqUC01XO/9zVqQaVozt6C9tDubEy5gAsmZ9qw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr32718756wru.506.1639415992703;
        Mon, 13 Dec 2021 09:19:52 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u10sm8483283wrs.99.2021.12.13.09.19.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Dec 2021 09:19:52 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] dt-bindings: msm: dsi: Add QCM2290 DSI phy
Date:   Mon, 13 Dec 2021 18:32:00 +0100
Message-Id: <1639416720-6732-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639416720-6732-1-git-send-email-loic.poulain@linaro.org>
References: <1639416720-6732-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 platform uses the 14nm DSI PHY driver.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 81dbee4..1617efc 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,dsi-phy-14nm
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
+      - qcom,dsi-phy-14nm-2290
 
   reg:
     items:
-- 
2.7.4

