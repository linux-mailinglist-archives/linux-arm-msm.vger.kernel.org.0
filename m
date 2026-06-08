Return-Path: <linux-arm-msm+bounces-111859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IYo9CvCwJmrwbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E87655FB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:09:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="oSWH/u0Q";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85DA830269F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3578B376BF2;
	Mon,  8 Jun 2026 12:05:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDBF372062
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920357; cv=none; b=k3mjeD0YfQZJICTuyVJ1JHGKzpcKgW5p34KYcc303GHuFHapRO+6+nm4N3qr60UtPSYrwZlnrzNBb/kIZ/FtZx9rpr17tBEA2Nwb6H8n+XmOjLCRx7i13NXriG3XegyF3dOFMvYOYhq0GwwIbtK2GYWUxF/Vqt0ejwaL2bYP8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920357; c=relaxed/simple;
	bh=d3TDx+W5LQCq/wcbWj/0EJPMBsW4tl0KmH3EmY0rMQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FW5oJHx/QP3poFh4yxcKue0FxAEBVjpGFJyRnKRuf7QfI/KFu9m+W/ss6KGNhBi8z+V8HXx99U6nIPhFur82jLnVIik73FE8Y+FPSw27yGrbAAS+ArvNRdCEJ3pMu6kQiDRH72T6a5C3Qj/ey3r4Qw7CLkTTQSi3urWxwKGS3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSWH/u0Q; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304ddfcf72cso4151840eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920354; x=1781525154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0zJ9OmXKz1HpRosgZiIPMmPyaSaP5wHJSlrRGpW154=;
        b=oSWH/u0QKeRuJIldfXYbUQtF6fUI4T00Z/N/ntX6WV8nPsRJaTyVHdBbYyxFztL7M6
         XkQgHzR06lOstXezeHmNynplLwME2/Xw3gJXslEtrzlGyj9K01xPwulc5gIvZm7NS1s2
         0FUwJ8f0GxwI+AIaGpDk5RhI6qsFqXCqmlO1CLSa8k+Wo8lXl6KlZ0raK+yCtUGhC0VM
         wygaIrRH3BXHIviuRb/aTepIuE2ou95j1SOElCcFgvB5hn2rN3OOEMlmxp8CxmnRBB4I
         nLGZFYe6TyQeICSviGDBbUswjvJF+6QQCWjJyVa8aIkllMPNXUJsSMU5SsXWFvQQtwSj
         hqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920354; x=1781525154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0zJ9OmXKz1HpRosgZiIPMmPyaSaP5wHJSlrRGpW154=;
        b=GFRYDw9Mc35LeWaLLh9oQ/LzllGL1fsWHt6W9vMcodIFgSPDBmLgOMXZu8CqL+acBw
         Bbd2qssPdnicmvezEkcGCLKF8ot1i10VWmdI7ML+qU1vHYxy406IqEFQUmGhD8ymUxYQ
         ztuLMGUjnLyOUBgBWF5iRD0jup3meRV5+HSdfhLDjxQ4crxYcUwLNY+9EZoUk0gvpqwC
         PKFWxIBmh+IIVnaArhP1X1K1XhGHAVW8Yza3qK6mTXqNwqpkyW8lOR3RFGXJrc0yEkcv
         meQziHlHSS/1aXSrEaybgsV/sxsEV8yEdiqJK87Zs6TB+HULJHqxyven5/LF72aQ1H2/
         /PMA==
X-Forwarded-Encrypted: i=1; AFNElJ/9gPFfJR49gh8uqRkXYCbaL7uSUg5zTCupCeVHAitM677hf3oDBRr8lgDYnd0R+ikaOYFSglVYi6BnBoe5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1LS7dDm+0hnu8RDUFfi5vdyHKlL8WomoYH2njqNuK8zjgV0QU
	D/7K3plsRDsXdarLkYym/CIP2bK+ADC9ki8aX258wOmWDoAT90m6mjXR
X-Gm-Gg: Acq92OH4y/fGqWqYHrqX55d/JM3RMmkmxgvyNYtFTDqgEhTwYJz/5ccLkijx+7doTAl
	G1dj0W+5RQwV6tqCM1cWY8R1656BxrTzHHS8I7dLl2nGQ7miqA6ofdIub22VG7IbKHgg1Vo+miJ
	Zp9MTiy8wuSBG0bTtwCrznPXFtmDfCMwJlyuyq+FwXAva7/JPh7Z+Th6FtfGmzPn+neZA6BJStZ
	8DkCiNWrm0mjKWle4RbqaZF0hRFmHLKf+J0s2nAOBc2KFtGOVyGBfoWoOXxSf+I+QQ+YGinQ8E3
	BLq8d46SwMOlUhNErstMMT+k/cq5wwPkqpxgEyFL+Qrot9TEfse+VhU2iLJrq82BMDVLyvdqL9N
	S1G1rYLNhN8mUtVPKALgTp5TapbNPFYPcojkqqCPV9oQfaUtuin+oF1LnHkhL4jpzrzOCj/A50m
	QHyXd19+YqvIwSC3cSOdfOQhryQDxDizuzuRoIYmosjQqpGCGkmaR3IQ5GkQYinEhr8g==
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr8086461eec.12.1780920353685;
        Mon, 08 Jun 2026 05:05:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm24603775eec.21.2026.06.08.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:05:53 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: abhinav.kumar@linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: iris: initialize OPP pointer at declaration
Date: Mon,  8 Jun 2026 12:05:31 +0000
Message-Id: <20260608120531.83459-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111859-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:abhinav.kumar@linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93E87655FB4

Initialize the managed OPP pointer at declaration rather than
assigning it in a separate statement.

This avoids a checkpatch warning about a potentially uninitialized
managed pointer.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Initialize the managed pointer directly at declaration as suggested
  by Dmitry Baryshkov.

 drivers/media/platform/qcom/iris/iris_resources.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..fd643cbff8d2 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -61,9 +61,9 @@ int iris_unset_icc_bw(struct iris_core *core)
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq)
 {
-	struct dev_pm_opp *opp __free(put_opp);
+	struct dev_pm_opp *opp __free(put_opp) =
+		devfreq_recommended_opp(dev, &freq, 0);
 
-	opp = devfreq_recommended_opp(dev, &freq, 0);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-- 
2.34.1


