Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AE63EBD1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 22:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhHMUMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 16:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbhHMUMc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 16:12:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134C4C061756;
        Fri, 13 Aug 2021 13:12:05 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u15so7605682wmj.1;
        Fri, 13 Aug 2021 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSjHQTvk0FVejWbp1Z7NELOH8hKVDSmJY2cV0c3KhBc=;
        b=u9LR/E5tFALGowh1x6KniM3RRnYBBPPZjT5Hb39tX66i6/3G4DSBq4ngeYKDTJZXxy
         m+1e5IhkINRukDKwhbaOnThxkSntUiSbJVmek/AM81Xfev+n7YszVUIS1fnVNC8LOSy1
         zCgz6IffmOiCvRMa8eQnHgtSQaF2+CRV60wccNAinhMjqA49a+TWJFey7kWX8nYv8kCz
         dGe/gaYRvS6vtCNltMaiyz///4TWb4ZF+UFSdBj+Kr2yYR/sL01+FLkx6RiC1VehGtaC
         GYQu6I9K7Kwlfy+fmaZ5SF+7Hiy3xQkF9vgEwhWwOV5AcrC0t8ZgoSGB3DurYPN4GQk2
         h7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSjHQTvk0FVejWbp1Z7NELOH8hKVDSmJY2cV0c3KhBc=;
        b=A0lfUEZI68+DRsMZ0RSrXnrhGF+Uwiran4VbYE3NMsXWA6VAftXZ2CQ5x7itLG5/As
         nci1/GQUeLGdfC95OaE/xKLU4iDXgRQJqyUMdEYL67uTrSjJqhU3yDUzYgeIuDjAATHQ
         jmd9Kbdg4Pp6xXbWV/J4Rb6cOkePtK8ORdM0Oh2i/SO/mrZmshIwkaNl0wdeC6BokCRF
         tVm38Hh2pDEW7FONB0XjyDM/DOojGpKAEoyH/MiBc8Z6iVXBC1czXgl/BOJz9df2Wxng
         RDW2gdwWCSysbrkmMJawu1JQ86wkGVZP0icMid6Fu3B3Ux6tB0G+OaF6HWU4EI9SjhIz
         fD3w==
X-Gm-Message-State: AOAM533HM7Plrqk5WozzPSLP4kCrcmu4bKJAcb6T98wg4kj/ioP+MR0t
        RrCNeRmw/8qQU+xiJKurlyI=
X-Google-Smtp-Source: ABdhPJz/uCFMtYgo2i8YsjHWNV9msRyMjgaZDArRwjAqpKuxPAI1vz0tcxes0wxJNiGeGnfo7QEcAQ==
X-Received: by 2002:a1c:9dd0:: with SMTP id g199mr4363007wme.12.1628885523760;
        Fri, 13 Aug 2021 13:12:03 -0700 (PDT)
Received: from localhost ([91.92.14.102])
        by smtp.gmail.com with ESMTPSA id f2sm2501147wrq.69.2021.08.13.13.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 13:12:03 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
Date:   Fri, 13 Aug 2021 23:11:50 +0300
Message-Id: <20210813201151.974512-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813201151.974512-1-iskren.chernev@gmail.com>
References: <20210813201151.974512-1-iskren.chernev@gmail.com>
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
index 242560ff52a4..7c3c8710ab47 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sdm845-qmp-ufs-phy
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
+      - qcom,sm6115-qmp-ufs-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-- 
2.32.0

