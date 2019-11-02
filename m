Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668F4ECC39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfKBAQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:16:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43998 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbfKBAQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:16:38 -0400
Received: by mail-pf1-f195.google.com with SMTP id 3so8079541pfb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vwfNasNmk/zaE6boGrbx1PqkuEi6mq3j6Mt8dGLE6Ps=;
        b=EPcVFzqSL64s0YIj+h3PJq7y8bYRW20pfznj3BLHp+oQLsCu3Ta+Q7gXLFv4bwQ0w+
         hl2erg4NmbjRIS+aGigEMfaHHtBJW3JgeboPhNoQlrj2wFQ0EQ7/g8rwaxWbzge6K1CT
         ZH4cBy3Yc8PzgTHrPI2MHY2vk8cvgpFjyMLd59iAze207ykg0bFbbRVErSC/wKaQEmrn
         BVhgmbzSLluEpgOJyFg4wrRyVgj/FB9cJrjeajfNHqFTIZrSqHGOYi+XMfSGXiNYTlpo
         QpcwmubIccH28bOHvX+fUEee08/bNfwv1MPWtIWp7+7eQSBA8bSTycr4yA4cqGoulglR
         MoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwfNasNmk/zaE6boGrbx1PqkuEi6mq3j6Mt8dGLE6Ps=;
        b=BEAADbagt0UIZkQo+UQz3XdZgKgKbeLoDj46YkUbX2LXuwK6QqNM6gKwLTgH9QqEKh
         3SqDhg8uYDJrNb1yUC5PIGoSB0M87BfHMYx+o76ZnyeN3m4b3i0JSMsXrDPxTYZK9pdk
         8ngzs930DEt63lajS3arp1FgmTzYrm31+3q148xLZwMbGi6lAL0+ei8Yh+Z0uQimdtL4
         HQGum5aJui4GefdNYZhqUCiBgLk/Yb1yW1ir2yHgRndKv0Yq636/sy51Y4ym0lXSJn0P
         sqm3bqf6LJ/LVnvGHSh5Ee1z3lyZ3bE7w3azDIhBHKdbYe0zmFCO5J5f0sYFWPkEP2kV
         qMcA==
X-Gm-Message-State: APjAAAU+P9pNTrBT1CN7hwXjYCn8wa0RGFIqq9cWTXetfcHFAKD55dKY
        6OsaJzx35qPAdfwpmd9o6Nob3A==
X-Google-Smtp-Source: APXvYqySSoNenfb7Gm7zScZPIqQugNGFW6uy/GggRVKYyC4nFsrgeNA8bJ/glcvhuN4MFJwUGGOp1w==
X-Received: by 2002:a17:90a:3ac8:: with SMTP id b66mr19246861pjc.9.1572653796381;
        Fri, 01 Nov 2019 17:16:36 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j11sm7876250pgk.3.2019.11.01.17.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:16:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] phy: qcom: qmp: Use power_on/off ops for PCIe
Date:   Fri,  1 Nov 2019 17:16:26 -0700
Message-Id: <20191102001628.4090861-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
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

Changes since v1:
- New patch

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

