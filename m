Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9C1F2313
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732636AbfKGAJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:09:25 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43912 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732543AbfKGAJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:09:25 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so336167pgh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkwrhUtOyjx0z9ia/8F33+h4qaYoxLjegmC7kxYQ68c=;
        b=G+nW4KyYZbSmZV1PjkTQItWl/2ynM7MjIg4xQoN3etiESrao5WSn8DqJrhbsEDXx7z
         VRSfFtgZrlUqjK/Am4eN6BvO9OeLveWVg2v7MGpYtHwP+zJQ6G/7leP8ahpXUESoxn5Q
         XLl/3rOmXsYBbPkbhJt8xebs2f8+J0E5sif/yBvUK99IXEoh7dCB4v8YN+7Q/xNqA3y5
         Djg07z3+oZAxmuKIvyi8XQWEMsksPV4l6ekG6ORvL3vUUpsazEJbyC851Mk5mWVlgdmk
         op1GB6r68yrrb7k1aMnDqtJPXMRrrjkZKLE5D9cXZMYTb/WW5ujfVQnRSOwJ3zWMjD4Y
         dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkwrhUtOyjx0z9ia/8F33+h4qaYoxLjegmC7kxYQ68c=;
        b=DCXDK2z5kKRqIB+5zXf6YVNBHq0Q+UCjQPZSeTWWcIp+MdUZrK8luYr2z8Tbji4gu9
         7d5v1ZFDbNrQip+5DpW1nZ43Gyl7sFimal7SxaDiv0o9FkKd5ZbQyaWNnPPgEpxx8uPR
         8okDBYDxer6SgpHA1pBQG6p8E971H90SSHXwjwMqN/5fe+gzAEOW+5rqXAleoBdPUN0D
         HjyJqV31bkgvyqkxkq1kXIjPOU2gSc77/LnOJL9Rmh4IOtNiVavbTvqkKZGHJQCal8N2
         b3h+ueQBsxfe3wnhfnjnAmOBxeVCU/ER3iozuZwDrGEsOA60tuPpE9vuAOtYu0/9U3bL
         cnIw==
X-Gm-Message-State: APjAAAUA7+ZbNkKF1/IWbSqKu+pDNuAxwQ61YXo+RyjSYT3WQhOvo74/
        eEGgvnCvefd0xhH42qGTkil1pA==
X-Google-Smtp-Source: APXvYqzL7Xf8VVGGGBOYn8T1eJwl32JXDaBaAGfga67YrGPm3bMWanjaIDD5Bj8hcuNZkpL4diF6pQ==
X-Received: by 2002:aa7:930c:: with SMTP id 12mr90008pfj.33.1573085364599;
        Wed, 06 Nov 2019 16:09:24 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/5] phy: qcom: qmp: Use power_on/off ops for PCIe
Date:   Wed,  6 Nov 2019 16:09:15 -0800
Message-Id: <20191107000917.1092409-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCIe PHY initialization requires the attached device to be present,
which is primarily achieved by the PCI controller driver.  So move the
logic from init/exit to power_on/power_off.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/phy/qualcomm/phy-qcom-qmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 66f91726b8b2..b9f849d86795 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1968,7 +1968,7 @@ static const struct phy_ops qcom_qmp_phy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_ufs_ops = {
+static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
 	.power_on	= qcom_qmp_phy_enable,
 	.power_off	= qcom_qmp_phy_disable,
 	.set_mode	= qcom_qmp_phy_set_mode,
@@ -2068,8 +2068,8 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 		}
 	}
 
-	if (qmp->cfg->type == PHY_TYPE_UFS)
-		ops = &qcom_qmp_ufs_ops;
+	if (qmp->cfg->type == PHY_TYPE_UFS || qmp->cfg->type == PHY_TYPE_PCIE)
+		ops = &qcom_qmp_pcie_ufs_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
-- 
2.23.0

