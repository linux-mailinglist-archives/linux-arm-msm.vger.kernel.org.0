Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EC62FDE0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403800AbhAUAb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404048AbhATXXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:23:44 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612E5C0617BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:45:25 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 9so97924oiq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UMTJ0JHuVDvRdMql14H7mW/63Qwi+kchpGfybyMLqlE=;
        b=L9pnkOb1g0h9Evn94z6yhdXe3BvX/dUxq9knD0iUOvRAt1duITpneYRtHD+gXRcK6S
         Wjrf/CHEut8lVcecB5qDwtxsMJ7b8Vyn3RAA3BIkVo6iajtZ2Z8yWukVOPaEPAwG7439
         XYmbT+iozQ7IU7YXxxU84GmbxKMgK2dT0IFMR0QTxX373UWdKGZE2zoRojbdcmoLJkbP
         Vkz9FNtjrMVubvGmoH7N0ZjtH2Uscp9/1HFqolXy1BedRri1yOJ9uGdAB9kMdAvpGO/o
         pGMe5gO7Pkl2DmypS+eXHI7Ec6mwjQJMUXzDNoun+11rRuF3ncq5sVUpJRr4x+j8trVx
         j86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMTJ0JHuVDvRdMql14H7mW/63Qwi+kchpGfybyMLqlE=;
        b=WUYpofHHj5TP3/b20NmsSqhJvqDsnK+Dvmt/IU6zrUyFTOyKVD00hu9GTLhZ746N3/
         B296JNelQLyB7OoHookvA4oCol10jKPtrpET5hYth6oNysyiaSnIa6zlglCICJsxIsc1
         ttJTMktpv38sOPSLBD0Ae3imCk1AvNZk6XNPVDtI3WyGwQZa7FRX0rtqigFh5wDRQQ+Y
         cgiq6NdJnTrzNA4dNGVCcYjwu1/KLQsL3/2Mtr11ONbMtwHo9eoGnEcOeyqU7WQhNT8i
         /W+R5/LeOwPK7/LuH2MN2/dgMULgDoIBEhOE81txZAMDDFdFyypqavkJthc3VTERrALa
         o5Vw==
X-Gm-Message-State: AOAM532ABcERN5oYtCoKS2WrvuNZJ02Y+/Pzdjo8Z8PCLfznDHQbLyLU
        mk5kEoPW4PzmmoALseS+lnpc7Q==
X-Google-Smtp-Source: ABdhPJyzj88dLLbYYlRKVCaP9cu++hO6ZvH1DKP9EnzLKSXpe9DE4vXK0nUQiowjRr/XNElYNdeXDQ==
X-Received: by 2002:aca:d98a:: with SMTP id q132mr4302008oig.33.1611182724813;
        Wed, 20 Jan 2021 14:45:24 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m18sm692791otj.50.2021.01.20.14.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:45:24 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-qmp: Add SC8180X UFS phy
Date:   Wed, 20 Jan 2021 14:45:31 -0800
Message-Id: <20210120224531.1610709-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
References: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS phy found in the Qualcomm SC8180X is either the same or very
similar to the phy present in SM8150, so add a compatible and reuse the
SM8150 configuration.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index bdcb8bf6225d..a1ea911856fb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -4208,6 +4208,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		/* It's a combo phy */
+	}, {
+		.compatible = "qcom,sc8180x-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qhp-pcie-phy",
 		.data = &sdm845_qhp_pciephy_cfg,
-- 
2.29.2

