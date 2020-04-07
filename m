Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CF51A18DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDGXvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:51:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45762 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgDGXvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:51:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id r14so1534718pfl.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KvEJzMH6Rxi8JFDstC273KQ0bdGB37YijaATrtjA+Oo=;
        b=OT/L+d2sOkBze7u7kCa/ul9nbt7FBPk4UFbvoXf7evUw860Zm7kdOTvn+/o1kPqp4C
         1Y0MaFQ01GRIGs3AAZfSuNfnwO66ph7dkS6vDmTcUTZl5i6jIw+1+KFcO9KXV1wjqlrZ
         PPO7T+JbzB1wgA8vitRJDvxObqOOuYYVZDiYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvEJzMH6Rxi8JFDstC273KQ0bdGB37YijaATrtjA+Oo=;
        b=ol5mtBnXZOz9LjDnQj2MHSwT2EACBH6kSLAV52G3VXokzSB/K0avTzec/GZTNUKGSA
         4D1v07FYjwUjyRGJGSJW5pfIE+WLkDhsCwuH5hdtNqJDEJWOmqvV6Adobvqw+EsnhoTf
         N1qbYDu5ar7r4RheaVqq5ttzRsRIOLYegT39x0nJX3DFD9Vr87eaoi58TJBoxTZrWDGu
         DiR/EVP8Ee0JHoTCe3LSsNPu9xD9RDH1kypRDIGa3rsxTsna3izJHn3edtmECCMrNAj+
         TvKCHJU8vyKD09BS59YjMUWv3PbsJmUIerWXavG5xAYuByCYaOByNjztzYutkVn5FZIb
         QEcA==
X-Gm-Message-State: AGi0Pua0Wa7jgUMMu1giF48B/kgm/29KPhFV/iCn7GM9Tma1PKwzc10n
        py4nboaSNNRamcEehcoCJfBfRg==
X-Google-Smtp-Source: APiQypJMr4oUHM0Ta88xT7+6ntyKOqf33TdlrkpIUfBkSR/NP5bMYzT+8z/Iix1PO7MN42gvKmsSlg==
X-Received: by 2002:aa7:8d90:: with SMTP id i16mr3456900pfr.126.1586303467414;
        Tue, 07 Apr 2020 16:51:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:51:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] drivers: qcom: rpmh-rsc: read_tcs_reg()/write_tcs_reg() are not for IRQ
Date:   Tue,  7 Apr 2020 16:50:24 -0700
Message-Id: <20200407164915.v3.10.I2adf93809c692d0b673e1a86ea97c45644aa8d97@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RSC_DRV_IRQ_ENABLE, RSC_DRV_IRQ_STATUS, and RSC_DRV_IRQ_CLEAR
registers are not part of TCS 0.  Let's not pretend that they are by
using read_tcs_reg() and write_tcs_reg() and passing a bogus tcs_id of
0.  We could introduce a new wrapper for these registers but it
wouldn't buy us much.  Let's just read/write directly.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("...are not for IRQ") is new for v3.

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a3b015196f15..31a998e6f2e9 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -363,12 +363,12 @@ static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
 {
 	u32 data;
 
-	data = read_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0);
+	data = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_ENABLE);
 	if (enable)
 		data |= BIT(tcs_id);
 	else
 		data &= ~BIT(tcs_id);
-	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, data);
+	writel_relaxed(data, drv->tcs_base + RSC_DRV_IRQ_ENABLE);
 }
 
 /**
@@ -389,7 +389,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	const struct tcs_request *req;
 	struct tcs_cmd *cmd;
 
-	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
+	irq_status = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_STATUS);
 
 	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
 		req = get_req_from_tcs(drv, i);
@@ -426,7 +426,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 		/* Reclaim the TCS */
 		write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
 		write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
-		write_tcs_reg(drv, RSC_DRV_IRQ_CLEAR, 0, BIT(i));
+		writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
 		spin_lock(&drv->lock);
 		clear_bit(i, drv->tcs_in_use);
 		/*
@@ -969,7 +969,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	}
 
 	/* Enable the active TCS to send requests immediately */
-	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, drv->tcs[ACTIVE_TCS].mask);
+	writel_relaxed(drv->tcs[ACTIVE_TCS].mask,
+		       drv->tcs_base + RSC_DRV_IRQ_ENABLE);
 
 	spin_lock_init(&drv->client.cache_lock);
 	INIT_LIST_HEAD(&drv->client.cache);
-- 
2.26.0.292.g33ef6b2f38-goog

