Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A01A24AA7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 02:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgHTABs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 20:01:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:57976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbgHTABr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 20:01:47 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE3CF214F1;
        Thu, 20 Aug 2020 00:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597881706;
        bh=9eM5rUoj0DJZv2BnhxvvhEMbKv87QePAjTshRCH1THE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LL0q7HK3bypbbZAUTlkzLoKtY2OovlUBRAufiaIiEfvrAOphhs2Gg2CLiHflVM5Xe
         gZe7qAXU+FXR1PXChtcBUXxvZAMvRtYVFWtdXY9UUumqOXN7U4kPzpmnumI43JWx0S
         qqt4IuI+ncF/nH58SEyWi3HdJq/+t03bpc0nbW9A=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 22/27] media: camss: fix memory leaks on error handling paths in probe
Date:   Wed, 19 Aug 2020 20:01:11 -0400
Message-Id: <20200820000116.214821-22-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000116.214821-1-sashal@kernel.org>
References: <20200820000116.214821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit f45882cfb152f5d3a421fd58f177f227e44843b9 ]

camss_probe() does not free camss on error handling paths. The patch
introduces an additional error label for this purpose. Besides, it
removes call of v4l2_async_notifier_cleanup() from
camss_of_parse_ports() since its caller, camss_probe(), cleans up all
its resources itself.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Anton Vasilyev <vasilyev@ispras.ru>
Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3fdc9f964a3c6..2483641799dfb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -504,7 +504,6 @@ static int camss_of_parse_ports(struct camss *camss)
 	return num_subdevs;
 
 err_cleanup:
-	v4l2_async_notifier_cleanup(&camss->notifier);
 	of_node_put(node);
 	return ret;
 }
@@ -835,29 +834,38 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csid_num = 4;
 		camss->vfe_num = 2;
 	} else {
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free;
 	}
 
 	camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
 				     sizeof(*camss->csiphy), GFP_KERNEL);
-	if (!camss->csiphy)
-		return -ENOMEM;
+	if (!camss->csiphy) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
-	if (!camss->csid)
-		return -ENOMEM;
+	if (!camss->csid) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
 				  GFP_KERNEL);
-	if (!camss->vfe)
-		return -ENOMEM;
+	if (!camss->vfe) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
 
 	v4l2_async_notifier_init(&camss->notifier);
 
 	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0)
-		return num_subdevs;
+	if (num_subdevs < 0) {
+		ret = num_subdevs;
+		goto err_cleanup;
+	}
 
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
@@ -936,6 +944,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
 	v4l2_async_notifier_cleanup(&camss->notifier);
+err_free:
+	kfree(camss);
 
 	return ret;
 }
-- 
2.25.1

