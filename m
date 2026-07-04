Return-Path: <linux-arm-msm+bounces-116496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J7LhERQqSWqjywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 17:43:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248C707E37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 17:43:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SEkDeVf0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 311C23013B77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 15:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164A626ED3D;
	Sat,  4 Jul 2026 15:43:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7188218592
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 15:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783179792; cv=none; b=RJPXndts87G12HF2XM7ORV4zrwEI7QAVOOLh4k8CqCB7w38djZ3ZTSLDhpdAqtjWI2kLhXkzOZ6IwNr7h5mybjjDRcmPbhhC72v8wGRnr+VjZCi7WQoVojKM2ZkRyVBgBI4D5hRwxSOWoXp66VnyC7lgN8Q6O9WyhMT7R6INoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783179792; c=relaxed/simple;
	bh=5+434mrhNFCVreVO5PMVEkojrR3Q+VTps1ur2DUp2+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJUu3RKKkbwZnAiHO6DVRX+bCyu6XASdKvgTSfyHymi3M54kD19ZcVmd1SBCnILrEhPLA+A9vFWYqmSXerMeMrsd60+H1zluKMIdeU+MvjxRUMYC+VcSLhtdyhDNTP2c7J02NUOLdsOkqvCJg2tmuRjfES/qJxe+vup4Cg2cm6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEkDeVf0; arc=none smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-847a52edeb2so1146038b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783179790; x=1783784590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/NZqjgS2aeNz/4jTSFjlw+7y1oyriEp+WR7nSStBWU=;
        b=SEkDeVf0oCCGO/N67xzHGdv7My8/16grKLrw5DjnZsdJve1EUwFEFCtQjkKPnygPLC
         gh/b25GuyIu4Ffb0NjTzTLE8oyKMZcLSDZ+JarBMqEBFCw+ucwxhr44nq53AGioBxXM4
         09Nayu+LJWrQj91fMtykIYZhgolypYHLwJw02D8m7HHd9g4qhw/KCEOTXPQLfTyi+fTy
         7A5PCuLLV8ywfQMDSnyepPjS0x3ZlLfxlscz0Dp4p2/2ANyB1Tc/WdLjMOYsxsuUVuXw
         0RHZfZ2b8VbJWIJC0c6Hf8ULLIeb38gHHyhNUCx6+d2ryH67d4BmiXnjLpu3hffFGBKa
         PMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783179790; x=1783784590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/NZqjgS2aeNz/4jTSFjlw+7y1oyriEp+WR7nSStBWU=;
        b=qKwZT2r8hzkffAVuTxK7Ej9gk1G8/Ixru9uQovm+luw1JpH9i2voQ2vcxF0f+Jjvw6
         smsRUUwE7zWEnmmCnfJWVHPzyWzh54eL825mjn+7Hj8CivC5vMonMGnjH0Vjxpc7utuN
         vrPoKlDSRrGA3Bkf97D2LWxGMWrIW2bOU8mksftAEXTn4YyqIxh8aw/+siXRW8/+Xbwj
         vetZzgXTfI5elUiIo9cMkAxzFlP/t5HxheZntZTC/ctZuXK7vm8oHHDdBesgVHDQ7DsF
         2KWgs6+hefcxo6/OIg2YeMvRBIPLR/rUfwDe7I5y7aoo9LaeN3HfIQT4dS3JyN8fsCeR
         3GKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8E0bmb6tL+/dk0YaJIa7KShjzLcViwWjr4kM2BoBzZiFHE9tmc6rxCE48GyvICp7hjASQ2bspoHSl4TrB@vger.kernel.org
X-Gm-Message-State: AOJu0YyU06gPqmSqT+eiAv3Rzkq0poTEQlwYCnqfQQP5MgViiSxkSZ1V
	dVr1mdaLWdMDXh3g033OscK7kMxKeDH4J3OLYHi/yeRyL6YaDJd87LMX
X-Gm-Gg: AfdE7clQGtlAkqS9sq1WIbznR4UgLgjqecnqtHqOKlBHkbqYKGgW4QQRWirWmBWdQun
	cK26/8brAiZs+drMqbgRYBfHnMMwZ93gp+4X11UZWVEMeCeyObqXsIY/FDM2iSY7w2AjfEEOXlv
	l9zUJIuA53s42YM+pPEFdRKW8He9swSIp9/bTERpTaNMb59mdqD8El4NloWtNFFBieXxa/wvQEs
	Q1X1gIV/nPSloN4sLRtz+wuqfd/BVVZmjBOkZq2CY97VjZu8l/tQ1cmCDjjHBmUvQlRHl2nAgve
	Jl1IemhDHCdimPT/lE9BAGAg2Y0e9CFXq/BHDy+vJtE4zZrw5rtv6iYWqsOjTLuVexJ8ToBpVc2
	gNLfMdV77Oi5KznWVMABmCoEfmSSjLhqhYLJV2aDLc1ALXexlaA7nrrEBO1mf4KlveuUqAGG32D
	8Y5OZ4iYyeoPcfiSokG7Pg
X-Received: by 2002:a05:6a00:2308:b0:845:396f:5be7 with SMTP id d2e1a72fcca58-847f6d5e221mr3509996b3a.5.1783179790003;
        Sat, 04 Jul 2026 08:43:10 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm4148463a12.5.2026.07.04.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 08:43:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] soc: qcom: ice: Fix storing raw error pointers in XArray
Date: Sat,  4 Jul 2026 23:43:00 +0800
Message-ID: <20260704154300.98504-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116496-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:sumit.garg@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7248C707E37

qcom_ice_probe() stores probe failures in ice_handles so that
of_qcom_ice_get() can distinguish between an ICE device that has not
probed yet and one that has failed permanently.

However, the failure paths store raw ERR_PTR() values in the XArray.
XArray entries use low pointer bits for internal encodings, so some
ERR_PTR() values can be interpreted as internal entries. For example,
ERR_PTR(-EINVAL) has the internal-node bit pattern and may be treated as
an xa_node by xa_load(), causing xas_load() to dereference an invalid
pointer before of_qcom_ice_get() reaches IS_ERR_OR_NULL().

Store probe failures as xa_mk_value() encoded errno values instead, and
convert them back to ERR_PTR() values when loading them from the XArray.

Fixes: d922113ef91e ("soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/soc/qcom/ice.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 5f20108aa03e..bc77dce971a6 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -667,12 +667,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	}
 
 	ice = xa_load(&ice_handles, pdev->dev.of_node->phandle);
-	if (IS_ERR_OR_NULL(ice)) {
+	if (!ice || xa_is_value(ice)) {
 		platform_device_put(pdev);
 		if (!ice)
 			return ERR_PTR(-EPROBE_DEFER);
 		else
-			return ice;
+			return ERR_PTR(-(long)xa_to_value(ice));
 	}
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -744,15 +744,17 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_warn(&pdev->dev, "ICE registers not found\n");
-		/* Store the error pointer for devm_of_qcom_ice_get() */
-		xa_store(&ice_handles, phandle, (__force void *)base, GFP_KERNEL);
+		/* Store the error code for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle,
+			 xa_mk_value(-PTR_ERR(base)), GFP_KERNEL);
 		return PTR_ERR(base);
 	}
 
 	engine = qcom_ice_create(&pdev->dev, base);
 	if (IS_ERR(engine)) {
-		/* Store the error pointer for devm_of_qcom_ice_get() */
-		xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
+		/* Store the error code for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle,
+			 xa_mk_value(-PTR_ERR(engine)), GFP_KERNEL);
 		return PTR_ERR(engine);
 	}
 
-- 
2.43.0


