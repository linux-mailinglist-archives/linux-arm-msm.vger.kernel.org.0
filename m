Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EA06580B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 17:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbiL1QTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 11:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbiL1QSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 11:18:46 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BEE19C37
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:31 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id b2so16436965pld.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbuT81cTqrWb06I08YNk/QYGpUnIYQwfiUqfqhuTPAs=;
        b=JwkluDZyi7Hbk8sR9WvMw++RLfzCX9DprsV3tjkhS2dzv1yi7hfwIIdDLn2zDn+WMU
         zXSx2D7xPxtwGEPFtzUYkN7s+Z2rUHQGfnEckae/t0WEY9i9Cens7510/Q4frn+bq0Y4
         R4qgF86gnbPdO0DZQD0FODtGrIwqZzwXERjL3YpRvaLQEMHDtYBGMWkEigYpLp3Pqf7M
         Ffap7EyGYsRbUb08/5RNkuPLE8UKKZN/qnC66e00Hrtx+ElVMdBQaWfukcJqMczec70i
         S45NoYIx8YZCIx6JUzPTBO9Sa1PjT5kB9FOnLI2LTd8HSUkWv5wQAgmy3yxVZZDN28z6
         3+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbuT81cTqrWb06I08YNk/QYGpUnIYQwfiUqfqhuTPAs=;
        b=3qcDuwMSZiejuz5dYwMbZjIHEJv3IZ0d/lw2EHfbJMoQPkmIBByXF7002QaUi2fqLn
         wPJ/Bx3YYihzJ+tkVsWaFQYd1Bp4n1FFvIdZ0Q2vCNI+9+5TzfjpCr69Z1H8XDYu5jjR
         c/calYFdzJWqr+62kAGz5WLRgq64Y98iMImNZCRtiEBlLWH7EfzLeT3kcwcFKi+oktvX
         CTxZJ1SKULuIjkKsjBZoZsh3zA6KTSTovhVlMhjOMN3agJpZ5DhwgBhCQNHxbXwbRHpG
         5vycXkSwtPpn8iaG0m2Nti++vl0ww4BCrHsArffVQaaklIjQFyW/NT//GRUEkRYGqe+Y
         Nu0g==
X-Gm-Message-State: AFqh2kr6mrWWiJWxuxO5m4Fugyl5kAxRLqkKuHBfSKBalkb5YBkJ9Ior
        0mU/Nz/jLmT5/KEqBqmGs7yf
X-Google-Smtp-Source: AMrXdXtGHOufEjAivRbcDgryAR6ZPswcvzR2crozMrc0bWmqfHtGbGBTW/roNQvygYIcdxVZ6G728g==
X-Received: by 2002:a17:902:be16:b0:188:f0eb:ce10 with SMTP id r22-20020a170902be1600b00188f0ebce10mr30387826pls.65.1672244251263;
        Wed, 28 Dec 2022 08:17:31 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/6] bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD cmd
Date:   Wed, 28 Dec 2022 21:47:02 +0530
Message-Id: <20221228161704.255268-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The debug log incorrectly mentions that STOP command is received instead of
RESET command. Fix that.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 7d68b00bdbcf..0bce6610ebf1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -226,7 +226,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 		mutex_unlock(&mhi_chan->lock);
 		break;
 	case MHI_PKT_TYPE_RESET_CHAN_CMD:
-		dev_dbg(dev, "Received STOP command for channel (%u)\n", ch_id);
+		dev_dbg(dev, "Received RESET command for channel (%u)\n", ch_id);
 		if (!ch_ring->started) {
 			dev_err(dev, "Channel (%u) not opened\n", ch_id);
 			return -ENODEV;
-- 
2.25.1

