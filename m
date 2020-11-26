Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EB82C57AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 15:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391143AbgKZOyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 09:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391130AbgKZOyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 09:54:23 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9308C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 06:54:21 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id mc24so3318999ejb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoEwWU3FcyAaL+Tym7arwyArkXDvjphvUtIZys9Wej0=;
        b=kD3eRsvVQnTG7OCxCilmXrra/m4FPpCrW4jVWjS7Q4OZC94Ih7CdmxWJOzOChiw8jD
         SPIG0zYtbau4klIa1W9gBe3c7cb1hpIhWdNeRoYPIMHJobnPAkC0WPkeltRX8BGRTEOa
         6h5LsfpY4GbzmWlDMRM5kJgfy2+2mLQBDxx77R3aSMzdH8N/qDRnUzVIkVwa4X+DR8/G
         4qNtyFPGbtTIexPxHwWKdPc3zUK8DZ+HkL2DyCrQXHosnAk7iecyxj9GEVUKZgbIpBmx
         qMN8hpHcrQfC4dfSujbPtnpzrKOEZ0qGzYDRqZ7377sovm15KETBYofWffrCZvAGgodk
         2w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoEwWU3FcyAaL+Tym7arwyArkXDvjphvUtIZys9Wej0=;
        b=mzyRJAzbpsBkbh3Zgfukfb3egL8aGSTOHYwsotbeKdeAX923d+6Ci7NMe1Fh2GxVgC
         aWgmMc7Ev9L1SCG5FpzghswJNUSaaHRthfo+2vhqzkgVmCPq9DpMsBIOTGWOWIQ5A8jN
         KwdHXINGZwt0vU8tdr2d0YqTcTX2d35ghYETdf799GeqEiO5pBbqB5LqAIzXN1UHq+Jn
         GVGI4WH7zV3BEZgEBH1ujNi03g1bAol/qmjO+vJoSb55SRlxJ0hdwltHmq0MaC1W+2jA
         B8VBPrSRQW8kLl9ybA6XxQLNcfSlhB4Hokf6dH01GJptnbVtG+2Dlma635X2OGi2mNLY
         f3gw==
X-Gm-Message-State: AOAM532GPoVcLi8MZkb76ORMEQ3xfNB1szh/KNuVvT+VVYP0lj8D2me5
        dg4EbfraCO8dRHNchG0YnPOkEw==
X-Google-Smtp-Source: ABdhPJzog4qZU/S6/hnX7cYmTgX6VNNApdMKMCARfCVGNQKu+9T0JCWv2ErFeGRZ5bnKWdlwvtY3FA==
X-Received: by 2002:a17:906:d0cd:: with SMTP id bq13mr2937055ejb.372.1606402460536;
        Thu, 26 Nov 2020 06:54:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:a9ae:e75d:ff39:a0bb])
        by smtp.gmail.com with ESMTPSA id t10sm3215105eji.61.2020.11.26.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:54:19 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     loic.poulain@linaro.org, robert.foss@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: qcom: Fix IRQ error misassignement
Date:   Thu, 26 Nov 2020 15:53:21 +0100
Message-Id: <20201126145321.18269-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During cci_isr() errors read from register fields belonging to
i2c master1 are currently assigned to the status field belonging to
i2c master0. This patch corrects this error, and always assigns
master1 errors to the status field of master1.

Suggested-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index f13735beca58..1c259b5188de 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -194,9 +194,9 @@ static irqreturn_t cci_isr(int irq, void *dev)
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
-			cci->master[0].status = -ENXIO;
+			cci->master[1].status = -ENXIO;
 		else
-			cci->master[0].status = -EIO;
+			cci->master[1].status = -EIO;
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
-- 
2.27.0

