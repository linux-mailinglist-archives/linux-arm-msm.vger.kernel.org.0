Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5E244DA14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhKKQQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbhKKQQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:46 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A60C06127A
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:13:57 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u18so10674194wrg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FPmsbooZ69p+mFnHgRZEE//JmnzCll9kSWteXKrkLY=;
        b=FJvu2bl6ENwFN+jQ84lYkQz933ta2nAnNLP+DSUFwl/JZaHIgb56hsMWlzQxZnwA+K
         +sGEMSt6hDZnSRD6Wsk1p5fWqonnzaEi7y+81SsL1Dixn4oP1swlmlaCT52uCgPzYmRw
         bhwo5lxnW7HAy/SVNPZ2Hy3MSlntoq1E9vWaIk3Tko0ZXD+pqMTXq+O2KrfxVAfVfo+f
         h5BCLApY/eE/RsiyIl+TwX+YVmrUTvKB56l95ZWNSDO4f17gsex1PiVBJ6E5qlJJ9PyF
         vb9sjtNZlG5IzOQAw8kVEtQHK5nZfcxJefZ4aihX0hjDK2xLS5sZIZ1mT2v2Nzt8ar4U
         h9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FPmsbooZ69p+mFnHgRZEE//JmnzCll9kSWteXKrkLY=;
        b=XPXm+40XYwEoHEABrAl3HhdE20kjMYeZoHbYdoVdJ/sj9YAImQJw8L6csyovjsC2WJ
         HnatKRLsH4zKM5azkv8p7tDFMmKZ+LZ1F+SD7B9avbp4C2In6uumuxnZEPwrVYsQh8AH
         GcKNr54NXcTqdWCrFCqMjfIhWLD+85w0w7xD/kEaguCUElLmcedeG/XVnmQnaq179fYR
         Zvj2ETZCjtW2qALF41jBHd8eYbzlmhVpdN7G3lqgBqjjNhN94OXe+nMGmb/GdIH4Zdzd
         W/ydeoPuo8vAbBo7kE8A3EH9A4FnJYR9yUXzesQCRixm0EXaYx83oAXp1QB7qE+o+FwL
         lH9w==
X-Gm-Message-State: AOAM532p9348EZ72x53YDKDJ75wN5LQcFSMF5JwrFeZFyQOZF76nGtx7
        WF6hpv3KV7CX1wl+yJ/XyJ7oQ/HYI0VLsg==
X-Google-Smtp-Source: ABdhPJwzFQ/g/IdInI/7lLjvbw1QYMozKYe4qzd9eC3pWthkhzWj8DZ10sw2SBULVr00xLVGQFxJ1g==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr9998981wrr.210.1636647235743;
        Thu, 11 Nov 2021 08:13:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 10/18] media: camss: csid: allow csid to work without a regulator
Date:   Thu, 11 Nov 2021 16:15:34 +0000
Message-Id: <20211111161542.3936425-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

At least for titan HW, CSID don't have an associated regulator. This change
is necessary to be able to model this in the CSID resources.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a1637b78568b..1226913c623b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -160,7 +160,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
-		ret = regulator_enable(csid->vdda);
+		ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			return ret;
@@ -168,14 +168,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -186,7 +188,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -195,7 +198,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
-		ret = regulator_disable(csid->vdda);
+		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
 	}
 
@@ -631,7 +634,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Regulator */
 
-	csid->vdda = devm_regulator_get(dev, res->regulator[0]);
+	csid->vdda = NULL;
+	if (res->regulator[0])
+		csid->vdda = devm_regulator_get(dev, res->regulator[0]);
 	if (IS_ERR(csid->vdda)) {
 		dev_err(dev, "could not get regulator\n");
 		return PTR_ERR(csid->vdda);
-- 
2.33.0

