Return-Path: <linux-arm-msm+bounces-94677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBMRLoOXo2lIHwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:33:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB81CAF92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 120533087E1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD81F2773EC;
	Sun,  1 Mar 2026 01:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umIupdPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99FE2727EB;
	Sun,  1 Mar 2026 01:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328192; cv=none; b=ZY9wawOtVomDFSIfIEr3gccN3iclLt0FrFEXprhEDOw/iTYcb5YSQZl1bfEy6x7a1e0UJ8/xzcWy3Hx4r4uInz11GHDYsJ5OLiPPBCeps3HIt7pFUyOxOv4HOV+9fa6wln2uVathPXYhXg6XKWedMmF+rlOcF1OCmG3olqcwFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328192; c=relaxed/simple;
	bh=SjODigOT5r/uI0owuaqF0rxzgcm6fcCUwRMRQwDnfIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfiRQXthpNlDVj4xOXRfmjsAxenM5M1kl5j9hc832nAEPiOmgM1iDeZYKec2jYNtuMRnzBrx+G9BpKPS+W9GZ6yQvHs6SXCITzcTmnF5vyJLal2kZeuzwGoJxoqCakp2IOiwaOISmXAyNyqk3bWQGvFvNj6RjR+8pW0juVwE3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umIupdPp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94182C19421;
	Sun,  1 Mar 2026 01:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328192;
	bh=SjODigOT5r/uI0owuaqF0rxzgcm6fcCUwRMRQwDnfIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=umIupdPpg07JYI/p4HKrCYN8H1h+/tY7RZtT2OYqJcdDTeySsQe3aYoliojC3Z7SU
	 yxjvutYzsg2rHwT4+P+7FOcwM9U9X5M0KOMSk8F7YGxAcoNkljotydRtaMqbPv9+xG
	 V7O0rQWwudTFuX/V3h5Hx3xd2il2V1t7/q7YfMJ28jewTMP2rDFr/a6EEFGADuzpC5
	 c0XRPU9Zr5xD/vlZtGKAv5fnOc6ItKDwOPp3g8rghZLQ8jKUiItcYSFLUpjnguwD1b
	 ggyDuKjSmo5VSqz5xtXpThf+wNiKXpr6QRgVTZInxsSbqbnnrzU/z5MO1tbokuPB6K
	 8/XfqVnCLmB3w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "mfd: qcom-pm8xxx: Fix OF populate on driver rebind" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:23:10 -0500
Message-ID: <20260301012310.1679836-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94677-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 63CB81CAF92
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 27a8acea47a93fea6ad0e2df4c20a9b51490e4d9 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 19 Dec 2025 12:09:47 +0100
Subject: [PATCH] mfd: qcom-pm8xxx: Fix OF populate on driver rebind

Since commit c6e126de43e7 ("of: Keep track of populated platform
devices") child devices will not be created by of_platform_populate()
if the devices had previously been deregistered individually so that the
OF_POPULATED flag is still set in the corresponding OF nodes.

Switch to using of_platform_depopulate() instead of open coding so that
the child devices are created if the driver is rebound.

Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
Cc: stable@vger.kernel.org	# 3.16
Signed-off-by: Johan Hovold <johan@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20251219110947.24101-1-johan@kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/qcom-pm8xxx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 1149f7102a365..0cf374c015ce7 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -577,17 +577,11 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int pm8xxx_remove_child(struct device *dev, void *unused)
-{
-	platform_device_unregister(to_platform_device(dev));
-	return 0;
-}
-
 static void pm8xxx_remove(struct platform_device *pdev)
 {
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
-	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
+	of_platform_depopulate(&pdev->dev);
 	irq_domain_remove(chip->irqdomain);
 }
 
-- 
2.51.0





