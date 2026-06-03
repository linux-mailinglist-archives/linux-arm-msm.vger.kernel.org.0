Return-Path: <linux-arm-msm+bounces-110952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBjsIqYWIGqWvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:57:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCAF6373FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:57:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TZG2bb6d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110952-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110952-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE0773090874
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6589E472785;
	Wed,  3 Jun 2026 11:50:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38213477E24
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487440; cv=none; b=SEJC21NwCr8qGnBhIwu+zmdgKOmpHSMhU6z1TQlTLbVOeSXPuY0tjKvzM2QytBR+I/qbhRYbVr/J8x1zEazMzDXQuapQhrbbvdm/Th/TTNnCNAExVop4PthPPlNENLXcgW1a/pLmkWQFtKQMI8qvcgM9YH6M4A+VASeJjTqMySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487440; c=relaxed/simple;
	bh=jjHgp/jZpuHSIFDNTXOtEU2uGayag8e8wk5Kamgfz9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1lBbiBOZKHV/4hT7iyiWsdRI/YmrqZWH4lVdBm4thbs5x021YmwTS6ABOqhh5JCBxAp5WhUaVfQqjJamUeKh14q9iiI1/LvLnUVx/z+262y/ggda+k9P31RrX+x3jNenMD04WpXtz6+csKr88fk3FrXQ35sm6NalpelXXsXOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZG2bb6d; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c3184c71so25403415ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487438; x=1781092238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBfuXDyFUzLNioBdr/HkD5u66fuFdgp5SklAx/I+Qf8=;
        b=TZG2bb6dCYNAVa7zqIQFWXwqguNGQMn7N7uNmcQxuBrsEfh6fk5JWY6uy1kVigOxLH
         aeiELEHK1JmDSO9Zc1j23ie1Taguq51F04O89quwnQSLmrQxNbw18xyovnriFmWzm2NB
         VxLWsgc2X7IlZ2lOF4OqalU5Q9QVpQrceeyouhwv4rKtP4dsr/Bmwe4Zo2NYYgIe7jco
         TZONWHGQFGDqhb4P+Nc4v7rBVXbCX7LL7hhCm23Qlm6REQx7+ADrN46kSaWZju2qNAqq
         ieprubN8DyrdLdUKdmswXAcBwejCPD/xlD6MIwMj+0EZhk/laM446YGtIBJy2UC9bNnm
         d/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487438; x=1781092238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBfuXDyFUzLNioBdr/HkD5u66fuFdgp5SklAx/I+Qf8=;
        b=ihX5i2rii27JCu7rjbjV3QkFDmRYI9IX9c03HxUchFrqRtygOye5+ZBP1m8YmVSMrW
         zxyrqaREOuLbcxDuy+mBkJvzYV+rmvC/YeMniqvbyXnWFDCDtg0C+C8fjid9AztL1dQv
         q4rnNBq1ldqsKUozXGOOCtF3p4n/HD6HNEPo7UIvB52GtU/U30wFuZ5SqJ4lgTdic5GB
         rmiwrTxF+AYSoDk7qsr/rxehZSWAsKnhb5t2QuuH/dVgIXmvXclpk5vg84XPj+irvcZ3
         zjhnkrGg5AyP1zXcJ9Jt10HmXpvJdr71GSmfsFBFlHNIAN8SjIShK5NewhaJDIiWTrAj
         dhrA==
X-Forwarded-Encrypted: i=1; AFNElJ9qtqMfM4wieAGkzYVw1z5VreO/Exm11LN6/Ut9DPb61x8l1FgGgCeMnJB9XVm1Ot3Hpl964weRPkH0K1Ta@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuv03gU0YMmN2ATKpTwpvLGwQ/+In7h8BD7FaLeZWbnLYV1sJ
	UFPcO163qhUSOnZKSM1rAeFfRP2uVSrn1+RK18JZtycj6QtQmB0HU1R8
X-Gm-Gg: Acq92OFbBwxcb3FjOwqE9Y07GWKs5LyatUoYug3D74rwaCjm+MRsntApktF9uFuqZty
	5p+0ad6bzQdPykzG/TAPXg0z6VS2bGiCUm7hycc8/5xyBeRM9GgUilflCJhtzL/ndfgfYmsA3GP
	roTPIZj7D5ISYArBLjvbf4ONHuebbQ47ZQP8ut2Egt7SYPg/vdAujyUDjMPZjPIa6Q2DnT+vL6I
	WAEl+TGlIJdLDCj1OKKQcaK69NXLiRW9lMfVeOi2QypwGsQ7sslAHPF+LQmalZX4NJ3lv0VVgk4
	qE3JczK0joReIs51hhEczR3EgY5pP9Pv2GL6lq8oLNqrSUkqCFR7KrA32Ge0dzzKPRd9S8IV35L
	jgklbLZPHd+MfR67p4vb4xQyQ1+jbhgAs7lIyOT7MePorOWQuvpTOR0K4im1QCOEajfUYKKgWDK
	57aDGmzFHJZNqUQszxjNxs1QIEdP9Fteh9GQTptImX9sudN4jGre6fatzJP3qb0f8Pxm0tZSVUx
	m4sGL0=
X-Received: by 2002:a17:903:b08:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c1644a63c5mr34036585ad.30.1780487438458;
        Wed, 03 Jun 2026 04:50:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:38 -0700 (PDT)
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
Subject: [PATCH 7/9] ASoC: qdsp6: q6routing: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:47 +0700
Message-ID: <20260603114949.149595-8-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-110952-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDCAF6373FE

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6routing.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..fff103b9dca1 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -381,7 +381,7 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 
 	pdata = &routing_data->port_data[session->port_id];
 
-	mutex_lock(&routing_data->lock);
+	guard(mutex)(&routing_data->lock);
 	session->fedai_id = fedai_id;
 
 	session->path_type = pdata->path_type;
@@ -396,10 +396,8 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 			      session->channels, topology, perf_mode,
 			      session->bits_per_sample, 0, 0);
 
-	if (IS_ERR_OR_NULL(copp)) {
-		mutex_unlock(&routing_data->lock);
+	if (IS_ERR_OR_NULL(copp))
 		return -EINVAL;
-	}
 
 	copp_idx = q6adm_get_copp_id(copp);
 	set_bit(copp_idx, &session->copp_map);
@@ -417,7 +415,6 @@ int q6routing_stream_open(int fedai_id, int perf_mode,
 		q6adm_matrix_map(routing_data->dev, session->path_type,
 				 payload, perf_mode);
 	}
-	mutex_unlock(&routing_data->lock);
 
 	return 0;
 }
@@ -1070,7 +1067,7 @@ static int routing_hw_params(struct snd_soc_component *component,
 
 	session = &data->port_data[be_id];
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	session->path_type = path_type;
 	session->sample_rate = params_rate(params);
@@ -1087,7 +1084,6 @@ static int routing_hw_params(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&data->lock);
 	return 0;
 }
 
-- 
2.43.0


