Return-Path: <linux-arm-msm+bounces-111741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EbpWKGF9JmpdXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CC6540BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:29:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VQuSqOp7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A8BE3031A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B560B3A5E72;
	Mon,  8 Jun 2026 08:17:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE03A2E33
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:17:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906672; cv=none; b=nJEpIVNDwBo/jSo8EHU2mniCNeTRp0NRMwHeuU1Mha05A9tavYwcyHE4kJAWHgIuJf3kJ/Af3NkaDNRBQXv2BkGIE1SkKRoWVU19rAyCxvOMLC9z8nDq/DtLMZjzx/cRL3mfabuHijODSlila6Jcd7o6hCIkNRlO05ABUmn/WE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906672; c=relaxed/simple;
	bh=G3mPKW0gTsempXh1cngtGsHlKo8rWtAyp1QhWG0BVWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2e/Q1aBS8P7c3Hz7GC75yQC2CfctKm9bAXb5CIGOzPeB/sVzgiNmmL7NWhjumjm7EfkcV0igdCnmWwuAozK/+29T3t/8BBXbZcMtsxuAcvafqygXQtrGI8CdKnfw56T69NqSBhegXHYtXotUMW2xBCTSoOt9K48vmcqXfS+Xms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQuSqOp7; arc=none smtp.client-ip=74.125.82.196
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-3078e0dcd67so1951243eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906670; x=1781511470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqwFJZf77z3gY890YdN/zmCB2I+TWixDM2zm/X7SEng=;
        b=VQuSqOp7V0F632GCcfLgGz8uS+4bjwt2vNVgXW0V//nWlhtOM5vIkJkOHhmHvvgQVV
         fZK1drAusW7lWZW3aMJKkYd18KqhG5/UUKl7pFqiGB02g/cz6K+PFoRoMx2kTkFGPbCo
         WZLVjo5RfCCfoAbU1NVV44Pg1dZt8ph+KUfjfVpj1K/4IFjCgiJdr8W+8yLU/7Dgpzl3
         CDRHFfHSK3T2uYgJvv0swiVtfTjRYbbcd7+LMjAjSTOUOGhv0E0jwT6oouHz0/ONs7lj
         7EIYtJHFKPl8ROZ5dywIXhwq88rQtVp+K+fvKfyOKctb670EIt+RycoDSWDIHmmOxq34
         wISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906670; x=1781511470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KqwFJZf77z3gY890YdN/zmCB2I+TWixDM2zm/X7SEng=;
        b=cexJOoG2Zk7HSPo1MCw2+YMMpH4UogYKZj1JG9BAIIZ8I9WdWBIsphXLTBvnDDXjE8
         Ey8Ny75+35YotcWd2b2uVfr2SO6usLsK3eOBfY29gIZ64ZN7J9GtjTaNp+N2Driouzhf
         qFZ3aGjPopjMbhJr0+THs+tIua1LZ8J3sv/Q5mxqSBAUU5wqb8EdYy3L+FP5MNdJZmD9
         yVugEvDIdI6Ijj7IqCdFBVLzziFm0Kuqi0JT20WyUY2RcthHQWXNIipPW2cecepFWy59
         lpCXwZKBewIWRhAN7mpJZT9tyk5BDE5n1QSndP9S4TVat7AD6givV96Q9JkD0xK3iakM
         T8Tw==
X-Forwarded-Encrypted: i=1; AFNElJ//cS4sRzMbNbo3QHYBL2nShKEJDqvAgnq2hF/JH1K2s5xoF8zrlX14iLUKStt6/a3zNFQGOrWt0btv/faF@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnKKdKyZ3S5JN1a2msh/J8OjPGih0nZhjCFIc29fHiIo09Z9N
	2sV1pw9tkJIpowDAxVD6ZlZy/tJ3JeY1pgca2IL8SBhfSlAPnoebEhDN
X-Gm-Gg: Acq92OFNQT7TFPPOSJI8yBf4xKxgycyZB3/EMmKDVdB40PX315gFMNEGMn6dVF2PECi
	xpVYlzO+U2CN2xczajxWOF8hfPplyJx7lVU7cU+nJe3MHLhczAteCwSk8SUlqtxG2ccSMxg4GFQ
	ojz5efKEQspbcYK7ac6N6XMFboWQOH6Yz5Kr/o28qpf2OmP0l9l89I2S4IBzbXTyvgkabsiIjcN
	zE2zFHw7Ddnei4rZ3WiVvKZccHWwCqF8HwTcxcUosaS0LKQkQMmBa4gHnQZKrahZaJr4Gm8cOKc
	FqDFP8zYd+Xf7bwzRhA3e+iT0aD423aLyuWzJIVGQ2DvJ08tKUxVyFioOd5bRSQEkwH7KBWupdr
	HO/0JxWmIZDiKUF+s87ms8MFrOL8NaRPi/ggcFNPaP7iN1KyKsyymDckt/iMmFmmw2bbVB47uos
	P52ukh5I+x0SqbfJ9xj61m47eRMowXNjxdhY01HSKwG71R1kBjB+PvXosfk+UZpby+Pg==
X-Received: by 2002:a05:693c:374c:b0:304:2cc9:2ba8 with SMTP id 5a478bee46e88-3077b32a2a0mr7233754eec.30.1780906670474;
        Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	busanna.reddy@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 1/2] media: qcom: iris: fix runtime PM reference leaks
Date: Mon,  8 Jun 2026 08:17:20 +0000
Message-Id: <20260608081721.82846-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608081721.82846-1-dennylin0707@gmail.com>
References: <20260608081721.82846-1-dennylin0707@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111741-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B9CC6540BD

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..6d3339423eec 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,24 +78,21 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
 	int ret;
+	int pm_ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
-	pm_runtime_put_sync(pd_dev);
+	pm_ret = pm_runtime_put_sync(pd_dev);
+	if (!ret)
+		ret = pm_ret;
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1


