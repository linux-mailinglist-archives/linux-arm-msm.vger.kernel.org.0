Return-Path: <linux-arm-msm+bounces-111166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xfQINYE/IWqlBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:04:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A694E63E4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JywV8Cg9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86A373088FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FBA3FC5B4;
	Thu,  4 Jun 2026 09:01:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5123F7A90
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563712; cv=none; b=kHWzf6R1lvDtDjxddTcDvY/popW/9RM11xd9uS5GpnNW8yJK6YeN2frWBVm8wYWMtDYJtr0tefilHOqjXdqgEA1b5s4T13Laj73ERCDsPHjzDMb17SwYJ07JocIod9WgRaLgLYn4gYT8K/83yQXD2iG4qSPF7rF32Zp7dOqO8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563712; c=relaxed/simple;
	bh=6sS/rOAwEAnbZVoTrMOiDHFw6dT7vuBK3ka0sNLl7b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e15hR2FBMt0omt13sexXK5gVSjMgrkWA31K6MF2iFjqDAoKc9MV1iHYh+S1571Y8cuFkEmMz/FUIqPvtTx7MoTavxATxnuJZCrj39l3ZqPHVC3QL3+gsB4atqU/Cy/GDlgEyiK32UUTUznkmbQGsSxJsIBMVBRBOEIJPrBz9rUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JywV8Cg9; arc=none smtp.client-ip=74.125.82.68
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-137f27712fdso4155c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563710; x=1781168510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=JywV8Cg966a5hLdPKq2WuMLOoSHKza7u1bzwTHhkU68mrILgYQkmyI3pXXb10uQZ3h
         KA+j3V467W/WCEAysain8UwMkHF/G3Z39mQzGACnrWSwqw6qPpeQJLyuIbmkYB1KtFLd
         NzhsLhHL9sGlSC8yKdquQtMm92GP0DPO2g93EQWCMa2PhbBnMbkspyfurqyT+RxcpF1z
         UMYjJDpAXYHVFS/EG5CqnH8FcWcmHOdu3c1GdTGHtzqeQErWlnpam2n0rFMG/0ixIiFk
         rSpdPb8HUTi5yGFAjpn3zYyw78V0J7s8c61Uv47rZAO4iHAglAQuX/4hlgA20CiUYyKB
         nnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563710; x=1781168510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtOAUIkJHHpqIWubsJjKRb06yKny8EDW95y2MrqiHJY=;
        b=WPSzqyLS6lLAZLESAfA7Bpi0rcfLKxkpOF+oBT3DOqbMWPT3pJinZYqGKYwdSlnsY0
         0SbJ4DBp/w4q9OCCcyKCbvt+D/5os38oGKyjmXM2wlvik5rsnzsfGvCHfaWcZRu6Ig+U
         13YSLIhY9wqdCZIBaJClWWBTGvdhyQWy4itqrul65nEdR5CJXxz1290qzbjv8CyCT1Pm
         H+aXXZReHOUZW9UdIAnLw1rLdXvfrj/TzS2ef4Q4MR+v21pZawrJlEqQc9/drzGTGa6X
         fq3y6CVm9TBizREP3KHL4I+g4/cr5H9lpG9zClZW5Xr1GLV2pAT316t1sy+/Vob3ZWm3
         S5Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9jw5Nz2d+hayEKGRFdoviqfWg8UiCOwgGkJ9AiIzbpkuOG3Uly2douvYCfwQ5XYQ5MP/mKwrQGg3K48pVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzkU0auZus38vGyczQLcwcZQnZGJrzZmX16uz3UgkglBLirMKna
	JeVYhnyvN4iiUZVT4t1BdoAVdkQpHffTHq/Zx6Cp+F13yMuDED5FX22u
X-Gm-Gg: Acq92OHdFu4fkVCTbj6UVnDp2LLSSdc4OHpeWI5zjUviqxXCSP8NlMpOlYisr7YJZ9f
	Pq/oksyYdzukt+YgSRuG4cte62rZzMZ2+Ac1QrLRQQ4Kuu7qlke6/7UWiJY86RzwNTvm91OALlc
	ld9j+vGt34YfeXMwZZgXRq0+lTtMQNO2T4KgvGFgMGr4bMICBajl8R6N2qORZy+R1xuEPJ0YyD/
	+PWJDWU39LZgZhFg424fVk+1BSw96kE+f4nUAR+LM4k288vYpJqTkaqNH/i6fcAmLjKWwyVRyLV
	dirtsXb8TZXuo/wVP8XZtiYOMC8+qaE2DgKxDkjSiM0lJqt1uv5bpI+/Ng4gEV5dqsTV8qP2Um9
	7HSFpP0xto42ycCDzbWcnNvoIeFy0h7DenzNevmX8q9hUKqOQkhMds5zjy/xEGibcbdmIyYZ9ah
	lWm3ll/H8Ts0KcrXvLNVUDw7YlSqKzVW684cEfErevgQeYuz6hvL4mdOQSPBzl1Sw9sw==
X-Received: by 2002:a05:693c:37c2:b0:2da:4216:7ea3 with SMTP id 5a478bee46e88-3074fabd68fmr3680720eec.14.1780563709986;
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Thu,  4 Jun 2026 09:00:59 +0000
Message-Id: <20260604090059.46355-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604090059.46355-1-dennylin0707@gmail.com>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111166-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A694E63E4E0

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


