Return-Path: <linux-arm-msm+bounces-32894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C616B98C0DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE70A1C23FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624351C8FCD;
	Tue,  1 Oct 2024 14:55:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 3.mo584.mail-out.ovh.net (3.mo584.mail-out.ovh.net [46.105.57.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF7C2E3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.57.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794510; cv=none; b=ojk90DD76p2Tf1Kt8c3f9cJb2UltVS5HNls4rkhoNRs+5gpcORsE/bw90kVDS7lZtgKNpt0UGMvniG04HPr4AzEdPV9RuWSJ3YuPzRweikqRR4wXeEKNos6xwbyi/dNgS3oJ4ehOdu73Lmu1pvgQ1OHyKipLCRFKUlA4T1uL+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794510; c=relaxed/simple;
	bh=5Ps6qaP3zQmDsMHKHbPv5tOEQw72uaJPiHCSZ93/QEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMAnitbkeRAvtxsFlTySHXmvW9BVXNXES0nxqP8qjmCIp5WHYWEP/kzioIXNfKsxtND7gOeJ+CFcjH5f5vXdTYnN9B6lZc7ps3nl1NMX7x6RkFSpfaJeJKThqyP3czi0BuF9WgD9fqycMzn23xjDkAoX2wttoBNZfLzaV5Ljo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.57.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.148.34])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4XHzVj2RBLz1W2H
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 13:36:29 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-kpzdn (unknown [10.110.164.11])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1B7CF1FE5F;
	Tue,  1 Oct 2024 13:36:27 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-55b549bf7b-kpzdn with ESMTPSA
	id ZIraKdv6+2YL7gAAvqo9vA
	(envelope-from <andi@etezian.org>); Tue, 01 Oct 2024 13:36:27 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00467e7d24f-62e5-415c-8458-368343432183,
                    19B342EA1BF14464D5388E9C092C63149640B63F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:188.155.229.193
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: qcom-geni: Keep comment why interrupts start disabled
Date: Tue,  1 Oct 2024 15:36:20 +0200
Message-ID: <20241001133620.2651795-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18076604480472025671
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvddujedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddukeekrdduheehrddvvdelrdduleefpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The to-be-fixed commit rightfully reduced a race window, but also
removed a comment which is still helpful after the fix. Bring the
comment back.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

I'm resending this patch from Wolfram so that we don't lose it. All the changes
in this v2 have been agreed during code review.

Here's the difference:
v1 -> v2:
 - Reword the comment.
 - Remove the Fixes tag.
 - Add Bjorn's r-b.

 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a69..b48f25c58baa9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -818,6 +818,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
+
+	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
 	if (ret) {
-- 
2.45.2


