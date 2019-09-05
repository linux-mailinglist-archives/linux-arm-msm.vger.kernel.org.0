Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B57A9CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 10:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732493AbfIEI0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 04:26:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34447 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732454AbfIEI0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 04:26:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id s18so1649456wrn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=0SGxKzloC1sYoifm3y16biO6W+84MTKzulfWNDZIOv0=;
        b=JtEU3isNL7tcsgWJfDETBw410yLKfnQUAezfYGPe+bkIod/xnIaEu2T3jcqiNm93kk
         c099+BNZcXW8lNfpNu4j2o3a0h7z5Zk+CnH+T3UfNNgcKwR7FG6TCKzWg7f7h5YmmqlM
         xVeCWcGOSo0Zc3rByshg/dksK8+xE6/CGJLPPz+dxi4uAOTWzzrJEXDKf2AL1a43X6zF
         A7Z9JWkCE23NMb3Me5AH8Gc2LD57eZsSX9B5Fd7Q0Q/EPeH2xqr0kLz6ZnV29gr7Mkbi
         eAsX4kMg4t43ld9DtOe0UsezPWxCDc6HSIdqOvBIQsO+DCP/5WMbNPmtqcvIBwphQcV1
         ujGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0SGxKzloC1sYoifm3y16biO6W+84MTKzulfWNDZIOv0=;
        b=ueIpEu5tPwGkCjIYFi6bMfQi7t8OJ2lqbdR5gceGK4aa+5373Yr57Z05ZScPjwWGW2
         kkvD67lGFkMWKqyABNGqlwuGDnZDEDH/+BzZct7nntuqoIixiKHcHEo42xv10FkM9NBj
         4IFUDJC/0RRAq3Ym/2m8IxVUJ2rOWYbCTElwHTFPYxoTcdUpjcKv1rAevhSmFqJwgWnI
         x/7XyJdTgdHzikzIfMEKW0+X4d2Shj+x0hWupLHcymkYLXOOh421zux0bT7cMNHsoeSw
         HfDqBCBGatssGsu+B3gicTgLwcx8AHumxE6K/RjqwW9RMFNJmGvFySZwv9626o6iqQ8J
         bc9A==
X-Gm-Message-State: APjAAAU7F1VCOt40vnRLe0dPhhWdneHrt9d02okD1Q6bZgTy74JkIYf9
        FuwK1E35xy9+/XmiY7RfBhRpDg==
X-Google-Smtp-Source: APXvYqyneYOfiTi5Ojy9R1/QQz07t4M61xgAm4mkWxAllP1dMOip2pu953cyhGMT71BimoquZaCjfg==
X-Received: by 2002:a5d:6504:: with SMTP id x4mr1489361wru.227.1567671958823;
        Thu, 05 Sep 2019 01:25:58 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id a13sm3592687wrf.73.2019.09.05.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 01:25:58 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, swboyd@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [RESEND 1/1] soc: qcom: geni: Provide parameter error checking
Date:   Thu,  5 Sep 2019 09:25:55 +0100
Message-Id: <20190905082555.15020-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting with ACPI, the Geni Serial Engine is not set as the I2C/SPI
parent and thus, the wrapper (parent device) is unassigned.  This causes
the kernel to crash with a null dereference error.

Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 * Collecting Acks

NB: If someone could send this to Linus for -rc7, it would make v5.3 work
    when booting with ACPI, meaning the newly released distros, due out
    in October will be bootable.  I'd be happy to send it myself with a
    nod from someone prominant (QCom, Andy, Bjorn, etc).

drivers/soc/qcom/qcom-geni-se.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index d5cf953b4337..7d622ea1274e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -630,6 +630,9 @@ int geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	struct geni_wrapper *wrapper = se->wrapper;
 	u32 val;
 
+	if (!wrapper)
+		return -EINVAL;
+
 	*iova = dma_map_single(wrapper->dev, buf, len, DMA_TO_DEVICE);
 	if (dma_mapping_error(wrapper->dev, *iova))
 		return -EIO;
@@ -663,6 +666,9 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	struct geni_wrapper *wrapper = se->wrapper;
 	u32 val;
 
+	if (!wrapper)
+		return -EINVAL;
+
 	*iova = dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVICE);
 	if (dma_mapping_error(wrapper->dev, *iova))
 		return -EIO;
-- 
2.17.1

