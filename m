Return-Path: <linux-arm-msm+bounces-113882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jkzYNuNJNmqy9AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 10:05:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAD36A88B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 10:05:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EVPgLndi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113882-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113882-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55B9A305117C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 08:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65853438B5;
	Sat, 20 Jun 2026 08:04:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9AE573
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 08:04:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781942653; cv=none; b=BNVSG2zQCWdpB/fJbmLXK2oW3XNuv+YHIYEOyTFgdXmw8hKVuwnSI5TswUaP56kOfJjEliEA2SV8mWAzXD1ze5mV6tvTNOWzSSxMequmbnrje2A4Rl9suabcXPrPzuYonc8B8kHJfNI+itPhJNMHznxTf1/l/0hYq+/424TBDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781942653; c=relaxed/simple;
	bh=vr+D48qZUZL4HK65fAvy4xudrWZiPByTLHbOTHkKFlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlAmpQJpD5XzmV2vAzNgYcroLxS2Bb49QzDwuAo8uJbVj8OQNykXCmoGScfFQ9N16GMSpU2WRQBYfS6zZMI+Au6i7GG7smaBtbatjevsTTSFYc5zLUx47qgGkXFd5v/RIa9N5cnRMEXiMCxemcRY3Tddkw3aBYMXBur/NToVVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVPgLndi; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6bb8a5980so19536185ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781942652; x=1782547452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heXg3yOXzX2LQOc/U/NrXde9JiDhaHN9Xy0IhhHBxTg=;
        b=EVPgLnditsnW4q/xYTK1+I1Il8n6UvMfeqX1Bd5IyjVRTsgn9sISketdOPw3ZbYCaa
         TGAZMP48YDw2BzW87+rbAH11DfPy6XQ6biBqNkBwqJg36SKkRJUIIrgvYPt1i0Gyyyzc
         zvG4wpv/GOjwBHk+XufenOiLWEiCX4LMd0chvPsPwtEmRD0BYaSGeLP2st6lJw3belCi
         5+l1/EfvCKVzxmJFOIiBpATdU8+3BjHOMP66+ocjp0rjFnnX26LZ4qkyzZuN/r4t5xMW
         Pt3h5jKiprZMxeaLtGbgL4Jvhy1THug1GKziCdf+qVqiVfZV49tXywT2xTyF2WBlO/Hr
         +XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781942652; x=1782547452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heXg3yOXzX2LQOc/U/NrXde9JiDhaHN9Xy0IhhHBxTg=;
        b=QDWaBmk5xn/FQWWv+UQeo76CzQuROD5zN2lUUBm/3V9WZqLjDGio/WTOjQOrBr/C9i
         58ElSFvMrMhIlAfOQ6ITutgN5/mKSmnWUjHU8FYwaSfbP3GIfVIhkC+1xNJHjj+8vZHY
         W+lXGMKYdrFvC6cUNn9c5JIDsB0yDyIHs6NEiP8JeGGTUMxj3DlZl4sTIWhfP8rtSciS
         iTAJZpdtG7mdJwYLWtcmshpdbAr40ejCH6ZXQtqdyV9q5IBD17eRlY3b69w7RfGhQ52l
         GjaleJLqwuK4NsnZDwYmisJo+VWiga1r+HMX1arDlBtnm0G4KwmL329+vZLA4ebzl+RE
         eg8A==
X-Forwarded-Encrypted: i=1; AFNElJ/nf2AL6hh0eUk5faJjA+4O7K78ka/fRj+a7+FoMFR+13FuCXYaTi+Bm3IAxwzhhdwwy+2mIjsPP5YwFJBr@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbZhd2ONIlIiOGMdJ628rcsUAAW3AskkMF5pQFvvLCwfHF1WB
	dDlmxNa7Z+IYZZ2fR7KU88qbBwQaqnPdyCqiOYjqazburJQW+CogTXfz
X-Gm-Gg: AfdE7cnTFsqCETPrDV7eIfgE3RLiv5u7FwoukwzErbAMh9EkMEB/aT5TX4/aEu3sjQy
	iyEik+/hmSFFH4Z+RdEkUtJVnzP3mc9ILn72h312jlCbZZzsTTQ9ScRh2IbjdHEiaMO+8QV4X6X
	wdXkVVGTFj9UodPT6PnspSv3pTckzKro5D+Eue1StLMf47XNOIGg24PkHJoJ/p//igPXXBIVhQg
	PmygAI+H35GEzQoQ0rM/LgP81oE59jxc4V4wBQZM1+sSnNfDY2Gnea+THiQ1MI2gX5biPLkHM8e
	XeydlFkzVV7KKZ5jHyKvtZTZMRllPsaljx6fuL9KJCt0qK0vhpRB6h0kCcto42tYhlKD+13qggd
	z44X+uhH6xBlAzHeJlvGlpXNz7T48RuoB1/ExEII5gXxoW7bDWO2WQ7n8cNGr1CWFwbq57IYM6z
	BPz6WXzm0xoPtiMyhchRrpSIYBSRP2YkCI
X-Received: by 2002:a17:902:d54a:b0:2b2:5515:661c with SMTP id d9443c01a7336-2c7190179a3mr76441265ad.31.1781942651724;
        Sat, 20 Jun 2026 01:04:11 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:8e0e:956e:b09c:23cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d5057sm15676735ad.21.2026.06.20.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 01:04:11 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] bus: qcom-ebi2: Fix clock leak on probe failure
Date: Sat, 20 Jun 2026 16:04:06 +0800
Message-ID: <20260620080406.1970447-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-113882-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linus.walleij@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iu.edu:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EAD36A88B2

qcom_ebi2_probe() enables the EBI2X and EBI2 clocks before it walks
child nodes and populates child devices. If reading a child node's reg
property fails, or if of_platform_default_populate() fails, probe returns
without disabling either clock.

Route those failure paths through the existing clock cleanup labels so a
failed probe does not leave the clocks prepared and enabled.

Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
This is a minimal error-path fix for a previously reported leak. A broader
devm_clk_get_enabled() conversion was posted in 2023 and reviewed, and a
similar cleanup was posted in 2024, but neither appears in current upstream:
https://lkml.iu.edu/hypermail/linux/kernel/2305.1/00605.html
https://lkml.iu.edu/2408.2/09536.html

 drivers/bus/qcom-ebi2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index be8166565e7c..ab00c75b9e95 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -353,7 +353,7 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
 		if (ret)
-			return ret;
+			goto err_disable_clk;
 
 		if (csindex > 5) {
 			dev_err(dev,
@@ -372,8 +372,12 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 		have_children = true;
 	}
 
-	if (have_children)
-		return of_platform_default_populate(np, NULL, dev);
+	if (have_children) {
+		ret = of_platform_default_populate(np, NULL, dev);
+		if (ret)
+			goto err_disable_clk;
+	}
+
 	return 0;
 
 err_disable_clk:
-- 
git 2.51.0

