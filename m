Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D9A130E74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 09:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgAFIMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 03:12:25 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33591 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFIMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 03:12:25 -0500
Received: by mail-pl1-f195.google.com with SMTP id c13so21579888pls.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58eNx8xjPfMV4eq6vPbdIdo8dcdfbd9IAa9aN+9mrdc=;
        b=MQG5p4dm8iSs9bjqsWL8TyBmSrQW9Hkp8VMQZugaTbXk2MSLt9tDixQkPu7YMcm9aG
         qwhfxUFs3DQqnVBtt/JAVyE+RcVoaKZ7fOwsow1tjSST6RcN3hyW5EuGoj8Lyah7iPqi
         Bh9APtJkRabqTt5AoHJTI8UXsHTBZApxKFrGYlO9whTrqbKdsdSOMNDIzc/UpDxLoDye
         gBSP6SEIMkr1vcuQ548H1pVa9ba6BHEDULqBma3d3GOZ6T1pYpdtUSwbXSpMOJlbPGWj
         PzRD0V23H9CM+656dIv+jv2wMibAssBph4Lz0aV4uNxyIGmNao4OGpTHUH3kHsTN8dws
         AZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58eNx8xjPfMV4eq6vPbdIdo8dcdfbd9IAa9aN+9mrdc=;
        b=YwFi0ruU1O8owTVx4sRhC0sSBdxkyrB8FrW65C0WJba++/4Rw88y6khynyUf+xMCSJ
         m7ZTsEsuQeImekmCDxnLItTNvf4mHZasCDin18irVyOnD2JPV/s0CH+F9X0Bbt8m+hmI
         mOKTXy8jZfMQm0ApJxRqUDOMCQlt95f6cD2MC8vFZnRakPiM00nWF33ys9dUxEkdf4Ot
         ipTGSNsuLeA4+SxMqN2TIc/7nYI7wLSQLEFLlo5alU8s514uksF9CSUCFBw5zPHMca3m
         8yCt/RNNQTcKht1bD0mp7qkXBQhQ4urBdqD+BgdI6KPsfmAt1FUXC+4SDG5q7PYpCr9M
         GjSQ==
X-Gm-Message-State: APjAAAX/0Dy72z8zjCHavTMy0zEEH1QrR5ZWgjJcjL39DXumMrUwJqxz
        zQXdcIpkAjyujCXu1buik0JBG3ZjUDo=
X-Google-Smtp-Source: APXvYqwxlIZexxNFfYuYrgDtyjvoOHjG2sq4TgXR5+3z7XlWffjwrHaQfndEtMXnQfh+jno11givJg==
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr105934875plp.144.1578298344533;
        Mon, 06 Jan 2020 00:12:24 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n4sm18755019pgg.88.2020.01.06.00.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:12:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] phy: qcom: qmp: Use power_on/off ops for PCIe
Date:   Mon,  6 Jan 2020 00:11:42 -0800
Message-Id: <20200106081142.3192204-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
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

Changes since v3:
- Sent separate from SDM845 QMP/QHP series

Changes since v2:
- None

Changes since v1:
- None

 drivers/phy/qualcomm/phy-qcom-qmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 7db2a94f7a99..e107a7eec235 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1967,7 +1967,7 @@ static const struct phy_ops qcom_qmp_phy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_ufs_ops = {
+static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
 	.power_on	= qcom_qmp_phy_enable,
 	.power_off	= qcom_qmp_phy_disable,
 	.set_mode	= qcom_qmp_phy_set_mode,
@@ -2067,8 +2067,8 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 		}
 	}
 
-	if (qmp->cfg->type == PHY_TYPE_UFS)
-		ops = &qcom_qmp_ufs_ops;
+	if (qmp->cfg->type == PHY_TYPE_UFS || qmp->cfg->type == PHY_TYPE_PCIE)
+		ops = &qcom_qmp_pcie_ufs_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
-- 
2.24.0

