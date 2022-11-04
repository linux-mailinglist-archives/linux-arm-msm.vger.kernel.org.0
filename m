Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEF3619BA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 16:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbiKDPbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 11:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbiKDPa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 11:30:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651842D771
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 08:30:57 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y14so14173328ejd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0/8QLq6i9UBaQrWixxpT1QN5F499hppxzKmDfSPo+o=;
        b=QEPWfvV5o0/xQrLseMnsrB2cPgofxv3zH/nstHYd2ezRCYfPwC8IKVAHC/RDJpIAOm
         QNi1POh6NYqgDxggTNQt77PFFTL3YbTyP6Q1+uTZQYDDSHa7wuWbJbqtJf/cX2bUUohM
         245D5iJmIRgkb5mgPEhTPsiM1JBVQ4XU6qH/1Hu8qDhG392OsVwob5TS5yGG2C2MQD3i
         QjZ/J4LHUFzaPDjoH3ujwaWhvYPpkcrmc4C5xpcZNXUu9CGVpCKgs4ttn7nYfhO4yLjh
         vVPHK2vAULnKhoCyKzvVXLgTw3eZmKoyclloKeHJOs+yGWqXDJ5hbgPdr5bQNNMFe+m1
         J89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0/8QLq6i9UBaQrWixxpT1QN5F499hppxzKmDfSPo+o=;
        b=LIglvzzcSghy4OKObty/of6uFxTdwJk990UXsjUPuR5M4O2/KmlaAkyefAlSQtfDjE
         fgdsamJu+FoMs9MdPcNqi1bQDBjz4PZguw/qnwSUlMIcowCB+RmsK3ZXf7Rzjpp20IO4
         +bFRbxmlUxIqHOhs1jpF0GpGFZ+Mzl7TdOlSWlvJm61ti7hTAksaRtrzDjZRoYug1PQF
         DQUvx/sDe83eSkAsZ2QQuG5Cp/wBCnFMNfvvNosRigQJOU2A8Y8gie+syYWrt5KqwNzY
         bsTRj9iAq/MsqoGfno+axTIhIdNstrRN96ZRBdVgnuujXmO8HKib6mlf4icvv1p8nnaq
         U3Tw==
X-Gm-Message-State: ACrzQf0mOQWJPZKN1tas+EYg6Ii+9RNT3mGv6v2x3xfEy1spoeXERMh0
        xL6+jA7fM8yT5qZxx2++zWIvOXNMio+s9Q==
X-Google-Smtp-Source: AMsMyM6Qm9G+ineNjR0kpLmP9LlNavjWQ8XENp+/k3yVxBWw3w6JPL3+riB7tItz0v4wzrMvO80ICA==
X-Received: by 2002:a17:906:3852:b0:78d:b3d2:97a9 with SMTP id w18-20020a170906385200b0078db3d297a9mr34237279ejc.565.1667575855783;
        Fri, 04 Nov 2022 08:30:55 -0700 (PDT)
Received: from otso.arnhem.chello.nl (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id es11-20020a056402380b00b00458898fe90asm2059971edb.5.2022.11.04.08.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:30:55 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Evan Green <evgreen@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: llcc: make irq truly optional
Date:   Fri,  4 Nov 2022 16:30:41 +0100
Message-Id: <20221104153041.412020-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
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

The function platform_get_irq prints an error message into the kernel
log when the irq isn't found.

Since the interrupt is actually optional and not provided by some SoCs,
use platform_get_irq_optional which does not print an error message.

Fixes: c081f3060fab ("soc: qcom: Add support to register LLCC EDAC driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/llcc-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8b7e8118f3ce..82c3cfdcc560 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -849,7 +849,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	drv_data->ecc_irq = platform_get_irq(pdev, 0);
+	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
 	if (drv_data->ecc_irq >= 0) {
 		llcc_edac = platform_device_register_data(&pdev->dev,
 						"qcom_llcc_edac", -1, drv_data,
-- 
2.38.1

