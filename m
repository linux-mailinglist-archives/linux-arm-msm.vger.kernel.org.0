Return-Path: <linux-arm-msm+bounces-110951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZX2tDYUWIGqOvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:56:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F86373F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y7OQnVIe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65803310D10D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282746AEE5;
	Wed,  3 Jun 2026 11:50:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB33466B52
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487436; cv=none; b=Wcm4b5n927uuzAvHYcL8//1QV/Ey0H0GehJ8lXtBBCaA0CqqzkwdLGxNDO0ROVxuqSseXlahTZL2WAItFVWkban1ZKE8yuHOfn2t8ohyCIaiK3VGTlB+gRgjLURVZQ7ynjvBKxYLYMmd5AVpxP0qaYTDc92u/t0StmhEwy7Gjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487436; c=relaxed/simple;
	bh=7vnU2lZPmEEMRduMSMleJemI++ozaYm06y7NJ1dlEEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG4PRZvbxIuHT8VjOmrzfQOaY2ih7HyDyUX7+e8z6o5pegJQQ/FObXXHaK0A5Zcs5KIWxQ0gX6Bmfew+a9jmeMdO7UpBgDXcyWBdDlCsT3eJ6dQ3aVPGJEJnmqVtQhX66xvGoTTvn75LXXrokq6Eq5+jLYCLpZa1xT20s03uR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7OQnVIe; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c2a68d01so22453775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487435; x=1781092235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0+OuvvQkl90TmM41S9YQoe97Z4NvBQ5dxCyjSxljyU=;
        b=Y7OQnVIeQ4P4ksLaktt1cMVG78hDlR6Fog9+JLxYhj3WWygUEAEv3LpCVEKaX8DxQE
         WK/7/Rh+u0ny9eAn/GIPyljwy3ozsHLrzurc+zBEVk1SeS/ShykBLNklSezEADet33UH
         l4u5Iwf90OgtBdXc9OjDlf/oaJI6gBrIGn5N6U8EuHK1NxnC+2ph2Qke45Cj/zhK5dS+
         j5ag/ko/axn2wh0kD6AofQeHPDAGZsxpULTdrqXUhvRcv10vyusyg0Nml099bt/P9AWW
         nfZ68S9MlkeRqcoUxff+fRLufl+qgQYVPH2jzpkSMkBid6vprWtgcMY/B9giWglLue5F
         JBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487435; x=1781092235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0+OuvvQkl90TmM41S9YQoe97Z4NvBQ5dxCyjSxljyU=;
        b=j39g/dRrXtJWrEPcT/lj9D78jKvSOvbkzhfSUC8qqFQU1k1qQ983gO3WRvcYQATncA
         t0xOKsEKP6hdAeZiFT3as4oRgvMgndse9xFwdKPySHbZrwV+K/5fGxZia+UHrYSpB5zU
         vuMaghqsV1WExuC5PH3RM67mnBlsDrYHBzsmekzQu3PZcPtEz8U+go3+zc1IXwgYR2Fg
         YqnCs6DAzc/XtHsII0OIe8viZvnQ8yFCu6Ikx+z+ogXmamuFTS4mMXbMHCTeBfp8k9Iv
         TsJPCyhgR2z/eTpa1AgqoF60nkjCDXMJfxI6AqJBUFhk37fEru6pk3n/PVskO/QKl2ID
         gEww==
X-Forwarded-Encrypted: i=1; AFNElJ8+EjYNPwU5WieEnkesPF+ZOw9NkBBxTlLoUZ4Gjf1h3VwVolYWuzcjBGvz4G4bHkii7VjbLvs13chJEqVY@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJnD4YmDjjxieMNERPpEzl7UtVFcDQo4S2Pa3e3a1y/e7nOpd
	km+kCmlp75D6U7RuM8yBhf1MOiMNl6B6xtTsKmCEBDFOnkD4OY+csSlm
X-Gm-Gg: Acq92OECajlMUY0neusQ8mUqTl9Tx2dlYfx3XIf3zShsxBPTk0h4vJW288y8zrT2FLd
	0rgOxgyFY2BsVNyykwA+CBLKT+2whqrWgNQ0o8L4oir9EbFNFgNDqT8uMbNFwOss0hQ1Fec47Xe
	3AM52c7V4KrMyXk7Wei7zoktUAU8RgOaOjU3wKRV1qDApmT4Gf6cYYw70XPvlhL6lEjl6mebOKc
	7A5qZxpNwpn2ZbtgYwxGbgPi8ck+mK8jBAxPbMmglGuwLtoGrLd6TnzZd5FfwWCbopksFOv27Sa
	oMWF3EmFihOKeBOfEnF1EbjEy09Aqgbn6mbU6Hrt+huOZ0D3XzLPhaZO5cn2wKF9Idp67EL3KE9
	5RFH5EdwGEhPPpxWZycRguyB58b8N7JFlSuXVH5ggeVMI7OUi7BiQ++lXccnk6YynQPq04f/zxV
	7djLzBaL/PJ5CWHYbOMJZRZHX6XT++mP3bEEfddnkgNaYLDrodG8Yei00bm8HC7TYJP/M0
X-Received: by 2002:a17:903:acd:b0:2c0:bd76:cf18 with SMTP id d9443c01a7336-2c1646df446mr31681185ad.38.1780487434906;
        Wed, 03 Jun 2026 04:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/9] ASoC: qdsp6: q6core: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:46 +0700
Message-ID: <20260603114949.149595-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB6F86373F2

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 48825756a7ab..99cd4ea821a5 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -252,7 +252,7 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 	if (!g_core || !ainfo)
 		return 0;
 
-	mutex_lock(&g_core->lock);
+	guard(mutex)(&g_core->lock);
 	if (!g_core->is_version_requested) {
 		if (q6core_get_fwk_versions(g_core) == -ENOTSUPP)
 			q6core_get_svc_versions(g_core);
@@ -287,8 +287,6 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 		}
 	}
 
-	mutex_unlock(&g_core->lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6core_get_svc_api_info);
@@ -306,7 +304,7 @@ bool q6core_is_adsp_ready(void)
 	if (!g_core)
 		return false;
 
-	mutex_lock(&g_core->lock);
+	guard(mutex)(&g_core->lock);
 	timeout = jiffies + msecs_to_jiffies(ADSP_STATE_READY_TIMEOUT_MS);
 	for (;;) {
 		if (__q6core_is_adsp_ready(g_core)) {
@@ -320,7 +318,6 @@ bool q6core_is_adsp_ready(void)
 		}
 	}
 
-	mutex_unlock(&g_core->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6core_is_adsp_ready);
-- 
2.43.0


