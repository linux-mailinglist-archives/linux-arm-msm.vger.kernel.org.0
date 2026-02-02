Return-Path: <linux-arm-msm+bounces-91442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJXABKBfgGlj7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58261C9AA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94F0C300C270
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 08:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596B23557EE;
	Mon,  2 Feb 2026 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXJzc/QL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51A3542F2;
	Mon,  2 Feb 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770020763; cv=none; b=d7yHsZXkD0buYwdyOxMhmUr82eJ2XlM8svr4u8hR4gU1blhsxRO2/Pfb2tVvqRlanx28InUMk811dWo4VFEkLK0NRFQmIKyj0a0zX9qyuVqM7iD5ZVQN5b+H67xt+tqKZLkemVuLeI6rmLvaEwfdD6js4qMMyHa9gly3G4TwCtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770020763; c=relaxed/simple;
	bh=wLsIkUQ80ugHrd+qzKIWtsSm6XESD5tBTskvqZcZ+wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MM7tyuGXSEWWKoKNTHH+rl0zAcaNMbkoHkLd1LKi2WWwjtA5tXkCqsUQ0xkwvDlMpLT4YtJSqcjcVosB+sPllTNGzFfzxt0VzuqiSme6wktkbCREGM8dPnB0EmPrFNZqfRkgJQ7fifpZP5SgiSv/k2LVdreM4qwBqKhAdFkPHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXJzc/QL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5E2C116C6;
	Mon,  2 Feb 2026 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770020762;
	bh=wLsIkUQ80ugHrd+qzKIWtsSm6XESD5tBTskvqZcZ+wQ=;
	h=From:To:Cc:Subject:Date:From;
	b=HXJzc/QLrdjsNp7PA3AY2/MCc8uut1TkMU5V/TErBkWHYkLzstoIhTd+LN8ohXwgh
	 wvHFKEmKsVORM9jzK/Cmcb6DTb+JOro/ZGuLPGTKqGRJUDy4EFfhKwLB/0McWUcbf+
	 GG1PCxQPfWkdN4fLB+F51aTLWtrpAJ1/4Fqteu64EVNFLKh2dkjPfZPFAcfnhj5JEU
	 tmppgWTEj9Hr7HzOJn1KQsbSLTRFUBQhjCZBHLUZpWMvcb+7fbRevo52CcwiKkXAgh
	 o6U96vmk86BKWwEWjjvIo/HZhl2tPXWAdfLECC0cQzydvHSm5Wgu8/WH9AH+JxK698
	 lCXoXIRXNIoTA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	robh+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2] soc: qcom: ice: Stop probe deferring once ICE isn't detected
Date: Mon,  2 Feb 2026 13:55:34 +0530
Message-ID: <20260202082534.121042-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91442-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58261C9AA7
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

ICE related SCM calls may not be supported in every TZ environment like
OP-TEE or a no-TZ environment too. So let's try to stop probe deferring
when it's known that ICE feature isn't supported.

This problem only came to notice after the inline encryption drivers were
enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
Enable SCSI UFS Crypto and Block Inline encryption drivers").

Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---

Changes in v2:
- Keep the probe deferring intact but stop it once it's know ICE SCM
  calls aren't supported by the TZ firmware.

 drivers/soc/qcom/ice.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..5a630c9010ee 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 
 	if (!qcom_scm_ice_available()) {
 		dev_warn(dev, "ICE SCM interface not found\n");
-		return NULL;
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	}
 
 	ice = platform_get_drvdata(pdev);
-	if (!ice) {
+	if (IS_ERR_OR_NULL(ice)) {
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
+		if (PTR_ERR(ice) == -EOPNOTSUPP)
+			return NULL;
+		else
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	}
 
 	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
+	if (IS_ERR(engine) && PTR_ERR(engine) != -EOPNOTSUPP)
 		return PTR_ERR(engine);
 
 	platform_set_drvdata(pdev, engine);
-- 
2.51.0


