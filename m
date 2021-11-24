Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE07645CB8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350020AbhKXSAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbhKXSAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:36 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAC5C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:26 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso6209824wml.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6xr95bY7KJM6r6ZUUp3Xp8tqiGSbIaSx1KljDmxxqw=;
        b=hXPxrz+x7pN2chHf8IN6CAe04A2DzEovptdKPqrKS2UAA0rNgKv2Ax24+DqmL3Oy+f
         E1MK1lFoc618A53v1LrjaSulTA5VjVOSgSbLOzlMqWP8d7xsmpEBWIRe4vWWBroUmVzj
         mYt+YUoIM7bjI7gpEuAf/JGzY5hyNlihY7USGexTclMcXF4SJ80mKRHyqlG82+hvBrr4
         AZAquk3qtaZjYuBougUD0fpAHhY/u4aTbU/GWUtpXTh6Uev7DAfNCvCZOqRYSorTb0CU
         yaxAZjj3TGg7fZhs+z8ex7nHb6t6yvw2YG2XJkjOs3T+F5+oU5NNgr9YdRTGYGSaSADs
         mXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6xr95bY7KJM6r6ZUUp3Xp8tqiGSbIaSx1KljDmxxqw=;
        b=a4lDZeoIh4YgzcWhlIrBcXXNqs+wnCWRCpCw0SLMc/Mnam8ZslWioVJ6oNb86UPHrl
         JQQIDnHs+YbYArRfm3fMS8EepwCaT8b0y7GFiu3Fn0yq6UQdqaj6X8iMs886CQkQoShb
         v4XVC7qTqfvm+wuZInwXfbUCSwhZ0xk/FeODLMAikwL5xUDg3n1mCx+6BbutavSh31U9
         uOlqGEuQ0qGFf36kc+EFwdpfh+68ma42e8PbIIiRBV5UWs3KDEVkx5ardDrnE+5O++9k
         IN6gt7jl8aNJdET798o9AL26Sj2fXYdL56lHSOPdUr2+skE5h93qK+JfRMI6rrJXVd7P
         i1SA==
X-Gm-Message-State: AOAM531qtQTGpXmzwHTUpOTOq7kI7QdpqaePr3YgIhGSWIxa5OpJ+dQV
        bQEG7AtmJqkspAy9QgLquUwpkFb+K4gEN0t6
X-Google-Smtp-Source: ABdhPJzMx8+Sst1WHNQvN+6h8ogrEMPXbFgJaYn3Yfch2S7mzbyASLIAYm543SwVvyaYW6HCU77whw==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr18034163wmc.187.1637776645080;
        Wed, 24 Nov 2021 09:57:25 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:24 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 06/19] media: camss: csid-170: don't enable unused irqs
Date:   Wed, 24 Nov 2021 17:59:08 +0000
Message-Id: <20211124175921.1048375-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index aa65043c3303..a006c8dbceb1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -444,12 +444,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.33.0

