Return-Path: <linux-arm-msm+bounces-96672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP7fAmUksGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:02:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFB25135C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44DE83236694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0F03B777B;
	Tue, 10 Mar 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Q0qI0qV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0353B7750;
	Tue, 10 Mar 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149114; cv=none; b=uFLEYhpl2WGw5NjFYi1/pYUtDrlf5pEP93uhRzr16baKQmBUjGFslriZpoHTVf1Z9ByIfuYOAK1m0RsffEspJa+33euw9mRLWMZa8CZQaYdnsr7Fih1AXVTPgkYEyMFl1iBSXqiGCMJ3vga/CbYEwk1uf9AcgHE0+VaBI5G1+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149114; c=relaxed/simple;
	bh=8V6wiphzP208Grx7TP7pzj/ZY+GYuzf2dDZ9kJVS9Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jzXQ8Rr8ZkmW5cr8NH6e/j93BEhWHhBvl/q3wmOT+tJeb/HxboyGXPGmUZtPFRJsy0NmmPvZ4OdVMz3uIumNF3vBCnVUvBdGEVefgecN03dRl85MQJ8Ahlpp3lIrbUwRdqTAR3yaNUtii/ygTyGxhidCZdF1BXoY6phPTbkoiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=Q0qI0qV1; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=ACnKL7gpyeb9TEVOS0fUu6uWaHNy0peZe6LdIjuK7os=; b=Q0qI0qV1GEYBk3
	iHvQO9SYSioOya9dYWRt/zE+kuLmhIkMbC40PyWTiLdRtrfFz22zK4XRCjW6LE1oEXEMHFl88zrf5
	TMYX4iX+ip0unszPFDZ8+DwjOBkpbu1BLSiT85Vt2rtz3UgrOCSxgdO1UDyJZLdHkpnTAKhG+ekoW
	LCvP1DWbkL8+CeqBnTtWJveBz0/9rJ0j/kBo79t0GVmlQ6kyA9gY0MM81BrjbXsRNkKIMV7XC3VNH
	g1pWQf9kan1Z4AyA+jNeCu9aFXBbfLlWB43K9nf6AoXqWYF1/It0DvmLVHyNC9mtp5sxYnvFXEGuE
	A0yHJgZ8kaQFq7gDck1w==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzx57-00CxcH-A6; Tue, 10 Mar 2026 13:25:05 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzx56-00000000oym-3OCT;
	Tue, 10 Mar 2026 13:25:04 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: marijn.suijten@somainline.org,
	sean@poorly.run,
	jesszhan0024@gmail.com,
	abhinav.kumar@linux.dev,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/msm/hdmi: make 'msm_hdmi_pm_ops' static
Date: Tue, 10 Mar 2026 13:25:01 +0000
Message-Id: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com
X-Rspamd-Queue-Id: B4EFB25135C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[codethink.co.uk,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap5-20230908];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,poorly.run,gmail.com,linux.dev,vger.kernel.org,codethink.co.uk];
	TAGGED_FROM(0.00)[bounces-96672-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,vger.kernel.org,ffwll.ch,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codethink.co.uk:dkim,codethink.co.uk:email,codethink.co.uk:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

The struct 'msm_hdmi_pm_ops' is not used outside of the
file it is defined in, so make it static.

Fixes the following sparse warning:
drivers/gpu/drm/msm/hdmi/hdmi.c:432:1: warning: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..64a0bc7118d5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -429,7 +429,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	return ret;
 }
 
-DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
-- 
2.37.2.352.g3c44437643


