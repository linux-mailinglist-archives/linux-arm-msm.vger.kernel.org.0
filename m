Return-Path: <linux-arm-msm+bounces-48467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4132A3B049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 05:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD37F1891E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 04:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1381192B76;
	Wed, 19 Feb 2025 04:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PJG0W018"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF405286289;
	Wed, 19 Feb 2025 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739938080; cv=none; b=ZGJVQmrb6WjQ3RetLS4bkq6NbWpA84bNgee2k4fNw4H9QVMsRqU9cvZ+BM3zHeQKxi5Kj2+v+896V02gvBnX1sarII0hVeL4+ewRkDp6tMaEPodoSQgv/Bl6iwDw8LDa2LPxQ6lzMaN9QTFZ/KxolfdNhgs8nNXa1DJm0hEXzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739938080; c=relaxed/simple;
	bh=33TK78y0PcEokxOnvoUZpDtewFSxLvkFIrg8wBNvyd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XYzc+/B0OTbXW2yNNm+LI8RwwrrsD0eapAedUizcqY7c0ctpriJYIG4SWwjTwqrdg5pultc1K0tcO7YYxVCe1sOeoGdnvNvZnQHQs7c5DCXYC7eWO0Smc5btmcKisTnC0GDUAUE9c/EOMVLcbaiQZPCxBowS1zYY4Y3wdMIDa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PJG0W018; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=up4oV
	Pi+blECBbrnd4T1e6VKTPf3P8EZCAss6qkrV/0=; b=PJG0W018kemkmYJXkR3jD
	ijqMuKCb7r0I0Zde4PsxuxoRVUVBivHiMnCM4cSVGB8rNF6ngN5K1RPpoPvdTdrn
	PabrRoYCA+ypoyrktG5sSIsS7D1otVJBpZL+XmiuZ9OEk9IJ2bP7PYrAgtNNZCJG
	3vHrqu3UR2M/3AwDx/Paeg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAHiij0WLVnLIlmNA--.661S4;
	Wed, 19 Feb 2025 12:07:17 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathan@marek.ca,
	quic_jesszhan@quicinc.com,
	konradybcio@kernel.org,
	haoxiang_li2024@163.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Date: Wed, 19 Feb 2025 12:07:12 +0800
Message-Id: <20250219040712.2598161-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHiij0WLVnLIlmNA--.661S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw13Ww47WFWkJry8XF4rGrg_yoWDCFb_uF
	yqqrnxXrsIyFsrKa4jyF1IyrW2kan0gF4rZ3W8tasay34jqr1FqwnavrZYvr4qvr18JF92
	kanFqF15XrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuBTYDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBT4bme1Uc0AhgABsb

Add check for the return value of devm_kstrdup() in
dsi_host_parse_dt() to catch potential exception.

Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fda..6dd1e10d8014 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1827,8 +1827,15 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 			__func__, ret);
 		goto err;
 	}
-	if (!ret)
+	if (!ret) {
 		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
+		if (!msm_dsi->te_source) {
+			DRM_DEV_ERROR(dev, "%s: failed to allocate te_source\n",
+				__func__);
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
 	ret = 0;
 
 	if (of_property_present(np, "syscon-sfpb")) {
-- 
2.25.1


