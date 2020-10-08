Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D72287ED7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 00:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgJHWxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 18:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728926AbgJHWxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 18:53:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460A9C0613D7
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2020 15:53:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x13so2590496pfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FdNMvCcCuXxLzDiJt9iUvAf1kgxpbOr+QNX/PxUy1tE=;
        b=kfDYdrEQA9wxhwwPN/a1Z5Twoej4LkSHIZvb+H9j4sp9IuIJwGp5iEW4blw9K2RV/j
         Bwtj60HKV0AIbAxewc3zi+h91ETQYJ1nDFkk84xmX91ctjnUWWoMwa0eaXycgXwHUUVV
         rtJgRSVFfuCzzDbiubtcNb08nvQ37edG/Ytd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FdNMvCcCuXxLzDiJt9iUvAf1kgxpbOr+QNX/PxUy1tE=;
        b=jW4t6dYnHv8HCNfrWJ1NAusfhyupWEN3JwQSyiza97mQaKzP3VZmTaHuwAzta4Nq/L
         Z9RmY1wYhp9orEkBcfu+lMuAX5hqFNZ0UTywtOJXlU6j3fNm3YiaxKWP0M1eVaw+0SPH
         1rb41xaTGoLtogI2sgVa3mthYuq5Y2cvhnmIdH93+2yrcMIgg+3lvC5psPDzQIB7VAIT
         DSt1YSeQmu8QWytfWhdqGZsVOI96gmgMTynXN/tEYwCHCyU89VlUzq6v8sF8UgeTcllf
         sGYBk52Q3HL9XTrfbAASzRi+xWqyfiBZF59xm29+kge2juc4kuLbqjhjBqgZlZJAHjDC
         VfGg==
X-Gm-Message-State: AOAM530JyC3Y4kb2RU17tS6/c+Ewpr+7oTF4U6uG83LrKqwxauDb0ked
        DRZaEDFf37dzlrbA7/zdPznmHg==
X-Google-Smtp-Source: ABdhPJzxLnz9aGRe7hNPvU+jJmdoGuEFrvjbpkIdAczY887yTc+wW3p+JHN1itUed4y072dHEwgIuw==
X-Received: by 2002:a62:7cd4:0:b029:152:b3e8:c59f with SMTP id x203-20020a627cd40000b0290152b3e8c59fmr9288919pfc.2.1602197579826;
        Thu, 08 Oct 2020 15:52:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id jx17sm8386369pjb.10.2020.10.08.15.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:52:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: qcom: geni: Optimize select fifo/dma mode
Date:   Thu,  8 Oct 2020 15:52:35 -0700
Message-Id: <20201008155154.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
References: <20201008225235.2035820-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The functions geni_se_select_fifo_mode() and
geni_se_select_fifo_mode() are a little funny.  They read/write a
bunch of memory mapped registers even if they don't change or aren't
relevant for the current protocol.  Let's make them a little more
sane.

NOTE: there is no evidence at all that this makes any performance
difference and it fixes no bugs.  However, it seems (to me) like it
makes the functions a little easier to understand.  Decreasing the
amount of times we read/write memory mapped registers is also nice,
even if we are using "relaxed" variants.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/qcom-geni-se.c | 44 ++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 751a49f6534f..746854745b15 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -266,49 +266,53 @@ EXPORT_SYMBOL(geni_se_init);
 static void geni_se_select_fifo_mode(struct geni_se *se)
 {
 	u32 proto = geni_se_read_proto(se);
-	u32 val;
+	u32 val, val_old;
 
 	geni_se_irq_clear(se);
 
-	val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
 	if (proto != GENI_SE_UART) {
+		val_old = val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
 		val |= M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN;
 		val |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
-	}
-	writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
+		if (val != val_old)
+			writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
 
-	val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
-	if (proto != GENI_SE_UART)
-		val |= S_CMD_DONE_EN;
-	writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
+		val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+		if (!(val & S_CMD_DONE_EN))
+			writel_relaxed(val | S_CMD_DONE_EN,
+				       se->base + SE_GENI_S_IRQ_EN);
+	}
 
 	val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
-	val &= ~GENI_DMA_MODE_EN;
-	writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
+	if (val & GENI_DMA_MODE_EN)
+		writel_relaxed(val & ~GENI_DMA_MODE_EN,
+			       se->base + SE_GENI_DMA_MODE_EN);
 }
 
 static void geni_se_select_dma_mode(struct geni_se *se)
 {
 	u32 proto = geni_se_read_proto(se);
-	u32 val;
+	u32 val, val_old;
 
 	geni_se_irq_clear(se);
 
-	val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
 	if (proto != GENI_SE_UART) {
+		val_old = val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
 		val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
 		val &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
-	}
-	writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
+		if (val != val_old)
+			writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
 
-	val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
-	if (proto != GENI_SE_UART)
-		val &= ~S_CMD_DONE_EN;
-	writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
+		val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+		if (val & S_CMD_DONE_EN)
+			writel_relaxed(val & ~S_CMD_DONE_EN,
+				       se->base + SE_GENI_S_IRQ_EN);
+	}
 
 	val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
-	val |= GENI_DMA_MODE_EN;
-	writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
+	if (!(val & GENI_DMA_MODE_EN))
+		writel_relaxed(val | GENI_DMA_MODE_EN,
+			       se->base + SE_GENI_DMA_MODE_EN);
 }
 
 /**
-- 
2.28.0.1011.ga647a8990f-goog

