Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BB71F85E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2020 01:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgFMX1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 19:27:21 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:34086 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgFMX1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 19:27:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49ktzX0VMxz9vKYX
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2020 23:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L2Sqcfc6IBng for <linux-arm-msm@vger.kernel.org>;
        Sat, 13 Jun 2020 18:27:19 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49ktzW5xfQz9vKYf
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2020 18:27:19 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49ktzW5xfQz9vKYf
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49ktzW5xfQz9vKYf
Received: by mail-il1-f197.google.com with SMTP id g8so9337149ilr.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2020 16:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MpamanQ4MpDumyihZoEEj0ayN/iNuyeJtVs/CuktPVA=;
        b=Csp8fRs7Uy+StTI+645mbkSC0XK86N68GqBqTuxWDPZaAXjTNTcW+33Yu5pnbzsUst
         2zAfG8qr16PkqUFCE5wUUSBarQFwevUXvqBNc/dEEzheHfbRxAL5wDsL6R+0fneX9z9v
         5kYteIDPnpYvILOAW9D8B+I39r+Zr+FmAiN6sI/hicPLn9k30kd54geM9NkMxnaSml9j
         5/VkPJxfcp23M59MYVMbyf9D6H0RbvUWb+olfVFljhjPD/hYLzLftYL3k3m8ahDNL2Nv
         z7hP8f3jLX4RgmHoIgpHcE8P22bCZBNuz1te4NQamwJRcRk0+DPO1ZqHouH/OfmdkRVA
         8Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MpamanQ4MpDumyihZoEEj0ayN/iNuyeJtVs/CuktPVA=;
        b=B+D3QGOzt5kKnctwkmcGoqatVba0RpGcuUglKeb4/TX5fkpjgjN/HbMv7WaiUNzdz3
         znutMF2gqwF4L1S7fdGyDZhEhIyLG9hqXZUTRsItXrM2AIaBlmPo72Jo1SrNk2w9+rPB
         JSeXG1POR+irFYEKttFwmDGZGSX7/8aqYKmyb8BY3PnecduTrrxZLEQGCGvOtYVYRptY
         qOOv/Ch9uzKUQc2D4BQ1qu5qG5gG8/7jB4cL7J8ye+C8/7jjEJ5Dncn+XW+Wsi0DVJgl
         J9rtLdbV6KQ/W7HErvqRVoIjIbpdRqkclPfKXxcJq6kJFGY8/34VdWX9MIkfWo7kyvBA
         pcMQ==
X-Gm-Message-State: AOAM530n828TXftLJqBffCLqoPMeo6C07syg3udh6iYhO6O1acgJJNX3
        nPwGwqmAHPVueQ0CQfdrP2LyqQiCdiDQv9Hz+Bc2MRG651h8UYb3iY6nR6SGDNfCNbqeKjq/ff3
        qmlrqn11DrcYBxDTrZRvoGNlqyXZuMw==
X-Received: by 2002:a92:2515:: with SMTP id l21mr19014215ill.64.1592090839135;
        Sat, 13 Jun 2020 16:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMEDlkkWxdPrIuB4rfOhbAimbKN1+ipCveYxCE39nD1rekM86PtxYYKuvjgZnzaG6VylvRuQ==
X-Received: by 2002:a92:2515:: with SMTP id l21mr19014197ill.64.1592090838889;
        Sat, 13 Jun 2020 16:27:18 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id a10sm5441544ilb.31.2020.06.13.16.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:27:18 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: camss: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:27:12 -0500
Message-Id: <20200613232713.19174-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
PM runtime put is not called in error handling paths.
Thus call pm_runtime_put_sync() if pm_runtime_get_sync() fails.

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 008afb85023b..3c5b9082ad72 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -176,8 +176,10 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 		int ret;
 
 		ret = pm_runtime_get_sync(dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
 			return ret;
+		}
 
 		ret = csiphy_set_clock_rates(csiphy);
 		if (ret < 0) {
-- 
2.17.1

