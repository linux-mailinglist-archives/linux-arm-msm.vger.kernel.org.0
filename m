Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382823E110F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbhHEJRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239678AbhHEJRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBEFC061765;
        Thu,  5 Aug 2021 02:17:35 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u15so2878410wmj.1;
        Thu, 05 Aug 2021 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGMIv5wQ+fS4t14WDHHMzzSo5Nn0QlXBj1nNDFCAyqE=;
        b=uHeZLDXa0DOJWSuPktLqTfXk/HKBBSdsUPS7ydH2wxaBf3oNxQjI/iWsNT4VUPiDVK
         /dzuK+u8m96o5IvI33IAB1SlfYMCx+V1WXZ4JF2+2qOL2Rv6EHg67/lkHWpy44+7h+nL
         laxfHKipnzIPKCoBnKAE8n0fseqWaDCAUBh0eZtLKJtJiRBNPGBnDIWlvbsVIhsNm7It
         JbqzccVt+OjtBxWrPdLOucRYR7bjk4S5M1R93gW6elbdPG3N+HuusnUJXoIyOqztbxoe
         1DHxS+iJrSRYEn4PPYIBPhGjbI869Kb6ti5O9YKjO0hHEKbLMyDXzoITNDIplcCz35U+
         l7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGMIv5wQ+fS4t14WDHHMzzSo5Nn0QlXBj1nNDFCAyqE=;
        b=MkxgCFNjuA5uiqCblF2oTiEWDxSS8taa0sATBXysbreCpi3A979UwBk01mkArct7N2
         H1oWnKzZ9Udj8W4y6AA41YL6zUESV8hdCODoqmaYoOmG2KKjn/+CS+WPHXDR+//+SatO
         elFBDi54WL45gjNUsZyWRHKuuHF2IAIZ3/OGYNxxu+CBeYjpCaVSlZlXH/WYdfj1pgXv
         E/9oUZ5GL7xJWOc9bq0ju8GoatKr54Q1lMtE2LMvzKAI7Noq+88A4B/KFKjV9vUciq+A
         c62wLYhCzoy/pogV1WUSM0mCtB3hCxqx9o6dvu16H02Scl5J0w55s/xV/1FK709WL3nH
         9VXA==
X-Gm-Message-State: AOAM533ttC+HMf/EDsXMqVh5Q50pXKxPyCVOKEYd/Fm8CogrFoAWoopF
        9DdTlxlALYWnzt+uKsRcn/Y=
X-Google-Smtp-Source: ABdhPJytpTUc9Q+2xehehY/aDRl3Rjixc0hPG17Y+H447NiUsdc00NB2AsLwQF9y+++KT9/htGI2Vw==
X-Received: by 2002:a05:600c:28b:: with SMTP id 11mr13700248wmk.6.1628155054609;
        Thu, 05 Aug 2021 02:17:34 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g138sm5995720wmg.32.2021.08.05.02.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:17:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
Date:   Thu,  5 Aug 2021 12:17:26 +0300
Message-Id: <20210805091727.942471-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805091727.942471-1-iskren.chernev@gmail.com>
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible strings for the UFS PHY found on SM4250/6115 SoC.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
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

