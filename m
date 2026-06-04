Return-Path: <linux-arm-msm+bounces-111115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zcTaFHALIWpz+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:21:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB763CF13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:21:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PYU0hcj1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B8263015469
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA283BCD15;
	Thu,  4 Jun 2026 05:18:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0063A8755
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:18:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550337; cv=none; b=apml5NzuEXM6dCth9hqf+RhobvpvrgBP9see/X8IjXdFFCoMDP7GwqD0a4sUTgo4azjRvglmCozO0Hs4rWOffvFNQYEQGqI92oWR0TS4fOZQ2RjppiIwAxZQkd793Fc05aVLBd/PGQ0bZILnarDil9u+sTnUS3HvRXNpzFHdl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550337; c=relaxed/simple;
	bh=6sS/rOAwEAnbZVoTrMOiDHFw6dT7vuBK3ka0sNLl7b4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q08F+dazOmdAm/2K68PRHeGiiIa+BmAhNXpKb4NTOtRi4hv074OO/MampmV813pE+AE1iwBORjiGFfyABJrNqRi0G9BcxqHN7p5/hsGPg9G4Uo6pTNWzUSbouns3C/FaqUC4B038rwf+mKKnYWUwNsc/Kg21ZNGrEjiMBkIwivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYU0hcj1; arc=none smtp.client-ip=74.125.82.196
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304e83724bfso299653eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780550336; x=1781155136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=PYU0hcj1nYhe5pt8AaifOMHHltJHBY2YhOm4+IcyuPIYDOyEx9qj0D8qCQrzS46hZZ
         cMTZumzOD3JV2RvIrqo7OAgEgxIb/JaHDDaNxfosYiCQGO7xrkVeEak0XyGIc4itqr2r
         hLOM5Qq0TKV8uvXu5gyJFiNlLkmzXPtkNQGEVRNfp6IUB+aoV7ZDGvHIH9PKmccxAd8O
         XS7a+EopBbsNU4OkUVigVE0JAP/mcfDUhz+6FGLZ3LB2mW6f7wmaXhTdlSTCvQcXy7MM
         NvYXJXpVBs8bUpiBT41QmE4y8dadsJejZQvCKZKlCb+UZaaO3fWwS9H6TcSBlvAlsf9k
         pxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550336; x=1781155136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=iHj6fXf6gMMNnM8KgqOBTotbGlKOrEcpyvgsphZU3s/KpPVWgEJ/owJJdpTSs7Yb+3
         BpIqWv/MOWhMGnLARm94jd3WPOsNCgJZb+SrLnkIfTVlCHPAJkiL8aIvg1euW3SwTXUL
         ZKftAXp7Hh2sJDyyF5kpRnDMwM7bE7d30wUNVjlrJak7paALSW1ceF2pWzrYnWGZPLJy
         BWn0Qi28lCQAD8DCPgcK5btMO2IdiuD05Y2lB6/OoeAHYSauBH3CbCdz/DRYnB75CK5d
         EEw/MHpDb/oRaRtb3urSrdJx8VVi0ueKVIDByi1KGXJ5hfkOcBxBNDKD0Cz1Ow+XG3ed
         474A==
X-Forwarded-Encrypted: i=1; AFNElJ8PgtowPeri0t1OAN1Ht/aRhQACw8/MkcQiGZEv82iMUIG8Czds8jvWhzbMGm/kKG6Y9PGVjSH2P3+0BF+u@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcxiqwtpy9+rrZnFYCWV24U1Ojl1Y++jNzsBNHxwBkCTFdzdy
	PnqoFw5e7nSWq9T9SEcyDMhBOlwSPiJXgkBJUycvw/eOsdBDrjmDcRuY
X-Gm-Gg: Acq92OGsiynT6QC/WlzYLdpJX/L4ZuyFemb1wqCIqTGESjwnwOwfplHRFZAQj7FXIAU
	OIMyQkreiqV+RwLG1Vz3UpfWeh+IfoE4ZSuiuPR3+0nbsQ2IdYRtKbXb/X7kgoQ1vYoVrz7DSf4
	5G8m5sjur2oVkuTIgcpNnNxapggNPOINAvtMzog+32dSE/8eTsKE+PA8s1SrKIPHurexECK/U7B
	QpLYyH9fymqeZ+ZCDasaeqP70TWksqTq47KO8ZbLkR1PDnR/m2eRmLM3eXzG8XkKwcNzUdKZl1c
	K7FjmYP4k+pqvsgVX6UQRdyxwqEGizpE1APywzsg7tCKyPIxDkYYPdjqE3D32yaObh0k6LoY+3T
	58hLh5Z2H0S98lnKlbasSP7FpMLMFYS/bpHj3lbE26zyPBgFS152gq0uEDdC4qgNJUT0W6+bVCT
	eiJANkOx37d/rNqwbcoaya9D4toGgTK+4L8VMvQgN5nN2CzZYZQBx1OqwfNRTFZkYNbw==
X-Received: by 2002:a05:7300:3c15:b0:2ed:e14:7f54 with SMTP id 5a478bee46e88-3074fc6fb5fmr3151329eec.30.1780550335845;
        Wed, 03 Jun 2026 22:18:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df805d1sm3837573eec.28.2026.06.03.22.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:18:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: abhinav.kumar@linux.dev,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Thu,  4 Jun 2026 05:18:14 +0000
Message-Id: <20260604051814.41738-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111115-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3BB763CF13

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

This ensures the performance state vote is released when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index f5e3341e1430..a7d25f7a201a 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 		return ret;
 
 	ret = pm_runtime_resume_and_get(pd_dev);
-	if (ret)
+	if (ret) {
+		iris_opp_set_rate(core->dev, 0);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


