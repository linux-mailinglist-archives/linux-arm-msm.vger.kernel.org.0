Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2844166A515
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjAMVWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjAMVVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:21:43 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5927088DDA
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:42 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so34849363lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN+BaiXuwcGWigpxuQcgmjXIWIeg6JazWWwPqMBFIbA=;
        b=zkjHswtQV2Yt+JQe2tTkt626HsTKAWWGegeehc9NsSwQPjIS8SdI99Vyy4YPaeT/B5
         xk5qpq1SZgtuzpu3mc10mNjmDqVFrtyWMUO30CezHIVNNY3vWcJ1U++sN52dRz85St/I
         YKlQx420wK60AluARYDu92Y0J5TOwQRvkk++uxY256k8D1On/ZQpT16bfujjj24D38An
         LJlvhPiMFLXoktV3QqhILEltIHeIyXgIxds6WmVXmxrqMTa9kVQrzW1sxOprJOlLvDVC
         +adf4P3qbRyFSxSg1FzLgqF++c9pUyDFVZYP0zAyB7UewmTB4tfULKCBx4I/hbataUE4
         XSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN+BaiXuwcGWigpxuQcgmjXIWIeg6JazWWwPqMBFIbA=;
        b=MFc3q6wnikES5r+s8F6hA90gVqrpUjNIkoWVW/B+uJX2o2bd8ZDY4uXRTaWwa4wN17
         uGZNTcx2J84qPU/bQYiDM3UsnJyqw5BqJz9zDplJNWJhPeFx1SAjpjo2fR0YnaCzRvnw
         0puou2xJfHPX3IUYyVGsr14vkG8n68BAhUbmpOKxsdqME8w6HouJmFfgsDKr+pEq6h3C
         EVx0KUgq/CNAbIcuy8QyFTh5lm/kIJEVCZPrTwlZcBEV/bUYz/yM0HJchfR3LMMIrAOV
         mY/MjDLGx9RM0yYhBAuH6XU0fGFQ7oML8B+E38+fAAw7j5QYIt1YbUKjjhIOByGUma6O
         9vaQ==
X-Gm-Message-State: AFqh2kpyfPAm5w9D6/kFCTiju9eEvB2i5LIYXx6HuIBHH3+Xh2Dhf+kJ
        IYQolUx4nwzyHy/UuB1lUJAAAg==
X-Google-Smtp-Source: AMrXdXu4J8Va8HZjzWO8oSP+VyIKzJD1Yi/6pJOQ4bBMwaYwAGsCpbfk/L1z9g36sOOz2PZk6+so9Q==
X-Received: by 2002:ac2:551c:0:b0:4a4:68b8:c2b8 with SMTP id j28-20020ac2551c000000b004a468b8c2b8mr444816lfk.15.1673644900742;
        Fri, 13 Jan 2023 13:21:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u11-20020ac243cb000000b004cafa2bfb7dsm4008933lfl.133.2023.01.13.13.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:21:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/2] phy: qcom-qmp-usb: fix the regs layout table for sdx65 uniphy PHY
Date:   Fri, 13 Jan 2023 23:21:38 +0200
Message-Id: <20230113212138.421583-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113212138.421583-1-dmitry.baryshkov@linaro.org>
References: <20230113212138.421583-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sdx64 uniphy gen3x1 PHY references the qmp_v4_usb3phy_regs_layout
while the PHY itself uses v5 regs. While there are only minor
differences between v4 and v5 regs and none of them concerns registers
mentions in regs_layout, switch the PHY to use
qmp_v5_usb3phy_regs_layout, to remove possible confusion.

Fixes: 14d98d3bf70e ("phy: qcom-qmp-usb: fix regs layout arrays")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index e1f038cc173b..a49711c5a63d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1862,7 +1862,7 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
+	.regs			= qmp_v5_usb3phy_regs_layout,
 	.pcs_usb_offset		= 0x1000,
 
 	.has_pwrdn_delay	= true,
-- 
2.39.0

