Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B276421A16F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgGINzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgGINyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:43 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9428C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:42 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id a32so1693211qtb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEAgnaM7D2mpY2dMCdUXKcsS9ZNQb7s4gUJ6O4bO1VY=;
        b=z6f4SsWOjcx7fgcSnDleEbKbZzlVgwdUSJ8c7wxYGJo3CUprw+OKSdrh2xOk0cXepb
         WwOlbcjamAI272MkcOSjkw1OjQqGXXfuST4mMYoQFOqvWm45FdJAPkpMQszo2ve/Br2D
         qE2fE+ucDia3rP7cf7m+1nUJbWOXLW7xsvrIzxYv6txHuuPLihDidgdFrntpefncGQQe
         +e8lhAhpAh9nk+AwwsY1dlzWC6f2eHsN5D93skl5RAAP51VMKVvWAdqO8Fnx8nS83z6L
         5z8xFEaP+5dpH3uwh9SZn10oYdShC9aIC9g8GZoGRSCZyF41QfHSms2jtZVfeel94u/m
         0HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEAgnaM7D2mpY2dMCdUXKcsS9ZNQb7s4gUJ6O4bO1VY=;
        b=AuwcoABSGErmxRv4V4nH5gdIoTdUNJo6cG0B65n3/AGDSr27NTl1umnANegd2Z/ESb
         EgwVTx2AgyVfesYkyOGvq7xuJej66OkZpd8fRqwwR3LX34hRJJCX3Jzz4TXKrjmdcJ9t
         oQoDaCYu0yiYGHLYOyLj/4mPlMtrDh5oFmShsVkbeiqkzmJk7FXbUA0fxtBlcOxiceWH
         8kbu//U1sXbi9/CSbnBpd/19n5BDYeVjhqkBYvkdV9J41DaWO7eGSHnbBg7UTlSRPhtv
         tuFiVN+CA8knLUwMUWFkSm70sq7aYE8irF05SCnQcDHb4gyZBapv4N+Xg+MUfDQYsjmS
         R9cw==
X-Gm-Message-State: AOAM5315n7f06s6aO0UETB7rCbHRBIlNzAcmL2X24MXh/chpNEz8n+uq
        WSM3QfX2vcxxFvO03XFFkzJUpadoAso=
X-Google-Smtp-Source: ABdhPJw5JYt3l6ePcLGaU033IML7gCfjuzLcRFrqrxO0z4Hdolxn0jO8dPiiMP63OJ6y9yJfPxC/Rw==
X-Received: by 2002:ac8:17d6:: with SMTP id r22mr67579365qtk.15.1594302881722;
        Thu, 09 Jul 2020 06:54:41 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:41 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/14] clk: qcom: add common gdsc_gx_do_nothing_enable for gpucc drivers
Date:   Thu,  9 Jul 2020 09:52:40 -0400
Message-Id: <20200709135251.643-10-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All gpucc drivers need this, so move it to common code instead of
duplicating it in every gpucc driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gdsc.c         | 25 +++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/gpucc-sc7180.c | 27 +--------------------------
 drivers/clk/qcom/gpucc-sdm845.c | 27 +--------------------------
 4 files changed, 28 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 04944f11659b..628397703717 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -433,3 +433,28 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	}
 	of_genpd_del_provider(dev->of_node);
 }
+
+/*
+ * On SDM845+ the GPU GX domain is *almost* entirely controlled by the GMU
+ * running in the CX domain so the CPU doesn't need to know anything about the
+ * GX domain EXCEPT....
+ *
+ * Hardware constraints dictate that the GX be powered down before the CX. If
+ * the GMU crashes it could leave the GX on. In order to successfully bring back
+ * the device the CPU needs to disable the GX headswitch. There being no sane
+ * way to reach in and touch that register from deep inside the GPU driver we
+ * need to set up the infrastructure to be able to ensure that the GPU can
+ * ensure that the GX is off during this super special case. We do this by
+ * defining a GX gdsc with a dummy enable function and a "default" disable
+ * function.
+ *
+ * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
+ * driver. During power up, nothing will happen from the CPU (and the GMU will
+ * power up normally but during power down this will ensure that the GX domain
+ * is *really* off - this gives us a semi standard way of doing what we need.
+ */
+int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
+{
+	/* Do nothing but give genpd the impression that we were successful */
+	return 0;
+}
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index c36fc26dcdff..1896bfb2bbd1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -68,6 +68,7 @@ struct gdsc_desc {
 int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
+int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 7b656b6aeced..88a739b6fec3 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -170,37 +170,12 @@ static struct gdsc cx_gdsc = {
 	.flags = VOTABLE,
 };
 
-/*
- * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
- * running in the CX domain so the CPU doesn't need to know anything about the
- * GX domain EXCEPT....
- *
- * Hardware constraints dictate that the GX be powered down before the CX. If
- * the GMU crashes it could leave the GX on. In order to successfully bring back
- * the device the CPU needs to disable the GX headswitch. There being no sane
- * way to reach in and touch that register from deep inside the GPU driver we
- * need to set up the infrastructure to be able to ensure that the GPU can
- * ensure that the GX is off during this super special case. We do this by
- * defining a GX gdsc with a dummy enable function and a "default" disable
- * function.
- *
- * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
- * driver. During power up, nothing will happen from the CPU (and the GMU will
- * power up normally but during power down this will ensure that the GX domain
- * is *really* off - this gives us a semi standard way of doing what we need.
- */
-static int gx_gdsc_enable(struct generic_pm_domain *domain)
-{
-	/* Do nothing but give genpd the impression that we were successful */
-	return 0;
-}
-
 static struct gdsc gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gx_gdsc",
-		.power_on = gx_gdsc_enable,
+		.power_on = gdsc_gx_do_nothing_enable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO,
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index e40efba1bf7d..5663698b306b 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -131,37 +131,12 @@ static struct gdsc gpu_cx_gdsc = {
 	.flags = VOTABLE,
 };
 
-/*
- * On SDM845 the GPU GX domain is *almost* entirely controlled by the GMU
- * running in the CX domain so the CPU doesn't need to know anything about the
- * GX domain EXCEPT....
- *
- * Hardware constraints dictate that the GX be powered down before the CX. If
- * the GMU crashes it could leave the GX on. In order to successfully bring back
- * the device the CPU needs to disable the GX headswitch. There being no sane
- * way to reach in and touch that register from deep inside the GPU driver we
- * need to set up the infrastructure to be able to ensure that the GPU can
- * ensure that the GX is off during this super special case. We do this by
- * defining a GX gdsc with a dummy enable function and a "default" disable
- * function.
- *
- * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
- * driver. During power up, nothing will happen from the CPU (and the GMU will
- * power up normally but during power down this will ensure that the GX domain
- * is *really* off - this gives us a semi standard way of doing what we need.
- */
-static int gx_gdsc_enable(struct generic_pm_domain *domain)
-{
-	/* Do nothing but give genpd the impression that we were successful */
-	return 0;
-}
-
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gpu_gx_gdsc",
-		.power_on = gx_gdsc_enable,
+		.power_on = gdsc_gx_do_nothing_enable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
-- 
2.26.1

