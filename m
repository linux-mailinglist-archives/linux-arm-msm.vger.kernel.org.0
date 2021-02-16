Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC2D31D1D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 22:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhBPVEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 16:04:43 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:28248 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhBPVEk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 16:04:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613509458; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=ZPYgjj7osuMdqrhvYEe/2OiYRLocQeK3kN4ElMketwc=; b=v0XHpTzzxSWzEYkamZUmyK9aSOV5PY09h1sxl7rg6rxzxLt4bzpuFTB4lDNMdB1OPxYRgf3v
 7EB+wN6nAfT5A6EKrdx+87hP0RP5ecsKQVYqleHfdtQ73ue68hk3GqNuP/zWufCmUAvtaV/E
 3dnNlbJmUe60h8P9yNdcjogbzUc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 602c3335b50d5f2cb402946b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 21:03:49
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 416B6C433ED; Tue, 16 Feb 2021 21:03:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6D06C433CA;
        Tue, 16 Feb 2021 21:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6D06C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fan Wu <wufan@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2] mhi_bus: core: Return EAGAIN if MHI ring is full
Date:   Tue, 16 Feb 2021 14:03:35 -0700
Message-Id: <1613509415-23191-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Fan Wu <wufan@codeaurora.org>

Currently ENOMEM is returned when MHI ring is full. This error code is
very misleading. Change to EAGAIN instead.

Signed-off-by: Fan Wu <wufan@codeaurora.org>
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---

v2: Change from EBUSY to EAGAIN

 drivers/bus/mhi/core/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index f182736..c043574 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -996,7 +996,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 
 	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
 	if (unlikely(ret)) {
-		ret = -ENOMEM;
+		ret = -EAGAIN;
 		goto exit_unlock;
 	}
 
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

