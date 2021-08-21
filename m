Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE50B3F3B4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Aug 2021 17:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhHUP5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Aug 2021 11:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbhHUP5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Aug 2021 11:57:46 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19973C061575;
        Sat, 21 Aug 2021 08:57:06 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s25so5977500edw.0;
        Sat, 21 Aug 2021 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8sfYSq0QuAuGiLgWyWy2pME6Wr0TNS7JzIzhSD/njQs=;
        b=buZokTB5fj0w8ZJTpIpmGJFW6rEwfiVGxeZaf+UR3gAuOY+tsalBWXDcwWn3djt5MS
         TxFruofVy1VPoEFPx4QupzG/1fjdowdtbkGY6sUVT/E8T42R5j2o0khUOc4PDAGphRE0
         NMm7ZLkaF20VIyEObCFf1Lr6egjV7U2eFx5eFzAKsLtqcqbXUziWB7GahOZ/+wlYpO8A
         EVCekLIuB3imX4GXjg4USmKm+/2c6lY8gQVw8W00zwUMl+cjAqVAc/NM72gWUp5XExuo
         rV3+RW+wDB6TUwFMeyG6w28mCiz5eImm1IJRSkmn+BVrNs8A5xSfDiCMZK7PbTje6Vhq
         IO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8sfYSq0QuAuGiLgWyWy2pME6Wr0TNS7JzIzhSD/njQs=;
        b=quSP2vK2dZY+Lr+t6RdHM1X4m4I+tgdlJ12TcXxAUa0u8j3zVYjmkiSZvtJVwHYhku
         1PM4q6R+G/v+MU4pw49jgVUYzSXOyXPIGKpjJONupkr1KS3sD7mrRdk3iDG4JnDETrtS
         PsLjmm7eoi2OsYvUm+kW532pZEjv3GWTkIuawryypic9HeTRuC8QZhctgnEnSw4AOdI3
         w2Xa6El/3kiWFJ1q0vGqeo1Z0eMxYUn0EOXJMBMspl66mIN4Ikqxm7FUutg7SEfQUQ7t
         ihEXrAkZi8QEpdNYwKCZZ0x6JMOhAlReJmwEynFdx8ZgmdsCRU5Azke9yseeOVyxmm4/
         Qx5Q==
X-Gm-Message-State: AOAM5329CMJRBCEBigHZY0K/ZM9BL1ZFfDE8YkIwzfl1eyi2lhKfEYBO
        Y4BxgjHu/EnqGYomQ8DO4z7WtTnO4hTaCA==
X-Google-Smtp-Source: ABdhPJwmsn579dsB7JySTVOgC0bVnx9mICFsu1H6QttWRkMOiunB40d8dFJ+FPMFe2jfET4gn7bBfw==
X-Received: by 2002:a05:6402:215:: with SMTP id t21mr28368506edv.68.1629561424769;
        Sat, 21 Aug 2021 08:57:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id ne22sm3423919ejc.113.2021.08.21.08.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 08:57:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
Date:   Sat, 21 Aug 2021 18:56:55 +0300
Message-Id: <20210821155657.893165-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210821155657.893165-1-iskren.chernev@gmail.com>
References: <20210821155657.893165-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible strings for the UFS PHY found on SM4250/6115 SoC.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 47d99001d2dd..75be5650a198 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -36,6 +36,7 @@ properties:
       - qcom,sdm845-qmp-ufs-phy
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
+      - qcom,sm6115-qmp-ufs-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-- 
2.32.0

