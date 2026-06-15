Return-Path: <linux-arm-msm+bounces-113151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rFFVLHzOL2rcGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F66853FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=LRDJctQh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02C4E3020FC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B2D2EEE71;
	Mon, 15 Jun 2026 10:04:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAF27A462
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:04:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517881; cv=none; b=PPI4teJQ1hDjohjf/a+7KBrMpL56rXKJ3CSm3SJEBhAwtAfNIwakSxNtJdc5b8OznP1LsJ98emgTAFclViL32IHhVhi1eIijlfcstPz4BSlhJKPOYteedCs0EFDdvmJzlW6xsH3qKkwOS4362DDDv5kV37QzMhuAXRb4mgVXRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517881; c=relaxed/simple;
	bh=HWOy5qI3cE3XDG2aY78lPGc4t10sB3g/XAplVhrp81o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=My/FVmwAcbWfdkoHEoO3XEy6F52oT5nLT/neQVrvSAEh38TLc9kT6UCf2Mpu+k9rZsfu21Ax5+zgkET69a26Xvr/qHYTUoS7RAHhRQCowiO7/SKTtB3lXLhoB6QSGejd6BIPvltL14XyZQXtusi/2HMXvMQhYeNOo8yMYGsGC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LRDJctQh; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3538554f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781517878; x=1782122678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chId6eLdk67OpLiEbLar+llIOLem48s5WXHEBw8NInU=;
        b=LRDJctQhfTbqS6YbYE0rs+xwqmeAOUUcDEogaezoXdUH9gXzSA3gGEmXVEiT9CHmeH
         LPGwZyTe0WZPgBNbyLTH4S5Hz5cv2ehhOovpYK3WcccnO9Wt6uzbE7Alhpr8W3PhVzRR
         s59vSCHuppmSoVRYVYLeBF8z9aZF6IMSsV0Mh01m3LVJXdGEz9eCIUu4lQlYYqFCyETG
         0gEYOBjzBZXfPZI54bn6per6xiJWKWcM3IlKw01voJAdZVwGuHCBHK0om8c39Ork6I1T
         NqmPb9kQ0oDSSYKfmf5SL+c5q444Db7TyQh0N+IQlz+vVWr/UQcdJjR+Fq90PiCqZfzz
         enGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517878; x=1782122678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chId6eLdk67OpLiEbLar+llIOLem48s5WXHEBw8NInU=;
        b=iamo1rmg9inPjYzFTbXFp5y5TAeGDTQbhU6dmK1bgM3M44WUbyj5TugEyje3r8mVOw
         A7TPOzLDpbxREHUkJkVMpGZxCf9cHJiLLGb/zEfioOwPveD7zi8yJjTa/vCO2uK3ivR7
         B5Y8KRdSlxEjmkpIMPRpDKUAYxSEOGus0uxnd6iTEgo8g9+crn6gzXolr42y8qPi0TLT
         AyCHPc8xqnpaahcY8vqfU1aqp9JkyDsrGZKZxtC83vFcw7AINE0sBaxCZcOHA3jVIJJA
         UufU1FUIH2NwGvxn45BuH5g22pnvD7zaEvTl/6xcrzJ63bd5TCx2E4xsC4Ne59/BemR4
         XRFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yY4tWIe5G/5DS3um3FLbq957krMoa7HBjnsEAJLqaFhGvmdfZ+agflMnJNtS11maVXb02Kr6Ui7+vuYod@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKsB7OFkcEyAp4rucFr+a50fBB9eNiqldN0T+vr1TrC6RiClz
	MV9wlXZnmHZuSOK/oc/wztavLwiQiee34r+XcN4cpsnTfJliySfPSmNffq3/iuGfhC8=
X-Gm-Gg: Acq92OGbQxTTt1fTLjfZKG1RM7c6wccpfu/nrWrlq+DE/qGR4Cf7MFyJiPgxYc+Rc2U
	fGeWejelNmrI/LNA+6S2B+DU4nv1SprYI1VQoSlWSfdXeCQJyaE00wX9bw0BIOAmflgqp4RzdM1
	VibKsSuwoRr8L7F70PXaji7eipSfQnTJ5VsQxYC/7D60IaHphIXO6WtZS2TQX3bunojNOM7S8GY
	4B/h3+trbkE15G5qNFdd0Yt8ojB5pBxuyCsjq8r3QjttxlJZWL+WS8a9UPHR1NwRVfTJHC+7wnc
	gzNFyYTw+lutoyEMY0ZW7nuDuDBYhbwEeCZ00oTek6SWaaWN6ZAOzt0TbrTjf1IyHhUc5X6airl
	WObgs7fi5Vqjjff6EWp83YGSn1+hME9EIMwVG8da8zrT7Z9EujKd5GhmFb94JjGNzWVJZaiBWTy
	lNBYhqpYSVkFgTUArMmKZE2BdKjHqF4fMftblzPmjNL9UgAeEHtQj+TpEkcTavgO/QrQpkhkbGA
	H1SfLj99jNCSbs=
X-Received: by 2002:a05:600c:3145:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490ec4a16b9mr207550085e9.7.1781517878214;
        Mon, 15 Jun 2026 03:04:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04b1d4be4b87a025dc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b1d4:be4b:87a0:25dc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490ea94f5b0sm231746795e9.1.2026.06.15.03.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:04:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Date: Mon, 15 Jun 2026 12:04:28 +0200
Message-ID:  <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HWOy5qI3cE3XDG2aY78lPGc4t10sB3g/XAplVhrp81o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqL84tUuQ9DV3X0CAvNauDcPbASZ2NR58j4lJBR RzH4qa/Wl6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCai/OLQAKCRCPgPtYfRL+ Tg8+CACmUm8o+aY9qCJjyOBmQb/ne/FIsv8OweqcwNMbpnO+dom4nyzGjnLH5SjzZxI0aQxEzjx DhqKPOehlLmEpJARER8x3RuMAWBmc1X9W+DQs78eDWLiNfaMJUOSnZgZ3XRCX3YF4LVBP3aoV9p wwJJP8R/vpsODOtaozb1rNn9G+SZ3HOk+64CNnR6Q/UfF+1RBsCSFNF/6VjzyJc5s4XhQKw45V+ xFZ5Gfz4T0DMslNP56GIKn9DW61rnxMFLvTooCIAhh4nLEL0azFKUUx1X34w88u4Yca2T6sLwWI bwK14ok7OPv/STlq66/9Xjf/ghCujagUtvo8rpXSzpqPApeI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113151-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:o-takashi@sakamocchi.jp,m:dave.hansen@linux.intel.com,m:sohil.mehta@intel.com,m:raag.jadav@intel.com,m:hkallweit1@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_CC(0.00)[sakamocchi.jp,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A6F66853FB

apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
bus driver") in 2018, and since then not a single driver made use of it.

So drop the unused id_table pointer from struct apr_driver and move
APR_NAME_SIZE to the apr header which still has a usage of it.

Note that with the id_table being NULL apr_device_match() degrades to just
of_driver_match_device(), so replace this callback accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/soc/qcom/apr.c          | 25 +------------------------
 include/linux/mod_devicetable.h | 11 -----------
 include/linux/soc/qcom/apr.h    |  4 ++--
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index ea7f83916d8d..2073edb416a4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -338,29 +338,6 @@ static void apr_rxwq(struct work_struct *work)
 	}
 }
 
-static int apr_device_match(struct device *dev, const struct device_driver *drv)
-{
-	struct apr_device *adev = to_apr_device(dev);
-	const struct apr_driver *adrv = to_apr_driver(drv);
-	const struct apr_device_id *id = adrv->id_table;
-
-	/* Attempt an OF style match first */
-	if (of_driver_match_device(dev, drv))
-		return 1;
-
-	if (!id)
-		return 0;
-
-	while (id->domain_id != 0 || id->svc_id != 0) {
-		if (id->domain_id == adev->domain_id &&
-		    id->svc_id == adev->svc.id)
-			return 1;
-		id++;
-	}
-
-	return 0;
-}
-
 static int apr_device_probe(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
@@ -401,7 +378,7 @@ static int apr_uevent(const struct device *dev, struct kobj_uevent_env *env)
 
 const struct bus_type aprbus = {
 	.name		= "aprbus",
-	.match		= apr_device_match,
+	.match		= of_driver_match_device,
 	.probe		= apr_device_probe,
 	.uevent		= apr_uevent,
 	.remove		= apr_device_remove,
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 7f44057aa65e..d74ff3ee1424 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -547,17 +547,6 @@ struct slim_device_id {
 	kernel_ulong_t driver_data;
 };
 
-#define APR_NAME_SIZE	32
-#define APR_MODULE_PREFIX "apr:"
-
-struct apr_device_id {
-	char name[APR_NAME_SIZE];
-	__u32 domain_id;
-	__u32 svc_id;
-	__u32 svc_version;
-	kernel_ulong_t driver_data;	/* Data private to the driver */
-};
-
 #define SPMI_NAME_SIZE	32
 #define SPMI_MODULE_PREFIX "spmi:"
 
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 58fa1df96347..2e4231092088 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -5,7 +5,6 @@
 
 #include <linux/spinlock.h>
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 
@@ -135,6 +134,8 @@ struct pkt_router_svc {
 
 typedef struct pkt_router_svc gpr_port_t;
 
+#define APR_NAME_SIZE   32
+
 struct apr_device {
 	struct device	dev;
 	uint16_t	svc_id;
@@ -158,7 +159,6 @@ struct apr_driver {
 			    const struct apr_resp_pkt *d);
 	gpr_port_cb gpr_callback;
 	struct device_driver		driver;
-	const struct apr_device_id	*id_table;
 };
 
 typedef struct apr_driver gpr_driver_t;

base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
-- 
2.47.3


