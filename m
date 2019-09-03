Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08B87A6A67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 15:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbfICNu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 09:50:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37081 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbfICNu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 09:50:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id z11so17588659wrt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=aOyM32hMSWR1qRMtRvlicJ7f1Z5Z1CPh11gGjkkMTtY=;
        b=SEnDskUHk7MKEpfjF3e0404Vx6RbV3Us34tpICArdFY5gu+Ad0LCkJkr+CWV8p0R7D
         0P9jX11NcJR/cppXMJNg4DK7nZ4wLb6hHDDRE5vjvkM60LHU4/vAUwvFhKtPrHwDZ2ed
         MSUFYAAPsEguqTREsrN9QgP2MicHw3nwD4o0WSQ9aRwsqQbzSqEACxn4LH5D+Vp78CVk
         zGVrqCc8E494TwnqdASdi1A/hNkXjwD2RO4iTxLPHlIZqeX4ExGXV9jYgJPO74QRp3dQ
         cpqFJjn1ShGo0tkINNFZOWHirhB8CwhLCdXMAd2igfWtPSS/kpS4LJwQGOzp98a8ZqJS
         bO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aOyM32hMSWR1qRMtRvlicJ7f1Z5Z1CPh11gGjkkMTtY=;
        b=fLraBbiYtZDdeUGTmbdBp61mJtvoXOofmZRJWJ/pAviF4X1XCTHFeJpwFlm0v8NSIl
         NifTaSCLXs4D1FZr6UQ9IKorNaXEdBxop+nIojZAN22AQntZBPsBY4tSLFOeqjhBxMAq
         vPoKU5aqI1htlWZS2mm8AVMuf6qnBfVw1FcXUjo1snSouNIiLtEWWTm8V2Lpgjfljtz0
         E1kRr17HAgWQ4lTWz/mAtc0GwkxOIyJHfci5zNldu8Y4EPMWCQ4QZUh2vL9AEm563Mxv
         acoY4/p9zmpyMYxn0lCXJ006aFp+2cFSvpiRCCeGotQ+05jZl7GCIKCRZqXOnEQj/iOq
         oCsA==
X-Gm-Message-State: APjAAAXneZs8YN+Gr8tQ3EdNkAQBRmiGaAqc8ERfriHC7g1yqhTnd6iw
        SkSl9L2MgkNgiGzuAewadbuShw==
X-Google-Smtp-Source: APXvYqwcNl225P8oK2CwZViBuGxf6CcNTfssQRviSxt65FF0BMbjIKf7EyVLOO4EJX1BTSuZUsMZLg==
X-Received: by 2002:adf:9e09:: with SMTP id u9mr43453065wre.169.1567518656051;
        Tue, 03 Sep 2019 06:50:56 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id a17sm20710665wmm.47.2019.09.03.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 06:50:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     agross@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Date:   Tue,  3 Sep 2019 14:50:52 +0100
Message-Id: <20190903135052.13827-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting with ACPI, the Geni Serial Engine is not set as the I2C/SPI
parent and thus, the wrapper (parent device) is unassigned.  This causes
the kernel to crash with a null dereference error.

Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Since we are already at -rc7 this patch should be processed ASAP - thank you.

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

