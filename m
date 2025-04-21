Return-Path: <linux-arm-msm+bounces-54831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCDA94A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 04:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E28B188F437
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 02:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4000A2566F3;
	Mon, 21 Apr 2025 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qh9DH6Gu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AD255E32;
	Mon, 21 Apr 2025 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201079; cv=none; b=Y+Wod9rRhtQ5Yh3e9k7gIsmTvjYw1sLpWJJK3aEdnyxdWu63BQ4rghTkvXMZ0lt8dFdZNj+GEHfCP6uPUZeGjNPDSWMEDnouGt32ru9s0NJQfR/D3vKHV+2rQXthLDKcBCMT9Pp2huMlKKa7rrj8nPDfjC4hWmDB2pjEVrkqpW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201079; c=relaxed/simple;
	bh=U6I+PwKCmy7pG4WA1RVuzIfpWgFlxP9eCznMIyTUuro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gd7YAO9RBhcbEtFZDZtFwBXH6/JEKaVmC/q+VTiLPn2cm40CpufPPBa2clmGx3JDUt7ms+orliKAHnnIKQwUYBWAQCsPcsMR9J7fxkCaa7Jy52JXa5YQm05lMFKbItC3DdDBuOx5gt4219JGR6Z36YWXPG66BXf3BLD7Unw6SsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qh9DH6Gu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id A46CBBBB02;
	Mon, 21 Apr 2025 02:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745201070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8aCnYJYVZSR3rbwBCwfDLTUp0VBv3iMT57/14xiRX4=;
	b=qh9DH6Guik594JtJd8dZxFrFRRZe9h+IA9qQ46M4tl0pRd7yX9Y1OVjh9wRv7pLNmQhH+y
	Ybn37xShMEz0T/N/fwvSi5JyKry1eRiMKSj3S7cA+Iy4i4iq12IQp4rPrah+Rxn5dESdfq
	WuNIcZdvHdSjEcV/h1uzxUL5JhvHzEbzHwQLpDVULbGGl7U/KgvjqIqnzrkJ/uMg6V/UMJ
	KYGTD6MvPtfouggH+QpjGIrPMG3rZI0SpnENuSmBuk3EjVo9Y/zEH8G7moVxCBNkf5z1sj
	FPfqwCjwkbSdf8FabrDxPtjrKZj1hjYcQVRbgPkQ4Vjl18WeQwH8MkqgYpVGmw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 04:04:17 +0200
Subject: [PATCH 2/2] soc: qcom: smp2p: Fix fallback to qcom,ipc parse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-fix-qcom-smd-v1-2-574d071d3f27@mainlining.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745201067; l=1084;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=U6I+PwKCmy7pG4WA1RVuzIfpWgFlxP9eCznMIyTUuro=;
 b=apfZxy3ONleNAqMDaQFSwnqwAN7RD3hcXNbyGo6P53JWqnqFQbdEKCXzexHp3+ru/JkDvxtcJ
 EjbVyV2LALrAv9XJ2GlEOgXsIKsU0UakD5GyPdr9b5OcNU8K2pxapod
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

mbox_request_channel() returning value was changed in case of error.
It uses returning value of of_parse_phandle_with_args().
It is returning with -ENOENT instead of -ENODEV when no mboxes property
exists.

Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/soc/qcom/smp2p.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index a3e88ced328a91f1eb9dbaaaeb12fc901838bdaa..c9199d6fbe26ecc5ce941cfd608ebf1381be0935 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -575,7 +575,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	smp2p->mbox_client.knows_txdone = true;
 	smp2p->mbox_chan = mbox_request_channel(&smp2p->mbox_client, 0);
 	if (IS_ERR(smp2p->mbox_chan)) {
-		if (PTR_ERR(smp2p->mbox_chan) != -ENODEV)
+		if (PTR_ERR(smp2p->mbox_chan) != -ENOENT)
 			return PTR_ERR(smp2p->mbox_chan);
 
 		smp2p->mbox_chan = NULL;

-- 
2.49.0


