Return-Path: <linux-arm-msm+bounces-91252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNGvGs11fGl7NAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:11:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14968B8BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EDE63001FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A70D34DCE3;
	Fri, 30 Jan 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf7mbiCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1D313545;
	Fri, 30 Jan 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764296; cv=none; b=m0Rfxznscse+8sXNn65uOo2MuctoF9zv98vWF4c5wyv+MdKn0WgzqnwX1v9LqY6gmtAoPUFDZ9FxRxaIWZReicqfgH7gpc01EAkUHgngxrmyFo5ZzlyHKD9N91jf2ZKJzAwSN0hODz26/dIIKO3tIZb44bdOb56vBA1aODQWibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764296; c=relaxed/simple;
	bh=cv+OdoYb0/CdlO+OEIvlY6h5CAMpvX5Q+H7YbOLBeYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RD1Z6nPrzKHO/jfN3VN6ddNtfg1USrE+JWCgXSLHe3iE7imjMBOOLXcCIIkcvGAHnqUL8YEsTHOJEcX0SJmrK/NOQU7JFZyDsCL+zgjuLJMPsWVlcS7jo6RFP6Lx6kuij3vYXkgKirLF0k9LrEKCD2Kr/QVykTpHrZTSA5MyY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf7mbiCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7A4C4CEF7;
	Fri, 30 Jan 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769764295;
	bh=cv+OdoYb0/CdlO+OEIvlY6h5CAMpvX5Q+H7YbOLBeYc=;
	h=From:To:Cc:Subject:Date:From;
	b=jf7mbiCxL2Ou9y6MfIpC61NS0zWh1vKrtbmGbbfvOf5io09lYTY7cb4rZsrqbkU7Z
	 dDv5lpDJNfgj1jwvAWqXkYA77i9mG7fs/1QuLLJ7VCAPGYpRzM8xrjyFMeCgF8I5Z/
	 K8Rnkcx+/rSvuO283erWrjKFgHyyVusvH4GxZ5gD8dHK9+XfEYx/Nh7MfosG2ApATh
	 oh1r64TBR8GkSM8dCLoLqSjCDJPbjpWr0FJyEPEyAxsrdp1bFVerWgGZyO73z39EeD
	 wSdUQDdN7IwLTaxWqUS13k188ThtwqMM+0ovRd1lWX0X9dUWd3HVLC/ihZ1J0Vx7gk
	 muLOUwXvzsLRQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported ICE feature
Date: Fri, 30 Jan 2026 14:41:18 +0530
Message-ID: <20260130091118.147379-1-sumit.garg@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91252-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 14968B8BF5
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

ICE related SCM calls may not be supported in every TZ environment like
OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
when it's known that ICE feature isn't supported.

This problem only came to notice after the inline encryption drivers were
enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
Enable SCSI UFS Crypto and Block Inline encryption drivers").

Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..ab9586b8caf5 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
+		return NULL;
 	}
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
-- 
2.51.0


