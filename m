Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE583B67A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 19:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbhF1RaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 13:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbhF1RaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 13:30:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA068C061766
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 10:27:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cs1-20020a17090af501b0290170856e1a8aso2876183pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oi7s7ZAKggIYA9cELE+fXzXNfj41gs2Dc3uXc+ZK0C4=;
        b=weXUs0nQHbJ7vo/3GvHUg0lzriDlghVSwf1RvxO+T7KI9n2a7VK/o0100WD1xlgdl0
         +IfM5NkwkTUD2waBN/S1YVr4hAmBf00eWnMk/pyKcZZFi7HdbnssetKkcimwCXp9rWWF
         pli+y/mXUY+L6OxnuzvZXNk3Z8oMOIBed7TI5RidC8fdOf/FgFl+QjKCbP7Cx/kZKFfu
         sGoxaMbdCw8dqlbb7gEJOoaCvFl4dzXlK6XU9Yr+YOSxMTuZuWtfLej71QQJ/2JoLi9e
         eg8gSYnqzWywTq+hdbiw3UQBMyNroMQckc3ffjW2w3lAdWmiqDeF6eBVJiB8+EZT3wLA
         usHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oi7s7ZAKggIYA9cELE+fXzXNfj41gs2Dc3uXc+ZK0C4=;
        b=F2qw0EwaOh+IFsRcJIIoBds8t8QH09ez3LH5jyJI2BSs85c6w1f6eCsj3qDFP324Dz
         GjVU9qxxtdpbkV7WNW+/49SGwqfU0FbTEAe8MTB0tXisJtruNf+rsdqLjXG8IAcoZkG7
         caZbEuyh6uizYy/SiZUW5QFdjXZqusOKFMIasmIZWomUIxNw3wsPqyK8yJMM5K1xpr++
         HBg/O6nHBCOwq47EEX9pYOm7qrZUlMre1ETfumt6YCe2fEMDSAR/R8vVziFjfQChQFWp
         ctKCcB9wVtDk70OHMORskDMv74SGk52gT6/JcMvoOtLFzDb4+ORPaKD4LreBXXp0ux79
         T0Kw==
X-Gm-Message-State: AOAM5339z3d0RG6qG5/wcgwxP3sP3KwGTm6MVq1xakcjaO2p0FEWmEtW
        dW1q5EdFZlNPf/tdwcitMfhb
X-Google-Smtp-Source: ABdhPJz1xWVXhT9rHorz+wFawEPTBVOtlpDLPfQO8Sao7/36rP6iGgvQptiV3WOWqTeLGgjW8QCchw==
X-Received: by 2002:a17:902:6b42:b029:11d:a147:bb7b with SMTP id g2-20020a1709026b42b029011da147bb7bmr24030953plt.9.1624901271951;
        Mon, 28 Jun 2021 10:27:51 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.225])
        by smtp.gmail.com with ESMTPSA id c24sm16482054pgj.11.2021.06.28.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 10:27:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        thara.gopinath@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] soc: qcom: aoss: Fix the out of bound usage of cooling_devs
Date:   Mon, 28 Jun 2021 22:57:41 +0530
Message-Id: <20210628172741.16894-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In "qmp_cooling_devices_register", the count value is initially
QMP_NUM_COOLING_RESOURCES, which is 2. Based on the initial count value,
the memory for cooling_devs is allocated. Then while calling the
"qmp_cooling_device_add" function, count value is post-incremented for
each child node.

This makes the out of bound access to the cooling_dev array. Fix it by
resetting the count value to zero before adding cooling devices.

While at it, let's also free the memory allocated to cooling_dev if no
cooling device is found in DT and during unroll phase.

Cc: stable@vger.kernel.org # 5.4
Fixes: 05589b30b21a ("soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Bjorn: I've just compile tested this patch.

 drivers/soc/qcom/qcom_aoss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 934fcc4d2b05..98c665411768 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -488,6 +488,7 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 	if (!qmp->cooling_devs)
 		return -ENOMEM;
 
+	count = 0;
 	for_each_available_child_of_node(np, child) {
 		if (!of_find_property(child, "#cooling-cells", NULL))
 			continue;
@@ -497,12 +498,16 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 			goto unroll;
 	}
 
+	if (!count)
+		devm_kfree(qmp->dev, qmp->cooling_devs);
+
 	return 0;
 
 unroll:
 	while (--count >= 0)
 		thermal_cooling_device_unregister
 			(qmp->cooling_devs[count].cdev);
+	devm_kfree(qmp->dev, qmp->cooling_devs);
 
 	return ret;
 }
-- 
2.25.1

