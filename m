Return-Path: <linux-arm-msm+bounces-17015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24489F0B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2DF2885F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3F615EFA1;
	Wed, 10 Apr 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jGE3GHSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9415E818
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748321; cv=none; b=C9t8ccR+Z2FZ8zkKnOyp672wqe0yxpAYz0melEYmWdyixp6fJLydw/yHB9wXFA3yhfG5V9Hr0NIkqRk0gLvwXCWcEIMP464KTZjOQPAqPtpRD4qefJwKBVpTJ4ZkDla6EBuBZ0PwOu4EE4vNVAOiMheC56ieBpbLOa8efG2yJtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748321; c=relaxed/simple;
	bh=sxi3WEpwgXQI9JfKHETzDTiVADUhdiDC54vmSGW+gcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYubh6+ipDVqnoY94fTIZd/SRwghP2rZmLoeSSiSefgzcwS6PTvTMPrfFGJJvuALaCRp/NEbQeTtIbA/2emgQDdD4W3rBioVzrwXckaLbyO2yfcMWQZ9/RGetHRwvmitTYDNOTFWsCtvndlWZS+DvnFgvEqb5ZDVmuqdfm8tiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jGE3GHSr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=k+7gyTeoVGWoiQtUP2kx99lHQC+xHgNqfgabFZlIt1A=; b=jGE3GH
	SrEt72iicQl3z+Wma4LyoJbEUhwq4GtkhjTCBT86qz3m3dKyZqNgvIgN9ulyjctM
	zLhTn30TwyJBvhhIIPmbV4hAa3R87lCupIZ3t+oD4PkwDA99PKFuG94FDI+dyrEz
	ZUA9x3+ENczhqRVFL1LWAb2IO9vnpQtip4k1s7DJu7RmyGmF6K8hhuMVpjV5zb5U
	y9zMdP26ZYjAvSqATF2aJ0iL7nOBFQgKWflgArrd4gQCViSeqV0NtV23+NkihG3F
	y32+rxjyjiMR+WFFmsSFDKxyeRRt6pzWF0PMRg88Zya8AKgv9km7NUci+W1GKuVo
	5+K/SLLwioe8w7jQ==
Received: (qmail 521729 invoked from network); 10 Apr 2024 13:25:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:12 +0200
X-UD-Smtp-Session: l3s3148p1@5xq1SrwVmi1tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] i2c: qup: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:26 +0200
Message-ID: <20240410112418.6400-32-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 598102d16677..c9b43a3c4bd3 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -793,10 +793,8 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 		dma_async_issue_pending(qup->brx.dma);
 	}
 
-	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout)) {
-		dev_err(qup->dev, "normal trans timed out\n");
+	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout))
 		ret = -ETIMEDOUT;
-	}
 
 	if (ret || qup->bus_err || qup->qup_err) {
 		reinit_completion(&qup->xfer);
-- 
2.43.0


