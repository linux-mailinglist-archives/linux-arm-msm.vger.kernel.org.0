Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9179847CA57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239691AbhLVAf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbhLVAfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:55 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377BAC061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:55 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a9so1300781wrr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7vVV84QeulAKqVS1hzfWHEV7x8szBi3Rm7dK++hOYc=;
        b=lpBdO+cYdhX2YSQNusTHd2sbOATWTHKSqubuQyLTLpWjBIbwibBmC5Ku639/D44F++
         Hd7HE2qb+M4/2ZdNeKAH53vnOXIuOvL8s0ROROkhw5L17HQdcyF3yzVqk20OlJ4bpODO
         fcl7ygBQvOrfy4ZWIWKZus77Rs+iIB91idY0eTKr2mJdbEvVmXA9zE9god9qEUYQ5LV3
         +vWNixQDKOqPJvuF/8WT8/XfFnFLGq2RYqMt/5Ii2ksQ5Pb51bLee4UH8C2zdWoztsDV
         +FixHo7wAX0nEh7z11+R+cQ5H4fOvilZNBBbzfrOBI/VIIVZK6e6We5mEfaj0y+krTpA
         kEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7vVV84QeulAKqVS1hzfWHEV7x8szBi3Rm7dK++hOYc=;
        b=sm9hbJ9wFF4MPnuyYv1pyWjwr4yHikAY6rvBXhpHIT7NFO5udUO+K9oH5JfWUR2SSX
         XHMmYChflNfD/zRXYHWy03N1UHAT0w9BFCgEgsANNlupBodjZ09QrxqEN/iZ7Wt+eO2G
         EtfnYl0iZnyjgDMMp3lDmrSN6mEjq9Jc/ClzSvKmOXGiM58XR9/Uz38/fnzJva6dDz/D
         PlbRRzJY3NAExhAByrL7I+a8LK9qAgR4KejgNfxJ1SHt/F0bNjs4zAmfFCCueEy7X2Lt
         oRrMGSCwRM7vzZooPtIAAnGgue+zDCsAu9LBSE2oWyUBUsOA8Vx/d6JLsDh+oIyoyNBO
         jhlA==
X-Gm-Message-State: AOAM533Hbl5WCNZxvLjseuVu/at4FJjl+lYb2+PJTMu14SqPfZ7078C3
        SDYCku4EFi0GYY61VUZkbS6G+tx2i6Sf1w==
X-Google-Smtp-Source: ABdhPJzawRic3+hsM8qCM+gLo9qOyZ5EuBg8NSAoyUqJ6fBKLq2VUnrNpOyGVkIKoZ0Nujl/ReTykA==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr385967wrq.603.1640133353545;
        Tue, 21 Dec 2021 16:35:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 07/19] media: camss: csid-170: remove stray comment
Date:   Wed, 22 Dec 2021 00:37:39 +0000
Message-Id: <20211222003751.2461466-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index a006c8dbceb13..f0c6a72592f99 100644
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

