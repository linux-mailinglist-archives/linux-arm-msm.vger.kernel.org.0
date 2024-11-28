Return-Path: <linux-arm-msm+bounces-39495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5999DBCC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 21:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5322916487D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 20:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89C01C2335;
	Thu, 28 Nov 2024 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="jizXA9bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BF1C1F37;
	Thu, 28 Nov 2024 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732824493; cv=none; b=Egc802tze37a+BorvCpOtXOoaohaREX4Drb2vr7OSk7ZpUjt6kx42qD9ATfWASAgucxxf7YOoftNVWlVppATmQOk0/4+TaU7pQcNqVMY7dKowvf/TT8GGUD33C3ejE9f3g9DQvl5dZkhMBeBCyX6k4gy9UD/WupTZa3Zv6tSTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732824493; c=relaxed/simple;
	bh=/29EL1P6NTYAqRPK5QoItt8MoFdIGOjQYDqpxRo/uDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9jew0YMGt4UPoFd5soZ0VeNmFqbspNNSh672WjVh3vNxk62GNYsoi3DEBKs08yZ7E7i3kbAI/KWcKKkyVznNmaEnhVhkehFSVAVShEfD1VOxvmwE97XQYTxFhmCx502t2qymKlXE8s3JCDQZxbcDwVjU7pyVCl5fFITiteYQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=jizXA9bj; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.hsd1.fl.comcast.net (unknown [69.138.96.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 87DE71660B4;
	Thu, 28 Nov 2024 21:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1732824115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H99C28iL1pkfFENhTK64vXu48Y6WZg8ad68wONm+vKQ=;
	b=jizXA9bjSDZ7j1Ei2wZiI6jSYzqAHIBok+V3vJ81WxW0xNJJ0S8zqVT6qkRneVufSYdF2f
	UPKVcL5qQe9Q4vz7wl8X8rnz1E2RbFXICVQmfpZbn2jJ2XEOKvV0GKA64YPBQmKgCkDgFS
	9DzoUsH3WGJK1euYR1h05YJEkOX+Wqw=
From: David Heidelberg <david@ixit.cz>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: document csiphy_lanes_cfg structure
Date: Thu, 28 Nov 2024 15:01:36 -0500
Message-ID: <20241128200142.602264-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Caleb Connolly <caleb.connolly@linaro.org>

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git ./drivers/media/platform/qcom/camss/camss-csiphy.h ./drivers/media/platform/qcom/camss/camss-csiphy.h
index eebc1ff1cfab..e3b9e8f12806 100644
--- ./drivers/media/platform/qcom/camss/camss-csiphy.h
+++ ./drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -26,6 +26,12 @@ struct csiphy_lane {
 	u8 pol;
 };
 
+/**
+ * struct csiphy_lanes_cfg - CSIPHY lanes configuration
+ * @num_data: number of data lanes
+ * @data:     data lanes configuration
+ * @clk:      clock lane configuration (only for D-PHY)
+ */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
-- 
2.45.2


