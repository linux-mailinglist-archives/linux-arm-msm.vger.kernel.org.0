Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C7E1FAE39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 12:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgFPKlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 06:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgFPKlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 06:41:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417AAC08C5C8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 03:41:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jz3so1259054pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4m6P3VqQCLvUhFBDKb6BzhpBcCZvCCTqjg+tD53gAY=;
        b=SBUAQMaCh6XaARCtdGI3FoxefEJ7byLWZI/XJCo4ieCiBLghkY+Y7V23Z0RXkfYm3D
         VR88nWZw16xFyasefWh9WQruIAP7V9tX6o+hkWYu581CG23OGPBlIKwCE0TkKqIi1i+I
         BtEFwt3dguzFXCdl1m7x2Yof9DwFlJpnWNlmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4m6P3VqQCLvUhFBDKb6BzhpBcCZvCCTqjg+tD53gAY=;
        b=S7HoRc0RoY0q/fl0RLye0wyMQjJSmQnjyLrtG6GpX+OyvnYoZRx/DC6nqZ4JDQsXIi
         h6gmYwOi+WOnEiyrTlueEc2DP2D1rMEme0OEuTc8LNhpL414HewI/Co8GzK5U90dttOH
         /QSP8uvxU4mooXd7CpmIeuC4qUFF9tBQTKavNpt0k43TZ32n36+ogesYy/OkkvXFD33t
         zzL3TN+FoyCNKutY72FdvoqC4wj0ARj8cOV6dPEGYvfGpjl6XEayn/1VFbcsBFmy27yD
         kq6ntHXgBjD/LBWqE3351JkFytR2rA0kLq2vAGpqHUCd7VcGKewp/+h4+NTNJPymNaZk
         YHiA==
X-Gm-Message-State: AOAM530fnUsxDUbaIAy9cF9bKSwwIoYY6IEXuN2EIhbhiiNdLdjlfE4Q
        XapWDPQ686aeBZyzojvs4nqf4w==
X-Google-Smtp-Source: ABdhPJzI5J1yKUbOrc2+yB3c5xtwjsI2MMS87NAhcz5LEgsif7C24AcptmwDLNOtc1vhUZcllgVfwg==
X-Received: by 2002:a17:902:9044:: with SMTP id w4mr1574397plz.83.1592304079792;
        Tue, 16 Jun 2020 03:41:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 140sm16947400pfz.154.2020.06.16.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 03:41:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v3 3/5] spi: spi-geni-qcom: Check for error IRQs
Date:   Tue, 16 Jun 2020 03:40:48 -0700
Message-Id: <20200616034044.v3.3.Id8bebdbdb4d2ed9468634343a7e6207d6cffff8a@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200616104050.84764-1-dianders@chromium.org>
References: <20200616104050.84764-1-dianders@chromium.org>
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
---

Changes in v3:
- ("spi: spi-geni-qcom: Check for error IRQs") new in v3.

Changes in v2: None

 drivers/spi/spi-geni-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index e0f0e5c241f3..56628d45421e 100644
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

