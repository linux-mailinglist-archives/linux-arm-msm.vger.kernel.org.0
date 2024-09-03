Return-Path: <linux-arm-msm+bounces-30431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDFA9690C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 02:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E402834E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 00:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5202C1A4E6E;
	Tue,  3 Sep 2024 00:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CIOB4dFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC7A20;
	Tue,  3 Sep 2024 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725325024; cv=none; b=m6egQw2+YGd4YBNVoYRZhyelDOxBC4zieeBYs+iKtT7vCoka9g4PGg+GMh8vLtYRjpo3fBPplOJxfZssa8zbUSjGBEPBE0Ssi6uZL1umBbl6kk+YHe/9zZqaM22ySjaWIL4MR+HcHW3GQLgZakmCPJHJYMSstSsKF08y6siwWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725325024; c=relaxed/simple;
	bh=2Rb1rrb9vlFmfD7dyqSuGhWuJzQKezZMlL4kXTVshmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RixEEcVqpHz6bhargIbOCXlrcZGr8yWtpMQNWJRUX3p1miS7MVMqFLUgFXLCOzNY33y0gU7vXXOyYP75SR9Sr7iqM2JKcBvCI96+J9CAVMDMNw29JcqTxe10DC77NPMSkrW/rTnCdnxTSnsPIKEY+w/b/mXxtIyR0R1hd8Ia+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CIOB4dFi; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1725325018; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=6LvQLmmUBZPT66uPvu6WKjwYLJgMZ1Dy5+7biil4v3Q=;
	b=CIOB4dFiAwZ3lX2P/wscBsSSsjO4TLKsqG5kifRZ3imnRkB+cAZ4E+mQ7ye8PVxks5f1VoK0BLl9Wy73vtiMvntcNoHeqjdWhYyiKOHa9+cf4WnYhRlfr88LFjgd2qiDMsZ2jOJxFA/kY9r0ZK3VHlST8UQBhpJkN4O4KWbr8Ck=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WEB7hkY_1725325016)
          by smtp.aliyun-inc.com;
          Tue, 03 Sep 2024 08:56:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	airlied@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/msm: Remove unneeded semicolon
Date: Tue,  3 Sep 2024 08:56:55 +0800
Message-Id: <20240903005655.4183-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9852
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..65cf237c6b4e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -279,7 +279,7 @@ static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
 	case 25:
 		found_hsclk_divsel = 14;
 		break;
-	};
+	}
 
 	pd->vco_freq = found_vco_freq;
 	pd->tx_band_sel = found_tx_band_sel;
-- 
2.32.0.3.g01195cf9f


