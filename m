Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05D435A9E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 03:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbhDJBTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 21:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235320AbhDJBTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 21:19:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A16C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 18:19:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b4so12450182lfi.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
        b=J1qJfsd3G51VUtZHejH2W0xArwQAEIsoz7Ag3L9pkjuW9XHmrSxPCeCc/ASZnF+sVm
         ao5RvymWUw/ApUSWMZVl6cjcbtbY2hofZkTz5+q4f0F20ggHftxfnxOj79pUZp4JT65A
         eqSvZZmRYJXudweA/UN3bqVjQOwqxvSuPk78zAP07Mb5GGvhPeep9m2Qek4RDmaa3Rhp
         3G5eRSYhob8ZlNUGS9ePi40CfXpSKWDW4BvXvbAbcl1l6vYmBzr2R63UYbOJ80o+mQWO
         M2zVqUeysH85gJUPIBpalHz32PcA+YL72ITBld7kdu4yyKLFZ3TFSQ61ZODP9bAqNs/g
         uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
        b=YdtSazplzj1pcJ6E3VNmtPIZD+/0Aeo72TC+7Vg/9y58Ob9tJ6wWRGfjNTGcJY35TB
         MaYkLLPkMu+xKkCrPuQ30vevPCip0cwVVncA2ehMQh6DNuauVXZJ18O4FjhquX/327N0
         a4Akm49FUyXbLApMaLZ1TLQs/xqe4GHLK8QR2ci2Y/+hWOTnf2noHyTULqFayxI4R1R3
         ExixkUDQtzrPIWhKoC4UtKmm5ul1S/lgsofAS9V6OZlb4ef+d/kHkecv9oL6Q0XhAl2y
         aVRYz8ak5Df9xnA8cZDhlUskTZIrnhu6bi5fq5F4ZbqPXNAMZvR38KKz7UNcViAWEbv/
         qmEw==
X-Gm-Message-State: AOAM532Hr5z0V2XwmmMZhbB2C4xxusnXSjrPbFM4oytqjAcDDCkDghty
        vxHSvTKEOEvWLkTUxARv3T6W0A==
X-Google-Smtp-Source: ABdhPJy75C3YoO0lTlpMn1djMnbOvX0ZgTBZhlF04KJLU8PmMSu98lEtJWHvdzOgvsr7y/RLrpboIg==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr11571187lfn.527.1618017543025;
        Fri, 09 Apr 2021 18:19:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4sm614132lfv.22.2021.04.09.18.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:19:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
Date:   Sat, 10 Apr 2021 04:19:01 +0300
Message-Id: <20210410011901.1735866-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The parent_name initialization was lost in refactoring, restore it now.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
2.30.2

