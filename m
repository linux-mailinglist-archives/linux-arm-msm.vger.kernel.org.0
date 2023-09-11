Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E24D79B867
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344783AbjIKVOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237819AbjIKNOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 09:14:35 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B422FE40
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c1c66876aso564362966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694438069; x=1695042869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=cPtdC0pwWsQvtGhN7POjiqr2i20d7TbLDvCi34jnfBusqydetaRfmwbfnxuM8v+JyQ
         qyAfVtovwUimLSc1S/B8BKD6qjrZbuaI/Hrslf7UWxbY8uf6tKyvgH4YaX+tSzIovII6
         Ry3xukEUeHfoktCl1xEcKFOGdC2vG9OSBQTBelrDNWtW3ObaE1mV6TwwrT7ZgQCMZDqy
         HmnAmMJroFC5G9ACshats8r+cPO+MMvCm6eSLFbnQwgD7Hn4aa2CN1biYO7tFUyPng8+
         wWGSzRNwe+QqCZHPmmNG54hurwYgUGk3EWcrJBIngSXMbH9FKX2mWaT+R5VsXBZ4BWFm
         Oayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438069; x=1695042869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=UeTuwKhWd95rUUNQ6UxrtilDAHwM9YMkSNvS7hYAo6AGjks9fqBJ+LnWA3atDjDf20
         RVGHOALC+YcVaqxm7p60AJQ9/tZ6ZruB66cPHnTPRYi+oxehtyBpH2i3C1n4+Nh13QfG
         aJu1zsfihVSg0+CzLXt2LJ87z+2qQjCo2hwsbnOgsW4svgMgth0/iLhg5Prk5IyF5vev
         SjpR7a5Lt8VWnnS6mbCaJTvq1YT77D8BAs6/8D7K60NgHe5qHv9tjefi5hS/I7Fk8EUw
         Dha/lvByA1fDAhE5DgswBMEjw2omegTT3ZFX3jndriVG08M2pfw/gwzH0K6UfwNKLpRS
         PAww==
X-Gm-Message-State: AOJu0Ywu+cRo9NOhuhDTVOFpAnJ14WR3ZrDSyeg7WlNGUhaC1zK+MbEl
        VDyKHqV9Z6hTHAJC9LSEMn3BZg==
X-Google-Smtp-Source: AGHT+IFUcyRm5SPFoxyVmnZ9MYesGgV7U4jcD+0ykckHs/EKmwcAsWQHdxC1SEXItfkQV7GAHZpBMg==
X-Received: by 2002:a17:907:75fc:b0:9a5:ca42:f3a9 with SMTP id jz28-20020a17090775fc00b009a5ca42f3a9mr8029922ejc.2.1694438069246;
        Mon, 11 Sep 2023 06:14:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b00988e953a586sm5313648ejb.61.2023.09.11.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/17] media: qcom: camss: Support RDI3 for VFE 17x
Date:   Mon, 11 Sep 2023 14:14:08 +0100
Message-ID: <20230911131411.196033-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
References: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some VFEs have four RDIs apiece. Right now the ISR code has a hard-coded
value which tops-out at RDI2 meaning only three RDIs can be utilised in
practice.

Extend out the various routines in camss-vfe-17x.c to support the higher
RDI count.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 2ba7160b3bd1e..a5aa799501861 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -209,7 +209,8 @@ static void vfe_global_reset(struct vfe_device *vfe)
 			 GLOBAL_RESET_CMD_IDLE_CGC	|
 			 GLOBAL_RESET_CMD_RDI0		|
 			 GLOBAL_RESET_CMD_RDI1		|
-			 GLOBAL_RESET_CMD_RDI2;
+			 GLOBAL_RESET_CMD_RDI2		|
+			 GLOBAL_RESET_CMD_RDI3;
 
 	writel_relaxed(BIT(31), vfe->base + VFE_IRQ_MASK_0);
 
@@ -343,7 +344,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 static irqreturn_t vfe_isr(int irq, void *dev)
 {
 	struct vfe_device *vfe = dev;
-	u32 status0, status1, vfe_bus_status[3];
+	u32 status0, status1, vfe_bus_status[VFE_LINE_NUM_MAX];
 	int i, wm;
 
 	status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
@@ -352,7 +353,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	writel_relaxed(status0, vfe->base + VFE_IRQ_CLEAR_0);
 	writel_relaxed(status1, vfe->base + VFE_IRQ_CLEAR_1);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++) {
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++) {
 		vfe_bus_status[i] = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
 		writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
 	}
@@ -366,11 +367,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	if (status0 & STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (status0 & STATUS_0_RDI_REG_UPDATE(i))
 			vfe->isr_ops.reg_update(vfe, i);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (status0 & STATUS_1_RDI_SOF(i))
 			vfe->isr_ops.sof(vfe, i);
 
-- 
2.42.0

