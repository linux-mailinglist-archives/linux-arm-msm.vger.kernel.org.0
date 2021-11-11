Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8AA44DA09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhKKQQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:16:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbhKKQQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:40 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783C8C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:13:51 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d3so10664161wrh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iT00SPNXaaNsqiLDXj5JoRlqm+cECqYRe4jjGiIw40Q=;
        b=dAaxuChgIfT2gNAAWVYOw93k0n+uhXCZTfztt9GJsu72oTRhHGTalXR6o7bAakiZW+
         2liuE/ooAi+vPsOrnAl5sIvxxVMUI1Xp5GrUtUGB5CbIWFpRcOWCSq0pS7pVZ55TkdU/
         q2Bgn38nbvfN/YPj5I8UYPbl05vH+r8DyWh+UWyA08opFhYe0HT8AH1JdLQa+H3EZ/Q1
         +UlUhVAgc8/GQsOXLlS/l78arUry4eMq2P5YHE5ZO2m3xP+Nd/OihM0L+ER3Cr1/pZ3c
         JsAxyVuoiriuqITc1Y7w2SG2eHNrtLE5RCuJLQj/TxGa2dhJQV7mYkgtJ+z1OpWmqBXs
         KAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iT00SPNXaaNsqiLDXj5JoRlqm+cECqYRe4jjGiIw40Q=;
        b=pr0lkIc42jP/Hwjy31biD0yqnpIBN/Kpib/A7cskbhZzJAGQwb3GyTx1cRlef1A0Bk
         t/IciF8TDTJR2kGg6MxqLbG9MrwBGUX6njS/Bf7flKuNqDtEZUzpMQhESytIFkuoy5pA
         GKT++yAEg/MlAz2/qxu6OzFEGkTb5Q0MHzJ4k0sY7TNXSpTBzhQsTaHvoodFAtDyh0IX
         PvFcpGJ+IxSF4l3LRLKNSr2CLN81ucm5udGQz4HnhykSCMRdyITT+rewSQetnxdkDah6
         MW1MMum2yYeHyfYDxJ4AUXrs/He+8TlvBLYdKTFKXCeXAdJbPywNAvtpHiFZqRNQEtb/
         +iUA==
X-Gm-Message-State: AOAM530Le3nrMnXCvkvjzbt8Y7I+kXJHasWC8WkQS9iiqI24hULENqdX
        /IFT8eXSCNvRqdqo93euEc0wGLFcUNx5cw==
X-Google-Smtp-Source: ABdhPJxaqvXnEwUf7UW0wVNBRfPQHgRFM3JM2cmXmelMJrX2RecMrdo0ep+vIyYTP6IAq/XeYuVB2A==
X-Received: by 2002:adf:f012:: with SMTP id j18mr9934114wro.353.1636647229569;
        Thu, 11 Nov 2021 08:13:49 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 05/18] media: camss: csid-170: fix non-10bit formats
Date:   Thu, 11 Nov 2021 16:15:29 +0000
Message-Id: <20211111161542.3936425-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9..aa65043c3303 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.33.0

