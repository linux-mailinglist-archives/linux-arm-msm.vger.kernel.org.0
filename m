Return-Path: <linux-arm-msm+bounces-66177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877AEB0EA36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1C24E5877
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 05:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB7E248F4F;
	Wed, 23 Jul 2025 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6hU1dNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A692F4A;
	Wed, 23 Jul 2025 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753250117; cv=none; b=Zj7JbfHY2mbz780mi/7eK5cLO1YwLs2NYfzDVCXuTjoSceD+N2LbrpUO2OyA8tfwfBMrvl103278ns7fNWOR/NBO7CpxWkPVeJL4S2o7V95wkmSMcfCFc0WAxjHBZUkFwhAsqnaBNufQ44AF3dQCJPJQcxSn0gfKJ0BBYf0qZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753250117; c=relaxed/simple;
	bh=yNIxe9WNdjMlMt5T6wP5iI1hqp2Pt062PwYTKa7D6Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxWlOXHlhJnqn+VwZvh16+CiGncZgl3Xmpny8W+vXMzGc2akOdhKWPjq+jKQap42+zwnkAHkyMj0tKlocQGs0qxoo7B//40Q5gBVOGCUb+eJ1h8Z62VNZsAhuIKSh+gXRRU+q6nANRqOscM0pPuJE/ojD0C03rwodXGD9XrkI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6hU1dNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E049C4CEE7;
	Wed, 23 Jul 2025 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753250117;
	bh=yNIxe9WNdjMlMt5T6wP5iI1hqp2Pt062PwYTKa7D6Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=s6hU1dNB1qZoBqPUcxtQr+CoF7gPP+QjeRP0BetXSXAHXBxHzQM1egBIJKHrGjQ5e
	 8rVmT/4B3Bra0Jtwo0bq0BLrL24oIMeeMZ7EwZpwCe/NAJkCq6KXSg9T7rmDRYexsJ
	 fq9G7OrM7vnEf4jYCjl/KBrDEzGh2YfFPcGXilHu3xcbuBF/SW47HiVFPJzzQRrdW9
	 /2UvbbxDVx9yLBonb093qwMgFHmEUgglaO35XYeSoiZYnjXORc1P/3t7SeJpiH2N6l
	 MiyLbUwvfcnGYdzi+30tmDee2FMq3WfJeRzxgqLf3zNnTD1Aa5UQyEasSp9TQ62i9b
	 2rjHu9TpKO/yg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org,
	tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH -resend] drm/msm: use dev_fwnode()
Date: Wed, 23 Jul 2025 07:55:12 +0200
Message-ID: <20250723055512.1800438-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

---

Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1f5fe7811e01..ec7d83831b83 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -154,8 +154,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 	dev = msm_mdss->dev;
 
-	domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), 32,
-			&msm_mdss_irqdomain_ops, msm_mdss);
+	domain = irq_domain_create_linear(dev_fwnode(dev), 32, &msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		dev_err(dev, "failed to add irq_domain\n");
 		return -EINVAL;
-- 
2.50.1


