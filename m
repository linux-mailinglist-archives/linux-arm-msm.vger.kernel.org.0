Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5237ADC35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 17:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbjIYPrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 11:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbjIYPrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 11:47:37 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8FE120
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 08:47:28 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4050bd2e33aso70704445e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656846; x=1696261646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=S4hVx2sg6CupCNOx2qU7m93mxgYGuycrwGF4RdfeS3PfCKN3/fYUZTRLd3O8ISaoir
         6Mzo7pnZj/VHQH0SYSvsp3ePdn+aJ/DthJ0aK6gSyB622+ezndn5WnRqn0/nVl3zn8kh
         kL1D123DlCtzdZJ3dwQ760VMASOhkWvX8wJZWOoVx5CT+bk6c3Pkcfh83shyjYh7rEeO
         zLb0SR1WmW9w6b2IYqNPLijne8nUu8HaayGkIUr8j3JKwjjxAlvcFFEdP5YDjZjNTIGt
         nIonMwDMNyZD7FJyyK6TYGRZkTeOh8R9Orb8cCTDOXEOpG/134JbYyJi1LJHr/MaVRD5
         0Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656846; x=1696261646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XAtVUAyBOvnRtU7QZlyMg2OvJJmAGTuY+WdBD311GM=;
        b=ONoKSFehd3TCUapcC5RJHEsHpDpwidFGCL28Zca8xOB35wA03UFSPB6kThbSLCTDG/
         4aiMOyGAfy3Cdnt9FZGlxGSrjbg8eT76rLJXMbe7Aovp4WTeiZR8BNub4dydkBWJ5+of
         NAW4HeLV9F9y1wBcejrqr4R2NyiTtcm7cv1U4DfLGL0APMkdNGFBpmE/cEAbkT6I9tHt
         LSdgG2KvWtBlLHcuIg5ZLWRUquxZZIoVolxlr/chmA5csQuY6onU3DF+aCvNCQg9pjKi
         xfm7T9ltnOVlchM4Xk4DRHNRdEt5CHLNfTF5sXAwcXuAVcC1uP3wBmU2cbzTKsvDDNHh
         eUYQ==
X-Gm-Message-State: AOJu0YzuG5CTDOv+A16E/KrTof8kQ5oO62sa0sqBKjZOxVxNuKpQbHSu
        LsTBTgVsjG0e2qu+nGPJZSV/iQxgu1Rea0/wqtA=
X-Google-Smtp-Source: AGHT+IGIsB4mLYETZvmkEyZcLWQPGapkBfLeHfY3+rXnsGeMiVp+S19QaagA0CKyurcmaGBgvdGfAQ==
X-Received: by 2002:adf:e4c9:0:b0:322:db93:41ab with SMTP id v9-20020adfe4c9000000b00322db9341abmr6252935wrm.0.1695656846518;
        Mon, 25 Sep 2023 08:47:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b0031f34a395e7sm12077536wrr.45.2023.09.25.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:47:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH v6 14/17] media: qcom: camss: Support RDI3 for VFE 17x
Date:   Mon, 25 Sep 2023 16:47:04 +0100
Message-ID: <20230925154707.837542-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
References: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

