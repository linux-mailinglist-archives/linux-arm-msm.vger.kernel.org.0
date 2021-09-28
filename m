Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C5E41A542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 04:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238672AbhI1CWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 22:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238695AbhI1CWI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 22:22:08 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C0CC06176C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 19:20:27 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y8so17607760pfa.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qHSumsFttLNe13vy2J2oY9G24Uv+x+gtP2uj1qdWakg=;
        b=XFaKrbicAE6MOpmf9fQ/3JJ+kZkW/PeuWDB5ZjnQ0QGs1Mp5Di/jwitdHQM2indyCa
         Z/9j+E+QPCa37kz8uaMUWSbYLL7qWCmimkX2x4PtZ0rcKS/5yV5ZowVP0g44ins406Rc
         cy3ay2TAsVjifjTOP2TMsP0LfGHBrml14J7UqenNeJvd1A0dR2LmR5doGNa5nSUWOz5A
         9HOIiQY+SsLLGtjVYk2p/rcndvoJ92oGoDclxtB1JPkN3WRaozOISMsRfB4W2ZCk0QaN
         p/emf1cqbkNXM2sDuCcRieUeMgHs12sgWlMO/pwmNph9acuVaoILE3qQOD5emHhOQDMi
         oq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qHSumsFttLNe13vy2J2oY9G24Uv+x+gtP2uj1qdWakg=;
        b=4AgfxjF2mPr0gYawz7cgrbA0ILVD/4A4T2/YCzxYnjPrY/nZNs+sHyjrtDcEipDTeg
         kPTpyMA50peAmFQijF35oLkN53ccPDRXwg224Vjb2WKvVuEmpv1FCv8pZJRc87jonlBg
         WbI1shkmP01/oYz25h73ZPdAuhqKLFLI2pZH+pGWiYD0iumHUn8R6FJZzERUkZEwn/ba
         VL9rjfNyuhNju88pOWNqlClOJQvpvzbMgs4xB6Nw6n06omQun04nRjrXuobf/E+bBnzz
         89BCH+iNLWv+3pOxGnfDvt9ivgU7+qgOuHxRy0SK3w0mzACuha/JZgGikL25FhJKw5vu
         5DuA==
X-Gm-Message-State: AOAM530xDvjSzo+VCs9seuBasiIWPXPCCkFscudRLzD86wZv1I1fQek4
        CVJXlu95avNBonbXSoJa1zmYzQ==
X-Google-Smtp-Source: ABdhPJzXL8A2F3RqJqnz6h6cJYNbXuaeta2bLaHDKzTDqrS9svQq+oMfQ0pUUulrGexEbWkEB74vyQ==
X-Received: by 2002:a63:af4b:: with SMTP id s11mr2351998pgo.185.1632795626732;
        Mon, 27 Sep 2021 19:20:26 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u12sm19178729pgi.21.2021.09.27.19.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:20:26 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/3] phy: qcom-qusb2: Add missing vdd supply
Date:   Tue, 28 Sep 2021 10:20:01 +0800
Message-Id: <20210928022002.26286-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928022002.26286-1-shawn.guo@linaro.org>
References: <20210928022002.26286-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per downstream kernel, beside vdda-pll and vdda-phy-dpdm, vdd is also a
required supply for QUSB2 PHY digital circuit operation.  The driver
works right now likely because firmware already sets it up.  Add it for
correctness and completeness.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3c1d3b71c825..02845e08dac0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -371,7 +371,7 @@ static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 };
 
 static const char * const qusb2_phy_vreg_names[] = {
-	"vdda-pll", "vdda-phy-dpdm",
+	"vdd", "vdda-pll", "vdda-phy-dpdm",
 };
 
 #define QUSB2_NUM_VREGS		ARRAY_SIZE(qusb2_phy_vreg_names)
-- 
2.17.1

