Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E082C81AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 11:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgK3KFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 05:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgK3KFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 05:05:36 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F2EC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 02:04:56 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id 38so7921527edr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2KorrjkWpWhpPEyV8UtE3mX2C8VcPs9mGkAT1KAXZsY=;
        b=YPCdVIZ4Yy/Rd08Qthx7KKMs9WSu82cJ7OEgbuAYxsvIXUVBO0yy1ceI5p2Bc30zib
         ONAtl2Wezjc9rL88UMUWvifswVTyFA0dj+TqgUlVCd+yR5pUXBkjyJZDS8w6Va1koW+Y
         FXk3X8804n0FOq46PT9TFlodigENJOWH54F2ijzDyC2dboWUJVTsEe6zTOpctCJCcoWA
         X+AsyXjMVMo73b3RGr5C1CWLwweLjHvjIXUMhq4MwqPop89Ugg8XofuQ2OUpDq/8nvwf
         Hg61k4nYR9mvMmpfHvKbb7M3OXs3/IQYyD/A6L1uxDP/9kUB7mtGVytmcRiVqpp95VMT
         Nr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2KorrjkWpWhpPEyV8UtE3mX2C8VcPs9mGkAT1KAXZsY=;
        b=MTDqE+Z0OemtPhUVf7k5QvjO6mRqxBdEW9/wMJEcm7BU5IhTCooM4I+J8rr2lfUzVp
         OQihnRS1Ix2BHfBJ7IboTjz2GMEtDdYwrjxB1bQPSkn2c79pKKTVOs1qI5d2NxeRw50Z
         1QBOfdvREQIOrKF7wIdhMGMmQzmD2jbP8svzpwB6bNcvbDyAlTqrQRHavwUqq3hAhcw+
         JxIsJCy8RuYoa1oAaVHWPv3Ad5rZj+41oOCCtqZ0YA7JoRPRg76fXd5GcMKLKG/2vLc/
         RwX04uAorKhLNX2mCY/hmqGTo17FOun8uBhu+BYLt8FUOC35XZrQSYMcWa9h1nTyUpk+
         Y6gw==
X-Gm-Message-State: AOAM532DXrzWxsjadzIvTNSWfPUSHrhQadNn2bPq+ZFiWfCwwdhDnTn3
        r2q5WRbHlqqPt+jMVvz1BzvKlA==
X-Google-Smtp-Source: ABdhPJzHUtKFbFKczdlmvtuRuWH1BE2O5OVdn8Ea1tIw8HuAN9cB0giOO8M/jlDUzAZ/C9APOv+ZRQ==
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr9742899edy.20.1606730694832;
        Mon, 30 Nov 2020 02:04:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4045:6525:ec27:9b77])
        by smtp.gmail.com with ESMTPSA id i9sm8267378ejf.41.2020.11.30.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 02:04:54 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     loic.poulain@linaro.org, robert.foss@linaro.org, wsa@kernel.org,
        vkoul@kernel.org, todor.too@gmail.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3] i2c: qcom: Fix IRQ error misassignement
Date:   Mon, 30 Nov 2020 11:04:45 +0100
Message-Id: <20201130100445.66930-1-robert.foss@linaro.org>
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

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Reported-by: Loic Poulain <loic.poulain@linaro.org>
Suggested-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

