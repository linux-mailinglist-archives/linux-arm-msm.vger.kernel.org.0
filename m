Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697961F20EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgFHUow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgFHUoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:44:17 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B47CC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:44:14 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id y1so15856836qtv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONkKk00wU6bNoQuWZM5ia2OqgRGBJA5uMULpx0HvSVs=;
        b=wRgDcxO8BCqt6sdiblcfLzl4rgLVW/62I97WXOlaKayAc75G8dB2ExJqPheT4ByLEt
         6cxtXG71WJOpGNCGV31RXojBl3HEazQ29hOJXTVdPdB13J3HwUTQfXi29Zq/YWVPLmCI
         Wjc0KEVayWJwjxHtT7veElQlljIyAMaJKwQHnTip2cpx71fX7nyG72RpYkLJoK6qlOCL
         tN+1/Olm0Xt53eSz3slJZ47LEfZL6KEVA12NLG5qdwzbLQGhNc11JI48dxrVF1XeoMX9
         b+XX4TW7K0e/R2gSg9vVBsveDp9Zpv8P94+TU6lp3CGs89n0l0Li3vwl9bWg13u6kr9L
         pd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONkKk00wU6bNoQuWZM5ia2OqgRGBJA5uMULpx0HvSVs=;
        b=d9FBubmBSksfFa1OiaK/nfJApqPocG1LIoyJxKTWTemqODiKnkGI1UKupM23gDffkp
         psP3/HieMY0l6+TOCFMXCcWZ9YQi3/TzwVG/5wByuTJTuKehZIsn/rSjLSEYuZaNrHfw
         uu7qtWvKU9lSRG0WqLg2pxEW56mkPvtEOa2/8gmurp2ig8AAKDGB+3fZw5UU3XHtKE3i
         qhFEOn9LnW+zswMp6NJX3vlEHEa4N1LzRCF6KztRv2jihlTta4l0V2CXLjSYqkrbbmbI
         zx2a0NRrNuTqTft4oK97VHnEa1OHSMu4fN/iF+24+ZXT2WaYg4WrqEZcGEuMIM1kCFxZ
         IGWA==
X-Gm-Message-State: AOAM530zTa7kA6ZFuVZiGP6I1T57Hf/uai2PMSzu2mK4cbf8veYZivJT
        K6fG6KcFXvp5Mo7PA7lHvARBeg==
X-Google-Smtp-Source: ABdhPJxFZ1JGmX+g9epu/PQEnKM/WSRYvOq/NrosWYsQIOnyJyLKXgl4JFeGXodB4BO3846UKpvcBg==
X-Received: by 2002:ac8:176f:: with SMTP id u44mr26539726qtk.0.1591649053340;
        Mon, 08 Jun 2020 13:44:13 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y16sm8895565qty.1.2020.06.08.13.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:44:12 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire devices
Date:   Mon,  8 Jun 2020 16:43:43 -0400
Message-Id: <20200608204347.19685-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200608204347.19685-1-jonathan@marek.ca>
References: <20200608204347.19685-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds support for qcom soundwire devices with memory mapped IO registers.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f38d1fd3679f..628747df1c75 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
 	struct regmap *regmap;
+	void __iomem *mmio;
 	struct completion *comp;
 	struct work_struct slave_work;
 	/* read/write lock */
@@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
 	return SDW_CMD_OK;
 }
 
+static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+				  u32 *val)
+{
+	*val = readl(ctrl->mmio + reg);
+	return SDW_CMD_OK;
+}
+
+static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
+				   int val)
+{
+	writel(val, ctrl->mmio + reg);
+	return SDW_CMD_OK;
+}
+
 static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 				     u8 dev_addr, u16 reg_addr)
 {
@@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	struct sdw_master_prop *prop;
 	struct sdw_bus_params *params;
 	struct qcom_swrm_ctrl *ctrl;
+	struct resource *res;
 	int ret;
 	u32 val;
 
@@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		if (!ctrl->regmap)
 			return -EINVAL;
 	} else {
-		/* Only WCD based SoundWire controller is supported */
-		return -ENOTSUPP;
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+		ctrl->reg_read = qcom_swrm_cpu_reg_read;
+		ctrl->reg_write = qcom_swrm_cpu_reg_write;
+		ctrl->mmio = devm_ioremap_resource(dev, res);
+		if (IS_ERR(ctrl->mmio))
+			return PTR_ERR(ctrl->mmio);
 	}
 
 	ctrl->irq = of_irq_get(dev->of_node, 0);
-- 
2.26.1

