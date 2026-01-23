Return-Path: <linux-arm-msm+bounces-90388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGKyJ1vnc2nhzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 22:25:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582E7AE2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 22:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD0CA303DAFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65227271464;
	Fri, 23 Jan 2026 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfToZBzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5492E36F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203499; cv=none; b=SPrf4Dr/1hoj1iq9FkLrhh0G+9Ns8dEb+GArglFOnOPv82TxiwnSvsKM0+Y+LDK7TkZibjM80I8Aj+jvd0Iem21hH+tvMwlqpGw4VunFLD/+kI5ax4D0jeGJxhDGjE70qo1eUN4cNfzD6Dn4nZFOag72uO3+hrSyeRl/2J8CUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203499; c=relaxed/simple;
	bh=yrXNODIr7BomkmwbFTfdc1dmWE/M85IjDSwFYcpA9YY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UPjsY5SuvZY3WrScLEj65FBIKP0GqBvn3NWbzhNkw0EXGGH/YsG256sCmfpGnkV6vlG75sYpzJECg7Rw5Q+5baCdkOqzuHXHKtv8eXhkDREEjaefaY8uXN5p9WymzJf4oW4Q0lPv6WYujGmBmt8PV+NiTnLaFJH840quVWgbmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfToZBzC; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f5418ec110so2574640137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769203497; x=1769808297; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
        b=mfToZBzCt+W4s+VDbray+i1VPXVquiTSL/RKD0ykpyzACNGH13gbzB+UolukDQpG1F
         MhxjzOMMF9KTVcnXB1qGtcFrFlBTw5xvJ3nB4AiJOIyE7m8N1HzgIJUnHy10ucziVkYC
         AIYAyx1d+kRd7oph637fYkYtgw5+KrM/s72lGEmYzBmrlwoGPn47rYzwA9qGqTtGTycV
         yWoGRkZm4A9VbZko8XeRGwAaSV6epNKUMbEu6Oqwtuk2CRMdocIt02f+pDzj0GUB+pMO
         JPm89VMBqHw+ElA8An8CHadIX0LfgAXLfXASRBv70Yte8lJXqsgspFd6XoKa4Q75mAp5
         LyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769203497; x=1769808297;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
        b=LPA/VaR9Cj29qgAU3LmG3ZKvXqa8ZGaKFN5wdpztLEKT9c9Rhm5qrkfRA35dCqPz3C
         wLYltvfa7S4q1/zpG/njHqP5S17W8EgQ6/fXZBTrqOaYz5zkImt4tdBjdkHEPSXv34ql
         eWvvT/yEiabXuyxZGl5/9aH2ausmgfPefkkXWthbaPpiu/P4N24hbmArZeMxhUlXvIoL
         JfQZUVwTetvZcV5GeE3Ncj/LVUWN48uMbDrWTgPS8qpNYJL6tEg4BlD30gwKL96BENHE
         tGvqu3YFoeK0nhCsRk2Fawub4ILsiDoWjIKfZLUZfRTQrtpnTAArGb+XwVjOuSzXiQfP
         JSMA==
X-Gm-Message-State: AOJu0Yxs94lxw5pKChSfUzuulfG8cLonjoQzsriXyVRomdVXiY1sNg75
	ONrlhPdYEak4fxz1YgDUJSgzsfNjbc+B3mhGD4EZSgmF6CLzviilP5V8pGfnf09jLCE=
X-Gm-Gg: AZuq6aLfv6dXxF8hb9ATzNrzDP1uwOMwt3R30Hy7/nJ1BKjOHkCaLSUK9oZ/ZS+MNH0
	ma/lhRIua1FnNCkLD/2b0H756mL1wHcENQbMjjgbSjKebPdPMLaDCHX+qLa6D8T+kdtEthJ+ZyT
	SsfoWuD/Nk8KHf/Hnqqu+GlrypBDuTUhiAOU0LHAhGaiEz2Xv5Xg6+UBl5+wxPJL+eSDpoAzHpA
	Epx1mQwo0JubemdwuKJroxQMosCELx8x31Mwwm9C12zU/OhnWOGXV3oWjkws1CBbR51jXI+CXMB
	xCdLZQ3wgSn0Vjo6xjKeKzvLg8R4Zom8o2vw/+g6Xjf5PRLAG5PfnEhaHfUMlHtbHvg8oX6axj8
	LZMU1wZd+18BJSXo4uBN+r6rxh5YCxeWcgzc00YBfqq1yW6REJaMKm2dFlYiBRuXfzkp0fkUTUw
	907jesMJG9qBV1m7kVNZ/zYWnd
X-Received: by 2002:a17:90b:6c3:b0:34c:3cbc:db8e with SMTP id 98e67ed59e1d1-35368b45324mr3047519a91.25.1769196870985;
        Fri, 23 Jan 2026 11:34:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d8b8f7bsm2731215a91.6.2026.01.23.11.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:34:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:34:23 +0800
Subject: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD7Nc2kC/0XMSwrCMBSF4a2UOzaSpLWoo+5DiuTdC7YpiYZIy
 d6NBXH4Hw7fBtEENBGuzQbBJIzolxr80ICaxOIMQV0bOOU9Zbwlos/57tYXUVLRy0lL0/EW6n0
 NxmLeqdtYe8L49OG9y4l91x/S/ZHECCNWUHWWXCsr2eBmgY+j8jOMpZQPzZC/r6AAAAA=
X-Change-ID: 20260123-a6xx_gpu-cbc095dbe423
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769196866; l=2364;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yrXNODIr7BomkmwbFTfdc1dmWE/M85IjDSwFYcpA9YY=;
 b=JgU/mPDrjPcXojazLX4qDQiHBhnqfv8QLohkDcjKBfaKWjkBRHhGiwsK40juItBCsPTUMbGsj
 /xEXYoqT0yDCiLEQMLR3tJNMRtRSyCbYJcmWJmFa90fSMpi9ncOKNJb
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90388-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4582E7AE2F
X-Rspamd-Action: no action

In a6xx_gpu_init(), node is obtained via of_parse_phandle().
While there was a manual of_node_put() at the end of the
common path, several early error returns would bypass this call,
resulting in a reference leak.
Fix this by using the __free(device_node) cleanup handler to
release the reference when the variable goes out of scope.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Explicitly add header file.
- Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..604b0f861d27 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,7 @@
 #include "a6xx_gmu.xml.h"
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/devfreq.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
@@ -2640,7 +2641,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -2660,7 +2660,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 
 	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	struct device_node *node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
@@ -2702,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
-	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-a6xx_gpu-cbc095dbe423

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


