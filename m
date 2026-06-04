Return-Path: <linux-arm-msm+bounces-111102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkRlNqb2IGrT9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 05:53:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD363CBBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 05:53:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="sNAKuKm/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C343009175
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 03:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D276533C50D;
	Thu,  4 Jun 2026 03:51:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAEE31352B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 03:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545114; cv=none; b=mDD+M9s8KX56oQHop3Nggkkrv4tlV3KhXLvlpO4m59sBOyLdeG4kYCSFMzymdgSbReqf2kmV7TRe/2BadfZ5GrLdgC5UMvIpbWA2pSdc2o/ZvPXLcDVa3/gOLYID7dcicKw8BEjVQ2Wm8zwJROm8gWbsr462YZqk9KLPU4mo1CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545114; c=relaxed/simple;
	bh=5Xwn95QTv2SaZnnoatHxG/UMBvLc0GnNX8aMIGUQk2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bEpMPdRMu/AADCaCWp1Iml/xl3fUdYWYd19HxD03SQ9cehvBGVyaE7mu9Qi0xquu1IwJwybI7o1aFYV/098Q6LjrxWZ0jst0TKM54KfgnzUi3cYVko9Pm6haAa+6CvLHI+WoW2CzcZHSn2lNxUGrsfG5Y6iLYnCTCYsjSC0ZKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNAKuKm/; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304d7f31215so170025eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780545113; x=1781149913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTNM1PBuK92bgU/P3kzPwXTUzBRzY/h/x6TymISVLAU=;
        b=sNAKuKm/4waEBQJB7/COpOJOvS7df1NGpjs7mvLMfK82iYtIduhNbT4kDHojwDYO1X
         P2EAmT0sM31WPPiOumQE/7zdBMdXsfxE5xyACb0Xiomy27g30mtivHz2iq9Q6LP5vmmo
         WEpCKBFAaBlbUbJsdvSd9PA4BWVwot1WYSYD80oWXbWXOQURz5JC/7HW3e11XsDOdVY6
         2yf9+rhEWLTc5Vcf/H46ro+4dux3VK3UM8opC9hZn0ZZjN0pCaeCNc159iFClZP+rOyx
         xkQKPojcsqDBBCNLEhMlalL8wxfagPBLL+Fm23iZ7rvCY3qSaBhWYJwnY+l+kZrb/jUz
         v8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780545113; x=1781149913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTNM1PBuK92bgU/P3kzPwXTUzBRzY/h/x6TymISVLAU=;
        b=pYMumv6FH8/AncCEKNoSE0MyL5/SLKLEHR9SHayIO5oyN3KviN1JogL4luo4kIuwRP
         IOhD7LTCHhVKnT31eVW+vlSuULnwBhss8KO7IcdayGMz+x/VwcG5FzgQmkxH2N9hBx2I
         ZO8rakWIfl6mutSukLA0x/JwGlXasQCCXGzdwafEWkkdT/Q4tXLypBwpXMc2stf3qgLG
         LrvJmt0luh+VplR8GS1SOK4mfxO51UWA+Wt3r2lCXeqExE4tRmW0cvZVNIQNXwEJr0Kl
         9rxHItyaSBBST+TTylI+7HA3RlORPy+YMV4MTThgVoLS9mLEmr/WpAXKXJzZdALCk6wY
         sh4w==
X-Forwarded-Encrypted: i=1; AFNElJ/Rw1RrR08pKQFN+Bxg5nFCJpfdWXQTlCG8dcfUPzHph3a9bQmHf7ZVaJ/EoJ2qCaxpWl8ffXmkZjqpStWK@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrTLRd0MAmG8VjoEhbEYEvH0iqty3vdbPRSyomE3gjq34MPHE
	kCWvS3UxY8lT6UemQIBhv6Vz7OKzhqm+C92pT+7Umz+IQsIAjm53dV6x
X-Gm-Gg: Acq92OE5wlRzUnMuxmXb0zgPF27OHig3v9afkuaXOIc2V+DUE7ynYj9LCuZjh7tBJun
	3q+5Pc9Z16553wea82eWa6fgMvXcUin3Z4NQitcKKmwU3eDKPhBNfCZM6c3OACoSJVD2cX/ltqL
	iRpFfC7vY06SzUKVWtO5hEs1mEcBa7ZYoNpxivab0Otvt251V4ib9fShnbXodBeCnsEbL730F5S
	zv87S7RuwQjtlXKbIG6pgDHb8T6MsSRQQMLNu+lyertYiT7IUhAERoAHH+XTfRb1rM28i7mvrLk
	RkNrcZ6xI1ryPOJrD5suo36gxQviCokFKNfr6ivY+PD9U61CPfSvIq9f3iW2RTZrikQXqVovAKp
	RnT0nhmk0+3AtDA6MiJpiTf3BFm0/BMAuuFdqu8V4oteBKpcs1YyNeyIyg7NKOc7bGf7vbpvz8u
	WUXvc1CsaHmhJBQ7wzf+pUQOntVN/khhyDsqhWzdSEgFhIisceZXlCC0HSavzTCpYFqg==
X-Received: by 2002:a05:7300:3213:b0:304:5a9c:6479 with SMTP id 5a478bee46e88-3074fabc095mr3275339eec.9.1780545112598;
        Wed, 03 Jun 2026 20:51:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm3771487eec.17.2026.06.03.20.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:51:52 -0700 (PDT)
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
Subject: [PATCH v2] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 03:51:33 +0000
Message-Id: <20260604035133.39825-1-dennylin0707@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-111102-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3BBD363CBBF

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Add Fixes tag suggested by Jie Gan

 drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..f5e3341e1430 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
 		return ret;
 
-	return ret;
+	return 0;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
@@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 	int ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
 	pm_runtime_put_sync(pd_dev);
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1


