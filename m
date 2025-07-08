Return-Path: <linux-arm-msm+bounces-64002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB9AFC65B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39CF4217DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724B7220F36;
	Tue,  8 Jul 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvh8iKxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C432BEC3E;
	Tue,  8 Jul 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965053; cv=none; b=FPLuzwaTSe03f/Ctm0/mXfQ9oQSWYuOwvRamIeoSmBbuAhp6sl9ale6RrrS6opcj5HwwCn/674VryMoqZgzQ08bdox1t4LQ97gC0u3s9cfFCh8haEoR+wmrinA+mFCBwbCzYDywX0Nubl1AbxVfYqeupNnvSxV3a5gglltyjtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965053; c=relaxed/simple;
	bh=ArnlYJ2oQj3tI9v/yYa8u3NPCosxGc2PHAGvQ5Ft23I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grIyDFQh4KQAvzUiIJ7aXpxTJZpjZxjV5NloIi3v/ZoVjUicqoJjvewd32eUS6Or0d/ymm6QDMbzf2gN6oDZ1kmUINaqzhgjEbN1EIYw0CEM+vuHqMAZUB9A4XWexH8MCtCfQbrwM724nKIO6ZNq6qGmTt/zWP2klxeALRYfIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvh8iKxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD10C4CEED;
	Tue,  8 Jul 2025 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751965052;
	bh=ArnlYJ2oQj3tI9v/yYa8u3NPCosxGc2PHAGvQ5Ft23I=;
	h=From:To:Cc:Subject:Date:From;
	b=rvh8iKxF3DnqpYx5xx7WUAdDdmTftIqfB8+mn4y5D1x7xpIVv9/KB+M/mHH3IDiVn
	 7/bi9LaIzkpv3NrZKieayo5CMfqXj7jnTA6Y+LnLXTGHleQf4NE7pexoEjqpaNSsqP
	 3fAJ//M9QbrElXOx8FVL3I+a40pAotRZZHR7OtVjE0v8VtMcZ0pWwQBtvqY7UtDcxK
	 lppicE78Ro6xzenJEHO4oi7HGYVizZ3/MDnx0IYVmPcF2XAbp5Q6xnTOq4KP10eENp
	 uOqdYaPBHhuijCtqaXpAkSja3m9MmDycgdJJ7YIbf002Hvam8nmNRA/ZoWLQTJ8ttA
	 ub2NG6/dq6qpA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uZ48j-0000000049T-0BDy;
	Tue, 08 Jul 2025 10:57:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: pmic_glink: fix OF node leak
Date: Tue,  8 Jul 2025 10:57:17 +0200
Message-ID: <20250708085717.15922-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the OF node reference taken when registering the
auxiliary devices when the devices are later released.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/qcom/pmic_glink.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 0a6d325b195c..c0a4be5df926 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -167,7 +167,10 @@ static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	return 0;
 }
 
-static void pmic_glink_aux_release(struct device *dev) {}
+static void pmic_glink_aux_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+}
 
 static int pmic_glink_add_aux_device(struct pmic_glink *pg,
 				     struct auxiliary_device *aux,
@@ -181,8 +184,10 @@ static int pmic_glink_add_aux_device(struct pmic_glink *pg,
 	aux->dev.release = pmic_glink_aux_release;
 	device_set_of_node_from_dev(&aux->dev, parent);
 	ret = auxiliary_device_init(aux);
-	if (ret)
+	if (ret) {
+		of_node_put(aux->dev.of_node);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(aux);
 	if (ret)
-- 
2.49.0


