Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4012B6C3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbgKQRtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730256AbgKQRtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:49:07 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCA0C0617A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:07 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id h16so12458502pgb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
        b=jfOa4AiS/tPxjopccSsFwVuEPAIEFOQvgNIDZfxXpCqZM2rBRAbMSPUGrRZCUxk9RM
         M1lSMnYTKmkr2XwSjmUTy27z01sP+vWfmEPHgxDNEejk9lIudy+tadMlhWcbHgGXGsAR
         m9Hv77MP41Mel1ZJKkB6HvxyP0sB62RPYQoM944E6Eo6+T24PBAzzub48v8+buJCMMRL
         vwM2SOKLaPLTVb64Py+CQN2TERL4pdJLcKZ9w49oof+AXLuSDSzabeXmjYwy5mLyGPi9
         ZyZVBHp4DECrukNla6p+KiGhOD3Jum1NWBvyRl7F4SiAeuW+7CxLg0w5K2zA2Rn7Xhls
         0ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
        b=HgEFwiQEyyHwVGGXrkEM4wXpK1DfaQb/7PirzzhgoJ4tCfI3K1aYMFR9U/f/ijnUts
         wQy2gbrwY4gZnZahfZTZcmWMro3cpRmBQ9LNnb45pssUtRbmypdbaafSy3rwVAFHg4c+
         KtELFvCaR86NqoNpZ+uNKiNmh6qcz51T5k7tMEXHcws/PP/r7gOWRM+B6YkP1j5n7T3e
         tcZq14QURmMb25BAEktG37t4Neoqj0RQImrbekKeeWTVkBJQK0bqp0+NOBi9LxDAWjxN
         OYt+yS05E/I8gzHHOy3Vhcj19DqkoM5jbKIjPpQr8/TclNrrFzuuquFsj3bFrbEup7sT
         L2Rw==
X-Gm-Message-State: AOAM533hRrbx4GQsQ2SjPBYQNbqmtKDCvQ3Mk8CVKyp/LPxcOFOKhE4F
        0Y/1xF2qr78YpvG7Buv+LFXE
X-Google-Smtp-Source: ABdhPJxY8KGN1ZSec/mXAFeuvkUuavubQH+z6KaVaM8f1siege4JnI9ulfj0qykscLac6PxVdm8hQg==
X-Received: by 2002:a62:e40c:0:b029:18b:ad5:18a8 with SMTP id r12-20020a62e40c0000b029018b0ad518a8mr707392pfh.16.1605635347218;
        Tue, 17 Nov 2020 09:49:07 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 192sm22222810pfz.200.2020.11.17.09.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:49:06 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
Date:   Tue, 17 Nov 2020 23:18:44 +0530
Message-Id: <20201117174845.28684-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for using Qualcomm SMEM based flash partition parser in
Qualcomm NAND controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 777fb0de0680..1b031aeac18b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2797,6 +2797,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static const char * const probes[] = { "qcomsmem", NULL };
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2860,7 +2862,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
-- 
2.17.1

