Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78F61FF642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 17:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbgFRPK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 11:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731394AbgFRPKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 11:10:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A5EC061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:10:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b5so2910328pfp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EgswRRarbAngjEcfcdO7vzU1X69Dnu5N0WEEYS8N17E=;
        b=GDnU2+CaEI6iO1FX18aBPuHJlLAXyHMvQn8RC61SQb2CvOFmgQWPfbcual4cPk934X
         sA0sjnBzrS6IZu2mx3Yj26le/et18tojNvJpgNQHujueWEvey7C4obNY7U2CIl4myHAz
         mcjeD1MBLt/CARfSmNysfkIDQLJS4fUXzJr6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EgswRRarbAngjEcfcdO7vzU1X69Dnu5N0WEEYS8N17E=;
        b=csj8fF22G//lT6+jTbj5GM7LgTnIS9PI3UxrwbfvhgGofsJ5dWSXPfj2YlCUUd8LM/
         NJhvJdM3dRjhL0HvniO5bGXX2eDsFAOvh6VENHIlQYzk/ngvvHw6MepX8ky6L6tv+0Ih
         wrrD0OAh+DKZE4DefK2UmeIJxTYRJ+8rmnsuCURXcBcwrn12L7adv/J7gF7zPmFMl5W2
         huyp94frHIWumoqSecGUTVdfo2eg1wHrWiGMnnK1Hgeihu1cQIIOeAdjm8pkflfYID0f
         yqBydGmkgEY8KkFKs3AbBky28/g9Steae4f3CRfVhpA54GU6CDNjA8siQSYGLWA2vOUb
         XLXw==
X-Gm-Message-State: AOAM530AtS0gpe7DuBDBdyVmHEpe02FvWn4Isve0MBfP4SGsDy/rzjn/
        Jmz2gt+V9SCEQE5ZEC1ZrhOiDg==
X-Google-Smtp-Source: ABdhPJxWP5h6GqAJBOvQkYlENccfoLscwWKOsJ5bOnlei9cHfBy1KvAoZrC0RykDVJAKLwA2KbbfAw==
X-Received: by 2002:a63:a558:: with SMTP id r24mr3845460pgu.70.1592493051091;
        Thu, 18 Jun 2020 08:10:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id b14sm3171510pft.23.2020.06.18.08.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:10:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     swboyd@chromium.org, Alok Chauhan <alokc@codeaurora.org>,
        skakit@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v4 3/5] spi: spi-geni-qcom: Check for error IRQs
Date:   Thu, 18 Jun 2020 08:06:24 -0700
Message-Id: <20200618080459.v4.3.Id8bebdbdb4d2ed9468634343a7e6207d6cffff8a@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200618150626.237027-1-dianders@chromium.org>
References: <20200618150626.237027-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From reading the #defines it seems like we should shout if we ever see
one of these error bits.  Let's do so.  This doesn't do anything
functional except print a yell in the log if the error bits are seen.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v4: None
Changes in v3:
- ("spi: spi-geni-qcom: Check for error IRQs") new in v3.

Changes in v2: None

 drivers/spi/spi-geni-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 7d022ccb1b6c..11f36d237c77 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -506,6 +506,11 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	if (!m_irq)
 		return IRQ_NONE;
 
+	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
+		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
+		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))
+		dev_warn(mas->dev, "Unexpected IRQ err status %#010x\n", m_irq);
+
 	spin_lock(&mas->lock);
 
 	if ((m_irq & M_RX_FIFO_WATERMARK_EN) || (m_irq & M_RX_FIFO_LAST_EN))
-- 
2.27.0.290.gba653c62da-goog

