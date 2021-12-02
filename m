Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC0B4666AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239731AbhLBPjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359050AbhLBPjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:12 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5728AC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso2644339wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=pkJARG9jtpqaheccmuyhSef7yV288L4VBLPZYyottTvHVBRxLjYf7w3roqYlfH/Yf9
         rqwW0i+oHVofPsyebn7F2cp8UybQKC4fQKBhf3R/hmKA3kUG22d8OH9rOqo4ge1TnUPd
         yIaccR0zTl3LtMbxIxkf92aHsF93oufpBXB8EmlOLtB0mLpgDz4mIOkmjNidoXrMJ0Uv
         N4WpFA2Ep22/bIFOQL12UhquZ4Kviygad4dqutG8sZ+e3OsjUXfJ5j/A1wtTxho0Cwgu
         erZVShMYxdZnfUdoYfp3I2iT7vj7Mm2CQzSc72iJbdmjGSBbwuIqEKxTNTYkG2y2NTQF
         koPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=uVPMHIChk68QegCF/NIFZpPb+tahxmpbBO2CiT6gu1GTkio+o22GK4qXRzJw7j9jev
         Y5+PcHX7t7LEK2tyqU+TSr7WnnMBOZQeOBBDRxbv6tijJBAJZZakND0QkT9WDeGG7xNQ
         06FLnQRhhbWeb930kLqmU6KYs052iUH5dKHV8vzzM/u2jUBtbngpSmUWDK+4Z7KG2R9H
         oqjUscokwTdpP/2QZ0+W/Uc/dDiSOq9Mx/tG4d4RrFk60+qDUZRtbVOTYBW3YbIDfd2U
         JUy0EhOotNfg2rEJiwQUJy0mFBHSOl+Td0zDuWGGGKi6tZHajX3Bgi6j8T6Qesp/7f+l
         1g1A==
X-Gm-Message-State: AOAM531GPBxuMAyzCvBTrT7aUUI97/oGA8Y/1hcD4e0mLCrSKiCiuF4L
        OgU+1lhlaXOEyeWgxOqhJ4Zp3XuAXdnKtlXq
X-Google-Smtp-Source: ABdhPJwMIfjMdAawPEOhiXZKfdNjFQ2QDWunurtXGXbMHPXMmeVJSEG1ShNizbmyKhMLgttb4fMUUQ==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id e10mr7001348wmq.176.1638459348554;
        Thu, 02 Dec 2021 07:35:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 07/19] media: camss: csid-170: remove stray comment
Date:   Thu,  2 Dec 2021 15:37:17 +0000
Message-Id: <20211202153729.3362372-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a006c8dbceb1..f0c6a72592f9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -442,7 +442,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.33.0

