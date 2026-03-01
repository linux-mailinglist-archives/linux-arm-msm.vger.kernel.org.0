Return-Path: <linux-arm-msm+bounces-94692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNl0CrKpo2nfJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:51:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6091CDFA6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CC0F31035F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AEE26FA6F;
	Sun,  1 Mar 2026 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toNDlqBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F884145A1F;
	Sun,  1 Mar 2026 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329396; cv=none; b=eJGMmAcgkFSYc3W83mRe4J6FLAaYDWCuYecgMv1tVdREzRBY8tR7phte9FqI+A/125QnKNGzdC+AzaW4gNcGVmh7UjzttgkDEyaL9LRQk/GmVTeR13ifQDL0ZTm0dn8qWYIM1MI0qmzxsSOKxLRT2mOElP04auaEF/Y/5FDenZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329396; c=relaxed/simple;
	bh=p35CT646UNG2/YBjz9HWSulWxIpVOpW3F1abFFnUdJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xg8Q2U8GQr/MISu0oRgUfPjBGWr1fr28PtaozBAp2bUqKJjFjlyT0CK1LOGNrdUdvMGvS/6JQeHF5aH3q0gy6QbXJnSwdRh/VeTppiLx6B78ZospUyvjVI+/rZnYTy84IYfhxclvdrZT1kw7NJgQIl8mbFVB/G2qiXSlpoGBPmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toNDlqBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92499C19421;
	Sun,  1 Mar 2026 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329396;
	bh=p35CT646UNG2/YBjz9HWSulWxIpVOpW3F1abFFnUdJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=toNDlqBc5A8oTJRiAC7BHlObKaZ5/iEEA0BoyLawFJUaE5Vq1VV8b0SVhS0AXFzrf
	 Peeh15hdmfy708O2mxCFIu66VqToZ0ncNXXlWt0M8Yws2y1eMYeDoEiI7AXpeOcMWj
	 0lSLJe/sC3rjLoW4B9v3ReY2rkd5m1GS/qDwpWAebz61pHK+YXTfTtfWRvI7Dbsvnn
	 9NUAT1ne92lktnFPLu6EgLMvRnddC1oh2WZqbfeseQc7LNvfy2+WYVHCLAtYfM3gXV
	 lUn8g1/bkJXlnSvq3WxAPfCVo+EXMK98gnet0OKF5N6UbL0FW5an0U5guje/kqHrfz
	 zZr+EhzHoZlrA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "mfd: qcom-pm8xxx: Fix OF populate on driver rebind" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:43:14 -0500
Message-ID: <20260301014314.1705291-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94692-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8A6091CDFA6
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
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





